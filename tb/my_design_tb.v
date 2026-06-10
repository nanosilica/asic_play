`timescale 1ns/1ps

module my_design_tb;

    // -------------------------
    // Parameters
    // -------------------------
    parameter CLK_PERIOD = 10; // ns

    // -------------------------
    // DUT signals
    // -------------------------
    reg  clk;
    reg  rst;
    reg  in;
    wire out;

    // -------------------------
    // DUT instantiation
    // -------------------------
    my_design dut (
        .clk (clk),
        .rst (rst),
        .in  (in),
        .out (out)
    );

    // -------------------------
    // Clock generation
    // -------------------------
    initial clk = 0;
    always #(CLK_PERIOD/2) clk = ~clk;

    // -------------------------
    // VCD dump
    // -------------------------
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, my_design_tb);
    end

    // -------------------------
    // Test stimulus
    // -------------------------
    integer failed = 0;

    task check;
        input expected_out;
        input [63:0] test_num;
        begin
            @(posedge clk); #1;
            if (out !== expected_out) begin
                $display("FAIL test %0d: out=%b expected=%b", test_num, out, expected_out);
                failed = failed + 1;
            end
        end
    endtask

    initial begin
        // Reset
        rst = 1;
        in  = 0;
        repeat(4) @(posedge clk);
        rst = 0;

        // TODO: add your test vectors here
        in = 1; check(1, 1);
        in = 0; check(0, 2);
        in = 1; check(1, 3);

        // Results
        if (failed == 0)
            $display("ALL TESTS PASSED");
        else
            $display("%0d TEST(S) FAILED", failed);

        $finish;
    end

endmodule
