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