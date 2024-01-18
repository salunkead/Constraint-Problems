//constraint for fibonacci series
class test;
  rand int num;
  int ref1[2]='{0,1};
  int count;
  function void post_randomize;
    $display("num=%0d",num);
    count++;
    if(count>2)
      begin
        if(count%2!=0)
          begin
            ref1[0]=num;
          end
        else
          begin
            ref1[1]=num;
          end
      end
  endfunction
  
  constraint c1{
    if(count==0)
    {
      num==ref1[0];
    }
   else if(count==1)
   {
     num==ref1[1];
   }
   else
   {
     num==ref1[1]+ref1[0];
   }
  }
endclass
     
module top;
  test t;
  initial
    begin
      t=new;
      repeat(20)t.randomize;
    end
endmodule
