	LDIA	2
	STA	255	255
cond0:
	LDA	255	255
	STA	0	0
	LDIA	255
	STA 	1	0
	LDA	0	0
	LDB	1	0
	JLT	loop0

	JMP	end0
loop0:
	LDIA	1
	STA	254	255
	LDIA	2
	STA	253	255
cond1:
	LDA	253	255
	STA	0	0
	LDA	255	255
	STA 	1	0
	LDA	0	0
	LDB	1	0
	JLT	loop1

	JMP	end1
loop1:
	LDA	253	255
	STA	0	0
	LDA	255	255
	LDB	0	0
	MOD
	STA 	0	0
	LDIA	0
	STA	1	0
	LDA	0	0
	LDB	1	0
	JEQ	loop2

	JMP	end2
loop2:
	LDIA	0
	STA	254	255

end2:
	LDIA	1
	STA	0	0
	LDA	253	255
	LDB	0	0
	ADD
	STA	253	255
	JMP	cond1
end1:
	LDA	254	255
	STA 	0	0
	LDIA	1
	STA	1	0
	LDA	0	0
	LDB	1	0
	JEQ	loop5

	JMP	end5
loop5:
	LDA	255	255
	OUTI
	LDIA	10
	OUTC

end5:
	LDIA	1
	STA	0	0
	LDA	255	255
	LDB	0	0
	ADD
	STA	255	255
	JMP	cond0
end0:
	HALT