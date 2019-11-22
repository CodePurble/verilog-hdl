`timescale 10ns / 1ns

module jkff_posedge(
    input [1:0] jk,
    input clk,
    output reg q, qbar
);

    always @(posedge clk)
        begin
            case(jk)
                2'b00:
                    begin
                        q = q;
                        qbar = qbar;
                    end
                2'b01:
                    begin
                        q = 0;
                        qbar = 1;
                    end

                2'b10:
                    begin
                        q = 1;
                        qbar = 0;
                    end

                2'b11:
                    begin
                        q = ~q;
                        qbar = ~qbar;
                    end

                default:
                    begin
                        q = 0;
                        qbar = 0;
                    end
            endcase
        end
endmodule

module jkff_posedge_tb;

    reg [1:0] jk;
    reg clk;
    wire q, qbar;

    jkff_posedge uut(.jk(jk), .clk(clk), .q(q), .qbar(qbar));

    initial
    begin
        $dumpfile("jkff_posedge.vcd");
        $dumpvars(0, jkff_posedge_tb);

        jk = 2'b00;
        #10;

        jk = 2'b10;
        #30;

        jk = 2'b01;
        #20;

        jk = 2'b10;
        #30;

        jk = 2'b00;
        #30;

        jk = 2'b11;
        #10;
    end

    initial
    begin
        clk = 0;
        repeat(15)
            begin
                clk = ~clk;
                #10;
            end
    end

    initial
    $monitor("jk = %b, q = %b, qbar = %b\n", jk, q, qbar);
endmodule
