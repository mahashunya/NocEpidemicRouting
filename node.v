module node (
    input wire clk,
    input wire rstn,
    input wire i_ready_l,
    input wire i_ready_r,
    input wire i_ready_t,
    input wire i_ready_b,
    input wire i_valid_l,
    input wire i_valid_r,
    input wire i_valid_t,
    input wire i_valid_b,
    output reg o_ready_l,
    output reg o_ready_r,
    output reg o_ready_t,
    output reg o_ready_b,
    output reg o_valid_l,
    output reg o_valid_r,
    output reg o_valid_t,
    output reg o_valid_b,
    input wire [7:0] i_data_l,
    input wire [7:0] i_data_r,
    input wire [7:0] i_data_t,
    input wire [7:0] i_data_b,
    output reg [7:0] o_data_l,
    output reg [7:0] o_data_r,
    output reg [7:0] o_data_t,
    output reg [7:0] o_data_b
);
    
endmodule