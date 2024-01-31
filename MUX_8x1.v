module mux(S0,S1,S2,Y,B0,B1,B2,B3,B4,B5,B6,B7);
  input S0,S1,S2,B0,B1,B2,B3,B4,B5,B6,B7;
  output reg Y;
  
  always @ (S0,S1,S2,B0,B1,B2,B3,B4,B5,B6,B7)
    begin

    if (S0 == 1'b0 && S1 == 1'b0 &&  S2 == 1'b0)
      begin 
        Y=B0;
      end
      else if (S0 == 1'b0 && S1 == 1'b0 &&  S2 == 1'b1)
      begin 
        Y=B1;
      end
      else if (S0 == 1'b0 && S1 == 1'b1 &&  S2 == 1'b0)
      begin 
       	Y=B2;
      end
      else if (S0 == 1'b0 && S1 == 1'b1 &&  S2 == 1'b1)
      begin 
       	Y=B3;
      end
      else if (S0 == 1'b1 && S1 == 1'b0 &&  S2 == 1'b0)
      begin 
       	Y=B4;
      end
      else if (S0 == 1'b1 && S1 == 1'b0 &&  S2 == 1'b1)
      begin 
        Y=B5;
      end
      else if (S0 == 1'b1 && S1 == 1'b1 &&  S2 == 1'b0)
      begin 
       	Y=B6;
      end

      else if (S0 == 1'b1 && S1 == 1'b1 &&  S2 == 1'b1)
      begin 
        Y=B7;
      end
    end
endmodule
