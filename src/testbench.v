`timescale 1ns / 1ps


module stimulus;

wire [1:0] HWY_SIG, CNTRY_SIG;
reg CAR_ON_CNTRY_RD;
reg CLK, CLEAR;

// Instantiate signal controller
traffic_sig_controller TSC(HWY_SIG, CNTRY_SIG, CAR_ON_CNTRY_RD, CLK, CLEAR);

// Set Up Monitor
initial
$monitor($time, "HWY Sig = %b Country Sig = %b  Car_on_cntry = %b",HWY_SIG,CNTRY_SIG,CAR_ON_CNTRY_RD);

// Set Up Clock
initial
begin
CLK = `FALSE;
forever #5 CLK = ~ CLK;
end

// Control Clear Signal

initial
begin
     CLEAR = `TRUE;
     repeat (5) @(negedge CLK);
     CLEAR = `FALSE;
end

// Apply Stimulus

initial
begin
     CAR_ON_CNTRY_RD = `FALSE;
     
     #200 CAR_ON_CNTRY_RD = `TRUE;
     #100 CAR_ON_CNTRY_RD = `FALSE;
     
     #200 CAR_ON_CNTRY_RD = `TRUE;
     #100 CAR_ON_CNTRY_RD = `FALSE;
     
     #200 CAR_ON_CNTRY_RD = `TRUE;
     #100 CAR_ON_CNTRY_RD = `FALSE;
     
     #100 $stop;
     end

endmodule

