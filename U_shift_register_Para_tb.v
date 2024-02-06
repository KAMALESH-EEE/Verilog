module tb();
  parameter N=8;
  reg clk=1'b0;
  reg rst = 1'b0;
  reg [N-1:0]D_in;
  wire [N-1:0]D_out;
  reg L =1'b0;
  reg S =1'b0;
  
  USR dut (clk, rst, D_in, D_out, L, S);
  defparam dut.N = 8;
  
  always #5 clk = ~clk;
    
    initial begin
   	  #1 rst <= 1'b1;
      #10 rst <= 1'b0;
      	D_in <= 8'b00001011;
      	L <= 1'b1;
      	S <= 1'b1;
      $display("L = %b || S = %b || Reset = %b|| Dout = %b ",L,S,rst,D_out);
      
      #10 L<= 1'b0;
      	$display("L = %b || S = %b || Reset = %b|| Dout = %b ",L,S,rst,D_out);
      
      #10 L<= ~L;
      	  S <= ~S;
      	$display("L = %b || S = %b || Reset = %b|| Dout = %b ",L,S,rst,D_out);
      
      #10 rst <= 1'b1;
      $display("L = %b || S = %b || Reset = %b|| Dout = %b ",L,S,rst,D_out);
      #10 rst <= 1'b0;
      	  S <= ~S;
      	  D_in <= 8'b00000111;
      $display("L = %b || S = %b || Reset = %b|| Dout = %b ",L,S,rst,D_out);
      #10;
      $finish();
           
    end
  
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars();
  end
  
endmodule
