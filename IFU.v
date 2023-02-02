module IFU(PCSrcD, clk, rst, j_sel, PC_value, 
	   instruction, next_PC, StallF);
input PCSrcD, clk, rst, j_sel, StallF;
input[31:0] next_PC;

output[31:0] instruction;
output reg[31:0] PC_value;

reg[7:0] Instrution_Memory[1023:0];
wire[31:0] PC_reg;

always@(posedge clk, posedge rst)
begin
if(StallF) begin
PC_value <= PC_reg;
end
else begin
if(rst) begin
// reset PC to 0x0000 3000
PC_value <= 32'h0000_3000;
end
else if(j_sel==1'b1) 
begin
PC_value <= next_PC;
end
else if(PCSrcD) 
begin
PC_value <= next_PC;
end
else 
begin
PC_value <= PC_value + 4;
end
end
end

assign PC_reg = PC_value;

// considering the jump condition when extending the instruction
//assign PC_ext = j_sel ? ext_imm32:ext_imm32 << 2;

// obtain the address of the next instruction in two cases:
// one is the normal senario 
//assign ins0 = PC_value + 4;
// the other is the beq scenario
//assign ins1 = ins0 + PC_ext;
// assign the value with PC
//assign PC_new = (nPC_sel && zero) ? next_PC : PC_value + 4;

// concatenate the final value of instruction, which is composed of foure byte.
// note that PC_value is a 32-bit value; therfore, it is necesary to convert it to 10-bit.
assign instruction = {Instrution_Memory[PC_value[9:0]], Instrution_Memory[PC_value[9:0]+1], Instrution_Memory[PC_value[9:0]+2], Instrution_Memory[PC_value[9:0]+3]}; 

endmodule






 
