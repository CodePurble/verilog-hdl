`timescale 10ns / 1ns

module fourToOneMux(a, b, c, d, s0, s1, y);
    input a, b, c, d, s0, s1;
    output y;

    assign y = (~s1 & ~s0 & a) | (~s1 & s0 & b) | (s1 & ~s0 & c) | (s1 & s0 & d);
endmodule

module fourToOneMux_testbench;
    reg a, b, c, d, s0, s1;
    wire y;

    fourToOneMux object(a, b, c, d, s0, s1, y);

    initial
    begin
        $monitor("a = %b, b = %b, c = %b, d = %b\ns1 = %b, s0 = %b\ny = %b\n\n", a, b, c, d, s1, s0, y);
        $dumpfile("fourToOneMux.vcd");
        $dumpvars(0, fourToOneMux_testbench);

        assign a = 0;
        assign b = 1;
        assign c = 0;
        assign d = 1;

	    assign s1 = 0;
	    assign s0 = 0;
	    #20;

	    assign s1 = 0;
	    assign s0 = 1;
	    #20;

	    assign s1 = 1;
	    assign s0 = 0;
	    #20;

	    assign s1 = 1;
	    assign s0 = 1;
	    #20;

        $finish;
    end
endmodule
