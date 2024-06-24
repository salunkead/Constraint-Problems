//Q. write a code to generate 64 bit random data having lower 48 bits between 888888888888 to ffffffffffff if upper 16 bits are between 0000 to 8887 
//and 48 bit between 0 to 888888888887 if upper 16 bits are from 8888 to ffff
//1.with randomization and constraint 
//2.without rand or randc

///Solution
class test;
  bit[63:0]num;
  function void post_randomize;
    $display("%h",num);
  endfunction
  
  constraint c1{
    if(num[15:0] inside{[16'h0000:16'h8887]}){
      num[47:0] inside{[48'h888888888888:48'hffffffffffff]};
    }
      
    if(num[15:0] inside{[16'h8888:16'hffff]}){
        num[47:0] inside{[48'h0:48'h888888888887]};
      }
  }
endclass

module top;
  test t;
  initial
    begin
      t=new;
      repeat(1)
        t.randomize(num);
    end
endmodule
