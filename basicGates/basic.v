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
    