`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.01.2023 22:21:09
// Design Name: 
// Module Name: parallel_adder
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

module five_bit(
    input [4:0] A, [4:0] B,
    input carry,
    output [4:0] S
    );
    
    wire [4:0]C;
    
    adder faa0 (A[0], B[0], carry, S[0], C[0]);
    adder faa1 (A[1], B[1], C[0], S[1], C[1]);
    adder faa2 (A[2], B[2], C[1], S[2], C[2]);
    adder faa3 (A[3], B[3], C[2], S[3], C[3]);
    adder faa4 (A[4], B[4], C[3], S[4], C[4]);
endmodule

module two_bit(
    input [1:0] A, [1:0] B,
    output [1:0] S,
    output carry
    );
    
    wire [1:0] C;
    
    adder fab0 (A[0], B[0], 0, S[0], C[0]);
    adder fab1 (A[1], B[1], C[0], S[1], C[1]);
    
    assign carry = C[1];
endmodule

module parallel_adder(
    input [6:0] A, B,
    input pb,
    output [6:0] S, [5:0] T,
    output [6:0] seg, [3:0] an
    );
    
    // init
    assign an[3:0] = 4'b1000;
    assign seg[6:0] = 7'b1101010;
    
    // parallel adders
    wire carry;
    wire [6:0] ans;
    
    five_bit msb (A[6:2],B[6:2],carry,ans[6:2]);
    two_bit lsb (A[1:0],B[1:0],ans[1:0],carry);
    
    // button press
    assign T[5:0] = pb ? 6'b111111 : 6'b0;
    assign S[2:0] = pb ? 0 : ans[2:0];
    assign S[6:3] = pb ? ans[3:0] : ans[6:3];
    
endmodule
