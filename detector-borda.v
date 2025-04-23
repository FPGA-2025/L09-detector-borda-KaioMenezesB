module detector_borda (
    input clk,
    input rst,
    input [1:0] entrada,
    output [1:0] detector
);

    reg [1:0] prev;
    reg [1:0] detector_reg;

    assign detector = detector_reg;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            prev         <= 2'b00;
            detector_reg <= 2'b00;
            
        end else begin
            detector_reg <= entrada & ~prev;
            prev         <= entrada;
        end
    end

endmodule