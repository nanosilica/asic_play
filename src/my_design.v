module my_design (
    input  wire        clk,
    input  wire        rst,
    // TODO: add your ports here
    input  wire        in,
    output reg         out
);

    // TODO: implement your design here
    always @(posedge clk or posedge rst) begin
        if (rst)
            out <= 1'b0;
        else
            out <= in;
    end

endmodule
