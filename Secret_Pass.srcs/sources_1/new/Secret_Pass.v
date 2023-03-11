`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.01.2023 21:35:05
// Design Name: 
// Module Name: Post_Lab
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


module Post_Lab(
    input SW0, SW1, SW2, SW3, SW4, SW5, SW6, SW7, SW8, SW9,
    output LED0, LED1, LED2, LED3, LED4, LED5, LED6, LED7, LED8, LED9, LED15,
    SEG0, SEG1, SEG2, SEG3, SEG4, SEG5, SEG6,
    DP,
    AN0, AN1, AN2, AN3
    );
    // LED Output
    assign LED0 = SW0;
    assign LED1 = SW1;
    assign LED2 = SW2;
    assign LED3 = SW3;
    assign LED4 = SW4;
    assign LED5 = SW5;
    assign LED6 = SW6;
    assign LED7 = SW7;
    assign LED8 = SW8;
    assign LED9 = SW9;
            
    // 7-ch display always on
    assign AN3 = 0;
    assign AN0 = 0;
    assign SEG4 = 0;
    assign SEG6 = 0;
    
    // 7-ch display always off
    assign AN2 = 1;
    assign SEG0 = 1;
    assign SEG1 = 1;
    assign DP = 1;
            
    // Init or Wrong Password
    assign SEG3 = (SW5 & SW7 & SW9 & SW2 & SW6) & ~(SW0 | SW1 | SW3 | SW4 | SW8);
    assign SEG5 = (SW5 & SW7 & SW9 & SW2 & SW6) & ~(SW0 | SW1 | SW3 | SW4 | SW8);
         
    // Correct Password
    assign LED15 = (SW5 & SW7 & SW9 & SW2 & SW6) & ~(SW0 | SW1 | SW3 | SW4 | SW8);
    assign AN1 = ~((SW5 & SW7 & SW9 & SW2 & SW6) & ~(SW0 | SW1 | SW3 | SW4 | SW8));
    assign SEG2 = ~((SW5 & SW7 & SW9 & SW2 & SW6) & ~(SW0 | SW1 | SW3 | SW4 | SW8));
endmodule
