module bcdToGray(
    input [3:0] b,
    output [3:0] g
    );

    assign g[3] = b[3];
    assign g[2] = b[3] ^ b[2];
    assign g[1] = b[2] ^ b[1];
    assign g[0] = b[1] ^ b[0];
endmodule

module bcdToGray_tb;
    reg [3:0] b;
    wire [3:0] g;

    bcdToGray uut(b, g);

    initial
    begin
        $monitor("b = %b, g = %b", b, g);
        $dumpfile("bcdToGray.vcd");
        $dumpvars(0, bcdToGray_tb);

        assign b = 1;
        #10;

        assign b = 5;
        #10;

        assign b = 9;
        #10;

        $finish;
    end
endmodule