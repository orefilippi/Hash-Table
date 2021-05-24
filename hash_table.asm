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

choise1:

    la $a0,readKey		
    li $v0, 4            
    syscall            
    
    #read key from user
    li $v0,5       
    syscall

    move $s7, $v0   
    
    #if key>0 go to insert key
    bgt $s7,$zero,insertkey     
    
    #if key<=0 print key must be greater than zero
    la $a0,wrongKey
    li $v0, 4            
    syscall

    j choise1

choise2:
    
    la $a0,readKeyFor
    li $v0,4          
    syscall
    
    #read key to search for
    li $v0,5          	
    syscall

    move $s7, $v0   
     
    #go to function findkey
    jal findkey  
    
    #s1=return of function 

    #if key doesn't exist in hash table go to notfindkey
    beq $s1,-1,if_notfindkey	
    
    #print key value
    la $a0,keyValue
    li $v0, 4 
    syscall

    mul $s1,$s1,4
    add $t0, $sp, $s1
    div $s1,$s1,4
    lw $t1,($t0)   
    move $a0, $t1  

    li $v0,1
    syscall

    la $a0,newLine		
    li $v0, 4 
    syscall

    la $a0,tablePos		
    li $v0, 4 
    syscall

    move $a0, $s1 
    
    #print position of value
    li $v0,1
    syscall

    j exit

if_notfindkey:

    #print key doesn't exist in hash table
    la $a0,notFindKey		
    li $v0, 4
    syscall

    j exit

choise4:
    
    #exit 
    li $v0, 10		
    syscall
    
 
insertkey:


    #go to function findkey

    jal findkey  

    

    #s1=return of function

    

    #if s1!=-1 means key is already in hash table

    bne $s1,-1,keyAlready 

    

    #if keys>=10 means table is full

    bge $s0,10,tableFull  

    

    #go to hashfunction

    jal hashfunction   

    

    #s4=return of hashfunction

  

    mul $s4,$s4,4

    add $t9,$sp,$s4

    div $s4,$s4,4

    

    #store key to stack

    sw $s7,($t9)

    addi $s0,$s0,1




    j exit
