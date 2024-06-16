`define CYCLE_TIME 10.0

module PATTERN #(parameter WIDTH=32)(
    // Input ports
    bin_in,
    // Output ports
    gray_out
);

output reg [WIDTH-1:0] bin_in;

input [WIDTH-1:0] gray_out;

reg [WIDTH-1:0] golden_gray;

integer PATNUM = 10000;
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
        $display("binary = %b, gray code = %b", bin_in, gray_out);
        if(golden_gray != gray_out) begin
            $display("gray code should be : %b, your answer is : %b", gray_out, golden_gray);
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
    bin_in   = $random;
    golden_gray[WIDTH-1:0] = bin_in[WIDTH-1:0] ^ (bin_in[WIDTH-1:0] >> 1);
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