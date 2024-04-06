module tb;

    int i;
    reg[3:0] in;

    wire A,B,C,D,E,F,G;

    SSLC dut(in,A,B,C,D,E,F,G);

    initial begin

        for (i=0;i<10;i++) begin
            in <= i[3:0];
            #10; 
        end

    end

    initial begin
        $monitor("A=%b B=%b C=%b D=%b E=%b F=%b G=%b",A,B,C,D,E,F,G);
        $dumpfile("tb.vcd");
        $dumpvars(0,tb);
    end
endmodule
