`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.01.2023 20:17:26
// Design Name: 
// Module Name: fourbit_adder
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

module fourbit_adder(
    input [3:0] A, [3:0] B, 
    input CARRYIN,
    output [3:0] led
    );
    wire [3:0] S;
    wire [3:0] internalC;
    
    adder a0 (A[0], B[0], CARRYIN, S[0], internalC[0]);
    adder a1 (A[1], B[1], internalC[0], S[1], internalC[1]);
    adder a2 (A[2], B[2], internalC[1], S[2], internalC[2]);
    adder a3 (A[3], B[3], internalC[2], S[3], internalC[3]);
    
    assign led[3:0] = S[3:0];
endmodule
