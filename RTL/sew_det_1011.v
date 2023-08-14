// Code your design here
module seq_det_1011(clk, reset, in, out);
  
  input  wire clk, reset;
  input  wire in;
  output wire  out;
  
  reg [2:0] PS, NS;
  
  parameter s0=0, s1=1, s2=2, s3=3, s4=4, s5=5;
  
  always @(posedge clk, negedge reset) begin
    if(!reset)
      PS <= s0;
    else
      PS <= NS;
  end
  
  always @(PS, in) begin
    
    case(PS)
      s0:begin
        if(in)
           NS <= s1;
        else
          NS <= s0;
      end

      s1:begin
        if(in)
           NS <= s1;
        else
          NS <= s2;
      end      
      
      s2:begin
        if(in)
           NS <= s3;
        else
          NS <= s0;
      end
      
      s3:begin
        if(in)
           NS <= s4;
        else
          NS <= s1;
      end
      
      s4:begin
        if(in)
           NS <= s0;
        else
          NS <= s1;
      end 
      
      default: NS <=s0;
    
    endcase 
  end 
  
  assign out = (PS==s4)?1:0;
  
endmodule:seq_det_1011      