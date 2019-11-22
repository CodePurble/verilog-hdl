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

module Dff_tb;
    reg  d, clk;
    wire q, qbar;

    Dff_posedge uut(.D(d), .clk(clk), .q(q), .qbar(qbar));

    initial
    begin
        $dumpfile("Dff_posedge.vcd");
        $dumpvars(0, Dff_tb);
        d = 1'b1;
        #10;

        d = 1'b0;
        #10;

        d = 1'b0;
        #10;

        d = 1'b1;
        #20;
        $finish;
    end

    initial
    begin
        clk = 1'b0;
        repeat(50)
            begin
                clk = ~clk;
                #10;
            end
    end

    initial
    begin
        $monitor("D = %b, clk = %b, q = %b", d, clk, q);
    end
endmodule
