/* Half Adder */
module MUX_4x1 #(parameter WIDTH=32)(
    // Input signals
    in0,
    in1,
    in2,
    in3,
    // Output signals
    select,
    out
);

input [WIDTH-1:0] in0, in1, in2, in3;
input [1:0] select;

output reg [WIDTH-1:0] out;

always @(*) begin
    case(select)
        2'd0 : out = in0;
        2'd1 : out = in1; 
        2'd2 : out = in2; 
        2'd3 : out = in3; 
        default: out = 0;
    endcase
end
    
endmodule