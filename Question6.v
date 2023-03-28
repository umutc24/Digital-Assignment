module mooreFSM(i_clk, i_reset, i_packet, o_signal);
	input i_clk, i_reset, i_packet;
	output o_signal;
  
  
  parameter idle = 3'b000;
  parameter A = 3'b001;
  parameter B = 3'b010;
  parameter C = 3'b011;
  parameter D = 3'b100;
  parameter E = 3'b101;
  parameter F = 3'b110;
  
  
  reg [2:0] state = idle;
  
  always @ (posedge i_clk or posedge i_reset) begin
    if(i_reset)
	   state <=idle;
	 else 
	   case(state)
		   idle : if(i_packet == 1) state <= A;
			       else state <= idle;
			A : if(i_packet == 1) state <= B;
			    else state <= idle;
			B : if(i_packet == 1) state <= C;
			    else state <= E;
			C : if(i_packet == 1) state <= C;
			    else state <= D;
			D : if(i_packet == 1) state <= B;
			    else state <= idle; //also output high
			E : if(i_packet == 1) state <= F;
			    else state <= idle;
			F : if(i_packet == 1) state <= B;
			    else state <= idle;	//also output high as well
		endcase
    end
	 
    assign o_signal = (state == D || state == F)? 1:0;
	 
endmodule
  
  
  
  	