entity test_ribble is 
end test_ribble;

architecture ar_test_ribble of test_ribble is 
    component ribble_adder
    port(
    x,y:in bit_vector(3 downto 0);
    cin :in bit ;
    sum:out bit_vector (3 downto 0);
    cout:out bit );
end component;

signal x:bit_vector (3 downto 0); 
signal y:bit_vector (3 downto 0);
signal cin :bit;
signal sum :bit_vector(3 downto 0);
signal cout:bit;

begin
    f0: ribble_adder port map(x=>x,y=>y,cin=>cin,sum=>sum,cout=>cout);
    process
    begin
        for i in  0 to 511 loop 
        cin<=bit'val (i mod 2);
        x(0)<=bit'val((i/2) mod 2);
        x(1)<=bit'val((i/4) mod 2);
        x(2)<=bit'val((i/8) mod 2);
        x(3)<=bit'val((i/16) mod 2);
        y(0)<=bit'val((i/32) mod 2);
        y(1)<=bit'val((i/64) mod 2);
        y(2)<=bit'val((i/128) mod 2);
        y(3)<=bit'val((i/256) mod 2);

        wait for 10 ns ; 
    end loop;
    wait ;
end process;
end  ar_test_ribble;
