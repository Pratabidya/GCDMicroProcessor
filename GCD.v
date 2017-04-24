`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:34:15 04/23/2017 
// Design Name: 
// Module Name:    GCD 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module GCD(clk,meow);
reg x;
reg c;
reg e;
output reg meow;
input clk;
reg clk2;
reg [3:0]a;
reg [3:0]b;
reg [7 : 0]addra;
reg [7:0]mem;
reg wea;
reg [3:0]ad1;
reg [3:0]ad2;
reg [3:0]dina;
wire [3:0]dout;
reg [3:0]douta;

reg z;
reg hlt;
//reg [2:0]counter;
reg [1:0]wa;
reg [1:0]bwa;
reg [1:0]bra;
reg [2:0]jmp;
memory sharat (
  .clka(clk), // input clka
  .wea(wea), // input [0 : 0] wea
  .addra(addra), // input [7 : 0] addra
  .dina(dina), // input [3 : 0] dina
  .douta(dout) // output [3 : 0] douta
);


initial
begin
hlt=0;
ad1=0;
ad2=0;
clk2=0;
z=0;
c=0;
a=0;
b=0;
e=0;
x=0;

//counter=0;
bwa=0;
bra=0;
jmp=0;
wa=0;
addra=8'd0;
mem=8'd0;
dina=4'd0;
end

always@(posedge clk)
begin

clk2=~clk2;
meow=clk2;
end

always@(posedge clk2)
begin
douta=dout;
wea=0;
if(hlt==0)
begin
if(wa!=0)
case(wa)
2'd1: begin a=douta; e=1; end 
2'd2: begin b=douta; e=1; end
2'd3: begin b=douta; wa=0; end
endcase
if(bwa!=0)
case(bwa)
2'd1: begin wea=1; dina=a; bwa=2'd2;  end
2'd2: begin addra=mem; e=1; end
endcase
if(bra!=0)
case(bra)
2'd1: begin a=douta; bra=2'd2;  end
2'd2: begin addra=mem;   e=1; end
endcase
if(jmp!=0)
case(jmp)
3'd1: begin ad2=douta; jmp=3'd2; x=1; end
3'd2: begin ad1=douta; jmp=3'd3; end
3'd3: begin addra={ad1,ad2}-1; e=1; end
endcase

if(wa==0 && bwa==0 && bra==0 && jmp==0 && e==0 && x==0)
begin
case(dout)
 4'd0: begin a=b; addra=addra+1; end
 4'd1: begin b=a; addra=addra+1; end
 4'd2: begin a=a+b; if(a==0) z=1; else z=0; addra=addra+1; end
 4'd3: begin b=a+b; addra=addra+1; end
 4'd4: begin a=a-b; if(a==0) z=1; else z=0;  addra=addra+1; end
 4'd5: begin b=b-a; addra=addra+1; end
 4'd6: begin wa=2'd1; addra=addra+1; end
 4'd7: begin wa=2'd2; addra=addra+1; end
 4'd8: begin bwa=2'd1; mem=addra; addra=8'd254; end
 4'd9: begin bra=2'd1; mem=addra; addra=8'd253; end
 4'd10: begin z=0; if(a==b) z=1; if(b>a) c=1; else c=0; addra=addra+1;   end
 4'd11: begin jmp=3'd1; addra=addra+4; end
 4'd12: begin if(z==1) begin jmp=3'd1; addra=addra+4; end else addra=addra+6;  end 
 4'd13: begin if(c==1) begin jmp=3'd1; addra=addra+4; end else addra=addra+6;  end
 4'd14: begin a=a; b=b; addra=addra+1; end
 4'd15: hlt=1;
 default: ;
endcase 
end
if(e==1 || x==1)
begin
wa=0;
bwa=0;
bra=0;
if(x==0)
jmp=0;
addra=addra+1;
e=0;
x=0;
end

end
end

endmodule
