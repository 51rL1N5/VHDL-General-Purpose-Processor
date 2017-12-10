# pR0C3Ss0r

#### Authors:   
- Felipe Oliveira Lins e Silva
- Luís Gabriel Pereira Condados


This project is a implementation of a general purpose processor using VHDL. The processor has the following instructions:

|Instruction|OPCODE|Action|
|-----------|------|------|
|MOVA Rd    |0000'dd00| Accumulator = Register[dd]|
|MOVR Rd    |0001'dd00| Register[dd] = Accumulator|
|LOAD Imm   |0010'iiii| Accumulator = Immediate   |
|ADD Rd     |0011'dd00| Accumulator = Accumulator + Register[dd]|
|SUB Rd     |0100'dd00| Accumulator = Accumulator - Register[dd]|
|ANDR Rd    |0101'dd00| Accumulator = Accumulator AND Register[dd]|
|ORR Rd     |0110'dd00| Accumulator = Accumulator OR Register[dd]|
|JMP Address|0111'aaaa| PC = Address[aaaa]                      |
|INV        |1000'0000| Accumulator = NOT Accumulator|
|Halt       |1001'1111| Stop execution|
|XOR       |1010'dd00| ACC = ACC XOR Register[dd]|
|XNOR       |1011'dd00| ACC = ACC XNOR Register[dd]|
|NAND       |1100'dd00| ACC = ACC NAND Register[dd]|
|JMPZ       |1101'ddoo| if(Register[dd] = 0) PC = PC + oo|
|SHFL       |1110'0000| Accumulator = Accumulator << 1   |
|SHFR       |1111'0000| Accumulator = Accumulator >> 1   |


The turbo version implements a processor which does the operations above in less cycles, but the Finite State Machine is simple. In the other hand, the normal version is slower but is more didatic.
