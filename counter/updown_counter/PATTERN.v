`define CYCLE_TIME 10

module PATTERN #(parameter WIDTH=32)(
    // Input ports
    clk,
    rst_n,
    ctrl,
    // Output ports
    cnt
);

output reg clk;
output reg rst_n;
output reg ctrl;

integer PATNUM = 100;
integer i;
integer seed = 0;

input [WIDTH-1:0] cnt;

reg [WIDTH-1:0] golden_cnt;

real CYCLE = `CYCLE_TIME;
always #(CYCLE / 2.0) clk = ~clk;

initial begin
    i = $random(seed);
    rst_n = 1'b1;
    force clk = 1'b0;
    reset_task;

    repeat(PATNUM) begin
        input_data;
        $display("cnt = %d, golden_cnt = %d, ctrl = %d, rst_n = %d", cnt, golden_cnt, ctrl, rst_n);
        if(rst_n === 1 && cnt !== golden_cnt) display_fail;
        if(rst_n === 0 && cnt !== 0)          display_fail;
    end

    display_pass;
    $finish;
end

task reset_task; begin
    #(0.5) rst_n = 0;
	#(3)   rst_n = 1;
    #(3)   release clk;
           golden_cnt = 0;
end endtask

task input_data; begin
    rst_n = $random;
    ctrl  = $random;
    if(!rst_n)
        golden_cnt = 0;
    else if(ctrl)
        golden_cnt = golden_cnt + 1;
    else
        golden_cnt = golden_cnt - 1;
    #10;
end endtask

task display_pass; begin
        $display("\033[0;32m        ----------------------------               \033[m");
        $display("\033[0;32m        --                        --       |\\__|\\\033[m");
        $display("\033[0;32m        --  Congratulations !!    --      / O.O  | \033[m");
        $display("\033[0;32m        --                        --    /_____   | \033[m");
        $display("\033[0;32m        --  Simulation PASS!!     --   /^ ^ ^ \\  |\033[m");
        $display("\033[0;32m        --                        --  |^ ^ ^ ^ |w| \033[m");
        $display("\033[0;32m        ----------------------------   \\m___m__|_|\033[m");
end endtask

task display_fail; begin
        $display("\033[0;31m        ----------------------------               \033[m");
        $display("\033[0;31m        --                        --       |\\__|\\\033[m");
        $display("\033[0;31m        --  OOPS!!                --      / X,X  | \033[m");
        $display("\033[0;31m        --                        --    /_____   | \033[m");
        $display("\033[0;31m        --  Simulation FAIL!!     --   /^ ^ ^ \\  |\033[m");
        $display("\033[0;31m        --                        --  |^ ^ ^ ^ |w| \033[m");
        $display("\033[0;31m        ----------------------------   \\m___m__|_|\033[m");
        $finish;
end endtask

endmodule