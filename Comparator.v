module Comparator(AD, BD, EqualD);
input [31:0] AD, BD;
output EqualD;

assign EqualD = (AD == BD) ? 1'b1 : 1'b0;

endmodule
