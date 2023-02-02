module controller(type, LSBs, RegDst, RegWr, nPC_sel, ExtOp, ALUSrc, ALUctr, MemWr, MemtoReg, j_sel);
input[5:0] type, LSBs;
output[1:0] ExtOp, ALUctr;
output RegDst, RegWr, ALUSrc, MemWr, MemtoReg, j_sel,nPC_sel;

assign addu = (type == 6'b0) && (LSBs == 6'b100001);
assign subu = (type == 6'b0) && (LSBs == 6'b100011);
assign ori = (type == 6'b001101);
assign lw = (type == 6'b100011);
assign sw = (type == 6'b101011);
assign beq = (type == 6'b000100);
assign lui = (type == 6'b001111);
assign j = (type == 6'b000010); 

assign RegDst = addu | subu;
assign ALUSrc = ori | lw | sw | lui;
assign MemtoReg = lw;
assign RegWr = addu | subu | ori | lw | lui;
assign MemWr = sw;
assign j_sel = j;
assign nPC_sel = beq;
assign ExtOp = {lui, lw|sw|j};
assign ALUctr = {ori|lui,subu|beq|j};

endmodule

