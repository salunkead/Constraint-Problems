//Q.24 write a constraint to randomly generate unique prime numbers in an array between 1 and 200.the genrated prime number should have 7 in it

class test;
  int t,q[$];
  randc int num;
  function void numbers;
    for(int i=3;i<=200;i++)
        begin
          for(int j=2;j<i;j++)
            begin
              if(i%j==0)
                break;
              else if(j==i-1)
                begin
                  t=i/10;
                  if(i%10==7 || t%10==7)
                    q.push_back(i);
                end
            end
        end
  endfunction
  function void post_randomize;
    $display(num);
  endfunction
  constraint c{num inside{q};}
endclass

module top;
  test t;
  initial
    begin
      t=new;
      t.numbers;
      repeat(10)t.randomize;     
    end
endmodule
