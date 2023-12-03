module s_ram #(parameter da=32,ad=4,sd=16)(input logic [da-1:0]data,input logic [ad-1:0]addr1,addr2,
input logic clk ,rst,rd,wr,en,output logic [da-1:0]d_out);
logic [da-1:0]ram[sd-1:0];

always_ff@(posedge clk)
begin
if(en)begin
  if(rst)
     begin
      for(int i=0;i<16;i++)
        begin
          ram[i]<=32'd0;
         end 
        d_out<=8'd0;
      end
   else begin
     
     case({rd,wr})
      2'b00:begin
         end
      2'b01:begin
       ram[addr1]<=data;
       end
      2'b10:begin
       d_out<=ram[addr2];
       end 
     2'b11:begin
     d_out<=ram[addr2];
     ram[addr1]<=data;
     end
    endcase
 end  
 end   
 end 
endmodule
