`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:   ---none----
// Engineer:  Teekam chand khandelwal
// 
// Create Date:    17:19:27 05/09/2021 
// Design Name:   uart_tx.v
// Module Name:    ede 
// Project Name: 
// Target Devices: sparten-3e
// Tool versions:  ise-14.7
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
// Code your design here
module urt_tx(input clk,rst,trig,input [7:0] data_to_send,output reg tx);
  parameter idle=0,start=1,st0=2,st1=3,st2=4,st3=5,st4=6,st5=7,st6=8,st7=9,stop=10;
  reg [3:0] p_state,n_state;
  reg  clk_9600=1;
  reg [12:0] count=0;
  
  always@(posedge clk) begin
    if((rst==1) ||(count==5208))begin
      count<=1;
		   clk_9600=~clk_9600; 
			end
    else begin
      count=count+1;
  
    end
  end
  
  always@(posedge clk_9600,rst) begin 
    
    if(rst==1) 
      p_state=idle;
    else 
      p_state=n_state;
  end
  
  
  always@(p_state,trig) begin
    case(p_state) 
      idle:begin
       // tx<=1;
        if(trig==1)
          n_state=start;
        else
          n_state=idle;
      end
      start: begin
        //tx<=0;
        n_state=st0;
      end
      st0: begin
        //tx<=data_to_send[0];
        n_state=st1;
      end
      st1: begin
        //tx<=data_to_send[1];
        n_state=st2;
      end
      st2: begin
        //tx<=data_to_send[2];
        n_state=st3;
      end
      st3: begin
        //tx<=data_to_send[3];
        n_state=st4;
      end
      st4: begin
        //tx<=data_to_send[4];
        n_state=st5;
      end
      st5: begin
        //tx<=data_to_send[5];
        n_state=st6;
      end
      st6: begin
       // tx<=data_to_send[6];
        n_state=st7;
      end
      st7: begin
        //tx<=data_to_send[7];
        n_state=stop;
      end
      stop: begin
        if(trig==0)
        n_state=idle;
        else
          n_state=start;
      end
		default :n_state=idle;
      
    endcase   
  end
always@(p_state) begin
case(p_state)
idle:tx<=1;
start:tx<=0;
st0:tx<=data_to_send[0];
st1:tx<=data_to_send[1];
st2:tx<=data_to_send[2];
st3:tx<=data_to_send[3];
st4:tx<=data_to_send[4];
st5:tx<=data_to_send[5];
st6:tx<=data_to_send[6];
st7:tx<=data_to_send[7];
stop:tx<=1;
default:tx<=1;
endcase
end
endmodule
