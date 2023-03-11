`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.01.2023 22:30:27
// Design Name: 
// Module Name: Test_Secret_Pass
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


module Test_Secret_Pass(

    );
    
    // Simulation Inputs
    reg SW0, SW1, SW2, SW3, SW4, SW5, SW6, SW7, SW8, SW9;
    
    // Simulation Outputs
    wire LED0, LED1, LED2, LED3, LED4, LED5, LED6, LED7, LED8, LED9, LED15;
    
    wire SEG0, SEG1, SEG2, SEG3,SEG4, SEG5, SEG6, DP, AN0, AN1, AN2, AN3;
    
    // Initiate Simulated Modules
    Post_Lab dut(SW0,SW1,SW2,SW3,SW4,SW5,SW6,SW7,SW8,SW9,LED0,LED1,LED2,LED3,LED4,LED5,LED6,LED7,LED8,LED9,LED15,SEG0,SEG1,SEG2,SEG3,SEG4,SEG5,SEG6,DP,AN0,AN1,AN2,AN3);
    
    // Stimuli
    initial begin
        SW0=0;SW1=0;SW2=0;SW3=0;SW4=0;SW5=0;SW6=0;SW7=0;SW8=0;SW9=0;#10;
        SW0=1;SW1=0;SW2=0;SW3=0;SW4=0;SW5=0;SW6=0;SW7=1;SW8=0;SW9=0;#10;
        SW0=0;SW1=1;SW2=1;SW3=0;SW4=0;SW5=1;SW6=1;SW7=1;SW8=0;SW9=1;#10;
        SW0=0;SW1=0;SW2=1;SW3=0;SW4=0;SW5=1;SW6=1;SW7=1;SW8=0;SW9=1;#10;
    end
endmodule
