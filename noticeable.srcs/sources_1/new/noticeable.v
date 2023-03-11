`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2023 21:25:41
// Design Name: 
// Module Name: noticeable
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


module noticeable(
    input CLOCK,
    input [2:0] sw,
    output led
    );
    reg [27:0] COUNT = 0;
    reg SLOW = 0;
    
    reg [27:0] max;
    
    assign led = (sw == 3'b0) ? 0 : SLOW;
    //assign max = 1.0e8;//(sw==3'b001) ? 1.0e6 : ((sw==3'b010) ? 1.0e7 : ((sw==3'b100) ? 1.0e8 : 0));
    
    always @ (posedge CLOCK) begin
        case (sw)
            3'b001 : begin max = 1.0e6; end
            3'b010 : begin max = 1.0e7; end
            3'b100 : begin max = 1.0e8; end
        endcase
        COUNT <= (COUNT >= (max/2)) ? 0 : COUNT + 1;
        SLOW <= (COUNT == 0) ? ~SLOW : SLOW;
    end
endmodule
