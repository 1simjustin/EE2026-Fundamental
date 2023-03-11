`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2023 20:13:01
// Design Name: 
// Module Name: blinky_sim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module blinky_sim();
    reg CLOCK_sim; 
    wire LED_sim;
    blinky simul (CLOCK_sim, LED_sim);
    
    initial begin
        CLOCK_sim = 0;
    end
    
    always begin
        #5 CLOCK_sim = ~CLOCK_sim;
    end
endmodule
