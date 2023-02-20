 
    .data
    nMsg: .asciiz "Enter the value for n: "
    kMsg: .asciiz "Enter the value for k: "
    arrMsg: .asciiz "Enter the elements of the array one by one."
    newline: .asciiz "\n"
    printNumMod: .asciiz "The number of dividable pairs are "
    errorNMsg: .asciiz "n must be between 2 and 100. Try again." 
    errorKMsg: .asciiz "k must be between 1 and 100. Try again."
    errorArrMsg: .asciiz "Array elements must be between 1 and 100. Try again"
    counter: .word 0
    n: .word 0
    k: .word 0
    array: .space 400
    
    
   .text
    #print string
    Read_n:
    la $a0, nMsg	 
    li $v0, 4
    syscall

    #read int and store in n 
    li $v0, 5	
    syscall
    
    #load n into $t0 and check 2 <= n <= 100
    move $t0, $v0
    slti $t2, $t0, 101 
    beq $t2, $zero, Error_n
    slti $t2, $t0, 2
    beq $t2, $zero, Read_k
    

    Error_n:
    #print error string for n and ask for another n 
    la $a0, errorNMsg
    li $v0, 4
    syscall
    la $a0, newline
    li $v0, 4
    syscall   
    j Read_n
    
    
    Read_k:
    #print string
    la $a0, kMsg
    li $v0, 4
    syscall

    #read int and store in k
    li $v0, 5
    syscall    
   
    #load k into $t1 and check 1 <= k <= 100    
    move $t1, $v0
    slti $t2, $t1, 101
    beq $t2, $zero, Error_k
    slti $t2, $t1, 0
    beq $t2, $zero, Print_Arr
    
    Error_k:
    #print error string for k and ask for another k 
    la $a0, errorKMsg
    li $v0, 4
    syscall   
    la $a0, newline
    li $v0, 4
    syscall   
    j Read_k   
   
    Print_Arr:
    #print string
    la $a0, arrMsg	 
    li $v0, 4
    syscall   
    la $a0, newline
    li $v0, 4
    syscall 
    lw $t4, counter #t4 is set to be the counter to check the number of array elements

    Get_Array:
    #take array elements from the user
    li $v0, 5	
    syscall
    
    move $t5, $v0 #t5 contains the arr[n] now
    
    addi $t7, $zero, 0
    sw $t5, array($t7) #store contents of t5 in first position of array 
    
    addi $t7, $t7, 4 #increment the index by 4
    
    addi $t4, $t4, 1 #add 1 to the counter for each iteration 
    beq $t0, $t4, First_Loop
    addi $t3, $zero, -1 #setting the counter to 0 for the First_Loop
    addi $s7, $zero, 0 #setting the mod counter to 0
    addi $t6, $zero, 0 #arr[n] position is set to 0
    j Get_Array
    
    
    First_Loop:
    addi $t3, $t3, 1 #incrementing the counter by one before every loop
    slt $t2, $t3, $t0
    beq $t2, $zero, Print_Mod 
    j Second_Loop

    
    Second_Loop:  
    slt $t2, $t5, $t0
    beq $t2, $zero First_Loop
    j Check_Mod

    
    Check_Mod:
    lw $t8, array($t6)
    addi $t6, $t6, 4 #increment the index by 4   
    lw $t9, array($t6)

    add $s3, $t8, $t9
    div $s3, $t1
    mfhi $s4 #s4 is the remainder of the mod calculation

    addi $t5, $t5, 1 #add 1 to the second loop counter

    beq $s4, $zero, Increment_Mod_Count #increment mod counter if the remainder is 0
    j Second_Loop

    Increment_Mod_Count:
    addi $s7, $s7, 1
    j Second_Loop
        
    
    Print_Mod:
    la $a0, printNumMod	 
    li $v0, 4
    syscall
    # Printing out the number
    li $v0, 1
    move $a0, $s7
    syscall
    j Exit
    
    Exit:
    li $v0, 10
    syscall


