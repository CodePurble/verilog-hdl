`timescale 10ns / 10ns

module dff_posedge(d, clk, q, qbar);
    input d, clk;
    output reg q, qbar;

    always @(posedge clk)
    begin
        q = d;
        qbar = ~d;
    end
endmodule

module mod6Counter();
    reg [3:1] dIn;
    reg clock;
    wire [3:1] qOut, qOutBar;

    dff_posedge d3(dIn[3], clock, qOut[3], qOutBar[3]);
    dff_posedge d2(dIn[2], clock, qOut[2], qOutBar[2]);
    dff_posedge d1(dIn[1], clock, qOut[1], qOutBar[1]);

    always(posedge clock)
    begin
        dIn[3] = (qOut[3] & qOutBar[2]) | (qOutBar[3] & qOut[2] & qOut[1]);
        dIn[2] = (qOut[1] & qOutBar[2]) | (qOutBar[3] & qOut[2] & qOutBar[1]);
        dIn[1] = qOutBar[1] & (qOutBar[2] | qOutBar[3]);
    end
    initial
    begin
        $dumpfile("mod6Counter.vcd");
        $dumpvars(0, mod6Counter);
    end
    

    initial
    begin
        clock = 1'b0;
        repeat(50)
            begin
                clock = ~clock;
                #10;
            end
    end

    initial
    begin
        $monitor("dIn = %b, clock = %b, qOut = %b", dIn, clock, qOut);
    end
endmodule
