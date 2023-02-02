module EXT(imm16, out32, ExtOp);
input[15:0] imm16;
input[1:0] ExtOp;

output reg[31:0] out32;

always@(*)
begin
if(ExtOp == 2'b00)
begin
out32 <= {16'b0, imm16};
end
else if(ExtOp == 2'b01)
begin
out32 <= {{16{imm16[15]}}, imm16};
end
else if(ExtOp == 2'b10)
begin
out32 <= {imm16, 16'b0};
end
end

endmodule
