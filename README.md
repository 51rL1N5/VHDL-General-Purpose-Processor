# pR0C3Ss0r

#### Authors:   
- Felipe Oliveira Lins e Silva
- Luís Gabriel Pereira Condados


This project is a implementation of a general purpose processor using VHDL. The processor has the following instructions:

|Instruction|OPCODE|Action|
|-----------|------|------|
|MOVA Rd    |0000'dd00|Accumulator = Register[dd]|
|MOVR Rd    |0001'dd00|Register[dd] = Accumulator|
|LOAD Imm   |0010'iiii|Accumulator = Immediate   |
|ADD Rd     |0011'dd00|Accumulator = Accumulator + Register[dd]|
|Sub Rd     |0100'dd00|Accumulator = Accumulator - Register[dd]|
|ANDR Rd    |0101'dd00|Accumulator = Accumulator AND Register[dd]|
|ORR Rd     |0110'dd00|Accumulator = Accumulator OR Register[dd]|
|JMP Address|0111'aaaa| PC = Address[aaaa]                      |
|INV        |1000'0000| Accumulator = NOT Accumulator|
|Halt       |1001'1111| Stop execution|

