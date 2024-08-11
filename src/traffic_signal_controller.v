`timescale 1ns / 1ps


`define TRUE 1'b1
`define FALSE 1'b0

// Delays
`define Y2RDELAY 3       // Yellow to Red Delay
`define R2GDELAY 2       // Red to Green Delay

module traffic_sig_controller(
    output reg [1:0] hwy,    // 2-bit output for 3 states of signal: GREEN, RED, YELLOW
    output reg [1:0] cntry,  // 2-bit output for 3 states of signal: GREEN, RED, YELLOW
    input X,                 // if TRUE, indicates that there is a car on the country road, otherwise FALSE
    input clk, 
    input clear
);
  
  parameter RED = 2'd0,
            YELLOW = 2'd1,
            GREEN = 2'd2;
  

  // State Definition
  
  parameter S0 = 3'd0,
            S1 = 3'd1,
            S2 = 3'd2,
            S3 = 3'd3,
            S4 = 3'd4;
  
 // Internal State Variables
  
  reg [2:0] prest_state;
  reg [2:0] next_state;
  
/*  Signal Controller starts in S0 State
  
 initial
   begin
     prest_state = S0;
     next_state  = S0;
     hwy         = GREEN;
     cntry       = RED;
   end
*/
  
// State Changes only at positive edge of 
always @(posedge clk)begin
if(clear)
     prest_state <= S0;
else
    prest_state <= next_state;
end      

// Compute values of main signal and country signal.

    always @(prest_state)
        begin
          case(prest_state)
            
            S0 : begin
                 hwy = GREEN;
                 cntry = RED;
                 end
            
            S1: begin
                 hwy = YELLOW;
                 cntry = RED;
                end
            
            S2: begin
                 hwy = RED;
                 cntry = RED;
                end
            
            S3: begin
                 hwy = RED;
                 cntry = GREEN;
                end
            
            S4: begin
                 hwy = RED;
                 cntry = YELLOW;
                end
            
            default : begin
                      hwy = GREEN;
                      cntry = RED;
                      end
            
          endcase
end
      
      
// Logic Part
      
      always @(prest_state or X)
        begin
          case(prest_state)
         
              S0 : next_state = X ? S1 : S0;
              
              
              S1 : begin
                   repeat (`Y2RDELAY) @(posedge clk);
                   next_state = S2;
                   end
              
              
              S2 : begin
                   repeat (`R2GDELAY) @(posedge clk);
                   next_state = S3;
                   end
              
              S3 :	next_state = X ? S3 : S4;
              
              S4 : begin
                   repeat (`Y2RDELAY) @(posedge clk);
                   next_state = S0;
                   end
              
              default : next_state = S0;
              
            endcase
        end
      
endmodule
