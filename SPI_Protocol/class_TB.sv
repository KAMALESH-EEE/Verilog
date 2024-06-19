class Slave;

    bit clk,MISO,MOSI,cs;

    byte rx_data;

    function new();
        clk <= 1'b0;
        MISO <= 1'b0;
        MOSI <= 1'b0;
        cs <= 1'b1;
    endfunction

    task Trans(byte a);
        clk <= 1'b0;
        cs<=1'b0;
        rx_data<=8'h00;
        #10;
        for(int i=0; i<8;i+=1)begin
            MOSI<=a[i];
            rx_data[i]<=MISO;
            #1;
            clk <= 1'b1;
            #5;
            clk <= 1'b0;
            #4;
        end
        cs<=1'b1;
        MOSI<=1'b0;
    endtask

endclass

module class_tb;

    reg clk,MOSI,cs2,cs1;
    wor MISO;
    reg [7:0] rx_data;
    Slave sc1=new;
    Slave sc2=new;

    SPI_slave s1(clk,MISO,MOSI,cs1);
    SPI_slave s2(clk,MISO,MOSI,cs2);

    initial begin
        s1.tx_mem <= 8'hea;
        s2.tx_mem <= 8'hae;
        #40;
        sc1.Trans(8'hbc);
        rx_data=sc1.rx_data;
        #10;
        $display("rx data: %h  || tx data: %h",rx_data,s1.rx_mem);
        #40;
        sc2.Trans(8'hcb);
        rx_data=sc2.rx_data;
        #10;
        $display("rx data: %h  || tx data: %h",rx_data,s2.rx_mem);
        #10;   
      $finish;
    end

    always @(sc1.clk or sc1.cs or sc2.clk or sc2.cs) begin
    clk <= sc1.clk | sc2.clk;
    MOSI <= sc1.MOSI | sc2.MOSI;
    cs1 <= sc1.cs;
    cs2 <= sc2.cs;
    sc1.MISO <= MISO;
    sc2.MISO <= MISO;    
    end
    
    initial begin
        $dumpfile("class_SPI.vcd");
        $dumpvars();
    end
    
endmodule
