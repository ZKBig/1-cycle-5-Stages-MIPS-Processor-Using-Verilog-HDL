module Hazard_Pro(RegWriteM, RegWriteW, WriteRegM, WriteRegW, 
		  ForwardAE, ForwardBE, RsE, RtE, MemtoRegE, 
                  FlushE, StallF, StallD, RsD, RtD, BranchD,
		  ForwardAD, ForwardBD, RegWriteE, 
		  MemtoRegM, WriteRegE);

input RegWriteM, RegWriteW, MemtoRegE, MemtoRegM, BranchD, RegWriteE;
input [4:0] RsE, RtE, WriteRegM, WriteRegW, WriteRegE, RsD, RtD;
output [1:0] ForwardBE, ForwardAE;
output FlushE, StallF, StallD;
output ForwardAD, ForwardBD;

wire lwstall;
wire branchStall;

assign ForwardAE =((RsE!=0) && (RsE == WriteRegM) && RegWriteM)? 2'b10 :
         (((RsE!=0) && (RsE == WriteRegW) && RegWriteW)? 2'b01 : 2'b00);

assign ForwardBE =((RtE!=0) && (RtE == WriteRegM) && RegWriteM)? 2'b10 :
	 (((RtE!=0) && (RtE == WriteRegW) && RegWriteW)? 2'b01 : 2'b00);

assign lwstall = (((RsD == RtE) || (RtD == RtE)) && MemtoRegE) ? 1'b1 : 1'b0;

// update the stall output signals
assign StallF = lwstall || branchStall;
assign StallD = lwstall || branchStall;
assign FlushE = lwstall || branchStall;

// beq control hazard
// forwarding
assign ForwardAD = ((RsD != 0) && (RsD == WriteRegM) && RegWriteM);
assign ForwardBD = ((RtD != 0) && (RtD == WriteRegM) && RegWriteM);

// stall
assign branchStall = ((BranchD && RegWriteE && ((WriteRegE == RsD) || (WriteRegE == RtD))) ||
       		     (BranchD && MemtoRegM && ((WriteRegM == RsD) || (WriteRegM == RtD))));

endmodule




