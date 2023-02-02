module GPR(A1, A2, regWr, busW, clk, RD1, WriteReg,
	   RD2, data_in, rst);
// define the input pins
input clk, regWr, rst;
input [31:0] busW;
input [4:0] WriteReg;
input [4:0] A1, A2;

// define the output pins
output reg [31:0] RD1, RD2, data_in;

// declare the register array 
reg[31:0] registers[31:0];

// initialize all the registers
integer i;
always@(posedge rst)
begin
if(rst)
for(i=0; i<32; i = i + 1)
begin
registers[i] <= 0;
end
end

// write in the register
always@(posedge clk)
begin
if(regWr)
registers[WriteReg] <= busW;
// note that the first register cannot be written
registers[0] <= 0;
end

// assign values to the outputs
always@(clk)
begin
if ((A1 == WriteReg) && regWr && (WriteReg!=0)) 
begin
RD1 = busW;
end
else begin
RD1 = registers[A1];
end
end

always@(clk)
begin
if ((A2 == WriteReg) && regWr && (WriteReg!=0)) 
begin
RD2 = busW;
end
else begin
RD2 = registers[A2];
data_in = RD2;
end
end


//assign RD1 = ((A1 == WriteReg) && regWr && (WriteReg!=0)) ? busW : registers[A1];
//assign RD2 = ((A2 == WriteReg) && regWr && (WriteReg!=0)) ? busW : registers[A2];
//assign data_in = RD2;

endmodule
