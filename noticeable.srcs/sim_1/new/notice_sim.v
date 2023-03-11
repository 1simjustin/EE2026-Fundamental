`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2023 22:10:20
// Design Name: 
// Module Name: notice_sim
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


module notice_sim();
    reg CLOCK_sim; 
    reg [2:0] sw;
    wire led_sim;
    noticeable simul (CLOCK_sim, sw, led_sim);
    
    initial begin
        CLOCK_sim = 0;
        sw = 3'b100; #10;
        //sw = 3'b010; #10;
        //sw = 3'b100; #10;
    end
    
    always begin
        #5 CLOCK_sim = ~CLOCK_sim;
    end
endmodule
