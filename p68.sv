//Q.write a constraint for an array,where each element in an array should be unique and even val should be generated at even index,along with that,the sum of an array should be <1000

//Solution
class top;
  rand bit[7:0] a[];
  constraint c1{a.size==10;}
  constraint c2{unique{a};}
  constraint c3{
    foreach (a[i]){
    if(i%2==0)
      a[i]%2==0;
    }
  }
  
  constraint c5{
    foreach(a[i]){
      a[i] inside {[1:2000]};
    }
  }
      constraint c4{a.sum(x) with (int'(x))<1000;}
endclass

module  test;
   top t;
  initial begin
    t=new();
    assert(t.randomize);
    $display("elements are %p",t.a);
  end
endmodule
