`define CYCLE_TIME 10.0

module PATTERN #(parameter WIDTH=32)(
    // Input ports
    a,
    b,
    // Output ports
    out_small,
    out_big
);

output reg [WIDTH-1:0] a, b;

input [WIDTH-1:0] out_small, out_big;
reg [WIDTH-1:0] golden_out_small, golden_out_big;

integer PATNUM = 100;
integer i;
integer seed = 0;
reg clk;
real CYCLE = `CYCLE_TIME;
always #(CYCLE/2.0) clk = ~clk;

initial begin
    i = $random(seed);
    force clk = 1'b0;
    reset_task;

    repeat(PATNUM) begin
        input_data;
        $display("a = %d, b = %d, out_small = %d, out_big = %d", a, b, out_small, out_big);
        if(golden_out_big !== out_big || golden_out_small !== out_small) begin
            $display("(out_small, out_big) should be : (%d, %d), your answer is : (%d, %d)", golden_out_small, golden_out_big, out_small, out_big);
            display_fail;
        end
    end

    display_pass;
    $finish;
end

task reset_task; begin
    #(3)   release clk;
end endtask

task input_data; begin
    a = $random;
    b = $random; 

    if(a > b) begin
        golden_out_big = a;
        golden_out_small = b;
    end
    else begin
        golden_out_big = b;
        golden_out_small = a;
    end
    #1;
end endtask

task display_pass; begin
        $display("\033[0;32m        ----------------------------               \033[m");
        $display("\033[0;32m        --                        --       |\__||  \033[m");
        $display("\033[0;32m        --  Congratulations !!    --      / O.O  | \033[m");
        $display("\033[0;32m        --                        --    /_____   | \033[m");
        $display("\033[0;32m        --  Simulation PASS!!     --   /^ ^ ^ \\  |\033[m");
        $display("\033[0;32m        --                        --  |^ ^ ^ ^ |w| \033[m");
        $display("\033[0;32m        ----------------------------   \\m___m__|_|\033[m");
end endtask

task display_fail; begin
        $display("\033[0;31m        ----------------------------               \033[m");
        $display("\033[0;31m        --                        --       |\__||  \033[m");
        $display("\033[0;31m        --  OOPS!!                --      / X,X  | \033[m");
        $display("\033[0;31m        --                        --    /_____   | \033[m");
        $display("\033[0;31m        --  Simulation FAIL!!     --   /^ ^ ^ \\  |\033[m");
        $display("\033[0;31m        --                        --  |^ ^ ^ ^ |w| \033[m");
        $display("\033[0;31m        ----------------------------   \\m___m__|_|\033[m");
        $finish;
end endtask

endmodule