library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  -- Needed for arithmetic operations



entity test_ribble is 
end test_ribble;

architecture ar_test_ribble of test_ribble is 
    component ribble_adder
    port(
    x,y:in std_logic_vector(3 downto 0);
    cin :in std_logic ;
    sum:out std_logic_vector (3 downto 0);
    cout:out std_logic );
end component;
signal x,y:std_logic_vector(3 downto 0);
signal cin : std_logic ;
signal sum: std_logic_vector (3 downto 0);
signal cout: std_logic ;

signal expected_sum:integer;
 signal acin:integer ;
 signal acout:integer ;
 signal  ax:integer ;
 signal ay:integer ;
 

 
begin
    f0: entity work.ribble_adder port map(x=>x,y=>y,cin=>cin,sum=>sum,cout=>cout);
    process
    begin


for ax in -8 to 7 loop
  for ay in -8 to 7 loop
        for acin in 0 to 1 loop
           if acin=1 then
              cin<='1'; else
              cin<='0';
           end if ;
          
         
           x<=std_logic_vector(to_signed(ax, 4));
           y<=std_logic_vector(to_signed(ay, 4));
         
           wait for 10 ns ; 
           
            --expected_sum<=ax+ay+acin;
           
          -- assert sum= exsum report "there is a problem in x = "&integer'image(ax)&" y= "&integer'image(ay)&" cin = "&integer'image(acin);
              report " the sum is  "&integer'image(  to_integer(signed(sum)));

           if    (sum(3)='1' and y(3)='0' and x(3)='0') or (sum(3)='0' and y(3)='1' and x(3)='1')   then
             report "OVER FLOW  OVER FLOW OVER FLOW OVER FLOW the result not correct ";
             end if ;

        end loop;

  end loop;
end loop;


    wait ;

end process;
end  ar_test_ribble;
