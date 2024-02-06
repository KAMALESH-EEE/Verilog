module USR (clk, rst, D_in, D_out, L, S);
  parameter N = 4;
  input clk;
  input rst;
  input [N-1:0]D_in;
  output [N-1:0]D_out;
  input L;
  input S;
  
  reg [N-1:0] S_Reg;
  
  always @(posedge clk or posedge rst) begin
    if (rst) begin
    	S_Reg <= 0;    
    end
    
    else begin 
      if (L && S) begin
        S_Reg <= D_in;
      end
      else if (~L && S) begin // left shift
        S_Reg <= {S_Reg[N-2:0], 1'b0};
      end
      else if (L && ~S) begin // right shift
        S_Reg <= {1'b0, S_Reg[N-1:1]};
      end
      
    end    
  end
  
  assign D_out = S_Reg;
endmodule
