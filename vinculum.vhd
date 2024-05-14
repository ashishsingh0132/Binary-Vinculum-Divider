library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BinaryToVinculum is
    port(
        input : in std_logic_vector(3 downto 0);
        output : out std_logic_vector(3 downto 0)
    );
end BinaryToVinculum;

architecture Behavioral of BinaryToVinculum is
   signal temp : std_logic_vector(3 downto 0);
begin
    process(input)
 
    begin
        temp <= input;
        for i in 0 to temp'length-1 loop
            if temp(i) = '1' then
                temp(i) <= '1'; -- Complement the rightmost '1'
                for j in i+1 to temp'length-1 loop
                    if temp(j) = '0' then
                        temp(j) <= '1'; -- Increase the next '0' digit
                        exit;
                    else
                        temp(j) <= '0'; -- Complement '1' digits until '0' is encountered
                    end if;
                end loop;
                exit;
            end if;
        end loop;
        output <= temp;
    end process;
end Behavioral;
