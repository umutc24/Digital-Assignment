module comparatorTwo(i_A,i_B,o_GT,o_LT,o_EQ); //i_ Input signal o_ Output signal
  input [1:0]i_A; //input A as 2-bit number
  input [1:0] i_B; //input B as 2-bit number
  output o_GT,o_LT,o_EQ; //outputs greater than(GT), less than(LT), and equal to(EQ)

  // A>B condition generated from K-maps		
  assign o_GT = (~i_A[1] & i_A[0] & ~i_B[1] & ~i_B[0])ssc  |
                (i_A[1] & i_A[0] & i_B[1] & ~i_B[0]) |
					      (i_A[1]  & ~i_B[1] );
  // A=B condition generated from K-maps				 
  assign o_EQ = (i_A[1] & i_A[0] & i_B[1] & i_B[0]) |
                (i_A[1] & ~i_A[0] & i_B[1] & ~i_B[0]) |
					      (~i_A[1] & i_A[0] & ~i_B[1] & i_B[0]) |
					      (~i_A[1] & ~i_A[0] & ~i_B[1] & ~i_B[0]);
  // A<B condition. Didn't use K-maps, just used the remaining conditions				 
  assign o_LT = ~o_GT ? (o_EQ?o_GT:~o_GT):
                        (~o_GT); 
endmodule  