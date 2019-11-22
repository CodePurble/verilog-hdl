`timescale 10ns / 10ns

module Dff_posedge(D, clk, q, qbar);
    input D, clk;
    output reg q, qbar;

    initial
    begin
        q = 0;
        qbar = 1;
    end

    always @(posedge clk)
	begin
        q = D;
        qbar = ~D;
    end
endmodule


module fourBitRipple(
    input clock,
    output [3:0] count
);
    wire q0, q1, q2, q3, qb0, qb1, qb3, qb4;

    Dff_posedge d3(.clk(clock), .q(q3), .qbar(qb3), .D(qb3));
    Dff_posedge d2(.clk(q3), .q(q2), .qbar(qb2), .D(qb2));
    Dff_posedge d1(.clk(q2), .q(q1), .qbar(qb1), .D(qb1));
    Dff_posedge d0(.clk(q1), .q(q0), .qbar(qb0), .D(qb0));

    assign count = {qb0, qb1, qb2, qb3};
endmodule

module fourBitRipple_tb;
    reg clk;
    wire [3:0] out;

    fourBitRipple uut(.clock(clk), .count(out));

    initial
    begin
        clk = 1;
        $monitor("clk = %b, count = %b\n", clk, out);
        $dumpfile("fourBitRipple.vcd");
        $dumpvars(0, fourBitRipple_tb);
        repeat(50)
            begin
                clk = ~clk;
                #10;
            end
    end
endmodule