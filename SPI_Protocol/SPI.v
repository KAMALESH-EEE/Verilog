module SPI_slave (sck,MISO,MOSI,cs);

    input wire sck,MOSI,cs;
    output wire MISO;

    reg[7:0] tx_data,rx_mem,tx_mem;
    wire[7:0] rx_data;
    reg rst,rx_done;
    wire out;
    SIPO Rx_buf (sck,rst,MOSI,rx_data,cs);
    PISO Tx_buf (sck,rst,tx_data,out,cs);

    reg [1:0] PS,NS;
    parameter Ideal =2'b00, Trans =2'b01, _end = 2'b10;

    initial begin
        PS<=2'b00;
        NS<=2'b00;
    end

    always @(posedge sck or cs) begin
        case (PS)        
            Ideal: begin
                if (cs == 1'b0) begin
                    tx_data <= tx_mem;
                    rst <=1'b0;
                    NS<=Trans;
                end
                else begin
                    NS <= Ideal;
                end
            end
            Trans: begin
                rst <= 1'b1;
                rx_done <= 1'b0;

                if (cs == 1'b0) begin
                    NS<=Trans;
                end
                else begin
                    NS<=_end;
                end
            end
            _end:
                begin
                    NS<=2'b00;  
                end
                
            default:
                NS<=Ideal;
        endcase
        PS<=NS;
    end

    always@(posedge cs) begin
        rx_done <=1'b1;
        rx_mem <= rx_data;
    end
    assign MISO = out & ~cs;
endmodule

module SIPO(clk,rst,in,out,cs);

    input wire clk,in,rst,cs;
    output wire[7:0] out;
    reg[7:0] data;

    always @(negedge rst) begin
        data<= 8'b0000_0000;
    end

    always @(posedge clk ) begin
        if (~cs) begin
            data <= {in,data[7:1]};
        end
    end

    assign out = data;
endmodule

module PISO(clk,rst,in,out,cs);

    input wire clk,rst,cs;
    input wire[7:0] in;

    output wire out;

    reg[7:0] data;

    always @(negedge rst) begin
        data<= in;
    end

    always @(posedge clk ) begin
        data <= {data[0],data[7:1]};
    end
    
    assign out = data[0]& ~cs;

endmodule