`timescale 10ns / 1ns

module mod6Counter(
    input clk,
    output reg [3:1] qOut
);
    reg d3, d2, d1;

    initial
    begin
       qOut = 0;
       d3 = 0;
       d2 = 0;
       d1 = 0;
    end

    always @(posedge clk)
        begin
            qOut[3] = d3;
            qOut[2] = d2;
            qOut[1] = d1;

            d3 = (qOut[3] & ~qOut[2]) | (~qOut[3] & qOut[2] & qOut[1]);
            d2 = (qOut[1] & ~qOut[2]) | (~qOut[3] & qOut[2] & ~qOut[1]);
            d1 = ~qOut[1] & (~qOut[2] | ~qOut[3]);
        end
endmodule

module mod6Counter_tb;

    // reg d3, d2, d1;
    reg clk;
    wire [3:1] q;

    mod6Counter uut(.clk(clk), .qOut(q));

    initial
    begin
        clk = 1;
        $dumpfile("mod6Counter.vcd");
        $dumpvars(0, mod6Counter_tb);
        $monitor("count = %b\n", q);

        repeat(50)
        begin
            clk = ~clk;
            #10;
        end
    end
endmodule


