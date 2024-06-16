`define CYCLE_TIME 10.0

module PATTERN #(parameter WIDTH=32)(
    // Input ports
    in0,
    in1,
    in2,
    in3,
    // Output ports
    select,
    out
);

output reg [WIDTH-1:0] in0, in1, in2, in3;
output reg [1:0] select;

input [WIDTH-1:0] out;
reg [WIDTH-1:0] golden_out;

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
        $display("in0 = %d, in1 = %d, in2 = %d, in3 = %d, select = %d, out = %d", in0, in1, in2, in3, select, out);
        if(golden_out != out) begin
            $display("out should be : %d, your answer is : %d", golden_out, out);
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
    in0 = $random;
    in1 = $random; 
    in2 = $random; 
    in3 = $random; 
    select = $random;

    if(select == 0)      golden_out = in0;
    else if(select == 1) golden_out = in1;
    else if(select == 2) golden_out = in2;
    else if(select == 3) golden_out = in3;
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