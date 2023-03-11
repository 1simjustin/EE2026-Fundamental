`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2023 20:33:04
// Design Name: 
// Module Name: slow_blinky
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


module slow_blinky(
    input CLOCK,
    output [1:0] led
);
    reg [4:0] COUNT = 5'b0;
    reg SLOW_CLOCK = 0;
    
    assign led[0] = SLOW_CLOCK;
    assign led[1] = 1;
    
    always @ (posedge CLOCK) begin
        COUNT <= (COUNT == 5'b01010) ? 0 : COUNT + 1;
        SLOW_CLOCK <= (COUNT == 0) ? ~SLOW_CLOCK : SLOW_CLOCK;
    end
endmodule
