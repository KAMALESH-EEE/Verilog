module spi_tb;
  typedef SPI_slave S;
class SPI_slave;

  logic clk,MOSI,cs;
  bit MISO;

  byte rx;

  S Slave (clk,MISO,MOSI,cs);

  function new;
    S =new;
    clk <=1'b0;
    cs <=1'b1;
  endfunction

  task Transfer(byte tx);
    cs <=1'b0;
    #10;
    for(int i=0;i<8;i++) begin
      rx[i] <= MISO;
      MOSI <= tx[i];
      clk<=1'b1;
      #5;
      clk  <= 1'b0;    
      #5;
    end
    cs<=1'b1;
    $display("Recived data  %h",rx);

  endtask

endclass





endmodule
