module my_design (clk,
    in,
    out,
    rst);
 input clk;
 input in;
 output out;
 input rst;

 wire _0_;
 wire VPWR;
 wire VGND;

 sky130_fd_sc_hd__inv_2 _1_ (.A(rst),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_0_));
 sky130_fd_sc_hd__dfrtp_2 _2_ (.CLK(clk),
    .D(in),
    .RESET_B(_0_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(out));
endmodule
