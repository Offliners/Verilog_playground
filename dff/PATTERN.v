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
        if(!(rst_n == 0 && Q == 0)) display_fail;
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
    #5;
end endtask

initial begin
    $monitor("D = %d, Q = %d, rst_n = %d", D, Q, rst_n);
end

task display_pass; begin
        $display("        ----------------------------               ");
        $display("        --                        --       |\__||  ");
        $display("        --  Congratulations !!    --      / O.O  | ");
        $display("        --                        --    /_____   | ");
        $display("        --  \033[0;32mSimulation PASS!!\033[m     --   /^ ^ ^ \\  |");
        $display("        --                        --  |^ ^ ^ ^ |w| ");
        $display("        ----------------------------   \\m___m__|_|");
end endtask

task display_fail; begin
        $display("        ----------------------------               ");
        $display("        --                        --       |\__||  ");
        $display("        --  OOPS!!                --      / X,X  | ");
        $display("        --                        --    /_____   | ");
        $display("        --  \033[0;31mSimulation FAIL!!\033[m   --   /^ ^ ^ \\  |");
        $display("        --                        --  |^ ^ ^ ^ |w| ");
        $display("        ----------------------------   \\m___m__|_|");
end endtask

endmodule