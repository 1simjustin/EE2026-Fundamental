`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.01.2023 20:24:20
// Design Name: 
// Module Name: fourbit_test
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


module fourbit_test(

    );
    reg [3:0] A;
    reg [3:0] B;
    reg CIN;
    
    wire [3:0] led;
    
    fourbit_adder test(A,B,CIN,led);
    
    initial begin
        A=4'b0000; B=4'b0000; CIN=1'b0; #10;
        A=4'b0011; B=4'b0011; CIN=1'b0; #10;
        A=4'b1011; B=4'b0111; CIN=1'b0; #10;
        A=4'b1111; B=4'b1111; CIN=1'b0; #10;
    end
endmodule
