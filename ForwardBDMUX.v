module ForwardBDMUX(RD2, ALUOutM, ForwardBD, BD_out);
input [31:0] RD2, ALUOutM;
input ForwardBD;

output [31:0] BD_out;

assign BD_out = ForwardBD ? ALUOutM : RD2;

endmodule
