module ForwardBEMUX(RD2E, ResultW, ALUOutM, ForwardBE, SrcBE);
input [31:0] RD2E, ALUOutM, ResultW;
input [1:0] ForwardBE;

output [31:0] SrcBE;

assign SrcBE = (ForwardBE == 2'b00) ? RD2E : ((ForwardBE == 2'b01) ? ResultW : ALUOutM);

endmodule
