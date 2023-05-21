import JWParser
import System.Environment
import Data.Char (ord)
import Data.Bits

type MemoryLocation = ([Char], Integer)
type Memory = [MemoryLocation]


seperate :: Integer -> String
seperate x = lowerByteAddress x ++ "\t" ++ higherByteAddress x

lowerByteAddress :: Integer -> String
lowerByteAddress x = show ( (.&.) x 255)

higherByteAddress :: Integer -> String
higherByteAddress x = show (div x 256)

getAddress :: [Char] -> Integer -> Integer -> Memory -> (Integer, Memory)
getAddress name loc block [] = (loc-block, [(name, loc-block)])
getAddress name loc block (mem:mems) =  if name == fst mem then (snd mem, mem:mems) else (addre, memory)
    where   currentBlock = snd mem
            addre = fst (getAddress name (currentBlock-1) block mems)
            memory = mem: snd (getAddress name (currentBlock-1) block mems)

findAddress :: [Char] -> Memory -> Integer
findAddress name [] = error ("Undefined variable: " ++ name) 
findAddress name (mem:mems) =  if name == fst mem then snd mem else findAddress name mems

getNextAddress :: Integer -> Memory -> Integer
getNextAddress loc [] = loc
getNextAddress loc (mem:mems) =  addre
    where   currentBlock = snd mem
            addre = getNextAddress (currentBlock-1) mems

compileProgram :: Command -> [Char]
compileProgram x = fst (compileCommand x [] 0) ++ "\tHALT"


-- x is the current number of needed jump conditions

compileCommand :: Command -> Memory -> Integer -> ([Char], (Integer, Memory))
compileCommand (Block b) mem x = compileBlock b mem x 
compileCommand (Sequence b c) mem x = (compB1 ++ compB2, snd (compileCommand c b1Mem b1x ))
    where   compB1 = fst (compileBlock b mem x )
            b1Mem  = snd (snd (compileBlock b mem x ))
            b1x    = fst (snd (compileBlock b mem x ))
            compB2 = fst (compileCommand c b1Mem b1x )

compileBlock :: Block -> Memory -> Integer -> ([Char], (Integer, Memory))
compileBlock (While bexp c) mem x = ("cond" ++ show x ++ ":\n" ++ compileBexp bexp mem x  ++ "\tJMP\tend" ++ show x ++ "\nloop" ++ show x ++ ":\n" ++ fst (compileCommand c mem (x+1) ) ++ "\tJMP\tcond" ++ show x ++ "\nend" ++ show x ++ ":\n", (fst (snd (compileCommand c mem (x+1) ))+1, mem))
compileBlock (If bexp c) mem x = (compileBexp bexp mem x  ++ "\tJMP\tend" ++ show x ++ "\nloop" ++ show x ++ ":\n" ++ fst (compileCommand c mem (x+1) ) ++ "\nend" ++ show x ++ ":\n", (fst (snd (compileCommand c mem (x+1) ))+1, mem))
compileBlock (IfElse bexp t f) mem x = ( compileBexp bexp mem x  ++ falseBlock ++ "\tJMP\tend" ++ show x ++ "\nloop" ++ show x ++ ":\n" ++ trueBlock ++ "end" ++ show x ++ ":\n", (newnewx+1, mem))
    where   falseBlock = fst( compileCommand f mem (x+1) )
            newx       = fst( snd (compileCommand f mem (x+1) ))
            trueBlock  = fst( compileCommand t mem (newx+1) )
            endcomp    = snd( compileCommand t mem (newx+1) )
            newnewx    = fst(snd (compileCommand t mem (newx+1) ))

compileBlock (For dec bexp iter c) mem x = ( declr ++ "cond" ++ show x ++ ":\n" ++ compileBexp bexp newmem x  ++ "\tJMP\tend" ++ show x ++ "\nloop" ++ show x ++ ":\n" ++ command ++ compiter ++ "\tJMP\tcond" ++ show x ++ "\nend" ++ show x ++ ":\n", (newx+1, mem))
    where   declr = fst(compileAssignment dec mem x)
            newmem   = snd (snd (compileAssignment dec mem x))
            command  = fst(compileCommand c newmem (x+1))
            newx     = fst(snd(compileCommand c newmem (x+1)))
            compiter = fst(compileAssignment iter newmem x )
            endcomp  = snd(compileCommand c newmem (x+1) )

compileBlock (Assign a) mem x  = compileAssignment a mem x 
compileBlock (Print a) mem x  = (compileAexp a mem 0  ++ "\tOUTI\n" ++ "\tLDIA\t10\n\tOUTC\n", (x, mem))
compileBlock (PrintS q) mem x  = (compileQuote q ++ "\tLDIA\t10\n\tOUTC\n", (x, mem))
compileBlock (PrintC c) mem x  = (compileAexp c mem 0  ++ "\tOUTC\n", (x, mem))
compileBlock (ArrDec var lim) mem x  = ("", (x, snd (getAddress var 65535 (read (show lim)-1) mem)))

compileQuote :: Quote -> [Char]
compileQuote (Quote "") = ""
compileQuote (Quote (c:cs)) = "\tLDIA\t" ++ show (ord c) ++ "\n\tOUTC\n" ++ compileQuote (Quote cs)

compileAssignment :: Assignment -> Memory -> Integer -> ([Char], (Integer, Memory))
compileAssignment (Assignment c a) mem x  = (compileAexp a mem 0  ++ "\tSTA\t" ++ seperate (fst (getAddress c 65535 0 mem)) ++ "\n", (x, snd (getAddress c 65535 0 mem)))
compileAssignment (ArrAss var idx a) mem x  = (compileAexp idx mem x  ++ "\n\tLDIB\t" ++ lowerByteAddress (findAddress var mem) ++ "\n\tADD\n\tSTA\t0\t0\n\tLDIB\t" ++ higherByteAddress (findAddress var mem) ++ "\n\tIBIC\n\tLDA\t0\t0\n\tLSP\n" ++ compileAexp a mem x  ++ "\tSTASP\n", (x,  mem))

compileAexp :: Aexp -> Memory -> Integer -> [Char]
compileAexp (Plus a t) mem l  = compileTerm t mem l  ++ "\tSTA\t" ++ seperate l ++ "\n" ++ compileAexp a mem (l+1)  ++ "\tLDB\t" ++ seperate l ++ "\n\tADD\n"
compileAexp (Minus a t) mem l  = compileTerm t mem l  ++ "\tSTA\t" ++ seperate l ++ "\n" ++ compileAexp a mem (l+1)  ++ "\tLDB\t" ++ seperate l ++ "\n\tSUB\n"
compileAexp (Term t) mem l  = compileTerm t mem l 

compileTerm :: Term -> Memory -> Integer -> [Char]
compileTerm (Mult t f) mem l  = compileFactor f mem l  ++ "\tSTA\t" ++ seperate l ++ "\n" ++ compileTerm t mem (l+1)  ++ "\tLDB\t" ++ seperate l ++ "\n\tMUL\n"
compileTerm (Div t f) mem l  = compileFactor f mem l  ++ "\tSTA\t" ++ seperate l ++ "\n" ++ compileTerm t mem (l+1)  ++ "\tLDB\t" ++ seperate l ++ "\n\tDIV\n"
compileTerm (Mod t f) mem l  = compileFactor f mem l  ++ "\tSTA\t" ++ seperate l ++ "\n" ++ compileTerm t mem (l+1)  ++ "\tLDB\t" ++ seperate l ++ "\n\tMOD\n"
compileTerm (Factor f) mem l  = compileFactor f mem l 

compileFactor :: Factor -> Memory -> Integer -> [Char]
compileFactor (Int i) mem l  = "\tLDIA\t" ++ show i ++ "\n"
compileFactor (Var v) mem l  = "\tLDA\t" ++ seperate (findAddress v mem) ++ "\n"
compileFactor (ArrIdx v idx) mem l  = compileAexp idx mem l  ++ "\tSTA\t" ++ seperate l ++ "\n\tLDIA\t" ++ lowerByteAddress (findAddress v mem) ++ "\n\tLDB\t" ++ seperate l ++ "\n\tADD\n\tLDIB\t" ++ higherByteAddress (findAddress v mem) ++ "\n\tIBIC\n\tLSP\n\tLASP\n" 
compileFactor Input mem l  = "INA\n"
compileFactor (Brack a) mem l  = compileAexp a mem l 

compileBexp :: Bexp -> Memory -> Integer -> [Char]
compileBexp (LeT o1 o2) mem x   = compileAexp o1 mem 0  ++ 
                        "\tSTA\t0\t0\n" ++ compileAexp o2 mem 1  ++ "\tSTA \t1\t0\n\tLDA\t0\t0\n\tLDB\t1\t0\n\tJLT\tloop" ++ show x ++ "\n\n"
compileBexp (GrT o1 o2) mem x   = compileAexp o1 mem 0  ++ "\tSTA \t0\t0\n" ++ compileAexp o2 mem 1  ++ "\tSTA\t1\t0\n\tLDA\t0\t0\n\tLDB\t1\t0\n\tJGT\tloop" ++ show x ++ "\n\n"
compileBexp (Equ o1 o2) mem x   = compileAexp o1 mem 0  ++ "\tSTA \t0\t0\n" ++ compileAexp o2 mem 1  ++ "\tSTA\t1\t0\n\tLDA\t0\t0\n\tLDB\t1\t0\n\tJEQ\tloop" ++ show x ++ "\n\n"
compileBexp (LOET o1 o2) mem x  = compileAexp o1 mem 0  ++ "\tSTA \t0\t0\n" ++ compileAexp o2 mem 1  ++ "\tSTA\t1\t0\n\tLDA\t0\t0\n\tLDB\t1\t0\n\tJLE\tloop" ++ show x ++ "\n\n"
compileBexp (GOET o1 o2) mem x  = compileAexp o1 mem 0  ++ "\tSTA \t0\t0\n" ++ compileAexp o2 mem 1  ++ "\tSTA\t1\t0\n\tLDA\t0\t0\n\tLDB\t1\t0\n\tJGE\tloop" ++ show x ++ "\n\n"
compileBexp (NET o1 o2) mem x   = compileAexp o1 mem 0  ++ "\tSTA \t0\t0\n" ++ compileAexp o2 mem 1  ++ "\tSTA\t1\t0\n\tLDA\t0\t0\n\tLDB\t1\t0\n\tJNE\tloop" ++ show x ++ "\n\n"

main = do 
    args <- getArgs
    let input = head args
    let output = head (tail args)
    contents <- readFile input
    writeFile output (compileProgram (runParse contents))
    print "Successfully compiled program"