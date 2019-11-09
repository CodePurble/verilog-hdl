`include "h_adder.v"

module h_adder_testbench;
    reg a, b;
    wire sum, carry;

    h_adder object(a, b, sum, carry);

    initial
	begin
	    $monitor("a=%b, b=%b, sum=%b, carry=%b", a, b, sum, carry);
	    $dumpfile("h_adder.vcd");
	    $dumpvars(0, h_adder_testbench);
	    assign a = 0;
	    assign b = 0;
	    #20;

	    assign a = 0;
	    assign b = 1;
	    #20;

	    assign a = 1;
	    assign b = 0;
	    #20;

	    assign a = 1;
	    assign b = 1;
	    #20;

	    $finish;
	end
endmodule
