//constraint to generate fibbonacci sequence
class t;
  rand int num;
  int i;
  int q[$];
  function void post_randomize;
    i++;
  endfunction
  constraint c{
    if(!i)
      num==i;
    else if(i==1)
      num==i;
    else
      num==q[i-2]+q[i-1];
  }
endclass
module test;
  t t1,t2;
  initial 
    begin
      t1=new();
      repeat(20)
        begin
          t1.randomize();
          t1.q.push_back(t1.num);
        end
      t2=new();
      $display("t1.q=%0p",t1.q);
      repeat(10)
        begin
          t2.randomize();
          t2.q.push_back(t2.num);
        end
      $display("t2.q=%0p",t2.q);
    end
endmodule
