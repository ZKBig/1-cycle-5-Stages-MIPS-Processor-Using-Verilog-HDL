module IF_ID(instruction, next_PC, clk, instruction_out, reset, PC_out, StallD, clr);
input [31:0] instruction, next_PC;
input clk, reset, StallD, clr;

output reg[31:0] instruction_out, PC_out;
reg [31:0] instruction_reg, PC_reg;

// IF stage: load the value of next PC and the 
//fentched instruction from the last ins
always@(posedge clk)
begin
if(StallD)
begin
	instruction_out <= instruction_reg;
	PC_out <= PC_reg;
end
else if(clr)
begin
	instruction_out <= 0;
	instruction_reg <= 0;
	PC_out <= 0;
	PC_reg <= 0;
end
else
begin
	instruction_out <= instruction;
	instruction_reg <= instruction;
	PC_out <= next_PC;
	PC_reg <= next_PC;
end
end

endmodule

