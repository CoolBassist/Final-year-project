{-# OPTIONS_GHC -w #-}
module JWParser where
import Data.Char
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t5 t6 t7 t8 t9 t10 t11
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 (Command)
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,188) ([4096,46080,2,64,2768,0,0,0,0,0,1,64,32768,0,0,32,0,32768,0,0,512,0,0,8,64,0,0,0,0,1024,44288,0,0,0,0,0,512,896,36864,0,4,0,6144,0,9,96,9216,32768,1,144,1536,16384,2,0,0,0,384,1024,0,56,0,0,0,0,0,0,0,0,2,0,128,1536,16384,2,24576,0,0,510,0,0,0,1,0,1024,0,0,4,32768,16385,0,0,256,0,0,0,24,2368,8192,0,0,0,0,16,6144,1024,0,0,16,0,4096,32768,1,144,1536,16384,2,0,1024,24576,0,36,0,0,2,0,2048,6144,0,9,96,9216,32768,1,144,1536,16384,2,24,2304,24576,0,36,0,0,1,6,576,6144,0,9,96,9216,32768,1,144,4096,0,0,24,2304,0,0,0,0,0,0,0,0,0,96,256,0,0,0,1536,0,0,24,0,24576,0,0,384,0,0,6,0,6144,0,4096,46080,2,64,2768,0,0,64,0,0,0,32768,3,0,3584,0,0,0,0,6,576,0,0,0,0,4096,0,0,0,0,24,4,16,0,0,0,256,0,0,4,0,0,0,96,0,0,32,0,0,0,0,0,4,0,1024,0,0,0,0,0,2,0,2048,4096,46080,2,64,2768,0,0,1024,0,0,16,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_jwp","Command","Block","Assignment","Aexp","Term","Factor","Bexp","Quote","int","var","quote","\":=\"","'>'","'<'","'='","\"<=\"","\">=\"","\"!=\"","'+'","'-'","'*'","'/'","'%'","\"if\"","\"else\"","\"while\"","\"for\"","\"char\"","\"print\"","\"input\"","\"declare\"","';'","'('","')'","'{'","'}'","'['","']'","%eof"]
        bit_start = st Prelude.* 42
        bit_end = (st Prelude.+ 1) Prelude.* 42
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..41]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (13) = happyShift action_4
action_0 (27) = happyShift action_5
action_0 (29) = happyShift action_6
action_0 (30) = happyShift action_7
action_0 (32) = happyShift action_8
action_0 (34) = happyShift action_9
action_0 (4) = happyGoto action_10
action_0 (5) = happyGoto action_11
action_0 (6) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (13) = happyShift action_4
action_1 (27) = happyShift action_5
action_1 (29) = happyShift action_6
action_1 (30) = happyShift action_7
action_1 (32) = happyShift action_8
action_1 (34) = happyShift action_9
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyFail (happyExpListPerState 2)

action_3 (35) = happyShift action_20
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (15) = happyShift action_18
action_4 (40) = happyShift action_19
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (36) = happyShift action_17
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (36) = happyShift action_16
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (36) = happyShift action_15
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (36) = happyShift action_14
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (13) = happyShift action_13
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (42) = happyAccept
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (13) = happyShift action_4
action_11 (27) = happyShift action_5
action_11 (29) = happyShift action_6
action_11 (30) = happyShift action_7
action_11 (32) = happyShift action_8
action_11 (34) = happyShift action_9
action_11 (4) = happyGoto action_12
action_11 (5) = happyGoto action_11
action_11 (6) = happyGoto action_3
action_11 _ = happyReduce_1

action_12 _ = happyReduce_2

action_13 (40) = happyShift action_37
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (12) = happyShift action_24
action_14 (13) = happyShift action_25
action_14 (14) = happyShift action_35
action_14 (33) = happyShift action_26
action_14 (36) = happyShift action_36
action_14 (7) = happyGoto action_33
action_14 (8) = happyGoto action_22
action_14 (9) = happyGoto action_23
action_14 (11) = happyGoto action_34
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (13) = happyShift action_4
action_15 (6) = happyGoto action_32
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (12) = happyShift action_24
action_16 (13) = happyShift action_25
action_16 (33) = happyShift action_26
action_16 (36) = happyShift action_27
action_16 (7) = happyGoto action_29
action_16 (8) = happyGoto action_22
action_16 (9) = happyGoto action_23
action_16 (10) = happyGoto action_31
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (12) = happyShift action_24
action_17 (13) = happyShift action_25
action_17 (33) = happyShift action_26
action_17 (36) = happyShift action_27
action_17 (7) = happyGoto action_29
action_17 (8) = happyGoto action_22
action_17 (9) = happyGoto action_23
action_17 (10) = happyGoto action_30
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (12) = happyShift action_24
action_18 (13) = happyShift action_25
action_18 (33) = happyShift action_26
action_18 (36) = happyShift action_27
action_18 (7) = happyGoto action_28
action_18 (8) = happyGoto action_22
action_18 (9) = happyGoto action_23
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (12) = happyShift action_24
action_19 (13) = happyShift action_25
action_19 (33) = happyShift action_26
action_19 (36) = happyShift action_27
action_19 (7) = happyGoto action_21
action_19 (8) = happyGoto action_22
action_19 (9) = happyGoto action_23
action_19 _ = happyFail (happyExpListPerState 19)

action_20 _ = happyReduce_7

action_21 (22) = happyShift action_42
action_21 (23) = happyShift action_43
action_21 (41) = happyShift action_59
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (24) = happyShift action_56
action_22 (25) = happyShift action_57
action_22 (26) = happyShift action_58
action_22 _ = happyReduce_16

action_23 _ = happyReduce_20

action_24 _ = happyReduce_21

action_25 (40) = happyShift action_55
action_25 _ = happyReduce_22

action_26 (36) = happyShift action_54
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (12) = happyShift action_24
action_27 (13) = happyShift action_25
action_27 (33) = happyShift action_26
action_27 (36) = happyShift action_27
action_27 (7) = happyGoto action_39
action_27 (8) = happyGoto action_22
action_27 (9) = happyGoto action_23
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (22) = happyShift action_42
action_28 (23) = happyShift action_43
action_28 _ = happyReduce_12

action_29 (16) = happyShift action_48
action_29 (17) = happyShift action_49
action_29 (18) = happyShift action_50
action_29 (19) = happyShift action_51
action_29 (20) = happyShift action_52
action_29 (21) = happyShift action_53
action_29 (22) = happyShift action_42
action_29 (23) = happyShift action_43
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (37) = happyShift action_47
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (37) = happyShift action_46
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (35) = happyShift action_45
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (22) = happyShift action_42
action_33 (23) = happyShift action_43
action_33 (37) = happyShift action_44
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (37) = happyShift action_41
action_34 _ = happyFail (happyExpListPerState 34)

action_35 _ = happyReduce_32

action_36 (12) = happyShift action_24
action_36 (13) = happyShift action_25
action_36 (31) = happyShift action_40
action_36 (33) = happyShift action_26
action_36 (36) = happyShift action_27
action_36 (7) = happyGoto action_39
action_36 (8) = happyGoto action_22
action_36 (9) = happyGoto action_23
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (12) = happyShift action_38
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (41) = happyShift action_81
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (22) = happyShift action_42
action_39 (23) = happyShift action_43
action_39 (37) = happyShift action_80
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (37) = happyShift action_79
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (35) = happyShift action_78
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (12) = happyShift action_24
action_42 (13) = happyShift action_25
action_42 (33) = happyShift action_26
action_42 (36) = happyShift action_27
action_42 (8) = happyGoto action_77
action_42 (9) = happyGoto action_23
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (12) = happyShift action_24
action_43 (13) = happyShift action_25
action_43 (33) = happyShift action_26
action_43 (36) = happyShift action_27
action_43 (8) = happyGoto action_76
action_43 (9) = happyGoto action_23
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (35) = happyShift action_75
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (12) = happyShift action_24
action_45 (13) = happyShift action_25
action_45 (33) = happyShift action_26
action_45 (36) = happyShift action_27
action_45 (7) = happyGoto action_29
action_45 (8) = happyGoto action_22
action_45 (9) = happyGoto action_23
action_45 (10) = happyGoto action_74
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (38) = happyShift action_73
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (38) = happyShift action_72
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (12) = happyShift action_24
action_48 (13) = happyShift action_25
action_48 (33) = happyShift action_26
action_48 (36) = happyShift action_27
action_48 (7) = happyGoto action_71
action_48 (8) = happyGoto action_22
action_48 (9) = happyGoto action_23
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (12) = happyShift action_24
action_49 (13) = happyShift action_25
action_49 (33) = happyShift action_26
action_49 (36) = happyShift action_27
action_49 (7) = happyGoto action_70
action_49 (8) = happyGoto action_22
action_49 (9) = happyGoto action_23
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (12) = happyShift action_24
action_50 (13) = happyShift action_25
action_50 (33) = happyShift action_26
action_50 (36) = happyShift action_27
action_50 (7) = happyGoto action_69
action_50 (8) = happyGoto action_22
action_50 (9) = happyGoto action_23
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (12) = happyShift action_24
action_51 (13) = happyShift action_25
action_51 (33) = happyShift action_26
action_51 (36) = happyShift action_27
action_51 (7) = happyGoto action_68
action_51 (8) = happyGoto action_22
action_51 (9) = happyGoto action_23
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (12) = happyShift action_24
action_52 (13) = happyShift action_25
action_52 (33) = happyShift action_26
action_52 (36) = happyShift action_27
action_52 (7) = happyGoto action_67
action_52 (8) = happyGoto action_22
action_52 (9) = happyGoto action_23
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (12) = happyShift action_24
action_53 (13) = happyShift action_25
action_53 (33) = happyShift action_26
action_53 (36) = happyShift action_27
action_53 (7) = happyGoto action_66
action_53 (8) = happyGoto action_22
action_53 (9) = happyGoto action_23
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (37) = happyShift action_65
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (12) = happyShift action_24
action_55 (13) = happyShift action_25
action_55 (33) = happyShift action_26
action_55 (36) = happyShift action_27
action_55 (7) = happyGoto action_64
action_55 (8) = happyGoto action_22
action_55 (9) = happyGoto action_23
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (12) = happyShift action_24
action_56 (13) = happyShift action_25
action_56 (33) = happyShift action_26
action_56 (36) = happyShift action_27
action_56 (9) = happyGoto action_63
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (12) = happyShift action_24
action_57 (13) = happyShift action_25
action_57 (33) = happyShift action_26
action_57 (36) = happyShift action_27
action_57 (9) = happyGoto action_62
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (12) = happyShift action_24
action_58 (13) = happyShift action_25
action_58 (33) = happyShift action_26
action_58 (36) = happyShift action_27
action_58 (9) = happyGoto action_61
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (15) = happyShift action_60
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (12) = happyShift action_24
action_60 (13) = happyShift action_25
action_60 (33) = happyShift action_26
action_60 (36) = happyShift action_27
action_60 (7) = happyGoto action_88
action_60 (8) = happyGoto action_22
action_60 (9) = happyGoto action_23
action_60 _ = happyFail (happyExpListPerState 60)

action_61 _ = happyReduce_19

action_62 _ = happyReduce_18

action_63 _ = happyReduce_17

action_64 (22) = happyShift action_42
action_64 (23) = happyShift action_43
action_64 (41) = happyShift action_87
action_64 _ = happyFail (happyExpListPerState 64)

action_65 _ = happyReduce_23

action_66 (22) = happyShift action_42
action_66 (23) = happyShift action_43
action_66 _ = happyReduce_31

action_67 (22) = happyShift action_42
action_67 (23) = happyShift action_43
action_67 _ = happyReduce_30

action_68 (22) = happyShift action_42
action_68 (23) = happyShift action_43
action_68 _ = happyReduce_29

action_69 (22) = happyShift action_42
action_69 (23) = happyShift action_43
action_69 _ = happyReduce_28

action_70 (22) = happyShift action_42
action_70 (23) = happyShift action_43
action_70 _ = happyReduce_26

action_71 (22) = happyShift action_42
action_71 (23) = happyShift action_43
action_71 _ = happyReduce_27

action_72 (13) = happyShift action_4
action_72 (27) = happyShift action_5
action_72 (29) = happyShift action_6
action_72 (30) = happyShift action_7
action_72 (32) = happyShift action_8
action_72 (34) = happyShift action_9
action_72 (4) = happyGoto action_86
action_72 (5) = happyGoto action_11
action_72 (6) = happyGoto action_3
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (13) = happyShift action_4
action_73 (27) = happyShift action_5
action_73 (29) = happyShift action_6
action_73 (30) = happyShift action_7
action_73 (32) = happyShift action_8
action_73 (34) = happyShift action_9
action_73 (4) = happyGoto action_85
action_73 (5) = happyGoto action_11
action_73 (6) = happyGoto action_3
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (35) = happyShift action_84
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_8

action_76 (24) = happyShift action_56
action_76 (25) = happyShift action_57
action_76 (26) = happyShift action_58
action_76 _ = happyReduce_15

action_77 (24) = happyShift action_56
action_77 (25) = happyShift action_57
action_77 (26) = happyShift action_58
action_77 _ = happyReduce_14

action_78 _ = happyReduce_9

action_79 (12) = happyShift action_24
action_79 (13) = happyShift action_25
action_79 (33) = happyShift action_26
action_79 (36) = happyShift action_27
action_79 (7) = happyGoto action_83
action_79 (8) = happyGoto action_22
action_79 (9) = happyGoto action_23
action_79 _ = happyFail (happyExpListPerState 79)

action_80 _ = happyReduce_25

action_81 (35) = happyShift action_82
action_81 _ = happyFail (happyExpListPerState 81)

action_82 _ = happyReduce_11

action_83 (22) = happyShift action_42
action_83 (23) = happyShift action_43
action_83 (37) = happyShift action_92
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (13) = happyShift action_4
action_84 (6) = happyGoto action_91
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (39) = happyShift action_90
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (39) = happyShift action_89
action_86 _ = happyFail (happyExpListPerState 86)

action_87 _ = happyReduce_24

action_88 (22) = happyShift action_42
action_88 (23) = happyShift action_43
action_88 _ = happyReduce_13

action_89 (28) = happyShift action_95
action_89 _ = happyReduce_5

action_90 _ = happyReduce_3

action_91 (37) = happyShift action_94
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (35) = happyShift action_93
action_92 _ = happyFail (happyExpListPerState 92)

action_93 _ = happyReduce_10

action_94 (38) = happyShift action_97
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (38) = happyShift action_96
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (13) = happyShift action_4
action_96 (27) = happyShift action_5
action_96 (29) = happyShift action_6
action_96 (30) = happyShift action_7
action_96 (32) = happyShift action_8
action_96 (34) = happyShift action_9
action_96 (4) = happyGoto action_99
action_96 (5) = happyGoto action_11
action_96 (6) = happyGoto action_3
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (13) = happyShift action_4
action_97 (27) = happyShift action_5
action_97 (29) = happyShift action_6
action_97 (30) = happyShift action_7
action_97 (32) = happyShift action_8
action_97 (34) = happyShift action_9
action_97 (4) = happyGoto action_98
action_97 (5) = happyGoto action_11
action_97 (6) = happyGoto action_3
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (39) = happyShift action_101
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (39) = happyShift action_100
action_99 _ = happyFail (happyExpListPerState 99)

action_100 _ = happyReduce_4

action_101 _ = happyReduce_6

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Block happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  4 happyReduction_2
happyReduction_2 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Sequence happy_var_1 happy_var_2
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happyReduce 7 5 happyReduction_3
happyReduction_3 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (While happy_var_3 happy_var_6
	) `HappyStk` happyRest

happyReduce_4 = happyReduce 11 5 happyReduction_4
happyReduction_4 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_10) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (IfElse happy_var_3 happy_var_6 happy_var_10
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 7 5 happyReduction_5
happyReduction_5 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (If happy_var_3 happy_var_6
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 11 5 happyReduction_6
happyReduction_6 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_10) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (For happy_var_3 happy_var_5 happy_var_7 happy_var_10
	) `HappyStk` happyRest

happyReduce_7 = happySpecReduce_2  5 happyReduction_7
happyReduction_7 _
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (Assign happy_var_1
	)
happyReduction_7 _ _  = notHappyAtAll 

happyReduce_8 = happyReduce 5 5 happyReduction_8
happyReduction_8 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (Print happy_var_3
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 5 5 happyReduction_9
happyReduction_9 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (PrintS happy_var_3
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 8 5 happyReduction_10
happyReduction_10 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (PrintC happy_var_6
	) `HappyStk` happyRest

happyReduce_11 = happyReduce 6 5 happyReduction_11
happyReduction_11 (_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (NumTok happy_var_4)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (IdentTok happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (ArrDec happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_12 = happySpecReduce_3  6 happyReduction_12
happyReduction_12 (HappyAbsSyn7  happy_var_3)
	_
	(HappyTerminal (IdentTok happy_var_1))
	 =  HappyAbsSyn6
		 (Assignment happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happyReduce 6 6 happyReduction_13
happyReduction_13 ((HappyAbsSyn7  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (IdentTok happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (ArrAss happy_var_1 happy_var_3 happy_var_6
	) `HappyStk` happyRest

happyReduce_14 = happySpecReduce_3  7 happyReduction_14
happyReduction_14 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Plus happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  7 happyReduction_15
happyReduction_15 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Minus happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  7 happyReduction_16
happyReduction_16 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (Term happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  8 happyReduction_17
happyReduction_17 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (Mult happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  8 happyReduction_18
happyReduction_18 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (Div happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  8 happyReduction_19
happyReduction_19 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (Mod happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  8 happyReduction_20
happyReduction_20 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (Factor happy_var_1
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  9 happyReduction_21
happyReduction_21 (HappyTerminal (NumTok happy_var_1))
	 =  HappyAbsSyn9
		 (Int happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  9 happyReduction_22
happyReduction_22 (HappyTerminal (IdentTok happy_var_1))
	 =  HappyAbsSyn9
		 (Var happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  9 happyReduction_23
happyReduction_23 _
	_
	_
	 =  HappyAbsSyn9
		 (Input
	)

happyReduce_24 = happyReduce 4 9 happyReduction_24
happyReduction_24 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (IdentTok happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (ArrIdx happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_25 = happySpecReduce_3  9 happyReduction_25
happyReduction_25 _
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Brack happy_var_2
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  10 happyReduction_26
happyReduction_26 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn10
		 (LeT happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  10 happyReduction_27
happyReduction_27 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn10
		 (GrT happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  10 happyReduction_28
happyReduction_28 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn10
		 (Equ happy_var_1 happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  10 happyReduction_29
happyReduction_29 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn10
		 (LOET happy_var_1 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  10 happyReduction_30
happyReduction_30 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn10
		 (GOET happy_var_1 happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  10 happyReduction_31
happyReduction_31 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn10
		 (NET happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  11 happyReduction_32
happyReduction_32 (HappyTerminal (QuoteTok happy_var_1))
	 =  HappyAbsSyn11
		 (Quote happy_var_1
	)
happyReduction_32 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 42 42 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	NumTok happy_dollar_dollar -> cont 12;
	IdentTok happy_dollar_dollar -> cont 13;
	QuoteTok happy_dollar_dollar -> cont 14;
	AssTok -> cont 15;
	GtTok -> cont 16;
	LtTok -> cont 17;
	EqTok -> cont 18;
	LETok -> cont 19;
	GETok -> cont 20;
	NETok -> cont 21;
	PlusTok -> cont 22;
	SubTok -> cont 23;
	MultTok -> cont 24;
	DivTok -> cont 25;
	ModTok -> cont 26;
	IfTok -> cont 27;
	ElseTok -> cont 28;
	WhileTok -> cont 29;
	ForTok -> cont 30;
	CharTok -> cont 31;
	PrintTok -> cont 32;
	InputTok -> cont 33;
	DecTok -> cont 34;
	SemiTok -> cont 35;
	LParenTok -> cont 36;
	RParenTok -> cont 37;
	LBraceTok -> cont 38;
	RBraceTok -> cont 39;
	LBrackTok -> cont 40;
	RBrackTok -> cont 41;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 42 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> happyError tokens)
jwp tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


happyError :: [Token] -> a
happyError _    = error ("Parse Error\n")
data Command    = Block Block | Sequence Block Command deriving Show
data Block      = While Bexp Command | IfElse Bexp Command Command | If Bexp Command | For Assignment Bexp Assignment Command | Assign Assignment | Print Aexp | PrintS Quote | PrintC Aexp | ArrDec String Int deriving Show
data Assignment = Assignment String Aexp | ArrAss String Aexp Aexp deriving Show
data Aexp       = Plus Aexp Term   | Minus Aexp Term | Term Term deriving Show
data Term       = Mult Term Factor | Div Term Factor | Mod Term Factor | Factor Factor deriving Show
data Factor     = Int Int | Var String | ArrIdx String Aexp | Input | Brack Aexp | FuncCall String Aexp deriving Show
data Bexp       = LeT Aexp Aexp | GrT Aexp Aexp | Equ Aexp Aexp | LOET Aexp Aexp | GOET Aexp Aexp | NET Aexp Aexp deriving Show
data Quote      = Quote String deriving Show


data Token
    = AssTok | GtTok | LtTok | EqTok | LETok | GETok | NETok |PlusTok | SubTok | MultTok | DivTok | ModTok | IfTok | ElseTok | WhileTok | ForTok | CharTok | PrintTok
    | InputTok | DecTok | SemiTok | LParenTok | RParenTok | LBraceTok | RBraceTok | LBrackTok | RBrackTok | NumTok Int | IdentTok String | QuoteTok String deriving Show


ignoreComment :: String -> String
ignoreComment ('\n': cs) = cs
ignoreComment (c:cs) = ignoreComment cs

lexQuote :: String -> String -> (String, String)
lexQuote ('\"' : cs) x = (x, cs)
lexQuote (c: cs) x = lexQuote cs (x ++ [c])  

lexer :: String -> [Token]
lexer [] = []
lexer ('#': cs) = lexer (ignoreComment cs)
lexer ('\"': cs) = QuoteTok (fst (lexQuote cs "")) : lexer (snd (lexQuote cs ""))
lexer (c:cs) 
	| isSpace c = lexer cs
	| isAlpha c = lexVar (c:cs)
	| isDigit c = lexNum (c:cs)
lexer ('\n':cs)= lexer cs
lexer ('\t':cs)= lexer cs
lexer (';':cs) = SemiTok : lexer cs
lexer ('>':'=':cs) = GETok : lexer cs
lexer ('<':'=':cs) = LETok : lexer cs
lexer ('!':'=':cs) = NETok : lexer cs
lexer ('>':cs) = GtTok : lexer cs
lexer ('<':cs) = LtTok : lexer cs
lexer (':': '=':cs) = AssTok : lexer cs
lexer ('=':cs) = EqTok : lexer cs
lexer ('+':cs) = PlusTok : lexer cs
lexer ('-':cs) = SubTok : lexer cs
lexer ('*':cs) = MultTok : lexer cs
lexer ('/':cs) = DivTok : lexer cs
lexer ('%':cs) = ModTok : lexer cs
lexer ('(':cs) = LParenTok : lexer cs
lexer (')':cs) = RParenTok : lexer cs
lexer ('{':cs) = LBraceTok : lexer cs
lexer ('}':cs) = RBraceTok : lexer cs
lexer ('[':cs) = LBrackTok : lexer cs
lexer (']':cs) = RBrackTok : lexer cs

lexNum cs = NumTok (read num) : lexer rest
	where (num,rest) = span isDigit cs

lexVar cs =
   case span isAlpha cs of
   ("if",rest)     -> IfTok        : lexer rest
   ("else",rest)   -> ElseTok      : lexer rest
   ("while",rest)  -> WhileTok     : lexer rest
   ("print",rest)  -> PrintTok     : lexer rest
   ("input",rest)  -> InputTok     : lexer rest
   ("for",rest)    -> ForTok       : lexer rest
   ("declare",rest)-> DecTok       : lexer rest
   ("char", rest)  -> CharTok      : lexer rest
   (var,rest)      -> IdentTok var : lexer rest

runParse = jwp . lexer
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
