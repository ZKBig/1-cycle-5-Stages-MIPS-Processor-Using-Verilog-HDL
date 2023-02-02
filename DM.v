module DM(data_in, clk, WrEn, Addr, out, rst);
input[31:0] data_in, Addr;
input WrEn, clk, rst;
output[31:0] out;

reg[7:0] memory[1023:0];

always@(posedge clk)
begin
if(WrEn == 1'b1)
begin
memory[Addr[9:0]+3] <= data_in[31:24];
memory[Addr[9:0]+2] <= data_in[23:16];
memory[Addr[9:0]+1] <= data_in[15:8];
memory[Addr[9:0]] <= data_in[7:0];
end
end

assign  out = {memory[Addr[9:0]+3], memory[Addr[9:0]+2], memory[Addr[9:0]+1], memory[Addr[9:0]]};

endmodule
