#описание секции данных
.data
#присвоение метки
init_iregs:
#выделение слова данных несколько раз
.word -1, -3, -5, -7, -9, -11, -13, -15, -17, -19, -21, -23, -25, -27, -29,
#выделение слова данных несколько раз
.word 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30,
refs:
.word 1, 0, 1, 0, 1, 0, 1, 0
.word 1, 0, 1, 0, 1, 0, 1, 0
.word 1, 0, 1, 0, 1, 0, 1, 0
.word 1, 0, 1, 0, 1, 0

save_x2:
#выделение одного слова данных
.word 0
fail_val:
.word 0xBAD
pass_ok_text:
.asciiz "C001"

#секция текста
.text

main: 
	#1.0 запись смещения  
    la x1, init_iregs
	
	#1.1 загрузка знач. регистра со смещением 0
    lw x2, 0(x1)
	#1.1 загрузка знач. регистра со смещением 4
    lw x4, 4(x1)
	#1.1 загрузка знач. регистра со смещением 8
    lw x6, 8(x1)
	#...
    lw x8, 12(x1)
    lw x10,16(x1)
    lw x12,20(x1)
    lw x14,24(x1)
    lw x16,28(x1)
    lw x18,32(x1)
    lw x20,36(x1)
    lw x22,40(x1)
    lw x24,44(x1)
    lw x26,48(x1)
    lw x28,52(x1)
    lw x30,56(x1)
    lw x3, 60(x1)
    lw x5, 64(x1)
    lw x7, 68(x1)
    lw x9, 72(x1)
    lw x11,76(x1)
    lw x13,80(x1)
    lw x15,84(x1)
    lw x17,88(x1)
    lw x19,92(x1)
    lw x21,96(x1)
    lw x23,100(x1)
    lw x25,104(x1)
    lw x27,108(x1)
    lw x29,112(x1)
    lw x31,116(x1)
	
	#2.0 сохранить значение x2 в x1
	mv     x1, x2
	#2.1 сравнение (если меньше записать в RD 1)  RD = x2
	slt    x2, x2, x3
	#2.1 сравнение (если меньше записать в RD 1)  RD = x3
    slt    x3, x3, x4
    slt    x4, x4, x5
    slt    x5, x5, x6
    slt    x6, x6, x7
    slt    x7, x7, x8
    slt    x8, x8, x9
    slt    x9, x9, x10
    slt    x10, x10, x11
    slt    x11, x11, x12
    slt    x12, x12, x13
    slt    x13, x13, x14
    slt    x14, x14, x15
    slt    x15, x15, x16
    slt    x16, x16, x17
    slt    x17, x17, x18
    slt    x18, x18, x19
    slt    x19, x19, x20
    slt    x20, x20, x21
    slt    x21, x21, x22
    slt    x22, x22, x23
    slt    x23, x23, x24
    slt    x24, x24, x25
    slt    x25, x25, x26
    slt    x26, x26, x27
    slt    x27, x27, x28
    slt    x28, x28, x29
    slt    x29, x29, x30
    slt    x30, x30, x31
    slt    x31, x31, x1
    
	#3.0 загрузка смещения
    la x1, save_x2
	#3.1 сохранить знач. регистра
    sw x2, 0(x1)

	#4.0 загрузка смещения
    la x1, refs
	#4.1 x2 хранит загруженный результатрезультат
    lw x2, 4(x1)
	#4.2 if (x3 != x2 ) тест провален. произвести переход к метке
    bne x3, x2, pass_fail
	
	#4.1 x2 хранит загруженный результатрезультат
    lw x2, 8(x1)
	#4.2 if (x4 != x2 ) тест провален. произвести переход к метке
    bne x4, x2, pass_fail
	
	#...
    lw x2, 12(x1)
    bne x5, x2, pass_fail
    lw x2, 16(x1)
    bne x6, x2, pass_fail
    lw x2, 20(x1)
    bne x7, x2, pass_fail
    lw x2, 24(x1)
    bne x8, x2, pass_fail
    lw x2, 28(x1)
    bne x9, x2, pass_fail
    lw x2, 32(x1)
    bne x10, x2, pass_fail
    lw x2, 36(x1)
    bne x11, x2, pass_fail
    lw x2, 40(x1)
    bne x12, x2, pass_fail
    lw x2, 44(x1)
    bne x13, x2, pass_fail
    lw x2, 48(x1)
    bne x14, x2, pass_fail
    lw x2, 52(x1)
    bne x15, x2, pass_fail
    lw x2, 56(x1)
    bne x16, x2, pass_fail
    lw x2, 60(x1)
    bne x17, x2, pass_fail
    lw x2, 64(x1)
    bne x18, x2, pass_fail
    lw x2, 68(x1)
    bne x19, x2, pass_fail
    lw x2, 72(x1)
    bne x20, x2, pass_fail
    lw x2, 76(x1)
    bne x21, x2, pass_fail
    lw x2, 80(x1)
    bne x22, x2, pass_fail
    lw x2, 84(x1)
    bne x23, x2, pass_fail
    lw x2, 88(x1)
    bne x24, x2, pass_fail
    lw x2, 92(x1)
    bne x25, x2, pass_fail
    lw x2, 96(x1)
    bne x26, x2, pass_fail
    lw x2, 100(x1)
    bne x27, x2, pass_fail
    lw x2, 104(x1)
    bne x28, x2, pass_fail
    lw x2, 108(x1)
    bne x29, x2, pass_fail
    lw x2, 112(x1)
    bne x30, x2, pass_fail
    lw x2, 116(x1)
    bne x31, x2, pass_fail

	#5.0 загрузка смещения 
    la x1, save_x2
	#5.2 восстановить x2 
    lw x2, 0(x1)
	
	# запись метки резултатов
    la x1, refs
	#x3 хранит загруженный результатрезультат от x2
    lw x3, 0(x1)
    bne x3, x2, pass_fail


pass_ok:
	#запись метки на текст
	la x11, pass_ok_text
	# запись номера системного вызова через сложение константы с x0( = 0)
	addi x10, x0, 4
	#инициация обработки вызова
    ecall
    j    exit
pass_fail:
	#запись метки на значение
	la    x10, fail_val
	#загрузка значения
    lw    x11, 0(x10)
	# запись номера системного вызова через сложение константы с x0( = 0)
	addi  x10, x0, 1
    ecall
exit:
	# запись номера системного вызова через сложение константы с x0( = 0)
    addi  x10, x0, 10
    ecall # terminate ecall
