`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.01.2023 23:07:36
// Design Name: 
// Module Name: SW_C
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


module SW_C(
    input A, B, C,
    output LED0, LED1, LED2
    );
    assign LED0 = A & C; 
    assign LED1 = B & C;
    assign LED2 = A & B & C;
endmodule
