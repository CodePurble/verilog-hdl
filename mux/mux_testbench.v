`include "mux.v"

module mux_testbench;
    reg a, b, c, d, s0, s1, s2;
    wire y;



    initial
    begin
        $monitor("a = %b, b = %b, c = %b, d = %b\ns1 = %b, s0 = %b\ny = %b\n\n", a, b, c, d, s1, s0, y);
        $dumpfile("mux.vcd");
        $dumpvars(0, mux_testbench);

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