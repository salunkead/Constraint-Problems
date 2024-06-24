//Q. write a code to generate 64 bit random data having lower 48 bits between 888888888888 to ffffffffffff if upper 16 bits are between 0000 to 8887 
//and 48 bit between 0 to 888888888887 if upper 16 bits are from 8888 to ffff
//1.with randomization and constraint 
//2.without rand or randc

///Solutionclass test1;
  rand int a,b;
  function void post_randomize;
    $display("a=%0d b=%0d",a,b);
  endfunction
  
  constraint a1{a inside {[1:20]};
                b==a*2;
                solve a before b;
               }
endclass

class test2;
  rand int a,b;
  function void post_randomize;
    $display("a=%0d b=%0d",a,b);
  endfunction
  
  constraint a1{a inside {[1:20]};
                b==a*2;
               }
endclass

module top;
  test1 t;
  test2 t1;
  initial
    begin
      t=new;
      t1=new;
      $display("with solve before............!");
      repeat(10)
      t.randomize;
      $display;
      $display("without solve before............!");
      repeat(10)t1.randomize;
    end
endmodule
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

    
/////code to validate given solution
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
      repeat(10)
        begin
          t.randomize(num) with {num[15:0]==16'h0000;};
          if(t.num[47:0] inside{[48'h888888888888:48'hffffffffffff]})
            begin
              $display("true");
            end
          else
            begin
              $display("false");
            end
        end
    end
endmodule
