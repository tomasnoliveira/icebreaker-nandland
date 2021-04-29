`default_nettype none

module top (
     input CLK,
     input BTN1,
     output [6:0] seg,
     output ca
);

reg r_BTN1 = 1'b0;
reg [3:0] r_COUNT = 0;
wire w_BTN1;
wire [7:0] w_disp0, w_disp1;
wire displayClock;

debounce_filter debounce_inst
     (.CLK(CLK),
     .i_BTN(BTN1),
     .o_BTN(w_BTN1));

always @(posedge CLK) begin
     r_BTN1 <= w_BTN1;

     if(w_BTN1 == 1'b0 && r_BTN1 == 1'b1 && r_COUNT < 9)
     begin
         r_COUNT <= r_COUNT + 1;
     end
     else if(w_BTN1 == 1'b0 && r_BTN1 == 1'b1 && r_COUNT == 9)
     begin
          r_COUNT <= 0;
     end
end

     nibble_to_seven_seg nibble0(
		.nibblein(r_COUNT),
		.segout(w_disp0)
	);	 
	 
	clkdiv displayClockGen(
		.clk(CLK),
		.clkout(displayClock)
	);

	seven_seg_mux display(
		.clk(displayClock),
		.disp0(w_disp0),
		.disp1(w_disp1),
		.segout(seg),
		.disp_sel(ca)
	);

endmodule