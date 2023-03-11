`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.01.2023 23:13:07
// Design Name: 
// Module Name: Test_SW_C
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


module Test_SW_C(

    );
    reg A, B, C;
    
    wire LED0, LED1, LED2;
    
    SW_C dut(A, B, C, LED0, LED1, LED2);
    
    initial begin
        A=0;B=0;C=0;#10;
        A=1;B=0;C=0;#10;
        A=1;B=0;C=1;#10;
        A=0;B=1;C=0;#10;
        A=0;B=1;C=1;#10;
        A=1;B=1;C=0;#10;
        A=1;B=1;C=1;#10;
        A=0;B=0;C=0;#10;
    end
endmodule
