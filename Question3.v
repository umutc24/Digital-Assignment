module halfAdder4(i_w,i_x,o_c,o_s);
  input [3:0] i_w;
  input [3:0] i_x;
  output [3:0] o_c;
  output [3:0] o_s;
  
  assign o_s = i_w ^ i_x; //sum i_w XOR i_x
  
  assign o_c = i_w & i_x; //carry i_w AND i_x
  
   
endmodule