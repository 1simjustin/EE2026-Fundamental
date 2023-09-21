`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.02.2023 18:10:16
// Design Name: 
// Module Name: count_pass
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


module count_pass(
    input [3:0]sw, [4:0]btn,
    input CLOCK,
    output [10:0]led, output reg [6:0]seg = 7'b1111111, output reg [3:0]an = 4'b1111,
    output dp
);
    // registers for subtask a
    // startup blink clock
    reg [26:0]TIME_COUNT = 27'b1;
    reg [8:0]led_control = 9'b0;
    reg [8:0]started = 9'b0; // start up status
    
    reg [26:0]blink_freq;
    reg blink_status = 0;
    reg [1:0]blink_num; // control which led to blink
    
    // registers for subtask b
    reg [2:0]step = 0;
    reg led_pass_control = 0;
    
    // registers for subtask c
    reg [1:0]an_status = 0;
    
    // registers for subtask d
    reg alpha_status = 0;
    reg [28:0]alpha_count = 29'b1;
    reg num_control = 0;
    
    assign led[8:0] = led_control;
    assign led[9] = num_control;
    assign led[10] = led_pass_control;
    
    assign dp = 1;
    
    always @ (posedge CLOCK) begin
        if (sw[3] == 1) begin
            alpha_count <= (alpha_count == 29'd300_000_000) ? 0 : alpha_count + 1;
            alpha_status <= (alpha_count == 0 && alpha_status == 0) ? 1 : alpha_status; // need to resolve problems, alpha_status getting set back to 0 after getting set to 1
            // tried fixing, pending testing
        end
        else begin
            alpha_count <= 29'b1;
            alpha_status <= 0;
        end
        
        if (alpha_status == 0) begin
            num_control <= 0;
        
            if (started != 9'b111111111) begin
                TIME_COUNT <= (TIME_COUNT == (27'd111_000_000 - 1)) ? 0 : TIME_COUNT + 1;
                an <= 4'b1111;
                led_control <= started;
                started <= (TIME_COUNT == 0) ? (started * 2 + 1) : started;
            end
        
            else if (started == 9'b111111111) begin
                // control blinking
                if (sw[2:0] >= 4) begin
                    blink_freq = 1.0e6 / 2;
                    blink_num = 2;
                    led_control[1:0] = 2'b11;
                end
                else if (sw[2:0] >= 2) begin
                    blink_freq = 1.0e7 / 2;
                    blink_num = 1;
                    led_control[2] = 1;
                    led_control[0] = 1;
                end
                else if (sw[2:0] >= 1) begin
                    blink_freq = 1.0e8 / 2;
                    blink_num = 0;
                    led_control[2:1] = 2'b11;
                end
            
                // blink if [2:0]sw on
                if (sw[2:0] != 0) begin
                    TIME_COUNT <= (TIME_COUNT >= blink_freq) ? 0 : TIME_COUNT + 1;
                    blink_status <= (TIME_COUNT == 0) ? ~blink_status : blink_status;
                    led_control[blink_num] <= blink_status;
                    led_control[8:3] = 6'b111111;
                end
                else begin
                    led_control[8:0] = 9'b111111111;
                    // reset clock and status
                    TIME_COUNT = 1;
                    blink_status = 0;
                end
            
                // enter passcode
                case (step)
                    0 : begin
                        an <= 4'b1110;
                        seg <= 7'b0100111;
                        step <= (btn[4] == 1) ? 1 : 0;
                    end
                    1 : begin
                        an <= 4'b1101;
                        seg <= 7'b0101111;
                        step <= (btn[3] == 1) ? 2 : 1;
                    end
                    2 : begin
                        an <= 4'b1011;
                        seg <= 7'b0100001;
                        step <= (btn[1] == 1) ? 3 : 2;
                    end
                    3 : begin
                        an <= 4'b0111;
                        seg <= 7'b1001111;
                        step <= (btn[2] == 1) ? 4 : 3;
                    end
                    4 : begin
                        an <= 4'b1101;
                        seg <= 7'b0101111;
                        step <= (btn[3] == 1) ? 5 : 4;
                    end
                    5 : begin
                        led_pass_control = 1;
                        case (an_status)
                            0 : begin
                                an <= 4'b1110;
                                seg <= 7'b0100111;
                            end
                            1 : begin
                                an <= 4'b1101;
                                seg <= 7'b0101111;
                            end
                            2 : begin
                                an <= 4'b1011;
                                seg <= 7'b0100001;
                            end
                        endcase
                        // blink if [2:0]sw on
                        if (sw[2:0] != 0 && TIME_COUNT == 0) begin
                            case (an_status)
                                0 : an_status <= 1;
                                1 : an_status <= 2;
                                2 : an_status <= 0;
                            endcase
                        end
                        else begin
                            led_control[2:0] = 3'b111;
                            // reset clock and status
                            TIME_COUNT = 1;
                            blink_status = 0;
                        end
                    end                
                endcase
            end
        end
        
        else begin
            num_control <= 1;
            led_control <= 9'b011100100;
            an <= 4'b0000;
            seg <= 7'b0101011;
        end
    end
endmodule
