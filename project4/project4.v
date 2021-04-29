module top (
    input CLK,
    input BTN1,
    output LED1
);

reg r_LED1 = 1'b0;
reg r_BTN1 = 1'b0;
wire w_BTN1;

debounce_filter debounce_inst
(.CLK(CLK),
 .i_BTN(BTN1),
 .o_BTN(w_BTN1));

 always @(posedge CLK) begin
     r_BTN1 <= w_BTN1;

     if(w_BTN1 == 1'b0 && r_BTN1 == 1'b1)
     begin
         r_LED1 <= ~r_LED1;
     end
 end

 assign LED1 = r_LED1;
    
endmodule