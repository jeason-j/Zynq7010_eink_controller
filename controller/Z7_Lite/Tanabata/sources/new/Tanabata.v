`timescale 1ns / 1ps

module Tanabata(
    input wire  clk,
    input wire  rst,
    output reg  [6:0] led
    );

parameter CNT = 25000000-1;//500ms cnt

parameter CNT_DATA = 44;

reg [5:0] cnt_data;
reg [24:0] cnt;

always @(posedge clk or negedge rst) begin
    if (rst == 1'b0) begin
        // reset
        cnt <= 0;
        cnt_data <= 0;
    end
    else if (cnt == CNT) begin
        cnt <= 0;
        cnt_data <= cnt_data + 1'b1;
        if (cnt_data == CNT_DATA) begin
            cnt_data <= 0;
        end
    end
    else begin
        cnt <= cnt + 1'b1;
    end
end

always @(posedge clk or negedge rst) begin
    if (rst == 1'b0) begin
        // reset
        led<= 7'b1111111;
    end
    else begin
        case(cnt_data)
            6'd1 :led<= 7'b1000100;//D
            6'd2 :led<= 7'b1100101;//e
            6'd3 :led<= 7'b1100001;//a
            6'd4 :led<= 7'b1110010;//r
            6'd5 :led<= 7'b1000000;// 
            6'd6 :led<= 7'b1110111;//w
            6'd7 :led<= 7'b1101001;//i
            6'd8 :led<= 7'b1100100;//d
            6'd9 :led<= 7'b1101111;//o
            6'd10:led<= 7'b1110111;//w
            6'd11:led<= 7'b1110100;//:
            6'd12:led<= 7'b1000000;//
            6'd13:led<= 7'b1001000;//H
            6'd14:led<= 7'b1100001;//a
            6'd15:led<= 7'b1110000;//p
            6'd16:led<= 7'b1110000;//p
            6'd17:led<= 7'b1111001;//y
            6'd18:led<= 7'b1000000;//
            6'd19:led<= 7'b1000011;//C
            6'd20:led<= 7'b1101000;//h
            6'd21:led<= 7'b1101001;//i
            6'd22:led<= 7'b1101110;//n
            6'd23:led<= 7'b1100101;//e
            6'd24:led<= 7'b1110011;//s
            6'd25:led<= 7'b1100101;//e
            6'd26:led<= 7'b1000000;//
            6'd27:led<= 7'b1010110;//V
            6'd28:led<= 7'b1100001;//a
            6'd29:led<= 7'b1101100;//l
            6'd30:led<= 7'b1100101;//e
            6'd31:led<= 7'b1101110;//n
            6'd32:led<= 7'b1110100;//t
            6'd33:led<= 7'b1101001;//i
            6'd34:led<= 7'b1101110;//n
            6'd35:led<= 7'b1100101;//e
            6'd36:led<= 7'b1001110;//'
            6'd37:led<= 7'b1110011;//s
            6'd38:led<= 7'b1000000;//
            6'd39:led<= 7'b1000100;//D
            6'd40:led<= 7'b1100001;//a
            6'd41:led<= 7'b1111001;//y
            6'd42:led<= 7'b1000000;//
            6'd43:led<= 7'b1111110;//~
            default:led<= 7'b0000000;
        endcase
    end
end


endmodule
