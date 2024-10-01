//write a constraint such that array size should be greater than previous array size

//Soultion
class test;
  rand bit[7:0] arr[];
  int pre_size;
  bit update=0;
  function void post_randomize;
    $display("arr=%p \n size=%0d",arr,arr.size);
  endfunction
  
  constraint c1{
    if(update==0)
      arr.size==4;
    else
      arr.size()>pre_size;
    
  }
  constraint c2{
    arr.size() inside{[1:2000]};
  }
endclass

module top;
  test t;
  bit c=0;
  initial
    begin
      t=new;
      repeat(10)
        begin
          if(!c)
            begin
              t.update=0;
              c=1;
            end
          else
            begin
              t.update=1;
            end
          t.randomize;
          t.pre_size=t.arr.size;
          $display(t.arr.size);
        end
    end
endmodule
