/* Half Adder */
module HA (
    // Input signals
    a,
    b,
    // Output signals
    sum,
    carry
);

input a;
input b;

output sum;
output carry;

assign sum = a ^ b;
assign carry = a & b;
    
endmodule