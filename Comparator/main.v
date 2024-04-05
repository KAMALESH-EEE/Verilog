module compare(a,b,gt,lt,eq,ge,le);

    input wire[63:0] a,b;
    output wire gt,lt,eq,ge,le;

    assign gt= (a>b);
    assign lt= (a<b);
    assign eq= (a===b);
    assign ge= (a>=b);
    assign le= (a<=b);

endmodule
