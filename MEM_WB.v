module MEM_WB(RegWriteM, MemtoRegM, ALUOutM, ReadDataM, WriteRegM, RegWriteW, 
	      MemtoRegW, ALUOutW, ReadDataW, WriteRegW, clk);
// define the input pins
input RegWriteM, MemtoRegM, clk;
input[31:0] ALUOutM, ReadDataM;
input[4:0] WriteRegM;

// define the output pins
output reg RegWriteW, MemtoRegW;
output reg [31:0] ALUOutW, ReadDataW;
output reg [4:0] WriteRegW;

// Memory Stage: memory for load
always@(posedge clk)
begin
RegWriteW <= RegWriteM;
MemtoRegW <= MemtoRegM;
ALUOutW <= ALUOutM;
ReadDataW <= ReadDataM;
WriteRegW <= WriteRegM;
end 

endmodule
