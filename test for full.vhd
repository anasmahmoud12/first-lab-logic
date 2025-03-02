
entity full_adder_test is 
end full_adder_test;

architecture test_full_adder of full_adder_test is 
    component full_adder
        PORT (
            x, y, cin  : IN  BIT;
            sum, cout  : OUT BIT
        );
   end component;
signal x,y,cin,sum,cout :bit;
signal expected_sum, expected_cout :bit ;
begin 
    f0: full_adder port map (x=>x,y=>y,cin=>cin,sum=>sum,cout=>cout);
    process
    begin 
      for i in 0 to 7 loop 
        x<= bit'val(i mod 2);
        y<= bit'val(i/2 mod 2);
        cin<= bit'val(i/4 mod 2);
        expected_sum<= (x xor y) xor cin ;
        expected_cout<= (x and y )or( x and cin) or (y and cin) ;
        wait for 10 ns ;
        

        assert sum =expected_sum 
        report "there is error in values of x =  "& bit'image(x) &" y= "& bit'image(y)&" cin = "& bit'image(cin)
        & "the output is "& bit'image(sum)&"the expected_sum"& bit'image( expected_sum) SEVERITY ERROR;
       
  assert sum =expected_sum 
        report "there is error in values of x =  "& bit'image(x) &" y= "& bit'image(y)&" cin = "& bit'image(cin)
        & "the output is "& bit'image(sum)&"the expected_sum"& bit'image( expected_sum) SEVERITY ERROR;
       


 
      end loop;
      wait ;
    end process;
end  test_full_adder;

