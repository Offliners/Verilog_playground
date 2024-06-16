`define CYCLE_TIME 10

module PATTERN(
    // Input ports
    clk,
    rst_n,
    D,
    // Output ports
    Q
);

output reg clk;
output reg rst_n;
output reg D;

input Q;

real CYCLE = `CYCLE_TIME;
always #(CYCLE / 2.0) clk = ~clk;

initial begin
    rst_n = 1'b1;
    force clk = 1'b0;
    reset_task;

    repeat(100) begin
        input_data;
        $display("D = %d, Q = %d, rst_n = %d", D, Q, rst_n);
        if(clk == 1 && rst_n == 1 && Q != D) display_fail;
        if(rst_n == 0 && Q != 0)             display_fail;
    end

    display_pass;
    $finish;
end

task reset_task; begin
    #(0.5) rst_n = 0;
	#(3)   rst_n = 1;
    #(3)   release clk;
end endtask

task input_data; begin
    D = $random; rst_n = $random;
    #10;
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
        //$finish;
end endtask

endmodule