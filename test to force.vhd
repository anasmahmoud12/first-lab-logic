library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use ieee.NUMERIC_STD.SIGNED;

entity test_ribble12 is 
end test_ribble12;

architecture ar_test_ribble12 of test_ribble12 is 
    component ribble_adder
    port(
    x,y:in std_logic_vector(3 downto 0);
    cin :in std_logic ;
    sum:out std_logic_vector (3 downto 0);
    cout:out std_logic );
end component;
signal x,y,sum:std_logic_vector(3 downto 0);
signal cin, cout : std_logic ;


signal asum,absy,absx,ay,ax,acout ,acin,expected_sum:integer;
signal aax:std_logic_vector(3 downto 0);



 
begin
    f0: entity work.ribble_adder port map(x=>x,y=>y,cin=>cin,sum=>sum,cout=>cout);
    process
    begin



if acin=1 then
              cin<='1'; else
              cin<='0';
           end if ;
          
         
           x<=std_logic_vector(to_signed(ax, 4));
           y<=std_logic_vector(to_signed(ay, 4));
         
           wait for 10 ns ; 
 expected_sum<=ax+ay+acin;
      --     exsum<=std_logic_vector(to_unsigned(expected_sum, 4));
         --  assert sum= std_logic_vector(to_signed(expected_sum, 4)) report "there is a problem in x = "&integer'image(ax)&" y= "&integer'image(ay)&" cin = "&integer'image(acin);


            if (sum(3)='1' and y(3)='0' and x(3)='0') or (sum(3)='0' and y(3)='1' and x(3)='1')  then
            report "OVER FLOW  OVER FLOW OVER FLOW OVER FLOW and the pervous result not correct";
            end if ;
            report " the sum is  "&integer'image(  to_integer(signed(sum)));
          --   report " the sum is  "&integer'image (expected_sum);

          


 wait ;

end process;
end  ar_test_ribble12;
