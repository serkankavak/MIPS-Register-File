----------------------------------------------------------------------------------
-- Engineer: Serkan Kavak
-- Create Date: 02.04.2019 03:44:44
-- Module Name: Register_File - Behavioral
-- Description: MIPS Register File 32-bit 32 registers
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Register_File is
    Port ( clk :     in STD_LOGIC;
           RegA :    in STD_LOGIC_VECTOR (4 downto 0);
           RegB :    in STD_LOGIC_VECTOR (4 downto 0);
           Wr_A :    in STD_LOGIC_VECTOR (4 downto 0);
           Wr_en :   in STD_LOGIC;
           Wr_data : in STD_LOGIC_VECTOR (31 downto 0);
           OutA :    out STD_LOGIC_VECTOR (31 downto 0);
           OutB :    out STD_LOGIC_VECTOR (31 downto 0));
end Register_File;

architecture Behavioral of Register_File is

type reg_type is array (0 to 31) of std_logic_vector (31 downto 0);
signal reg: reg_type;

begin
OutA <= X"0000_0000" when RegA = "00000"
        else reg(to_integer(unsigned(RegA))) ;
OutB <= X"0000_0000" when RegB = "00000"
        else reg(to_integer(unsigned(RegB)));

process (clk)
begin
    if(clk'event and clk = '1') then
        if(Wr_en = '1') then
            reg(to_integer(unsigned(Wr_A))) <= Wr_data;
        end if;
    end if;
end process;


end Behavioral;
