INA
	STA	255	255
	LDIA	0
	STA	254	255
cond0:
	LDA	255	255
	STA 	0	0
	LDIA	1
	STA	1	0
	LDA	0	0
	LDB	1	0
	JGT	loop0

	JMP	end0
loop0:
	LDA	255	255
	OUTI
	LDIA	10
	OUTC
	LDIA	1
	STA	0	0
	LDA	254	255
	LDB	0	0
	ADD
	STA	254	255
	LDIA	2
	STA	0	0
	LDA	255	255
	LDB	0	0
	MOD
	STA 	0	0
	LDIA	0
	STA	1	0
	LDA	0	0
	LDB	1	0
	JEQ	loop1

	LDIA	1
	STA	0	0
	LDA	255	255
	STA	1	0
	LDIA	3
	LDB	1	0
	MUL
	LDB	0	0
	ADD
	STA	255	255
	JMP	end1
loop1:
	LDIA	2
	STA	0	0
	LDA	255	255
	LDB	0	0
	DIV
	STA	255	255
end1:
	JMP	cond0
end0:
	LDA	255	255
	OUTI
	LDIA	10
	OUTC
	LDIA	10
	OUTC
	LDIA	83
	OUTC
	LDIA	116
	OUTC
	LDIA	101
	OUTC
	LDIA	112
	OUTC
	LDIA	115
	OUTC
	LDIA	58
	OUTC
	LDIA	10
	OUTC
	LDA	254	255
	OUTI
	LDIA	10
	OUTC
	HALT