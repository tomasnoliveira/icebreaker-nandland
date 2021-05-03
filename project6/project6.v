module top
    (input CLK,
    output reg LED5,
    output reg LED2,
    output reg LED3,
    output reg LED4);

    reg [31:0] r_count_10Hz = 0;
    reg [31:0] r_count_5Hz  = 0;
    reg [31:0] r_count_2Hz  = 0;
    reg [31:0] r_count_1Hz  = 0;

    always @(posedge CLK) begin
        if (r_count_10Hz == 1200000)
        begin
            LED5      <= ~LED5;
            r_count_10Hz <= 0;
        end
        else
            r_count_10Hz <= r_count_10Hz + 1;
    end

    always @(posedge CLK) begin
        if (r_count_5Hz == 2400000)
        begin
            LED2     <= ~LED2;
            r_count_5Hz <= 0;
        end
        else
            r_count_5Hz <= r_count_5Hz + 1;
    end

    always @(posedge CLK) begin
        if (r_count_2Hz == 6000000)
        begin
            LED3     <= ~LED3;
            r_count_2Hz <= 0;
        end
        else
            r_count_2Hz <= r_count_2Hz + 1;
    end

    always @(posedge CLK) begin
        if (r_count_1Hz == 12000000)
        begin
            LED4     <= ~LED4;
            r_count_1Hz <= 0;
        end
        else
            r_count_1Hz <= r_count_1Hz + 1;
    end

endmodule