`timescale 1ns/1ps
module testbench();

parameter N=8;

reg [N-1:0] A, B;
reg Cin;
wire Cout;
wire [N-1:0] Sum;
reg [N:0] expected;

RCA dut_instance (A, B, Cin, Sum, Cout);

integer i;
initial begin
	for (i=0;i<2**(2*N+1);i=i+1)
		begin
			{Cin, B, A} = i;
			
			expected = A + B + Cin;
			
			#10;
			
			if({Cout, Sum} !== expected)
				begin
					$display("Wrong addition of %d, %d and %d is %d, expected value is %d", A, B, Cin, {Cout, Sum}, expected);
					$stop;
				end
		end
end




endmodule
