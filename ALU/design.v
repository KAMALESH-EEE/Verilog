
module ALU #(parameter W_size=8)(A,B,s,C,zero,Of,C_out);

    input [W_size-1:0]  A,B;
    input [2:0] s;
    output reg zero;
    output wire Of;
    inout wire C;
    output wire [W_size-1:0]C_out;

    reg [W_size:0] result;

    always @(A,B,s) begin
        result = 0;
        case (s)
            3'b000:
                result = (A+B)+C;
            3'b001:
                result <= A-B;
            3'b010:
                result <= A & B;
            3'b011:
                result <= A|B;
            3'b100:
                result <= A^B;
            3'b101:
                result <= ~A;

            default:
                result <= 4'b0000;
        endcase
	        
    end

    always @(result) begin
        zero = (result == 0);
    end
      
        assign Of = result[W_size];   
        assign C_out = result[W_size-1:0];
	assign C=Of; 
endmodule