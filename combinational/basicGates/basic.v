`timescale 10ns / 1ns

module basic(a1, a2, y1, y2, y3, y4, y5, y6, y7);
    input a1, a2;
    output y1, y2, y3, y4, y5, y6, y7;

    assign y1 = ~a1;
    assign y2 = a1 & a2;
    assign y3 = ~(a1 & a2);
    assign y4 = a1 | a2;
    assign y5 = ~(a1 | a2);
    assign y6 = a1 ^ a2;
    assign y7 = ~(a1 ^ a2);
endmodule

module basic_testbench;
    reg a1, a2;
    wire y1, y2, y3, y4, y5, y6, y7;

    basic obj(a1, a2, y1, y2, y3, y4, y5, y6, y7);

    initial
    begin
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
