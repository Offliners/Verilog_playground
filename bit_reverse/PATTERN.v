`define CYCLE_TIME 10

module PATTERN #(parameter WIDTH=32)(
    // Input ports
    in,
    // Output ports
    out
);

output reg [WIDTH-1:0] in;

integer PATNUM = 1000;
integer i;
integer seed = 0;

reg [WIDTH-1:0] goledn_out;

input [WIDTH-1:0] out;

reg clk;
real CYCLE = `CYCLE_TIME;
always #(CYCLE / 2.0) clk = ~clk;

initial begin
    i = $random(seed);
    force clk = 1'b0;
    reset_task;

    repeat(PATNUM) begin
        input_data;
        $display("in = %b, out = %b", in, out);
        if(goledn_out !== out) display_fail;
    end

    display_pass;
    $finish;
end

task reset_task; begin
    #(3)   release clk;
end endtask

task input_data; begin
    in = $random;

    for(i = 0; i < WIDTH; i += 1) begin
        goledn_out[i] = in[WIDTH-1-i];
    end
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