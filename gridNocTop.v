module gridNocTop #(parameter X=4,Y=4) (
    input wire clk,
    input wire rstn,
);

wire i_ready_l[X-1:0][Y-1:0];
wire i_ready_r[X-1:0][Y-1:0];
wire i_ready_t[X-1:0][Y-1:0];
wire i_ready_b[X-1:0][Y-1:0];
wire o_ready_l[X-1:0][Y-1:0];
wire o_ready_r[X-1:0][Y-1:0];
wire o_ready_t[X-1:0][Y-1:0];
wire o_ready_b[X-1:0][Y-1:0];
wire i_valid_l[X-1:0][Y-1:0];
wire i_valid_r[X-1:0][Y-1:0];
wire i_valid_t[X-1:0][Y-1:0];
wire i_valid_b[X-1:0][Y-1:0];
wire o_valid_l[X-1:0][Y-1:0];
wire o_valid_r[X-1:0][Y-1:0];
wire o_valid_t[X-1:0][Y-1:0];
wire o_valid_b[X-1:0][Y-1:0];
wire [7:0] i_data_l[X-1:0][Y-1:0];
wire [7:0] i_data_r[X-1:0][Y-1:0];
wire [7:0] i_data_t[X-1:0][Y-1:0];
wire [7:0] i_data_b[X-1:0][Y-1:0];
wire [7:0] o_data_l[X-1:0][Y-1:0];
wire [7:0] o_data_r[X-1:0][Y-1:0];
wire [7:0] o_data_t[X-1:0][Y-1:0];
wire [7:0] o_data_b[X-1:0][Y-1:0];


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
               .i_ready_r(o_ready_l[x+1][y]),
               .i_ready_t(o_ready_b[x][y+1]),
               .i_ready_b(1'b0),
               .i_valid_l(1'b0),
               .i_valid_r(o_valid_l[x+1][y]),
               .i_valid_t(o_valid_b[x][y+1]),
               .i_valid_b(1'b0),
               .o_ready_l(1'b0),
               .o_ready_r(i_ready_l[x+1][y]),
               .o_ready_t(i_ready_b[x][y+1]),
               .o_ready_b(1'b0),
               .o_valid_l(1'b0),
               .o_valid_r(i_valid_l[x+1][y]),
               .o_valid_t(i_valid_b[x][y+1]),
               .o_valid_b(1'b0),
               .i_data_l(8'b00000000),
               .i_data_r(o_data_l[x+1][y]),
               .i_data_t(o_data_b[x][y+1]),
               .i_data_b(8'b00000000),
               .o_data_l(8'b00000000),
               .o_data_r(i_data_l[x+1][y]),
               .o_data_t(i_data_b[x][y+1]),
               .o_data_b(8'b00000000),
          );
      end

      else if(x==X-1 & y==Y-1) 
      begin
          node n_instance(
               .clk(clk), 
               .rstn(rstn),
               .i_ready_l(o_ready_r[x-1][y]),
               .i_ready_r(1'b0),
               .i_ready_t(1'b0),
               .i_ready_b(o_ready_t[x][y-1]),
               .i_valid_l(o_valid_r[x-1][y]),
               .i_valid_r(1'b0),
               .i_valid_t(1'b0),
               .i_valid_b(o_valid_t[x][y-1]),
               .o_ready_l(i_ready_r[x-1][y]),
               .o_ready_r(1'b0),
               .o_ready_t(1'b0),
               .o_ready_b(i_ready_t[x][y-1]),
               .o_valid_l(i_valid_r[x-1][y]),
               .o_valid_r(1'b0),
               .o_valid_t(1'b0),
               .o_valid_b(i_valid_t[x][y-1]),
               .i_data_l(o_data_r[x-1][y]),
               .i_data_r(8'b00000000),
               .i_data_t(8'b00000000),
               .i_data_b(o_data_t[x][y-1]),
               .o_data_l(i_data_r[x-1][y]),
               .o_data_r(8'b00000000),
               .o_data_t(8'b00000000),
               .o_data_b(i_data_t[x][y-1]),
      end

      else if(x!=0 & x!=X-1 & y==0)
      begin
           node n_instance(
               .clk(clk), 
               .rstn(rstn),
               .i_ready_l(o_ready_r[x-1][y]),
               .i_ready_r(o_ready_l[x+1][y]),
               .i_ready_t(o_ready_b[x][y+1]),
               .i_ready_b(1'b0),
               .i_valid_l(o_valid_r[x-1][y]),
               .i_valid_r(o_valid_l[x+1][y]),
               .i_valid_t(o_valid_b[x][y+1]),
               .i_valid_b(1'b0),
               .o_ready_l(i_ready_r[x-1][y]),
               .o_ready_r(i_ready_l[x+1][y]),
               .o_ready_t(i_ready_b[x][y+1]),
               .o_ready_b(1'b0),
               .o_valid_l(i_valid_r[x-1][y]),
               .o_valid_r(i_valid_l[x+1][y]),
               .o_valid_t(i_valid_b[x][y+1]),
               .o_valid_b(1'b0),
               .i_data_l(o_data_r[x-1][y]),
               .i_data_r(o_data_l[x+1][y]),
               .i_data_t(o_data_b[x][y+1]),
               .i_data_b(8'b00000000),
               .o_data_l(i_data_r[x-1][y]),
               .o_data_r(i_data_l[x+1][y]),
               .o_data_t(i_data_b[x][y+1]),
               .o_data_b(8'b00000000),
          );
      end

      else if(x==0 & y!=0 & y!=Y-1)
      begin
           node n_instance(
               .clk(clk), 
               .rstn(rstn),
               .i_ready_l(1'b0),
               .i_ready_r(o_ready_l[x+1][y]),
               .i_ready_t(o_ready_b[x][y+1]),
               .i_ready_b(o_ready_t[x][y-1]),
               .i_valid_l(1'b0),
               .i_valid_r(o_valid_l[x+1][y]),
               .i_valid_t(o_valid_b[x][y+1]),
               .i_valid_b(o_valid_t[x][y-1]),
               .o_ready_l(1'b0),
               .o_ready_r(i_ready_l[x+1][y]),
               .o_ready_t(i_ready_b[x][y+1]),
               .o_ready_b(i_ready_t[x][y-1]),
               .o_valid_l(1'b0),
               .o_valid_r(i_valid_l[x+1][y]),
               .o_valid_t(i_valid_b[x][y+1]),
               .o_valid_b(i_valid_t[x][y-1]),
               .i_data_l(8'b00000000),
               .i_data_r(o_data_l[x+1][y]),
               .i_data_t(o_data_b[x][y+1]),
               .i_data_b(o_data_t[x][y-1]),
               .o_data_l(8'b00000000),
               .o_data_r(i_data_l[x+1][y]),
               .o_data_t(i_data_b[x][y+1]),
               .o_data_b(i_data_t[x][y-1]),
          );
      end

      else if(x!=0 & x!=X-1 & y==Y-1)
      begin
           node n_instance(
               .clk(clk), 
               .rstn(rstn),
               .i_ready_l(o_ready_r[x-1][y]),
               .i_ready_r(o_ready_l[x+1][y]),
               .i_ready_t(1'b0),
               .i_ready_b(o_ready_t[x][y-1]),
               .i_valid_l(o_valid_r[x-1][y]),
               .i_valid_r(o_valid_l[x+1][y]),
               .i_valid_t(1'b0),
               .i_valid_b(o_valid_t[x][y-1]),
               .o_ready_l(i_ready_r[x-1][y]),
               .o_ready_r(i_ready_l[x+1][y]),
               .o_ready_t(1'b0),
               .o_ready_b(i_ready_t[x][y-1]),
               .o_valid_l(i_valid_r[x-1][y]),
               .o_valid_r(i_valid_l[x+1][y]),
               .o_valid_t(1'b0),
               .o_valid_b(i_valid_t[x][y-1]),
               .i_data_l(o_data_r[x-1][y]),
               .i_data_r(o_data_l[x+1][y]),
               .i_data_t(8'b00000000),
               .i_data_b(o_data_t[x][y-1]),
               .o_data_l(i_data_o[x-1][y]),
               .o_data_r(i_data_l[x+1][y]),
               .o_data_t(8'b00000000),
               .o_data_b(i_data_t[x][y-1]),
          );
      end

      else if(x==X-1 & y!=0 & y!=Y-1)
      begin
           node n_instance(
               .clk(clk), 
               .rstn(rstn),
               .i_ready_l(o_ready_r[x-1][y]),
               .i_ready_r(1'b0),
               .i_ready_t(o_ready_b[x][y+1]),
               .i_ready_b(o_ready_t[x][y-1]),
               .i_valid_l(o_valid_r[x-1][y]),
               .i_valid_r(1'b0),
               .i_valid_t(o_valid_b[x][y+1]),
               .i_valid_b(o_valid_t[x][y-1]),
               .o_ready_l(i_ready_r[x-1][y]),
               .o_ready_r(1'b0),
               .o_ready_t(i_ready_b[x][y+1]),
               .o_ready_b(i_ready_t[x][y-1]),
               .o_valid_l(i_valid_r[x-1][y]),
               .o_valid_r(1'b0),
               .o_valid_t(i_valid_b[x][y+1]),
               .o_valid_b(i_valid_t[x][y-1]),
               .i_data_l(o_data_r[x-1][y]),
               .i_data_r(8'b00000000),
               .i_data_t(o_data_b[x][y+1]),
               .i_data_b(o_data_t[x][y-1]),
               .o_data_l(i_data_r[x-1][y]),
               .o_data_r(8'b00000000),
               .o_data_t(i_data_b[x][y+1]),
               .o_data_b(i_data_t[x][y-1]),
          );
      end
      
      else
      begin
           node n_instance(
               .clk(clk), 
               .rstn(rstn),
               .i_ready_l(o_ready_r[x-1][y]),
               .i_ready_r(o_ready_l[x+1][y]),
               .i_ready_t(o_ready_b[x][y+1]),
               .i_ready_b(o_ready_t[x][y-1]),
               .i_valid_l(o_valid_r[x-1][y]),
               .i_valid_r(o_valid_l[x+1][y]),
               .i_valid_t(o_valid_b[x][y+1]),
               .i_valid_b(o_valid_t[x][y-1]),
               .o_ready_l(i_ready_r[x-1][y]),
               .o_ready_r(i_ready_l[x+1][y]),
               .o_ready_t(i_ready_b[x][y+1]),
               .o_ready_b(i_ready_t[x][y-1]),
               .o_valid_l(i_valid_r[x-1][y]),
               .o_valid_r(i_valid_l[x+1][y]),
               .o_valid_t(i_valid_b[x][y+1]),
               .o_valid_b(i_valid_t[x][y-1]),
               .i_data_l(o_data_r[x-1][y]),
               .i_data_r(o_data_l[x+1][y]),
               .i_data_t(o_data_b[x][y+1]),
               .i_data_b(o_data_t[x][y-1]),
               .o_data_l(i_data_r[x-1][y]),
               .o_data_r(i_data_l[x+1][y]),
               .o_data_t(i_data_b[x][y+1]),
               .o_data_b(i_data_t[x][y-1]),
          ); 
      end
     end
    end   
endgenerate
endmodule