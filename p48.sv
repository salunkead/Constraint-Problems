//write constraint such that there should be 12 number of 1's non-consecutively
class test;
  bit [31:0]num;
  rand int arr[12];
  constraint c{
    foreach(arr[i]){
      arr[i] inside{[0:31]};
  }
  }
  constraint c1{foreach(arr[i]){
        arr[i]%2==0;
      }}
  constraint c2{unique{arr};}
          
           function void result;
                num=32'd0;
                for(int i=0;i<$size(arr);i++)
                  begin
                    num[arr[i]]=1;
                  end
                $displayb(num);
           endfunction
endclass
module top;
  test t;
  initial
    begin
      t=new;
      repeat(5)
        begin
          t.randomize;
          t.result;
        end
    end
endmodule
