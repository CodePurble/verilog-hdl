`timescale 10ns / 1ns

module DLatch(
    input D,
    input en,
    output Q
);

    assign Q = en ? D : Q;

endmodule

module DLatch_tb;

    reg D, en;
    wire Q;

    DLatch uut(.D(D), .en(en), .Q(Q));

    initial
    begin
        $monitor("en = %b, D = %b, Q = %b", en, D, Q);
        $dumpfile("DLatch.vcd");
        $dumpvars(0, DLatch_tb);

        assign D = 0;
        assign en = 1;
        #10;

        assign D = 1;
        assign en = 0;
        #10;

        assign D = 1;
        assign en = 1;
        #10;

        assign D = 0;
        assign en = 1;
        #10;
        $finish;
    end
endmodule

