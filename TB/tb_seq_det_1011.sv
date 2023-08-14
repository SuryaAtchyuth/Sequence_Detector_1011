module tb_seq_det_1011;
  
  bit clk;
  logic reset, in;
  wire out;
  
  seq_det_1011 DUT(clk, reset, in, out);
  
  always #5 clk= !clk;
  
  initial begin
    $dumpfile("tb_seq_det_1011.vcd"); $dumpvars(0, tb_seq_det_1011.DUT);
    reset=1; in=0;
  end
  
  initial begin
    $monitor(" PS = S%d", DUT.PS);
    #2; reset=0;
    #1; reset=1;
    @(posedge clk);
    in <=1;
    @(posedge clk);
    in <=0;
    @(posedge clk);
    in <=1;
    @(posedge clk);
    in <=1;
    @(posedge clk);
    in <=0;
    @(posedge clk);
    in <=1;
    
    #10; $finish;
  end
  
endmodule:tb_seq_det_1011
