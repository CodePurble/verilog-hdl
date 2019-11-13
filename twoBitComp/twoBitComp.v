module twoBitComp(
    input [1:0] a,
    input [1:0] b,
    output greater, less, equal
);

    assign greater = (a[0] & ~b[1] & ~b[0]) | (a[1] & a[0] & ~b[0]) | (a[1] & ~b[1]);

    assign less = (~a[1] & b[1]) | (a[1] & a[0] & b[0]) | (~a[0] & b[1] & b[0]);

    assign equal = (a[0] & b[0] & a[1] & b[1]) | (~a[0] & ~b[0] & a[1] & b[1]) |
                    (~a[0] & ~b[0] & ~a[1] & ~b[1])| (a[0] & b[0] & ~a[1] & ~b[1]);

endmodule

module twoBitComp_tb;
    reg [1:0] a;
    reg [1:0] b;
    wire greater, less, equal;

    twoBitComp uut(a, b, greater, less, equal);

    initial
    begin
        $dumpfile("twoBitComp.vcd");
        $dumpvars(0, twoBitComp_tb);
        $monitor("a = %b, b = %b, greater = %b, less = %b, equal = %b", a, b, greater, less, equal);

        a = 1;
        b = 2;
        #10;

        a = 4;
        b = 4;
        #10;

        a = 3;
        b = 0;
        #10;

        $finish;
    end
endmodule

