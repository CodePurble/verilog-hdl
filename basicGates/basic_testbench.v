`include "basic.v"

module basic_testbench;
    reg a1, a2;
    wire y1, y2, y3, y4, y5, y6, y7;

    basic obj(a1, a2, y1, y2, y3, y4, y5, y6, y7);

    initial
    begin
        // $monitor("a1 = %b, a2 = %b", a1, a2);
        $monitor("a1 = %b, a2 = %b\ny1 = %b, y2 = %b, y3 = %b, y4 = %b, y5 = %b, y6 = %b, y7 = %b\n", a1, a2, y1, y2, y3, y4, y5, y6, y7);
        $dumpfile("basic.vcd");
        $dumpvars(0, basic_testbench);

	    assign a1 = 0;
	    assign a2 = 0;
	    #20;

	    assign a1 = 0;
	    assign a2 = 1;
	    #20;

	    assign a1 = 1;
	    assign a2 = 0;
	    #20;

	    assign a1 = 1;
	    assign a2 = 1;
	    #20;
    end

endmodule // basic_testbench