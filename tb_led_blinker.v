
`timescale 1ns/1ps

module tb_led_blinker;

    reg clk;
    reg reset;
    wire led;

    // DUT: Device Under Test
    // Use a small threshold for fast simulation
    led_blinker #(
        .THRESHOLD(4)
    ) dut (
        .clk(clk),
        .reset(reset),
        .led(led)
    );

    // Clock generation: 10 ns period
    initial begin
        clk = 0;
    end

    always #5 clk = ~clk;

    // Reset generation
    initial begin
        reset = 1;
        #20;
        reset = 0;
    end

    // Display signal values
    initial begin
        $monitor(
            "Time=%0t | reset=%b | clk=%b | led=%b | counter=%d",
            $time, reset, clk, led, dut.counter
        );
    end

    // Waveform generation
    initial begin
        $dumpfile("led_blinker.vcd");
        $dumpvars(0, tb_led_blinker);
    end

    // Reset verification
    initial begin
        #1;

        if (led === 1'bx)
            $display("PASS: LED starts unknown before first clock edge");
        else
            $display("INFO: LED already has a known value");

        // Check after the first rising edge and reset update
        #5;

        if (led == 1'b0 && dut.counter == 0)
            $display("PASS: Reset initialized LED and counter");
        else
            $display("FAIL: Reset did not initialize LED and counter");
    end

    // LED ON/OFF verification
    initial begin
        #66;

        if (led == 1'b1)
            $display("PASS: LED turned ON");
        else
            $display("FAIL: LED did not turn ON");

        #50;

        if (led == 1'b0)
            $display("PASS: LED turned OFF");
        else
            $display("FAIL: LED did not turn OFF");
    end

    // End simulation
    initial begin
        #140;
        $finish;
    end

endmodule
