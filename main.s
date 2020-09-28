	.option nopic
	.text
	.align	3
.LC0:
	.string "%llu\n"
	.text
	.align 1
	.globl	main
	.type	main, @function
.LC1:
	.string "%llu"
	.align 3
.LC2:
	.string "%llu "
	.align 3
.LC3:
	.string "\n"
	.align 3
main:
	addi	x2,x2,-32
	sd	x1,24(x2)
	sd	x8,16(x2)
	addi x8,x2,32
	
	#begin
	addi x2,x2,-128
	sd x18,88(x2)
	sd x19,96(x2)
	sd x20,104(x2)
	sd x21,112(x2)
	sd x22,120(x2)

	addi x18,x2,0
	addi x19,x2,88
input:
	add x11, x8, zero
    lui x15,%hi(.LC1)
    addi x10,x15,%lo(.LC1)
    call scanf
    ld x29,0(x8)
    sd x29,0(x18)
    addi x18,x18,8
    blt x18,x19,input


    addi x20,x2,88 #the last number
    addi x21,x2,8  #i
    addi x29,x21,0 #the first number
for1tst:
 	bge x21,x20,exitFor1tst 
 	addi x22,x21,0 #j=i-1
for2tst:
	addi x22,x22,-8
 	blt x22,x29,exitFor2tst
 	ld x5,0(x22)
 	ld x6,8(x22)
 	bgeu x6,x5,for2tst
 	addi x10,x5,0
 	addi x11,x6,0
 	jal x1,swap
 	addi x22,x22,8
 	jal x0,for2tst
swap:
    addi x7,x10,0
    addi x10,x11,0
    addi x11,x7,0
    sd x10,0(x22)
    sd x11,8(x22)
    jalr x0,0(x1)
exitFor2tst:
	addi x21,x21,8
	jal x0,for1tst
exitFor1tst:

	addi x18,x2,8
	addi x20,x2,8
	addi x19,x2,88
	addi x22,x0,1
	ld x21,0(x2)
output:
    ld x11,0(x18)
    lui x15,%hi(.LC2)    
    addi x10,x15,%lo(.LC2)
    call printf
    addi x18,x18,8
    bge x18,x19,exit
    jal x0,output
exit:
	lui x15,%hi(.LC3)
	addi x10,x15,%lo(.LC3)
	call printf
loop:
	ld x29,0(x20)
	bge x20,x19,exit1
	beq x29,x21,win
	addi x22,x22,1
	addi x20,x20,8
	jal x0,loop

exit1:
	addi x11,x0,0
	lui x15,%hi(.LC2)
	addi x10,x15,%lo(.LC2)
	call printf
	jal  x0,load
win:
	addi x11,x22,0
	lui x15,%hi(.LC2)
	addi x10,x15,%lo(.LC2)
	call printf

load:
	ld x18,88(x2)
	ld x19,96(x2)
	ld x20,104(x2)
	ld x21,112(x2)
	ld x22,120(x2)
	addi x2,x2,128
	#end

	li	x15,0
	mv	x10,x15
	ld	x1,24(x2)
	ld	x8,16(x2)
	addi x2,x2,32
	jr	x1
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
