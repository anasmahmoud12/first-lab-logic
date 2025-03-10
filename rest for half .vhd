library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--use work.all;

entity test_half is 
end test_half ;








  architecture t_test_half_adder of test_half is 
            component half_adder
            port (
                x:in std_logic ;
                y:in std_logic ;
                sum,cout:out std_logic 
            );
        end component;
        signal x,y,sum,cout:std_logic ;
        begin
            f0: half_adder port map(x=>x,y=>y,sum=>sum,cout=>cout);
            process
            begin

               x<='0'; y<='0' ; wait for 10 ns ;
               assert sum = '0'  report  " test fail in a=0  , b=0 ";

               x<='0'; y<='1' ; wait for 10 ns ;
              assert sum = '1' report  " test fail in a=0  , b=1";
                
               x<='1'; y<='0' ; wait for 10 ns ;
               assert sum = '1' report  " test fail in a=1  , b=0 ";
                
               x<='1'; y<='1' ; wait for 10 ns ;
               assert sum = '0'  report  " test fail in a=1  , b=1 ";
                
wait ;
            end process;
 end  t_test_half_adder;
