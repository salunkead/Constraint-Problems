//Q. constraint for a variable
//1.on every 2nd randomization the value should be reverse of the previous value
//2.otherwise the value ranges from 500 to 10,000

//Solution
class test;
  rand int n;
  int rev,c=0;
  function void reverse(int n);
    if(n inside{[500:999]})
      rev=(n%10)*100+((n/10)%10)*10+((n/100)%10);
    if(n inside{[1000:9999]})
      rev=(n%10)*1000+((n/10)%10)*100+((n/100)%10)*10+((n/1000)%10);
  endfunction
  
  function void post_randomize;
    $display("randomization no: %0d -> value : %d",c+1,n);
    if(c%2==0)
      reverse(n);
    else
      $display("--------------------------------------------------");
    c++;
  endfunction
  
  constraint c1{
    if(c%2==0){
      n inside{[500:10000]};
      if(n inside{[500:999]}){
        n%10>=5;
      }
    }else{
      n==rev;
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
