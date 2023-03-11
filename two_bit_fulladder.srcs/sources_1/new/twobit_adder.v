`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.01.2023 17:56:06
// Design Name: 
// Module Name: twobit_adder
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

module adder(
    input A, B, CIN,
    output S, COUT
    );
    assign S = A ^ B ^ CIN;
    assign COUT = (A & B) | (CIN & (A ^ B));
endmodule

module my_2_bit_adder(
    input [1:0] A, [1:0] B, C0,
    output [1:0] S, output C2
    );
    
    wire C1;
    
    adder fa0 (A[0], B[0], C0, S[0], C1);
    adder fa1 (A[1], B[1], C1, S[1], C2);
endmodule
