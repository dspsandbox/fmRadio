----------------------------------------------------------------------------------
-- Company: Pau Gomez
-- Engineer: 
-- 
-- Create Date: 12.04.2020 17:13:58
-- Design Name: 
-- Module Name: axisConfig - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity axisConfig is
    Generic( PORT_WIDTH: integer := 32);
    Port ( clk : in STD_LOGIC;
           resetn : in STD_LOGIC;
           counterMax : in STD_LOGIC_VECTOR (31 downto 0);
           S_AXIS_tdata : in STD_LOGIC_VECTOR ((PORT_WIDTH - 1) downto 0);
           S_AXIS_tvalid : in STD_LOGIC;
           S_AXIS_tready : out STD_LOGIC;
           M_AXIS_tdata : out STD_LOGIC_VECTOR ((PORT_WIDTH - 1) downto 0);
           M_AXIS_tvalid : out STD_LOGIC;
           M_AXIS_tready : in STD_LOGIC);
           
end axisConfig;

architecture Behavioral of axisConfig is
signal counter : UNSIGNED (31 downto 0) := (others => '0'); 
signal axisEnable0 : STD_LOGIC := '0';
signal axisEnable1 : STD_LOGIC := '0';


begin
    process(clk)
    begin
        if rising_edge(clk) then
            if resetn='0' then
                counter <= (others => '0');
                axisEnable0 <= '0';
                axisEnable1 <= '0';
            else
                axisEnable1 <= axisEnable0;
                
                if counter < UNSIGNED(counterMax) then
                    counter <= counter + 1;
                    axisEnable0 <= '0';
                else   
                    counter <= (others => '0'); 
                    axisEnable0 <= '1';
                end if;
                
            end if; 
        end if;
    end process;
    
    S_AXIS_tready <= M_AXIS_tready and axisEnable1;
    M_AXIS_tvalid <= S_AXIS_tvalid and axisEnable1;
    M_AXIS_tdata <= S_AXIS_tdata;
end Behavioral;
