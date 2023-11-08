//two time write to the unique address and after that read to the same address
//Ex- wr=1 and addr=249
//    wr=1 and addr=192
//    wr=0 and addr=249
//    wr=0 and addr=192
//    wr=1 and addr=43
//    wr=1 and addr=50 so on..
class test;
  randc bit[7:0]addr;
  rand bit wr;
  int i,j,q[$];
  bit wr_ref;
 function void pre_randomize;
    if(i%4==0)
      begin
        j=i+1;
        addr.rand_mode(1);
      end
    else if(i==j)
      addr.rand_mode(1);
    else
      addr.rand_mode(0);
  endfunction
  function void post_randomize;
    if(wr==1)
      q.push_back(addr);
    else
      addr=q.pop_front;
    $display("wr=%b and addr=%0d",wr,addr);
    i++;
    wr_ref=wr;
  endfunction
  constraint c{
    if(i>0 && i%2==0){
      wr==~wr_ref;
    }else{
      wr==wr_ref;
    }
  }   
endclass

module top;
  test t;
  initial
    begin
      t=new;
      repeat(20)
        begin
          if(t.i==0)
            begin
              t.c.constraint_mode(0);
              t.wr=1;
              t.randomize;
            end
          else
            begin
              t.c.constraint_mode(1);
              t.randomize;
            end
        end
    end
endmodule
