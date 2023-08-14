/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Sun Aug 13 01:09:58 2023
/////////////////////////////////////////////////////////////

// Headers
module tsb(a, three_state, out);     // Tri State Buffer

input a;
input three_state;
output out;
assign out = three_state? 'bz: a ;
endmodule


module inv(in, out);
input in;
output out;
assign out = ~in;
endmodule

module nand2(a, b, out);
input a, b;
output out;
assign out = ~(a & b);
endmodule

module nand3(a, b, c, out);
input a, b, c;
output out;
assign out = ~(a & b & c);
endmodule

module nand4(a, b, c, d, out);
input a, b, c, d;
output out;
assign out = ~(a & b & c & d);
endmodule

module nor2(a, b, out);
input a, b;
output out;
assign out = ~(a | b);
endmodule

module nor3(a, b, c, out);
input a, b, c;
output out;
assign out = ~(a | b | c);
endmodule

module xor2(a, b, out);
input a, b;
output out;
assign out = (a ^ b);
endmodule

module aoi12(a, b, c, out);
input a, b, c;
output out;
assign out = ~(a | (b & c));
endmodule

module aoi22(a, b, c, d, out);
input a, b, c, d;
output out;
assign out = ~((a & b) | (c & d));
endmodule

module oai12(a, b, c, out);
input a, b, c;
output out;
assign out = ~(a & (b | c));
endmodule

module oai22(a, b, c, d, out);
input a, b, c, d;
output out;
assign out = ~((a | b) & (c | d));
endmodule

module dff( d, gclk, rnot, q);
input d, gclk, rnot;
output q;
reg q;
always @(posedge gclk or negedge rnot)
  if (rnot == 1'b0)
    q = 1'b0;
  else
    q = d;
endmodule

module seq_det_1011 ( clk, reset, in, out );
  input clk, reset, in;
  output out;
  wire   N7, N8, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21, N22,
         N27, N28, N29, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;
  wire   [2:0] PS;
  wire   [2:0] NS;

  inv I_8 ( .in(N21), .out(N22) );
  inv I_7 ( .in(N18), .out(N19) );
  inv I_6 ( .in(N15), .out(N16) );
  inv I_5 ( .in(N12), .out(N13) );
  inv I_4 ( .in(PS[0]), .out(N8) );
  inv I_3 ( .in(PS[1]), .out(N7) );
  inv I_1 ( .in(N29), .out(out) );
  nand2 C96 ( .a(N8), .b(n12), .out(N29) );
  nand2 C95 ( .a(N7), .b(PS[2]), .out(N28) );
  inv I_0 ( .in(PS[2]), .out(N27) );
  nand2 C34 ( .a(PS[2]), .b(N7), .out(N20) );
  nand2 C30 ( .a(N27), .b(PS[1]), .out(N17) );
  nand2 C25 ( .a(N27), .b(PS[1]), .out(N14) );
  nand2 C21 ( .a(N27), .b(N7), .out(N11) );
  nand2 C18 ( .a(N27), .b(N7), .out(n1) );
  dff \PS_reg[0]  ( .d(NS[0]), .gclk(clk), .rnot(reset), .q(PS[0]) );
  dff \PS_reg[2]  ( .d(NS[2]), .gclk(clk), .rnot(reset), .q(PS[2]) );
  dff \PS_reg[1]  ( .d(NS[1]), .gclk(clk), .rnot(reset), .q(PS[1]) );
  inv U3 ( .in(n2), .out(NS[2]) );
  nand2 U4 ( .a(N19), .b(in), .out(n2) );
  inv U5 ( .in(n3), .out(NS[1]) );
  aoi22 U6 ( .a(in), .b(N16), .c(n4), .d(N13), .out(n3) );
  oai22 U7 ( .a(n5), .b(n4), .c(in), .d(n6), .out(NS[0]) );
  nor2 U8 ( .a(N19), .b(N22), .out(n6) );
  inv U9 ( .in(in), .out(n4) );
  nor3 U10 ( .a(n7), .b(N16), .c(N13), .out(n5) );
  nor2 U11 ( .a(n1), .b(PS[0]), .out(n7) );
  inv U12 ( .in(n8), .out(N21) );
  nor2 U13 ( .a(N20), .b(PS[0]), .out(n8) );
  nand2 U14 ( .a(PS[0]), .b(n9), .out(N18) );
  inv U15 ( .in(N17), .out(n9) );
  inv U16 ( .in(n10), .out(N15) );
  nor2 U17 ( .a(N14), .b(PS[0]), .out(n10) );
  nand2 U18 ( .a(PS[0]), .b(n11), .out(N12) );
  inv U19 ( .in(N11), .out(n11) );
  inv U20 ( .in(N28), .out(n12) );
endmodule

