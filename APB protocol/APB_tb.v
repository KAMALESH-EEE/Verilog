`include "APB.v"
module tb;

  reg clk,rst,p_sel, p_en, wr, p_ready;
  reg [7:0] addr;
  reg [15:0]  w_data;
  wire [15:0] r_data;
  integer i;
  
  APB_slave dut (clk,rst, p_sel, p_en, addr, wr, w_data, r_data, p_ready);

  initial begin
    clk<=1'b1;
    rst<=1'b1;
    #1;

    forever begin
      #5 clk <= ~clk;
    end
  end

  // initial begin
  //   #1 rst<=1'b0;
  //   #1 rst<=1'b1;
  //   #28;
  //   p_sel<=1'b0;
  //   #10;
  //   p_sel<=1'b1;
  //   wr <= 1'b1;
  //   p_ready<=1'b1;
  //   #10;
  //   p_en<=1'b1;
  //   #10;
  //   for(i=0; i<255; i=i+1) begin
  //     addr<=i;
  //     w_data<=$random;
  //     #10;
  //   end
  //   p_sel <=1'b0;
  //   p_en  <=1'b0;
  //   #20;
  //   p_sel <=1'b1;
  //   #10;
  //   p_en  <=1'b1;
  //   wr<=1'b0;
  //   #10;
  //   for(i=0; i<255; i=i+1) begin
  //     addr<=i;
  //     //$display();
  //     #10;
  //   end
  //   $finish();
  // end

  initial begin
    #1 rst<=1'b0; //T0
    #1 rst<=1'b1;
    #10 p_sel <=1'b1; //T1
    p_en<=1'b0;
    wr<=1'b1;
    addr<=16'hef;
    w_data<=32'habcd;
    #10;                //T2
    p_en<=1'b1;
    p_ready<=1'b0;
    #10;                //T3
    $display("%h",dut.mem_arr[239]);
    #10;

    #1 rst<=1'b0; //T0
    #1 rst<=1'b1;
    #10 p_sel <=1'b1; //T1
    p_en<=1'b0;
    wr<=1'b0;
    addr<=16'hef;
    w_data<=32'hxxxx;
    #10;                //T2
    p_en<=1'b1;
    p_ready<=1'b0;
    #10;                //T3
    $display("%h",dut.mem_arr[239]);
    #10;
    $finish();      

  end

  initial begin
    $dumpfile("APB_Slave.vcd");
    $dumpvars(0,tb);
  end

endmodule