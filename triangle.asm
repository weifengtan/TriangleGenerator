##################################################################################################################################
# Created by: Tan, Wei Feng												 	 #
# Wtan40															 #
# 18 November 2020														 #
#																 #
# Assignment: Lab 3: ASCII - risks										 		 #
# CMPE 012, Computer Systems and Assembly Language										 #
# UC Santa Cruz, Fall 2020													 #
#																 #
# Description: This program prints a triangle pattern out and the height based on the user input. 				 #		
#																 #
# Notes: This program is intended to be run from the MARS IDE.									 #
#																 #
# PSEUDO CODE:															 #
# 		whileLoop: asking for user input, if user input is bigger than 0 then move to loop1				 #		 								 
# 		if not then prints invalid statement and jumps back to while loop					 	 #							 
#																 #
#		loop1: is where i set the registers that i will be using. I will mainly be using the height input from user,	 #													 
# 		 a new register to increment the number of "counts" I need to tab, 						 #								 
# 		a register for the number behind the astericks, and finally a counter to start the secondloop.			 #			 								 
#														                 #
#		Firstloop: tells the program to print out the tabs after each row. 						 #								 
# 		if my counter register equals my height register I tell it to branch to my LeaveFirst loop,			 #			 								 
# 		which ends the program. 						 					 #			 
#		My second if statement branches off to secondloop which prints my numbers(1,2,3,4,5) on star triangle		 #												 
#		 														 #
# 		secondloop: prints the numbers on top of the triangle then increment it by 1, and also make a new register 	 #					 								 
# 		storing the first number + 2 and prints that out when it branches off to my EndofNumber loop.			 #			 								 
#																 #
#		thirdloop: makes a new register that looks in register storing number +2 and printing out that many astericks. 	 #													 
# 		when the new register is incremented to be equal to number+2 register it branches out to PrintEndOfAsterick 	 #					 								 
# 		loop. Basically my third loop looks at the right most number and prints that amount of astericks.                #
#   																 #
#		PrintEndOfAsterick: prints a tab out after my left number, and also prints the next number in the triangle. 	 #			 								 
#		then it increments the number by 1.				 						 #		 						 								 
#						 								 		 #				 								 						 								 
#		EndofNumber: this loop prints out a newline after im done printing the spaces,number,astericks in a row.	 #
#               it also increments the counter number in loop1 by 1 and increments the height by -1 				 #
#		after that it jumps back to the beginning. To my Firstloop.							 #
#																 #
#		LeaveFirst: ends the program								 			 #			 								 						 								 						 								 						 								 				 								 						 								 						 								 						 								 						 						
#		 								 						 #								 						 								 						 								 						 								 				 								 						 								 						 								 						 								 						 								 		 								 						 								 						 								 						 								 						 								 				 								 						 								 						 								 						 		 								 						 								 						 								 						 								 						 								 				 								 						 								 						 								 						 								 						 								 #
##################################################################################################################################
.data
Height:  .asciiz "Enter the height of the pattern (must be greater than 0):\t"
Invalid: .asciiz "Invalid Entry!\n"
star: .asciiz "*"
tab: .asciiz "\t"
newline: .asciiz "\n"

.text
# Prompt
# LOOP counter>input exit/done
	# Left tabs
	# left #
	# stars
	# right #
	# new line

	 

Whileloop: nop  	#PROMPT
	li $v0 4
	la $a0 Height
	syscall
	li $v0 5
	syscall
	move $t0 $v0
	move $t9 $t0
	sub $t9 $t9 1
	bgt $t0 $zero loop1
	
InvalidLoop: nop
	li $v0 4
	la $a0 Invalid
	syscall
	
	j Whileloop			#jump back to while loop
	
loop1: nop					#t0 is the height
	add $t2 $t2 $zero		#new register tab counter number  t2 = t2 + 0 === counter
	sub $t1 $t0 $t2		        #height - register in t1          input - counter
	
	add $t3 $t3 $zero		#tab counter for left side
	sub  $t3 $t1 1			#height- incrementing register -1 
	
	add $t4 $t4 $zero		 
	li $t5 1			#left number
	
	j Firstloop

	
Firstloop: nop
	beq $t2 $t0 LeaveFirst
	bge $t4 $t9 Secondloop
	
	li $v0 4 			#prints tab before number
	la $a0 tab
	syscall
	
	addi $t4 $t4 1
	j Firstloop 
Secondloop: nop 
	li $t4 0			#loop that prints number
					
	li $v0 1
	la $a0 ($t5)				
	syscall
	addi $t5 $t5 1
	sub $t6 $t5 2			#t6 is number outside triangle -2 
	beq $t6 $zero EndofNumber
thirdloop: nop
	add $t7 $t7 $zero		#loop that prints astericks
	beq $t7 $t6 PrintEndOfAsterick
	li $v0 4
	la $a0 tab
	syscall
	
	li $v0 4
	la $a0 star
	syscall
	
	add $t7 $t7 1
	j thirdloop
PrintEndOfAsterick:nop			#printing the end of asterick loop
	li $t7 0
	li $v0 4
	la $a0 tab
	syscall
	
	li $v0 1
	la $a0 ($t5)
	syscall
	
	add $t5 $t5 1
EndofNumber: nop			#printing end of number
	add $t2 $t2 1
	li $v0 11
	li $a0 0x0a
	sub $t9 $t9 1
	syscall
	
	j Firstloop
LeaveFirst: nop			
	li $v0 10
	syscall
	
	
	
	
	 
	
	
	

	
	
