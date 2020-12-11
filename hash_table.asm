    .data

menu: .asciiz "\n Menu\n1. Insert Key\n2. Find Key\n3. Display Hash Table\n4. Exit"
choise: .asciiz "\nChoise? "
readKey: .asciiz "\nGive new key (greater than zero): "
wrongKey: .asciiz "\nkey must be greater than zero"
readKeyFor: .asciiz "\nGive key to search for: "
notFindKey: .asciiz "\nKey not in hash table"
keyValue: .asciiz "Key value = "
tablePos: .asciiz "Table position = \n"
alreadyKey: .asciiz "\nKey is already in hash table."
fullTable: .asciiz "\nhash table is full"
posKey: .asciiz "\npos key\n"
quotes: .asciiz " "
newLine: .asciiz "\n"

    .text
    .globl main

main: 

    #keys
    li $s0,0 
    
    #i
    li $t1,0 
    
    #N
    li $t2,10 
    
    li $t0,0 

for:

    #initialize 10 positions of stack with zeros
    
    bgt $t1,$t2,exit	
    addi $sp, $sp, -4	
    sw  $t0, 0($sp)		
    addi $t1,$t1,1		

    j for

exit:
    
    #print menu    
    la $a0,menu
    li $v0, 4          
    syscall 

    la $a0,choise
    li $v0, 4         
    syscall
    
    #read choise from user    
    li $v0,5
    syscall          
    
    #t0 = choise
    move $t0,$v0 
    
    #if choice>4	go to exit
	  bgt $t0, 4, exit	
    
    #choises
    
    beq $t0,1,choise1   	
    beq $t0,2,choise2   	
    beq $t0,3,displaytable  
    beq $t0,4,choise4   	 
