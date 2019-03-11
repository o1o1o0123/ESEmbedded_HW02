.syntax unified

.word 0x20000100
.word _start

.global _start
.type _start, %function
_start:
	//
	//mov # to reg
	//
	mov	r0,	#1
	movs	r1,	#2
	movw	r2,	#3


	//
	//push
	//
	push	{r0}
	push	{r1,r2}
	//
	//pop
	//
	pop	{r3}
	pop	{r4,r5}


	b	sleep

sleep:
	b	.
