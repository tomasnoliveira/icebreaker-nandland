`timescale 1ns / 1ps
//module name and inputs/outputs
module nibble_to_seven_seg(
    input [3:0] nibblein,
    output reg [6:0] segout
    );

always @*
   case (nibblein)
     0: segout = ~7'b0111111;
     1: segout = ~7'b0000110;
     2: segout = ~7'b1011011;
     3: segout = ~7'b1001111;
     4: segout = ~7'b1100110;
     5: segout = ~7'b1101101;
     6: segout = ~7'b1111101;
     7: segout = ~7'b0000111;
     8: segout = ~7'b1111111;
     9: segout = ~7'b1101111;   
     // default case happens whenever an undefined input occurs...
     default: segout = ~7'b1001001;
   endcase
endmodule
