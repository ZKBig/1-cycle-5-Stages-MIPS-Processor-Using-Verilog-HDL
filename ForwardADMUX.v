module ForwardADMUX(RD1, ALUOutM, ForwardAD, AD_out);
input [31:0] RD1, ALUOutM;
input ForwardAD;

output [31:0] AD_out;

assign AD_out = ForwardAD ? ALUOutM : RD1;

endmodule
