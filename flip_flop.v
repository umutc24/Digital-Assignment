module dFlipFlop_structural(i_D, i_clk, o_Q, o_Qbar);
  input i_D; // input D 
  input i_clk; // clock signal
  output o_Q, o_Qbar; // output Q
  wire w0,w1,w3, w4;... // 63 wires would be needed 
                    // to achieve 64 flipflops and one final output

nand(w0, i_D, w1);
nand(w1, w0, i_clk, w4);
nand(w3, w0, w4);
nand(w4, w3, i_clk);
nand(o_Q, w4, o_Qbar);
nand(o_Qbar, w1, o_Q);

