# VHDL MIPS Processor
This was the final lab assignment of my ECE 445: Computer Organization course at GMU during Fall 2020. Xilinx Vivado 2019.1 was used for this lab. The previous labs consisted of consecutively building a MIPS processes unit by unit. 

### Software and Hardware
* Xilinx Vivado 2019.1 or later
* Basys 3 Artix-7 FPGA trainer board

### Datapath
The final datapath diagram has all the units connected:
![Datapath](https://user-images.githubusercontent.com/99919744/216753496-ee652a91-88ba-44a9-a887-b04e15ed667f.PNG)
![BlockDiagram](https://user-images.githubusercontent.com/99919744/216752387-e6c5a02a-75b3-41a1-8d73-07c20c706fc8.PNG)

### MIPS Instructions
Each unit in the diagram above has its own .vhd file. This MIPS processor is capable of reading assembly language instructions via intsmem.vhd.
The table below displays all the readable MIPS instructions: 

| No   | Operation                        | Format | Mnemonic | Opcode | Function |
|----- | -------------------------------- | ------ | -------- | ------ | -------- |
|  1   | Add                              | R      | add      | 00     | 20       |
|  2   | Add unsigned                     | R      | addu     | 00     | 21       |
|  3   | Subtract                         | R      | sub      | 00     | 22       |
|  4   | Subtract unsigned                | R      | subu     | 00     | 23       |
|  5   | And                              | R      | and      | 00     | 24       |
|  6   | Or                               | R      | or       | 00     | 25       |
|  7   | Xor                              | R      | xor      | 00     | 26       |
|  8   | Nor                              | R      | nor      | 00     | 27       |
|  9   | Set less than                    | R      | slt      | 00     | 2A       |
|  10  | Set less than unsigned           | R      | slt      | 00     | 2B       |
|  11  | Jump register                    | R      | jr       | 00     | 08       |
|  12  | Jump                             | J      | j        | 02     | -        |
|  13  | Jump and link                    | J      | jal      | 03     | -        |
|  14  | Branch on equal                  | I      | beq      | 04     | -        |
|  15  | Branch on not equal              | I      | bne      | 05     | -        |
|  16  | Add immediate                    | I      | addi     | 08     | -        |
|  17  | Add immediate unsigned           | I      | addiu    | 09     | -        |
|  18  | Set less than immediate          | I      | slti     | 0A     | -        |
|  19  | Set less than immediate unsigned | I      | sltiu    | 0B     | -        |
|  20  | And immediate                    | I      | andi     | 0C     | -        |
|  21  | Or immediate                     | I      | ori      | 0D     | -        |
|  22  | Load word                        | I      | lw       | 23     | -        |
|  23  | Store word                       | I      | sw       | 2B     | -        |
