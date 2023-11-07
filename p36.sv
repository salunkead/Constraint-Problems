///constraint to generate pattern 122333444455555666666777777788888888999999999.....
class test;
  rand bit[7:0]num;
  int i=1,count=1;
  function void post_randomize;
    $write("%0d",i);
    count--;
    if(count==0)
      begin
        i++;
        count=i;
      end
  endfunction
  constraint c{num==i;}
endclass
module top;
  test t;
  initial
    begin
      t=new;
      repeat(200)t.randomize;
      $display();
    end
endmodule
