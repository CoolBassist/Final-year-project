> {
> module JWParser3 where
> import Data.Char
> }

> %name jwp
> %tokentype { Token }

> %token
>   int         {NumTok $$}
>   var         {IdentTok $$}
>   quote       {QuoteTok $$}
>   ":="        {AssTok}
>   '>'         {GtTok}
>   '<'         {LtTok}
>   '='         {EqTok}
>   "<="        {LETok}
>   ">="        {GETok}
>   "!="        {NETok}
>   '+'         {PlusTok}
>   '-'         {SubTok}
>   '*'         {MultTok}
>   '/'         {DivTok}
>   '%'         {ModTok}
>   "if"        {IfTok}
>   "else"      {ElseTok}
>   "while"     {WhileTok}
>   "for"       {ForTok}
>   "char"      {CharTok}
>   "print"     {PrintTok}
>   "input"     {InputTok}
>   "declare"   {DecTok}
>   ';'         {SemiTok}
>   '('         {LParenTok}
>   ')'         {RParenTok}
>   '{'         {LBraceTok}
>   '}'         {RBraceTok}
>   '['         {LBrackTok}
>   ']'         {RBrackTok}


> %%

> Command :: {Command}
> Command   : Block         {Block $1}
>           | Block Command {Sequence $1 $2}


> Block     : "while" '(' Bexp ')' '{' Command '}'                              {While $3 $6}
>           | "if" '(' Bexp ')' '{' Command '}' "else" '{' Command '}'          {IfElse $3 $6 $10}
>           | "if" '(' Bexp ')' '{' Command '}'                                 {If $3 $6}
>           | "for" '(' Assignment ';' Bexp ';' Assignment ')' '{' Command '}'  {For $3 $5 $7 $10}
>           | Assignment ';'                                                    {Assign $1}
>           | "print" '(' Aexp  ')' ';'                                         {Print $3}
>           | "print" '(' Quote ')' ';'                                         {PrintS $3}
>           | "print" '(' '(' "char" ')' Aexp ')' ';'                           {PrintC $6}
>           | "declare" var '[' int ']' ';'                                     {ArrDec $2 $4}


> Assignment: var ":=" Aexp                  {Assignment $1 $3}
>           | var '[' Aexp ']' ":=" Aexp     {ArrAss $1 $3 $6}


> Aexp      : Aexp '+' Term     {Plus $1 $3}
>           | Aexp '-' Term     {Minus $1 $3}
>           | Term              {Term $1}


> Term      : Term '*' Factor   {Mult $1 $3}
>           | Term '/' Factor   {Div $1 $3}
>           | Term '%' Factor   {Mod $1 $3}
>           | Factor            {Factor $1}


> Factor    : int               {Int $1}
>           | var               {Var $1}
>           | "input" '(' ')'   {Input}
>           | var '[' Aexp ']'  {ArrIdx $1 $3}
>           | '(' Aexp ')'      {Brack $2}


> Bexp      : Aexp '<' Aexp       {LeT $1 $3}
>           | Aexp '>' Aexp       {GrT $1 $3}
>           | Aexp '=' Aexp       {Equ $1 $3}
>           | Aexp "<=" Aexp      {LOET $1 $3}
>           | Aexp ">=" Aexp      {GOET $1 $3}
>           | Aexp "!=" Aexp      {NET $1 $3}


> Quote     : quote               {Quote $1}

> {
> happyError :: [Token] -> a
> happyError _    = error ("Parse Error\n")
> data Command    = Block Block | Sequence Block Command deriving Show
> data Block      = While Bexp Command | IfElse Bexp Command Command | If Bexp Command | For Assignment Bexp Assignment Command | Assign Assignment | Print Aexp | PrintS Quote | PrintC Aexp | ArrDec String Int deriving Show
> data Assignment = Assignment String Aexp | ArrAss String Aexp Aexp deriving Show
> data Aexp       = Plus Aexp Term   | Minus Aexp Term | Term Term deriving Show
> data Term       = Mult Term Factor | Div Term Factor | Mod Term Factor | Factor Factor deriving Show
> data Factor     = Int Int | Var String | ArrIdx String Aexp | Input | Brack Aexp | FuncCall String Aexp deriving Show
> data Bexp       = LeT Aexp Aexp | GrT Aexp Aexp | Equ Aexp Aexp | LOET Aexp Aexp | GOET Aexp Aexp | NET Aexp Aexp deriving Show
> data Quote      = Quote String deriving Show


> data Token
>     = AssTok | GtTok | LtTok | EqTok | LETok | GETok | NETok |PlusTok | SubTok | MultTok | DivTok | ModTok | IfTok | ElseTok | WhileTok | ForTok | CharTok | PrintTok
>     | InputTok | DecTok | SemiTok | LParenTok | RParenTok | LBraceTok | RBraceTok | LBrackTok | RBrackTok | NumTok Int | IdentTok String | QuoteTok String deriving Show


> ignoreComment :: String -> String
> ignoreComment ('\n': cs) = cs
> ignoreComment (c:cs) = ignoreComment cs

> lexQuote :: String -> String -> (String, String)
> lexQuote ('\"' : cs) x = (x, cs)
> lexQuote (c: cs) x = lexQuote cs (x ++ [c])  

> lexer :: String -> [Token]
> lexer [] = []
> lexer ('#': cs) = lexer (ignoreComment cs)
> lexer ('\"': cs) = QuoteTok (fst (lexQuote cs "")) : lexer (snd (lexQuote cs ""))
> lexer (c:cs) 
>	| isSpace c = lexer cs
> 	| isAlpha c = lexVar (c:cs)
>	| isDigit c = lexNum (c:cs)
> lexer ('\n':cs)= lexer cs
> lexer ('\t':cs)= lexer cs
> lexer (';':cs) = SemiTok : lexer cs
> lexer ('>':'=':cs) = GETok : lexer cs
> lexer ('<':'=':cs) = LETok : lexer cs
> lexer ('!':'=':cs) = NETok : lexer cs
> lexer ('>':cs) = GtTok : lexer cs
> lexer ('<':cs) = LtTok : lexer cs
> lexer (':': '=':cs) = AssTok : lexer cs
> lexer ('=':cs) = EqTok : lexer cs
> lexer ('+':cs) = PlusTok : lexer cs
> lexer ('-':cs) = SubTok : lexer cs
> lexer ('*':cs) = MultTok : lexer cs
> lexer ('/':cs) = DivTok : lexer cs
> lexer ('%':cs) = ModTok : lexer cs
> lexer ('(':cs) = LParenTok : lexer cs
> lexer (')':cs) = RParenTok : lexer cs
> lexer ('{':cs) = LBraceTok : lexer cs
> lexer ('}':cs) = RBraceTok : lexer cs
> lexer ('[':cs) = LBrackTok : lexer cs
> lexer (']':cs) = RBrackTok : lexer cs

> lexNum cs = NumTok (read num) : lexer rest
>	where (num,rest) = span isDigit cs

> lexVar cs =
>    case span isAlpha cs of
>    ("if",rest)     -> IfTok        : lexer rest
>    ("else",rest)   -> ElseTok      : lexer rest
>    ("while",rest)  -> WhileTok     : lexer rest
>    ("print",rest)  -> PrintTok     : lexer rest
>    ("input",rest)  -> InputTok     : lexer rest
>    ("for",rest)    -> ForTok       : lexer rest
>    ("declare",rest)-> DecTok       : lexer rest
>    ("char", rest)  -> CharTok      : lexer rest
>    (var,rest)      -> IdentTok var : lexer rest

> runParse = jwp . lexer

> }