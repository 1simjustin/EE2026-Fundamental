`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.01.2023 22:32:03
// Design Name: 
// Module Name: control_module_sim
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


module control_module_sim(

    );
    
    // Simulate inputs
    reg sim_A, sim_B;
    
    // Simulate outputs
    wire LED1, LED2, LED3;
    
    // Initiate module to be simulated
    control_module dut(sim_A, sim_B, LED1, LED2, LED3);
    
    // Stimuli
    initial begin
        sim_A = 0; sim_B = 0; #10;
        sim_A = 0; sim_B = 1; #10;
        sim_A = 1; sim_B = 0; #10;
        sim_A = 1; sim_B = 1; #10;
        sim_A = 0; sim_B = 0; #10;
    end
endmodule
