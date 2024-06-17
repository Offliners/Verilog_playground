`define CYCLE_TIME 10.0

module PATTERN(
    // Input ports
    a,
    b,
    cin,
    // Output ports
    sum,
    carry
);

output reg a;
output reg b;
output reg cin;

input sum;
input carry;

reg golden_sum;
reg golden_carry;

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
        $display("a = %d, b = %d, cin = %d, carry = %d, sum = %d", a, b, cin, carry, sum);
        if(golden_carry !== carry || golden_sum !== sum) begin
            $display("(carry, sum) should be : (%d, %d), your answer is : (%d, %d)", golden_carry, golden_sum, carry, sum);
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
    a   = $random; 
    b   = $random;
    cin = $random;
    {golden_carry, golden_sum} = a + b + cin;
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