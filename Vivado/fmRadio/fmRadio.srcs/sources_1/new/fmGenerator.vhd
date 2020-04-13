----------------------------------------------------------------------------------
-- Company: Pau Gomez
-- Engineer: 
-- 
-- Create Date: 12.04.2020 17:08:46
-- Design Name: 
-- Module Name: fmGenerator - Behavioral
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
library UNISIM;
use UNISIM.VComponents.all;

entity fmGenerator is
    Generic( PORT_WIDTH: integer := 32);
    Port ( clk : in STD_LOGIC;
           resetn : in STD_LOGIC;
           S_AXIS_tdata : in STD_LOGIC_VECTOR ((PORT_WIDTH - 1) downto 0);
           S_AXIS_tvalid : in STD_LOGIC;
           S_AXIS_tready : out STD_LOGIC;
           fmOut : out STD_LOGIC
           );
end fmGenerator;

architecture Behavioral of fmGenerator is
signal counter0 : UNSIGNED((PORT_WIDTH - 1) downto 0) := (others => '0');
signal counter1 : UNSIGNED((PORT_WIDTH - 1) downto 0) := (others => '0');
signal counterIncr : UNSIGNED((PORT_WIDTH - 1) downto 0) := (others => '0');

begin
    
    process(clk)
    begin
        if rising_edge(clk) then
            if resetn='0' then
                counter0 <= (others => '0'); 
                counter1 <= (others => '0'); 
                S_AXIS_tready <= '0';  
            else
                S_AXIS_tready <= '1';
                counter0 <= counter1 + counterIncr;  
                counter1 <= counter1 + counterIncr + counterIncr;
                if S_AXIS_tvalid = '1' then
                    counterIncr <= UNSIGNED(S_AXIS_tdata);
                end if;
            end if;
        end if;
    end process;
    
    ODDR_inst : ODDR
        generic map(
          DDR_CLK_EDGE => "SAME_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE" 
          INIT => '0',   -- Initial value for Q port ('1' or '0')
          SRTYPE => "SYNC") -- Reset Type ("ASYNC" or "SYNC")
        port map (
          Q => fmOut,   -- 1-bit DDR output
          C => clk,    -- 1-bit clock input
          CE => '1',  -- 1-bit clock enable input
          D1 => counter0(PORT_WIDTH -1),  -- 1-bit data input (positive edge)
          D2 => counter1(PORT_WIDTH -1),  -- 1-bit data input (negative edge)
          R => '0'    -- 1-bit reset input
        );
                
end Behavioral;
