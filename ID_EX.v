module ID_EX(RegWriteD, MemtoRegD, MemWriteD, ALUControlD, ext_imm32E, ext_imm32D,
	     ALUsrcD, RegDstD, RD1_D, RD2_D, RtD, RdD,
	     RegWriteE, MemtoRegE, MemWriteE, ALUControlE, 
	     ALUsrcE, RegDstE, RD1_E, RD2_E, RtE, RdE,
             clk, data_in_D, data_in_E, clr, RsE, RsD);

// define the input pins
input RegWriteD, MemtoRegD, MemWriteD, ALUsrcD, RegDstD, clk, clr;
input [1:0] ALUControlD;
input [31:0] RD1_D, RD2_D, data_in_D, ext_imm32D;
input [4:0] RtD, RdD, RsD;

// define the output pins
output reg RegWriteE, MemtoRegE, MemWriteE, ALUsrcE, RegDstE;
output reg[1:0] ALUControlE;
output reg[31:0] RD1_E, RD2_E, data_in_E, ext_imm32E;
output reg[4:0] RtE, RdE, RsE;

// EX Stage: execute for load
always@(posedge clk)
begin
if(clr)
begin
     RegWriteE <= 0;
     MemtoRegE <= 0;
     MemWriteE <= 0;
     ALUsrcE <= 0;
     RegDstE <= 0; 
     ALUControlE <= 0;
     RD1_E <= 0;
     RD2_E <= 0; 
     data_in_E <= 0;
     RtE <= 0; 
     RdE <= 0;
     RsE <= 0;
     ext_imm32E <= 0;
end
else begin
     RegWriteE <= RegWriteD;
     MemtoRegE <= MemtoRegD;
     MemWriteE <= MemWriteD;
     ALUsrcE <= ALUsrcD;
     RegDstE <= RegDstD;
     ALUControlE <= ALUControlD;
     RD1_E <= RD1_D;
     RD2_E <= RD2_D; 
     data_in_E <= data_in_D;
     RtE <= RtD; 
     RdE <= RdD;
     RsE <= RsD;
     ext_imm32E <= ext_imm32D;
end
end


endmodule





	    
