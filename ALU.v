module ALU(data1, data2, ALUctr, out);
input[31:0] data1, data2;
input[1:0] ALUctr;

output reg[31:0] out;

always@(*)
begin
case(ALUctr)
2'b00: begin out <= data1 + data2; end
2'b01: begin out <= data1 - data2; end
2'b10: begin out <= data1 | data2; end
endcase
end

endmodule

