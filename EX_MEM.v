module EX_MEM(RegWriteE, MemtoRegE, MemWriteE,clk, 
	      ALUOutE, WriteDataE, WriteRegE,
	      RegWriteM, MemtoRegM, MemWriteM,
	      ALUOutM, WriteDataM, WriteRegM);
// define the input pins
input RegWriteE, MemtoRegE, MemWriteE, clk;
input [4:0] WriteRegE;
input [31:0] ALUOutE, WriteDataE;

// define the output pins
output reg RegWriteM, MemtoRegM, MemWriteM;
output reg [4:0] WriteRegM;
output reg [31:0] ALUOutM, WriteDataM;

reg RegWrite, MemtoReg, MemWrite;
reg [4:0] WriteReg;
reg [31:0] ALUOut, WriteData;

// EX stage: execute for load
always@(posedge clk)
begin
RegWrite = RegWriteE;
MemtoReg = MemtoRegE;
MemWrite = MemWriteE;
WriteReg = WriteRegE;
ALUOut = ALUOutE;
WriteData = WriteDataE;
end

always@(negedge clk)
begin
RegWriteM <= RegWrite;
MemtoRegM <= MemtoReg;
MemWriteM <= MemWrite;
WriteRegM <= WriteReg;
ALUOutM <= ALUOut;
WriteDataM <= WriteData;
end
endmodule
