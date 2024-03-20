module APB_slave(clk,rst, p_sel, p_en, addr, wr, w_data, r_data, p_ready );

  input wire clk,rst,p_sel, p_en, wr, p_ready;

  input [7:0] addr;
  input [15:0]  w_data;
  output reg [15:0]  r_data;

  reg [15:0] mem_arr [0:255];
  integer  i;

  reg [1:0] PS,NS;

  parameter IDEAL =2'b00, SETUP =2'b01, ACESS =2'b10;

  always @(posedge clk or negedge rst) begin
    if (~rst) begin
      PS <= IDEAL;
      NS <= IDEAL;
    end

    else begin 
      PS=NS;
      if (PS === 2'b10) begin
        if(wr & p_en & p_sel) mem_arr[addr] <= w_data;

        else if (~wr & p_en & p_sel) r_data<=mem_arr[addr];        
      end

    end

  end
    always @(*) begin

    case (PS)
      
      IDEAL:begin
        if(p_sel === 1'b1) begin
          NS <= SETUP;
        end
        else begin
          NS <= IDEAL;
        end
      end

      SETUP:begin
        if (p_sel)
        NS<= ACESS;        
      end

      ACESS:begin

        if(~p_ready & p_sel & p_en ) begin
          NS<=ACESS;
        end

        else if(p_sel & p_ready & p_ready)
        begin
          NS<=SETUP;
        end

        else begin 
          NS<=IDEAL; 
        end
      end

      default:begin
        PS<=IDEAL;
      end
    endcase
  end
endmodule