	.file	"lex.yy.c"
	.version	"01.01"
	.ident	"xpg4plus @(#) stdio.h 20.1 94/12/04 "
	.data
	.globl	yyin
	.align	4
yyin:
	.long	__iob
	.globl	yyout
yyout:
	.long	__iob+16
	.text
	.def	d1;	.scl	2;	.type	040;	.val	d1;	.endef
	.globl	d1
	.align	4
d1:
	jmp	.L121
.L120:
	movl	8(%ebp),%eax
	leal	2(%eax),%eax
	pushl	%eax
	call	atoi
	popl	%ecx
	movl	%eax,p1
/REGAL	0	PARAM	8(%ebp)	4
.L119:
	leave
	ret/0
.L121:
	pushl	%ebp
	movl	%esp,%ebp
	jmp	.L120
	.def	d1;	.scl	-1;	.val	.;	.endef
	.globl	d1
	.align	4
d1:
	jmp	.L125
.L124:
	pushl	$59
	pushl	8(%ebp)
	call	strchr
	addl	$8,%esp
	movl	%eax,-4(%ebp)
	movl	8(%ebp),%eax
	leal	2(%eax),%eax
	pushl	%eax
	call	atoi
	popl	%ecx
	movl	%eax,p1
	cmpl	$0,-4(%ebp)
	je	.L126
	movl	-4(%ebp),%eax
	incl	%eax
	pushl	%eax
	call	atoi
	popl	%ecx
	movl	%eax,p2
	jmp	.L127
.L126:
	movl	$0,p2
.L127:
/REGAL	0	AUTO	-4(%ebp)	4
/REGAL	0	PARAM	8(%ebp)	4
.L123:
	leave
	ret/0
.L125:
	pushl	%ebp
	movl	%esp,%ebp
	pushl	%eax
	jmp	.L124
	.def	d1;	.scl	-1;	.val	.;	.endef
	.def	yylex;	.scl	2;	.type	044;	.val	yylex;	.endef
	.globl	yylex
	.align	4
yylex:
	jmp	.L153
.L152:
/LOOP	BEG
	jmp	.L133
/LOOP	HDR
.L130:
.L134:
	jmp	.L136
.L137:
	call	yywrap
	testl	%eax,%eax
	je	.L138
	xorl	%eax,%eax
	jmp	.L151
.L138:
	jmp	.L135
.L139:
	pushl	$yytext
	call	d1
	popl	%ecx
	movl	$256,%eax
	jmp	.L151
.L140:
	pushl	$yytext
	call	d1
	popl	%ecx
	movl	$257,%eax
	jmp	.L151
.L141:
	pushl	$yytext
	call	d1
	popl	%ecx
	movl	$258,%eax
	jmp	.L151
.L142:
	pushl	$yytext
	call	d1
	popl	%ecx
	movl	$259,%eax
	jmp	.L151
.L143:
	pushl	$yytext
	call	d1
	popl	%ecx
	movl	$260,%eax
	jmp	.L151
.L144:
	pushl	$yytext
	call	d1
	popl	%ecx
	movl	$261,%eax
	jmp	.L151
.L145:
	pushl	$yytext
	call	d1
	popl	%ecx
	movl	$263,%eax
	jmp	.L151
.L146:
	pushl	$yytext
	call	d2
	popl	%ecx
	movl	$262,%eax
	jmp	.L151
.L148:
	movzbl	yytext,%eax
	jmp	.L151
.L149:
	jmp	.L135
.L150:
	.text
	pushl	%edi
	pushl	$.X154
	pushl	yyout
	call	fprintf
	addl	$12,%esp
	jmp	.L135
.L136:
	movl	%edi,%eax
	subl	$-1,%eax
	cmpl	$10,%eax
	ja	.L150
	jmp	*.L155(,%eax,4)
	.data
	.align	4
/SWBEG
.L155:
	.long	.L149
	.long	.L137
	.long	.L139
	.long	.L140
	.long	.L141
	.long	.L142
	.long	.L143
	.long	.L144
	.long	.L145
	.long	.L146
	.long	.L148
/SWEND
	.text
.L135:
.L133:
/LOOP	COND
	call	yylook
	movl	%eax,%edi
	testl	%edi,%edi
	jge	.L130
/LOOP	END
	xorl	%eax,%eax
	jmp	.L151
/REGAL	0	EXTERN	yyprevious	4
.L151:
	popl	%edi
	leave
	ret/1
.L153:
	pushl	%ebp
	movl	%esp,%ebp
	pushl	%edi
	jmp	.L152
	.def	yylex;	.scl	-1;	.val	.;	.endef
	.def	main;	.scl	2;	.type	044;	.val	main;	.endef
	.globl	main
	.align	4
main:
	jmp	.L175
.L174:
	.text
	pushl	$257
	pushl	$256
	pushl	$.X176
	call	printf
	addl	$12,%esp
/LOOP	BEG
	jmp	.L160
/LOOP	HDR
.L157:
	jmp	.L162
.L163:
	.text
	pushl	p1
	pushl	$.X177
	call	printf
	addl	$8,%esp
	jmp	.L161
.L164:
	.text
	pushl	p1
	pushl	$.X178
	call	printf
	addl	$8,%esp
	jmp	.L161
.L165:
	.text
	pushl	p1
	pushl	$.X179
	call	printf
	addl	$8,%esp
	jmp	.L161
.L166:
	.text
	pushl	p1
	pushl	$.X180
	call	printf
	addl	$8,%esp
	jmp	.L161
.L167:
	.text
	pushl	p1
	pushl	$.X181
	call	printf
	addl	$8,%esp
	jmp	.L161
.L168:
	.text
	pushl	p1
	pushl	$.X182
	call	printf
	addl	$8,%esp
	jmp	.L161
.L169:
	.text
	pushl	p1
	pushl	$.X183
	call	printf
	addl	$8,%esp
	jmp	.L161
.L170:
	.text
	pushl	p2
	pushl	p1
	pushl	$.X184
	call	printf
	addl	$12,%esp
	jmp	.L161
.L171:
	.text
	pushl	%edi
	pushl	$.X185
	call	printf
	addl	$8,%esp
	jmp	.L161
.L172:
	jmp	.L161
.L162:
	movl	%edi,%eax
	cmpl	$260,%eax
	je	.L167
	jg	.L186
	cmpl	$258,%eax
	je	.L165
	jg	.L187
	cmpl	$256,%eax
	je	.L163
	jg	.L188
	cmpl	$0,%eax
	je	.L172
	jmp	.L171
.L188:
	cmpl	$257,%eax
	je	.L164
	jmp	.L171
.L187:
	cmpl	$259,%eax
	je	.L166
	jmp	.L171
.L186:
	cmpl	$262,%eax
	je	.L170
	jg	.L189
	cmpl	$261,%eax
	je	.L168
	jmp	.L171
.L189:
	cmpl	$263,%eax
	je	.L169
	jmp	.L171
	jmp	.L171
.L161:
.L160:
/LOOP	COND
	call	yylex
	movl	%eax,%edi
	testl	%edi,%edi
	jne	.L157
/LOOP	END
	.text
	pushl	$.X190
	call	printf
	popl	%ecx
	xorl	%eax,%eax
	jmp	.L173
.L173:
	popl	%edi
	leave
	ret/1
.L175:
	pushl	%ebp
	movl	%esp,%ebp
	pushl	%edi
	jmp	.L174
	.def	main;	.scl	-1;	.val	.;	.endef
	.data
	.globl	yyvstop
	.align	4
yyvstop:
	.long	0
	.long	9
	.long	0
	.long	9
	.long	0
	.long	7
	.long	0
	.long	5
	.long	0
	.long	6
	.long	0
	.long	4
	.long	0
	.long	2
	.long	0
	.long	3
	.long	0
	.long	8
	.long	0
	.long	1
	.long	0
	.long	0
	.globl	yycrank
yycrank:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	3
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	3
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	4
	.byte	2
	.byte	4
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	3
	.byte	0
	.byte	0
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	0
	.byte	0
	.byte	5
	.byte	6
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	5
	.byte	7
	.byte	5
	.byte	8
	.byte	5
	.byte	9
	.byte	5
	.byte	10
	.byte	5
	.byte	11
	.byte	5
	.byte	12
	.byte	0
	.byte	0
	.byte	5
	.byte	13
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	4
	.byte	5
	.byte	5
	.byte	14
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	6
	.byte	13
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.globl	yysvec
	.align	4
yysvec:
	.long	0
	.long	0
	.long	0
	.long	yycrank-2
	.long	0
	.long	0
	.long	yycrank-4
	.long	yysvec+12
	.long	0
	.long	yycrank
	.long	0
	.long	yyvstop+4
	.long	yycrank+2
	.long	0
	.long	yyvstop+12
	.long	yycrank+6
	.long	0
	.long	0
	.long	yycrank+56
	.long	0
	.long	0
	.long	yycrank
	.long	0
	.long	yyvstop+20
	.long	yycrank
	.long	0
	.long	yyvstop+28
	.long	yycrank
	.long	0
	.long	yyvstop+36
	.long	yycrank
	.long	0
	.long	yyvstop+44
	.long	yycrank
	.long	0
	.long	yyvstop+52
	.long	yycrank
	.long	0
	.long	yyvstop+60
	.long	yycrank
	.long	0
	.long	yyvstop+68
	.long	yycrank
	.long	0
	.long	yyvstop+76
	.long	0
	.long	0
	.long	0
	.globl	yytop
yytop:
	.long	yycrank+200
	.globl	yybgin
yybgin:
	.long	yysvec+12
	.globl	yymatch
yymatch:
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	10
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.globl	yyextra
yyextra:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.ident	"@(#) ncform 20.1 94/12/04 "
	.ident	"@(#)libl:lib/ncform	1.7"
	.globl	yylineno
	.align	4
yylineno:
	.long	1
	.globl	yysptr
yysptr:
	.long	yysbuf
	.globl	yyprevious
yyprevious:
	.long	10
	.text
	.def	yylook;	.scl	2;	.type	044;	.val	yylook;	.endef
	.globl	yylook
	.align	4
yylook:
	jmp	.L249
.L248:
	movl	$1,-16(%ebp)
	cmpl	$0,yymorfg
	jne	.L200
	movl	$yytext,%ebx
	jmp	.L201
.L200:
	movl	$0,yymorfg
	movl	yyleng,%eax
	leal	yytext(%eax),%eax
	movl	%eax,%ebx
.L201:
/LOOP	BEG
/LOOP	HDR
.L202:
	movl	$yylstate,%edi
	movl	yybgin,%eax
	movl	%eax,-4(%ebp)
	movl	%eax,yyestate
	cmpl	$10,yyprevious
	jne	.L205
	addl	$12,-4(%ebp)
.L205:
/LOOP	BEG
/LOOP	HDR
.L206:
	movl	-4(%ebp),%eax
	movl	(%eax),%esi
	cmpl	$yycrank,%esi
	jne	.L209
	cmpl	$0,-16(%ebp)
	jne	.L209
	movl	-4(%ebp),%eax
	movl	4(%eax),%eax
	movl	%eax,-8(%ebp)
	cmpl	$0,-8(%ebp)
	jne	.L210
	jmp	.L208
.L210:
	movl	-8(%ebp),%eax
	cmpl	$yycrank,(%eax)
	jne	.L211
	jmp	.L208
.L211:
.L209:
	cmpl	$yysbuf,yysptr
	jna	.L254
	decl	yysptr
	movl	yysptr,%eax
	movzbl	(%eax),%eax
	movl	%eax,yytchar
	jmp	.L255
.L254:
	movl	yyin,%eax
	decl	(%eax)
	jge	.L256
	pushl	yyin
	call	__filbuf
	popl	%ecx
	jmp	.L257
.L256:
	movl	yyin,%eax
	movl	4(%eax),%edx
	incl	4(%eax)
	movzbl	(%edx),%eax
.L257:
	movl	%eax,yytchar
.L255:
	cmpl	$10,%eax
	jne	.L252
	incl	yylineno
	movl	yytchar,%eax
	jmp	.L253
.L252:
	movl	yytchar,%eax
.L253:
	cmpl	$-1,%eax
	jne	.L250
	movl	%ebx,%eax
	incl	%ebx
	movl	$0,-12(%ebp)
	movl	-12(%ebp),%edx
	movb	%dl,(%eax)
	jmp	.L251
.L250:
	movl	%ebx,%eax
	incl	%ebx
	movl	yytchar,%edx
	movl	%edx,-12(%ebp)
	movb	%dl,(%eax)
.L251:
	cmpl	$yytext+200,%ebx
	jna	.L212
	.text
	pushl	$200
	pushl	$.X258
	pushl	yyout
	call	fprintf
	addl	$12,%esp
	pushl	$1
	call	exit
	popl	%ecx
.L212:
	movl	$0,-16(%ebp)
.L214:
	movl	%esi,-20(%ebp)
	cmpl	$yycrank,%esi
	jle	.L215
	movl	-20(%ebp),%eax
	movl	-12(%ebp),%edx
	leal	(%eax,%edx,2),%eax
	movl	%eax,%esi
	cmpl	yytop,%esi
	jnbe	.L216
	movzbl	(%esi),%eax
	imull	$12,%eax,%eax
	leal	yysvec(%eax),%eax
	cmpl	-4(%ebp),%eax
	jne	.L216
	movzbl	1(%esi),%eax
	imull	$12,%eax,%eax
	leal	yysvec(%eax),%eax
	cmpl	$yysvec,%eax
	jne	.L217
	decl	%ebx
	movzbl	(%ebx),%eax
	movl	%eax,yytchar
	cmpl	$10,yytchar
	jne	.L218
	decl	yylineno
.L218:
	movl	yysptr,%eax
	incl	yysptr
	movb	yytchar,%dl
	movb	%dl,(%eax)
	jmp	.L208
.L217:
	movzbl	1(%esi),%eax
	imull	$12,%eax,%eax
	leal	yysvec(%eax),%eax
	movl	%eax,-4(%ebp)
	movl	%eax,(%edi)
	addl	$4,%edi
	cmpl	$yylstate+800,%edi
	jna	.L219
	.text
	pushl	$200
	pushl	$.X259
	pushl	yyout
	call	fprintf
	addl	$12,%esp
	pushl	$1
	call	exit
	popl	%ecx
.L219:
	jmp	.L220
.L216:
	jmp	.L221
.L215:
	cmpl	$yycrank,%esi
	jge	.L222
	movl	$yycrank,%eax
	subl	%esi,%eax
	movl	$2,%ecx
       cltd
       idivl   %ecx
	leal	yycrank(,%eax,2),%eax
	movl	%eax,-20(%ebp)
	movl	%eax,%esi
	movl	-12(%ebp),%eax
	leal	(,%eax,2),%eax
	addl	%eax,%esi
	cmpl	yytop,%esi
	jnbe	.L223
	movzbl	(%esi),%eax
	imull	$12,%eax,%eax
	leal	yysvec(%eax),%eax
	cmpl	-4(%ebp),%eax
	jne	.L223
	movzbl	1(%esi),%eax
	imull	$12,%eax,%eax
	leal	yysvec(%eax),%eax
	cmpl	$yysvec,%eax
	jne	.L224
	decl	%ebx
	movzbl	(%ebx),%eax
	movl	%eax,yytchar
	cmpl	$10,yytchar
	jne	.L225
	decl	yylineno
.L225:
	movl	yysptr,%eax
	incl	yysptr
	movb	yytchar,%dl
	movb	%dl,(%eax)
	jmp	.L208
.L224:
	movzbl	1(%esi),%eax
	imull	$12,%eax,%eax
	leal	yysvec(%eax),%eax
	movl	%eax,-4(%ebp)
	movl	%eax,(%edi)
	addl	$4,%edi
	cmpl	$yylstate+800,%edi
	jna	.L226
	.text
	pushl	$200
	pushl	$.X260
	pushl	yyout
	call	fprintf
	addl	$12,%esp
	pushl	$1
	call	exit
	popl	%ecx
.L226:
	jmp	.L220
.L223:
	movl	-20(%ebp),%eax
	movl	-12(%ebp),%edx
	movzbl	yymatch(%edx),%edx
	leal	(%eax,%edx,2),%eax
	movl	%eax,%esi
	cmpl	yytop,%esi
	jnbe	.L227
	movzbl	(%esi),%eax
	imull	$12,%eax,%eax
	leal	yysvec(%eax),%eax
	cmpl	-4(%ebp),%eax
	jne	.L227
	movzbl	1(%esi),%eax
	imull	$12,%eax,%eax
	leal	yysvec(%eax),%eax
	cmpl	$yysvec,%eax
	jne	.L228
	decl	%ebx
	movzbl	(%ebx),%eax
	movl	%eax,yytchar
	cmpl	$10,yytchar
	jne	.L229
	decl	yylineno
.L229:
	movl	yysptr,%eax
	incl	yysptr
	movb	yytchar,%dl
	movb	%dl,(%eax)
	jmp	.L208
.L228:
	movzbl	1(%esi),%eax
	imull	$12,%eax,%eax
	leal	yysvec(%eax),%eax
	movl	%eax,-4(%ebp)
	movl	%eax,(%edi)
	addl	$4,%edi
	cmpl	$yylstate+800,%edi
	jna	.L230
	.text
	pushl	$200
	pushl	$.X261
	pushl	yyout
	call	fprintf
	addl	$12,%esp
	pushl	$1
	call	exit
	popl	%ecx
.L230:
	jmp	.L220
.L227:
.L222:
.L221:
	movl	-4(%ebp),%eax
	movl	4(%eax),%eax
	movl	%eax,-4(%ebp)
	testl	%eax,%eax
	je	.L231
	movl	-4(%ebp),%eax
	movl	(%eax),%esi
	cmpl	$yycrank,%esi
	je	.L231
	jmp	.L214
.L231:
	decl	%ebx
	movzbl	(%ebx),%eax
	movl	%eax,yytchar
	cmpl	$10,yytchar
	jne	.L232
	decl	yylineno
.L232:
	movl	yysptr,%eax
	incl	yysptr
	movb	yytchar,%dl
	movb	%dl,(%eax)
	jmp	.L208
.L220:
/LOOP	COND
	jmp	.L206
/LOOP	END
.L208:
/LOOP	BEG
	jmp	.L236
/LOOP	HDR
.L233:
	movb	$0,(%ebx)
	decl	%ebx
	cmpl	$0,(%edi)
	je	.L237
	movl	(%edi),%eax
	movl	8(%eax),%eax
	movl	%eax,yyfnd
	testl	%eax,%eax
	je	.L237
	movl	yyfnd,%eax
	cmpl	$0,(%eax)
	jle	.L237
	movl	%edi,yyolsp
	movl	yyfnd,%eax
	movl	(%eax),%eax
	cmpb	$0,yyextra(%eax)
	je	.L238
/LOOP	BEG
	jmp	.L242
/LOOP	HDR
.L239:
	subl	$4,%edi
	movl	%ebx,%eax
	decl	%ebx
	movzbl	(%eax),%eax
	movl	%eax,yytchar
	cmpl	$10,yytchar
	jne	.L243
	decl	yylineno
.L243:
	movl	yysptr,%eax
	incl	yysptr
	movb	yytchar,%dl
	movb	%dl,(%eax)
.L242:
/LOOP	COND
	movl	yyfnd,%eax
	movl	(%eax),%eax
	negl	%eax
	pushl	%eax
	movl	(%edi),%eax
	pushl	8(%eax)
	call	yyback
	addl	$8,%esp
	cmpl	$1,%eax
	je	.L262
	cmpl	$yylstate,%edi
	jnbe	.L239
.L262:
/LOOP	END
.L238:
	movzbl	(%ebx),%eax
	movl	%eax,yyprevious
	movl	%edi,yylsp
	movl	%ebx,%eax
	subl	$yytext-1,%eax
	movl	%eax,yyleng
	movl	yyleng,%eax
	movb	$0,yytext(%eax)
	movl	yyfnd,%eax
	addl	$4,yyfnd
	movl	(%eax),%eax
	jmp	.L247
.L237:
	movzbl	(%ebx),%eax
	movl	%eax,yytchar
	cmpl	$10,yytchar
	jne	.L244
	decl	yylineno
.L244:
	movl	yysptr,%eax
	incl	yysptr
	movb	yytchar,%dl
	movb	%dl,(%eax)
.L236:
/LOOP	COND
	movl	%edi,%eax
	subl	$4,%edi
	cmpl	$yylstate,%eax
	jnbe	.L233
/LOOP	END
	movb	yytext,%al
	testb	%al,%al
	jne	.L245
	movl	$yysbuf,yysptr
	xorl	%eax,%eax
	jmp	.L247
.L245:
	cmpl	$yysbuf,yysptr
	jna	.L267
	decl	yysptr
	movl	yysptr,%eax
	movzbl	(%eax),%eax
	movl	%eax,yytchar
	jmp	.L268
.L267:
	movl	yyin,%eax
	decl	(%eax)
	jge	.L269
	pushl	yyin
	call	__filbuf
	popl	%ecx
	jmp	.L270
.L269:
	movl	yyin,%eax
	movl	4(%eax),%edx
	incl	4(%eax)
	movzbl	(%edx),%eax
.L270:
	movl	%eax,yytchar
.L268:
	cmpl	$10,%eax
	jne	.L265
	incl	yylineno
	movl	yytchar,%eax
	jmp	.L266
.L265:
	movl	yytchar,%eax
.L266:
	cmpl	$-1,%eax
	jne	.L263
	movb	$0,yytext
	movb	yytext,%al
	movzbl	%al,%eax
	movl	%eax,yyprevious
	jmp	.L264
.L263:
	movb	yytchar,%al
	movb	%al,yytext
	movzbl	%al,%eax
	movl	%eax,yyprevious
.L264:
	cmpl	$0,yyprevious
	jle	.L246
	movl	yyout,%eax
	decl	(%eax)
	jge	.L271
	pushl	yyout
	movzbl	yyprevious,%eax
	pushl	%eax
	call	__flsbuf
	addl	$8,%esp
	jmp	.L272
.L271:
	movl	yyout,%eax
	movl	4(%eax),%edx
	incl	4(%eax)
	movb	yyprevious,%al
	movb	%al,(%edx)
.L272:
.L246:
	movl	$yytext,%ebx
/LOOP	COND
	jmp	.L202
/LOOP	END
/REGAL	0	AUTO	-20(%ebp)	4
/REGAL	0	AUTO	-16(%ebp)	4
/REGAL	0	AUTO	-12(%ebp)	4
/REGAL	0	AUTO	-8(%ebp)	4
/REGAL	0	AUTO	-4(%ebp)	4
.L247:
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret/1
.L249:
	pushl	%ebp
	movl	%esp,%ebp
	subl	$20,%esp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	jmp	.L248
	.def	yylook;	.scl	-1;	.val	.;	.endef
	.def	yyback;	.scl	2;	.type	044;	.val	yyback;	.endef
	.globl	yyback
	.align	4
yyback:
	jmp	.L281
.L280:
	movl	8(%ebp),%edi
	movl	12(%ebp),%esi
	testl	%edi,%edi
	jne	.L273
	xorl	%eax,%eax
	jmp	.L279
.L273:
/LOOP	BEG
	jmp	.L277
/LOOP	HDR
.L274:
	movl	%edi,%eax
	addl	$4,%edi
	cmpl	%esi,(%eax)
	jne	.L278
	movl	$1,%eax
	jmp	.L279
.L278:
.L277:
/LOOP	COND
	cmpl	$0,(%edi)
	jne	.L274
/LOOP	END
	xorl	%eax,%eax
	jmp	.L279
.L279:
	popl	%esi
	popl	%edi
	leave
	ret/1
.L281:
	pushl	%ebp
	movl	%esp,%ebp
	pushl	%edi
	pushl	%esi
	jmp	.L280
	.def	yyback;	.scl	-1;	.val	.;	.endef
	.def	yyinput;	.scl	2;	.type	044;	.val	yyinput;	.endef
	.globl	yyinput
	.align	4
yyinput:
	jmp	.L284
.L283:
	cmpl	$yysbuf,yysptr
	jna	.L289
	decl	yysptr
	movl	yysptr,%eax
	movzbl	(%eax),%eax
	movl	%eax,yytchar
	jmp	.L290
.L289:
	movl	yyin,%eax
	decl	(%eax)
	jge	.L291
	pushl	yyin
	call	__filbuf
	popl	%ecx
	jmp	.L292
.L291:
	movl	yyin,%eax
	movl	4(%eax),%edx
	incl	4(%eax)
	movzbl	(%edx),%eax
.L292:
	movl	%eax,yytchar
.L290:
	cmpl	$10,%eax
	jne	.L287
	incl	yylineno
	movl	yytchar,%eax
	jmp	.L288
.L287:
	movl	yytchar,%eax
.L288:
	cmpl	$-1,%eax
	jne	.L285
	xorl	%eax,%eax
	jmp	.L286
.L285:
	movl	yytchar,%eax
.L286:
	jmp	.L282
.L282:
	leave
	ret/1
.L284:
	pushl	%ebp
	movl	%esp,%ebp
	jmp	.L283
	.def	yyinput;	.scl	-1;	.val	.;	.endef
	.def	yyoutput;	.scl	2;	.type	040;	.val	yyoutput;	.endef
	.globl	yyoutput
	.align	4
yyoutput:
	jmp	.L295
.L294:
	movl	yyout,%eax
	decl	(%eax)
	jge	.L296
	pushl	yyout
	movzbl	8(%ebp),%eax
	pushl	%eax
	call	__flsbuf
	addl	$8,%esp
	jmp	.L297
.L296:
	movl	yyout,%eax
	movl	4(%eax),%edx
	incl	4(%eax)
	movb	8(%ebp),%al
	movb	%al,(%edx)
.L297:
/REGAL	0	PARAM	8(%ebp)	4
.L293:
	leave
	ret/0
.L295:
	pushl	%ebp
	movl	%esp,%ebp
	jmp	.L294
	.def	yyoutput;	.scl	-1;	.val	.;	.endef
	.def	yyunput;	.scl	2;	.type	040;	.val	yyunput;	.endef
	.globl	yyunput
	.align	4
yyunput:
	jmp	.L301
.L300:
	movl	8(%ebp),%eax
	movl	%eax,yytchar
	cmpl	$10,yytchar
	jne	.L298
	decl	yylineno
.L298:
	movl	yysptr,%eax
	incl	yysptr
	movb	yytchar,%dl
	movb	%dl,(%eax)
/REGAL	0	PARAM	8(%ebp)	4
.L299:
	leave
	ret/0
.L301:
	pushl	%ebp
	movl	%esp,%ebp
	jmp	.L300
	.def	yyunput;	.scl	-1;	.val	.;	.endef
	.ident	"acomp: Release 5.0.0a 16Mar95"
	.data
	.comm	yyfnd,4
/REGAL	0	EXTDEF	yyfnd	4
	.comm	yyolsp,4
/REGAL	0	EXTDEF	yyolsp	4
	.comm	yylsp,4
/REGAL	0	EXTDEF	yylsp	4
	.comm	yylstate,800
/REGAL	0	EXTDEF	yytop	4
	.comm	p3,4
/REGAL	0	EXTDEF	p3	4
	.comm	p2,4
/REGAL	0	EXTDEF	p2	4
	.comm	p1,4
/REGAL	0	EXTDEF	p1	4
/REGAL	0	EXTDEF	yybgin	4
	.comm	yyestate,4
/REGAL	0	EXTDEF	yyestate	4
/REGAL	0	EXTDEF	yylineno	4
/REGAL	0	EXTDEF	yyout	4
/REGAL	0	EXTDEF	yyin	4
	.comm	yytchar,4
/REGAL	0	EXTDEF	yytchar	4
	.comm	yysbuf,200
/REGAL	0	EXTDEF	yysptr	4
	.comm	yymorfg,4
/REGAL	0	EXTDEF	yymorfg	4
	.comm	yytext,200
	.comm	yyleng,4
/REGAL	0	EXTDEF	yyleng	4
/REGAL	0	EXTERN	optopt	4
/REGAL	0	EXTERN	opterr	4
/REGAL	0	EXTERN	optind	4
/REGAL	0	EXTERN	optarg	4
/REGAL	0	EXTDEF	yyprevious	4
	.align	4
.X154:

	.byte	0x62,0x61,0x64,0x20,0x73,0x77,0x69,0x74,0x63,0x68
	.byte	0x20,0x79,0x79,0x6c,0x6f,0x6f,0x6b,0x20,0x25,0x64
	.byte	0x00
	.align	4
.X176:

	.byte	0x43,0x42,0x54,0x3a,0x25,0x64,0x20,0x43,0x4e,0x4c
	.byte	0x3a,0x25,0x64,0x0a,0x00
	.align	4
.X177:

	.byte	0x43,0x42,0x54,0x3c,0x25,0x64,0x3e,0x0a,0x00
	.align	4
.X178:

	.byte	0x43,0x4e,0x4c,0x3c,0x25,0x64,0x3e,0x0a,0x00
	.align	4
.X179:

	.byte	0x43,0x50,0x4c,0x3c,0x25,0x64,0x3e,0x0a,0x00
	.align	4
.X180:

	.byte	0x43,0x55,0x42,0x3c,0x25,0x64,0x3e,0x0a,0x00
	.align	4
.X181:

	.byte	0x43,0x55,0x44,0x3c,0x25,0x64,0x3e,0x0a,0x00
	.align	4
.X182:

	.byte	0x43,0x55,0x46,0x3c,0x25,0x64,0x3e,0x0a,0x00
	.align	4
.X183:

	.byte	0x43,0x55,0x55,0x3c,0x25,0x64,0x3e,0x0a,0x00
	.align	4
.X184:

	.byte	0x43,0x55,0x55,0x3c,0x25,0x64,0x2c,0x25,0x64,0x3e
	.byte	0x0a,0x00
	.align	4
.X185:

	.byte	0x43,0x68,0x61,0x72,0x20,0x25,0x64,0x0a,0x00
	.align	4
.X190:

	.byte	0x46,0x69,0x6e,0x0a,0x00
	.align	4
.X258:

	.byte	0x49,0x6e,0x70,0x75,0x74,0x20,0x73,0x74,0x72,0x69
	.byte	0x6e,0x67,0x20,0x74,0x6f,0x6f,0x20,0x6c,0x6f,0x6e
	.byte	0x67,0x2c,0x20,0x6c,0x69,0x6d,0x69,0x74,0x20,0x25
	.byte	0x64,0x0a,0x00
	.align	4
.X259:

	.byte	0x49,0x6e,0x70,0x75,0x74,0x20,0x73,0x74,0x72,0x69
	.byte	0x6e,0x67,0x20,0x74,0x6f,0x6f,0x20,0x6c,0x6f,0x6e
	.byte	0x67,0x2c,0x20,0x6c,0x69,0x6d,0x69,0x74,0x20,0x25
	.byte	0x64,0x0a,0x00
	.align	4
.X260:

	.byte	0x49,0x6e,0x70,0x75,0x74,0x20,0x73,0x74,0x72,0x69
	.byte	0x6e,0x67,0x20,0x74,0x6f,0x6f,0x20,0x6c,0x6f,0x6e
	.byte	0x67,0x2c,0x20,0x6c,0x69,0x6d,0x69,0x74,0x20,0x25
	.byte	0x64,0x0a,0x00
	.align	4
.X261:

	.byte	0x49,0x6e,0x70,0x75,0x74,0x20,0x73,0x74,0x72,0x69
	.byte	0x6e,0x67,0x20,0x74,0x6f,0x6f,0x20,0x6c,0x6f,0x6e
	.byte	0x67,0x2c,0x20,0x6c,0x69,0x6d,0x69,0x74,0x20,0x25
	.byte	0x64,0x0a,0x00
