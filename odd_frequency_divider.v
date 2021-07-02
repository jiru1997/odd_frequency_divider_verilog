module odd_div
#(parameter div = 4)
( input clk,
  input restn,
  output clk_div);

reg[3:0] cnt;
reg clk_test;

always@(posedge clk or negedge restn) begin
  if(!restn) begin
     cnt <= 4'b0;
  end
  else if(cnt == div) begin
     cnt <= 4'b0;
  end
  else begin
     cnt <= cnt + 1;
  end
end

reg clk1;
always@(posedge clk or negedge restn) begin
  if(!restn) begin
     clk1 <= 1'b0;
  end
  else if(cnt == div / 2 + 2) begin
     clk1 <= 1'b0;
  end
  else if(cnt == 4'b1) begin
     clk1 <= 1'b1;
  end
end

reg clk2;
always@(negedge clk or negedge restn) begin
  if(!restn) begin
     clk2 <= 1'b0;
  end
  else if(cnt == div / 2 + 2) begin
     clk2 <= 1'b0;
  end
  else if(cnt == 4'b1) begin
     clk2 <= 1'b1;
  end
end

assign clk_div = clk1 & clk2;

endmodule