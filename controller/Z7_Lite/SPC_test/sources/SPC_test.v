`timescale 1ns / 1ps

module SPC_test(
    input wire clk,
    input wire SW,
    input wire A,
    input wire B,
    output reg [7:0] globalCount
    );

parameter IDEL   = 3'b000,
          STATE1 = 3'b001,
          STATE2 = 3'b010,
          DONE   = 3'b100;

reg [2:0] STATE;
reg lastSib;
reg resetflag;
reg currentSib;
reg flag;

always @(posedge clk) begin
    case(STATE)
        IDEL:begin
            lastSib             <= B;
            STATE               <= STATE1; 
        end

        STATE1:begin
            if (SW == 1'b1) begin
                STATE           <= STATE2;
            end
            else if (SW == 1'b0) begin
                STATE           <= STATE1;
                resetflag       <= 1'b1;
            end
        end

        STATE2:begin
            if (A == 1'b1) begin
                STATE           <= DONE;
            end
            else if (A == 1'b0) begin
                STATE           <= STATE2;
                currentSib      <= B;
                flag            <= 1'b1;
            end
        end

        DONE:begin
            if (resetflag == 1'b1) begin
                globalCount     <= 1'b0; 
                resetflag       <= 1'b0;
                STATE           <= IDEL;
            end
            else if (flag == 1'b1) begin
                if (lastSib == 1'b0 & currentSib == 1'b1) begin
                    globalCount = globalCount + 1'b1;
                end
                if (lastSib == 1'b1 & currentSib == 1'b0) begin
                    globalCount = globalCount - 1'b1;
                end
                flag            <= 1'b0;
                STATE           <= IDEL;
            end
            else begin
                STATE           <= IDEL;
            end
        end
        
        default:begin
            STATE               <= IDEL;
        end
        
    endcase
end

endmodule