always @* begin
    if (A == B) begin
        EQ = 1;
        GT = 0;
        LT = 0;
    end else if (A > B) begin
        EQ = 0;
        GT = 1;
        LT = 0;
    end else begin
        EQ = 0;
        GT = 0;
        LT = 1;
    end
end

endmodule
