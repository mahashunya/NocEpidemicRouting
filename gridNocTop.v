`timescale 1ns/1ps

module gridNocTop #(parameter X=4,Y=4) (
    input wire clk,
    input wire rstn
);

wire ready_l[X-1:0][Y-1:0];
wire ready_r[X-1:0][Y-1:0];
wire ready_t[X-1:0][Y-1:0];
wire ready_b[X-1:0][Y-1:0];

wire valid_l[X-1:0][Y-1:0];
wire valid_r[X-1:0][Y-1:0];
wire valid_t[X-1:0][Y-1:0];
wire valid_b[X-1:0][Y-1:0];

wire [7:0] data_l[X-1:0][Y-1:0];
wire [7:0] data_r[X-1:0][Y-1:0];
wire [7:0] data_t[X-1:0][Y-1:0];
wire [7:0] data_b[X-1:0][Y-1:0];



generate 
    genvar x,y;
    for (x=0;x<X;x=x+1) begin:xs
     for (y=0;y<Y;y=y+1) begin:ys
      if(x==0 & y==0) 
      begin
          node n_instance(
               .clk(clk), 
               .rstn(rstn),
               .i_ready_l(1'b0),
               .i_ready_r(ready_l[x+1][y]),
               .i_ready_t(ready_b[x][y+1]),
               .i_ready_b(1'b0),
               .i_valid_l(1'b0),
               .i_valid_r(valid_l[x+1][y]),
               .i_valid_t(valid_b[x][y+1]),
               .i_valid_b(1'b0),
               .o_ready_l(),
               .o_ready_r(ready_l[x+1][y]),
               .o_ready_t(ready_b[x][y+1]),
               .o_ready_b(),
               .o_valid_l(),
               .o_valid_r(valid_l[x+1][y]),
               .o_valid_t(valid_b[x][y+1]),
               .o_valid_b(),
               .i_data_l(8'b00000000),
               .i_data_r(data_l[x+1][y]),
               .i_data_t(data_b[x][y+1]),
               .i_data_b(8'b00000000),
               .o_data_l(),
               .o_data_r(data_l[x+1][y]),
               .o_data_t(data_b[x][y+1]),
               .o_data_b()
          );
      end

      else if(x==X-1 & y==Y-1) 
      begin
          node n_instance(
               .clk(clk), 
               .rstn(rstn),
               .i_ready_l(ready_r[x-1][y]),
               .i_ready_r(1'b0),
               .i_ready_t(1'b0),
               .i_ready_b(ready_t[x][y-1]),
               .i_valid_l(valid_r[x-1][y]),
               .i_valid_r(1'b0),
               .i_valid_t(1'b0),
               .i_valid_b(valid_t[x][y-1]),
               .o_ready_l(ready_r[x-1][y]),
               .o_ready_r(),
               .o_ready_t(),
               .o_ready_b(ready_t[x][y-1]),
               .o_valid_l(valid_r[x-1][y]),
               .o_valid_r(),
               .o_valid_t(),
               .o_valid_b(valid_t[x][y-1]),
               .i_data_l(data_r[x-1][y]),
               .i_data_r(8'b00000000),
               .i_data_t(8'b00000000),
               .i_data_b(data_t[x][y-1]),
               .o_data_l(data_r[x-1][y]),
               .o_data_r(),
               .o_data_t(),
               .o_data_b(data_t[x][y-1])
               );
      end

      else if(x!=0 & x!=X-1 & y==0)
      begin
           node n_instance(
               .clk(clk), 
               .rstn(rstn),
               .i_ready_l(ready_r[x-1][y]),
               .i_ready_r(ready_l[x+1][y]),
               .i_ready_t(ready_b[x][y+1]),
               .i_ready_b(1'b0),
               .i_valid_l(valid_r[x-1][y]),
               .i_valid_r(valid_l[x+1][y]),
               .i_valid_t(valid_b[x][y+1]),
               .i_valid_b(1'b0),
               .o_ready_l(ready_r[x-1][y]),
               .o_ready_r(ready_l[x+1][y]),
               .o_ready_t(ready_b[x][y+1]),
               .o_ready_b(),
               .o_valid_l(valid_r[x-1][y]),
               .o_valid_r(valid_l[x+1][y]),
               .o_valid_t(valid_b[x][y+1]),
               .o_valid_b(),
               .i_data_l(data_r[x-1][y]),
               .i_data_r(data_l[x+1][y]),
               .i_data_t(data_b[x][y+1]),
               .i_data_b(8'b00000000),
               .o_data_l(data_r[x-1][y]),
               .o_data_r(data_l[x+1][y]),
               .o_data_t(data_b[x][y+1]),
               .o_data_b()
          );
      end

      else if(x==0 & y!=0 & y!=Y-1)
      begin
           node n_instance(
               .clk(clk), 
               .rstn(rstn),
               .i_ready_l(1'b0),
               .i_ready_r(ready_l[x+1][y]),
               .i_ready_t(ready_b[x][y+1]),
               .i_ready_b(ready_t[x][y-1]),
               .i_valid_l(1'b0),
               .i_valid_r(valid_l[x+1][y]),
               .i_valid_t(valid_b[x][y+1]),
               .i_valid_b(valid_t[x][y-1]),
               .o_ready_l(),
               .o_ready_r(ready_l[x+1][y]),
               .o_ready_t(ready_b[x][y+1]),
               .o_ready_b(ready_t[x][y-1]),
               .o_valid_l(),
               .o_valid_r(valid_l[x+1][y]),
               .o_valid_t(valid_b[x][y+1]),
               .o_valid_b(valid_t[x][y-1]),
               .i_data_l(8'b00000000),
               .i_data_r(data_l[x+1][y]),
               .i_data_t(data_b[x][y+1]),
               .i_data_b(data_t[x][y-1]),
               .o_data_l(),
               .o_data_r(data_l[x+1][y]),
               .o_data_t(data_b[x][y+1]),
               .o_data_b(data_t[x][y-1])
          );
      end

      else if(x!=0 & x!=X-1 & y==Y-1)
      begin
           node n_instance(
               .clk(clk), 
               .rstn(rstn),
               .i_ready_l(ready_r[x-1][y]),
               .i_ready_r(ready_l[x+1][y]),
               .i_ready_t(1'b0),
               .i_ready_b(ready_t[x][y-1]),
               .i_valid_l(valid_r[x-1][y]),
               .i_valid_r(valid_l[x+1][y]),
               .i_valid_t(1'b0),
               .i_valid_b(valid_t[x][y-1]),
               .o_ready_l(ready_r[x-1][y]),
               .o_ready_r(ready_l[x+1][y]),
               .o_ready_t(),
               .o_ready_b(ready_t[x][y-1]),
               .o_valid_l(valid_r[x-1][y]),
               .o_valid_r(valid_l[x+1][y]),
               .o_valid_t(),
               .o_valid_b(valid_t[x][y-1]),
               .i_data_l(data_r[x-1][y]),
               .i_data_r(data_l[x+1][y]),
               .i_data_t(8'b00000000),
               .i_data_b(data_t[x][y-1]),
               .o_data_l(data_r[x-1][y]),
               .o_data_r(data_l[x+1][y]),
               .o_data_t(),
               .o_data_b(data_t[x][y-1])
          );
      end

      else if(x==X-1 & y!=0 & y!=Y-1)
      begin
           node n_instance(
               .clk(clk), 
               .rstn(rstn),
               .i_ready_l(ready_r[x-1][y]),
               .i_ready_r(1'b0),
               .i_ready_t(ready_b[x][y+1]),
               .i_ready_b(ready_t[x][y-1]),
               .i_valid_l(valid_r[x-1][y]),
               .i_valid_r(1'b0),
               .i_valid_t(valid_b[x][y+1]),
               .i_valid_b(valid_t[x][y-1]),
               .o_ready_l(ready_r[x-1][y]),
               .o_ready_r(),
               .o_ready_t(ready_b[x][y+1]),
               .o_ready_b(ready_t[x][y-1]),
               .o_valid_l(valid_r[x-1][y]),
               .o_valid_r(),
               .o_valid_t(valid_b[x][y+1]),
               .o_valid_b(valid_t[x][y-1]),
               .i_data_l(data_r[x-1][y]),
               .i_data_r(8'b00000000),
               .i_data_t(data_b[x][y+1]),
               .i_data_b(data_t[x][y-1]),
               .o_data_l(data_r[x-1][y]),
               .o_data_r(),
               .o_data_t(data_b[x][y+1]),
               .o_data_b(data_t[x][y-1])
          );
      end
      
      else if(x==0 & y==Y-1)
      begin
          node n_instance(
               .clk(clk), 
               .rstn(rstn),
               .i_ready_l(1'b0),
               .i_ready_r(ready_l[x+1][y]),
               .i_ready_t(1'b0),
               .i_ready_b(ready_t[x][y-1]),
               .i_valid_l(1'b0),
               .i_valid_r(valid_l[x+1][y]),
               .i_valid_t(1'b0),
               .i_valid_b(valid_t[x][y-1]),
               .o_ready_l(),
               .o_ready_r(ready_l[x+1][y]),
               .o_ready_t(),
               .o_ready_b(ready_t[x][y-1]),
               .o_valid_l(),
               .o_valid_r(valid_l[x+1][y]),
               .o_valid_t(),
               .o_valid_b(valid_t[x][y-1]),
               .i_data_l(8'b00000000),
               .i_data_r(data_l[x+1][y]),
               .i_data_t(8'b00000000),
               .i_data_b(data_t[x][y-1]),
               .o_data_l(),
               .o_data_r(data_l[x+1][y]),
               .o_data_t(),
               .o_data_b(data_t[x][y-1])
          ); 
      end

      else if(x==X-1 & y==0)
      begin
          node n_instance(
               .clk(clk), 
               .rstn(rstn),
               .i_ready_l(ready_r[x-1][y]),
               .i_ready_r(1'b0),
               .i_ready_t(ready_b[x][y+1]),
               .i_ready_b(1'b0),
               .i_valid_l(valid_r[x-1][y]),
               .i_valid_r(1'b0),
               .i_valid_t(valid_b[x][y+1]),
               .i_valid_b(1'b0),
               .o_ready_l(ready_r[x-1][y]),
               .o_ready_r(),
               .o_ready_t(ready_b[x][y+1]),
               .o_ready_b(),
               .o_valid_l(valid_r[x-1][y]),
               .o_valid_r(),
               .o_valid_t(valid_b[x][y+1]),
               .o_valid_b(),
               .i_data_l(data_r[x-1][y]),
               .i_data_r(8'b00000000),
               .i_data_t(data_b[x][y+1]),
               .i_data_b(8'b00000000),
               .o_data_l(data_r[x-1][y]),
               .o_data_r(),
               .o_data_t(data_b[x][y+1]),
               .o_data_b()
          ); 
      end

      else
      begin
           node n_instance(
               .clk(clk), 
               .rstn(rstn),
               .i_ready_l(ready_r[x-1][y]),
               .i_ready_r(ready_l[x+1][y]),
               .i_ready_t(ready_b[x][y+1]),
               .i_ready_b(ready_t[x][y-1]),
               .i_valid_l(valid_r[x-1][y]),
               .i_valid_r(valid_l[x+1][y]),
               .i_valid_t(valid_b[x][y+1]),
               .i_valid_b(valid_t[x][y-1]),
               .o_ready_l(ready_r[x-1][y]),
               .o_ready_r(ready_l[x+1][y]),
               .o_ready_t(ready_b[x][y+1]),
               .o_ready_b(ready_t[x][y-1]),
               .o_valid_l(valid_r[x-1][y]),
               .o_valid_r(valid_l[x+1][y]),
               .o_valid_t(valid_b[x][y+1]),
               .o_valid_b(valid_t[x][y-1]),
               .i_data_l(data_r[x-1][y]),
               .i_data_r(data_l[x+1][y]),
               .i_data_t(data_b[x][y+1]),
               .i_data_b(data_t[x][y-1]),
               .o_data_l(data_r[x-1][y]),
               .o_data_r(data_l[x+1][y]),
               .o_data_t(data_b[x][y+1]),
               .o_data_b(data_t[x][y-1])
          ); 
      end
     end
    end   
endgenerate
endmodule