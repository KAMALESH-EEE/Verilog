module stb;
 
    reg clk,MOSI,cs1,cs2,ck;
    wor MISO;
    int i;

    reg[7:0] data,rx_data;

    SPI_slave S1(clk,MISO,MOSI,cs1);
    SPI_slave S2(clk,MISO,MOSI,cs2);
    
    initial begin
        ck<=1'b0;
        clk <=1'b0;
        cs1 <=1'b1;
        cs2 <=1'b1;
        data <= 8'hab;
        #40;
        cs1<=1'b0;
        S1.tx_mem<=8'hbc;
        
        #10;
        for(i=0; i<8;i+=1)begin
            MOSI<=data[i];
           
            clk <= 1'b1;
            #5;
            clk <= 1'b0;
            #5;
        end
        cs1<=1'b1;
        $display("RX status %b",S1.rx_done);
        $display("MI data %b",rx_data); 

        #40;
        cs2<=1'b0;
        data <= 8'hcd;
        S2.tx_mem<=8'hde;
        #10;
        for(i=0; i<8;i+=1)begin
            MOSI<=data[i];
        
            clk <= 1'b1;
            #5;
            clk <= 1'b0;
            #5;
        end
        cs2<=1'b1;
        $display("RX status %b",S2.rx_done);
        $display("MI data %b",rx_data);               
    end

    always @(posedge clk) begin
        rx_data[i]<=MISO;
    end

    always begin
        #5;
        ck <= ~ck;
    end

    initial begin
        $dumpfile("SPI_tb.vcd");
        $dumpvars(0,stb);
    end

endmodule
