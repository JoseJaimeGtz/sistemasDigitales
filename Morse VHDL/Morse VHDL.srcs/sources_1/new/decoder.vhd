----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.04.2021 17:39:11
-- Design Name: 
-- Module Name: decoder - Behavioral
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


library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all; 

entity decoder is 
 port ( clkkey, clk, reset : in std_logic; 
   letterser : in std_logic; 
   letterpar : buffer std_logic_vector (6 downto 0); 
   getnextletter : buffer std_logic; 
   count : buffer std_logic_vector (4 downto 0); 
   sound, letterclk : buffer std_logic ); 
end decoder; 

architecture ltos of decoder is 
 signal let : std_logic_vector (6 downto 0); 

-- convert serial to parallel 
 component stop 
  port ( clk, reset : in std_logic; 
    sdata : in std_logic; 
    pdata : out std_logic_vector (6 downto 0) ); 
 end component; 

-- hold the letter in "memory" 
 component pdatahold 
  port (  clk, reset : in std_logic; 
    letterin : in std_logic_vector (6 downto 0); 
    letterout : out std_logic_vector (6 downto 0) ); 
 end component; 

-- find the correct letter 
 component letters 
  port (  clk, reset : in std_logic; 
    letter : in std_logic_vector (6 downto 0); 
    getnextletter : buffer std_logic; 
    count : out std_logic_vector (4 downto 0) ); 
 end component; 

-- sound out the morse code for the appropriate letter 
 component soundout 
  port (  clk, reset : in std_logic; 
    count : in std_logic_vector (4 downto 0); 
    sound, letterclk : out std_logic ); 
 end component; 

begin 
 serpar : stop port map (clkkey, reset, letterser, letterpar); 
 parhold : pdatahold port map (getnextletter, reset, letterpar, let); 
 decod : letters port map (letterclk, reset, let, getnextletter, count); 
 time : soundout port map (clk, reset, count, sound, letterclk); 
end ltos; 