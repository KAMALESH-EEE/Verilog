module tb;
  reg s0,s1,s2,b0,b1,b2,b3,b4,b5,b6,b7;
  wire o;
  
  mux dut(s0,s1,s2,o,b0,b1,b2,b3,b4,b5,b6,b7);
  
  initial begin
    
    $monitor("S0 = %b S1 = %b S2 = %b | Out = %b",s0,s1,s2,o);
        
    #1 s0=1'b0;s1=1'b0;s2=1'b0; b0=1'b0;
    #5 s0=1'b0;s1=1'b0;s2=1'b0; b0=1'b1;
    
    #5 s0=1'b0;s1=1'b0;s2=1'b1; b1=1'b0;
    #5 s0=1'b0;s1=1'b0;s2=1'b1; b1=1'b1;
    
    #5 s0=1'b0;s1=1'b1;s2=1'b0; b2=1'b0;
    #5 s0=1'b0;s1=1'b1;s2=1'b0; b2=1'b1;
    
    #5 s0=1'b0;s1=1'b1;s2=1'b1; b3=1'b0;
    #5 s0=1'b0;s1=1'b1;s2=1'b1; b3=1'b1;
    
    #5 s0=1'b1;s1=1'b0;s2=1'b0; b4=1'b0;
    #5 s0=1'b1;s1=1'b0;s2=1'b0; b4=1'b1;
    
    #5 s0=1'b1;s1=1'b0;s2=1'b1; b5=1'b0;
    #5 s0=1'b1;s1=1'b0;s2=1'b1; b5=1'b1;
    
    #5 s0=1'b1;s1=1'b1;s2=1'b0; b6=1'b0;
    #5 s0=1'b1;s1=1'b1;s2=1'b0; b6=1'b1;
    
    #5 s0=1'b1;s1=1'b1;s2=1'b1; b7=1'b0;
    #5 s0=1'b1;s1=1'b1;s2=1'b1; b7=1'b1;
    
    #5;
    

  end
  
  initial begin
    
    $dumpfile("testbench.vcd");
    $dumpvars();
  end
    
endmodule 
  
