library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity full_adder_test is 
end full_adder_test;

architecture test_full_adder of full_adder_test is 
    component full_adder
        PORT (
            x, y, cin  : IN  std_logic;
            sum, cout  : OUT std_logic
        );
   end component;
signal x,y,cin,sum,cout :std_logic;
signal expected_sum, expected_cout :std_logic ;
begin 
    f0: full_adder port map (x=>x,y=>y,cin=>cin,sum=>sum,cout=>cout);
    process
    begin 
      for i in 0 to 7 loop 
             if (i mod 2) = 0 then
            x <= '1';
        else
            x <= '0';
        end if;

        if (i mod 4) = 0 then
            y <= '1';
        else
            y <= '0';
        end if;

        if (i mod 8) = 0 then
            cin <= '1';
        else
            cin <= '0';
        end if;

        expected_sum<= (x xor y) xor cin ;
        expected_cout<= (x and y )or( x and cin) or (y and cin) ;
        wait for 10 ns ;
        

        assert sum =expected_sum 
         report "There is an error: x = " & std_logic'image(x) & 
                   ", y = " & std_logic'image(y) & 
                   ", cin = " & std_logic'image(cin) & 
                   ", output sum = " & std_logic'image(sum) & 
                   ", expected sum = " & std_logic'image(expected_sum)
            SEVERITY ERROR;

            assert cout = expected_cout
            report "There is an error: x = " & std_logic'image(x) & 
                   ", y = " & std_logic'image(y) & 
                   ", cin = " & std_logic'image(cin) & 
                   ", output cout = " & std_logic'image(cout) & 
                   ", expected cout = " & std_logic'image(expected_cout)
            SEVERITY ERROR;

 
      end loop;
      wait ;
    end process;
end  test_full_adder;
