module myMux(a, b, c, d, s0, s1, s2, y);
    input a, b, c, d, s0, s1, s2;
    output y;
    
    assign y = (~s1 & ~s0 & a) | (~s1 & s0 & b) | (s1 & ~s0 & c) | (s1 & s0 & d);
endmodule