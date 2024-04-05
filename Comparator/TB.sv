`include "main.v"
module tb;

    reg [63:0] a,b;

    wire[4:0] out;

    compare dut(a,b,out[0],out[1],out[2],out[3],out[4]);

    initial begin
       repeat(20) begin
            a<=$random;
            b<=$random;
            #5;
        end
        $finish();
    end

    initial begin
        $monitor("%d %d || %b",dut.a,dut.b,out);
        $dumpfile("tb.vcd");
        $dumpvars(0,tb);
    end

endmodule
