module SSLC (in,A,B,C,D,E,F,G);

    input wire [3:0] in;
    output reg A,B,C,D,E,F,G;

    reg [6:0] in_out;

    parameter _0=7'b1111110, _1=7'b0110000, _2=7'b1101101, _3=7'b1111001, _4=7'b0110011, _5=7'b1011011, _6=7'b1011111, _7=7'b1110000, _8=7'b1111111, _9=7'b1111011;

    always @(in) begin
        case (in)
            4'b0000:
            in_out <= _0;

            4'b001:
            in_out <= _1;
            
            4'b0010:
            in_out <= _2;

            4'b0011:
            in_out <= _3;

            4'b0100:
            in_out <= _4;

            4'b0101:
            in_out <= _5;

            4'b0110:
            in_out <= _6;

            4'b0111:
            in_out <=_7;

            4'b1000:
            in_out <=_8;

            4'b1001:
            in_out <=_9;

        endcase
      
    end

    assign {A,B,C,D,E,F,G} = in_out[6:0];

endmodule