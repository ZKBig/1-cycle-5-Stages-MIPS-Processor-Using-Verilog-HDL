module mips_test_bench;
reg clk, rst;
mips launch(.clk(clk), .rst(rst));

initial
begin
rst = 0;
clk = 1;
#1 rst = 1;
#2 rst = 0;
$readmemh("pipeline3.txt", launch.dp.ifu.Instrution_Memory);
end

always
begin
#30 clk <= ~clk;
end

endmodule
