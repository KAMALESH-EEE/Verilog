module tb;

  reg [7:0] A, B; 
  reg [2:0] s;
  wire [7:0] out;
  wire Of, c, zero;

    ALU #(8) dut(A, B, s, c, zero, Of, out);

    initial begin
    	A<=8'h23;
        B<=8'h21;
      	s<=3'b000;
      	#10;
      	A<=8'h23;
        B<=8'h21;
      	s<=3'b001;
      	#10;
      	A<=8'h23;
        B<=8'h21;
      	s<=3'b010;
      	#10;
     	A<=8'h23;
        B<=8'h21;
      	s<=3'b011;
      	#10;
        A<=8'h23;
        B<=8'h21;
      	s<=3'b100;
      	#10;
        A<=8'h23;
        B<=8'h21;
      	s<=3'b101;
      	#10;
        A<=8'hff;
        B<=8'h01;
      	s<=3'b000;
      	#10;
    
    end


    initial begin
        $dumpfile("tb.vcd");
        $dumpvars(0,tb);
    end

endmodule

