module debounce_filter (
    input CLK,
    input i_BTN,
    output o_BTN
);

parameter c_DEBOUNCE_LIMIT = 120000;

reg [17:0] r_Count = 0;
reg r_State = 1'b0;

always @(posedge CLK) begin
    if (i_BTN !== r_State && r_Count < c_DEBOUNCE_LIMIT)
        r_Count <= r_Count + 1;

    else if (r_Count == c_DEBOUNCE_LIMIT)
    begin
        r_State <= i_BTN;
        r_Count <= 0;
    end

    else
        r_Count <= 0;
end

assign o_BTN = r_State;
    
endmodule