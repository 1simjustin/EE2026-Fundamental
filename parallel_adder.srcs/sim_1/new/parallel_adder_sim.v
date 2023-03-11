`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2023 09:53:04
// Design Name: 
// Module Name: parallel_adder_sim
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


module parallel_adder_sim();
    reg [6:0] sim_A, sim_B;
    reg sim_btn;
    wire [6:0] sim_S; 
    wire [5:0] sim_T;
    wire [6:0] sim_seg;
    wire [3:0] sim_an;
    
    parallel_adder test_unit(.A(sim_A),.B(sim_B),.pb(sim_btn),.S(sim_S),.T(sim_T),.seg(sim_seg),.an(sim_an));

    initial begin
        sim_A = 7'b0100100; sim_B = 7'b0001001; sim_btn = 0; #20;
        sim_A = 7'b0101010; sim_B = 7'b1010101; sim_btn = 0; #20;
        sim_A = 7'b1111101; sim_B = 7'b0000011; sim_btn = 0; #20; // empty
        sim_A = 7'b0000101; sim_B = 7'b0000010; sim_btn = 1; #20;
        sim_A = 7'b1000110; sim_B = 7'b0100011; sim_btn = 1; #20; // overflow
        sim_A = 7'b0001101; sim_B = 7'b0000011; sim_btn = 1; #20; // overflow empty
        sim_A = 7'b0000000; sim_B = 7'b0000000; sim_btn = 0; #20; // reset
    end
endmodule