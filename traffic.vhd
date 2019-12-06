----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:40:19 12/01/2019 
-- Design Name: 
-- Module Name:    traffic - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
     use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity traffic is
port( clk: IN STD_LOGIC;
		rst: IN STD_LOGIC;
		hg11: OUT STD_LOGIC_VECTOR(2 downto 0);
		hg12: OUT STD_LOGIC_VECTOR(2 downto 0);
		hg21: OUT STD_LOGIC_VECTOR(2 downto 0);
		hg22: OUT STD_LOGIC_VECTOR(2 downto 0)
		);
		
end traffic;

architecture Behavioral of traffic is

signal counter: std_logic_vector(35 downto 0):= x"000000000";
--TYPE State_type IS (A, B, C, D);
--signal curr:State_type;
--signal nex:State_Type:=A;

TYPE State_Y IS (Y1,yd121,yd122, Y2, yd231,yd232,Y3,yd341,yd342, Y4,yd411,yd412);
signal currn :State_Y;
signal nexn: State_Y:=yd121;

begin

Process(clk)
begin
if (rising_edge(clk))
		then counter <= counter + 1;
			if ( counter = x"FFFFFFFFF")
			then counter <= x"000000000";
			end if;
	end if;
end process;



----doing for yellow----
process(counter(30), rst)
begin
if(rst='1')
then currn<=yd121;
elsif(rising_edge(counter(30)))
then currn<=nexn;
end if;
end process;

process(currn)
begin 
case currn is

when yd121=>
		nexn<=yd122;
		hg11(0)<='1';
		hg12(0)<='0';
		hg21(0)<='0';
		hg22(0)<='0';
		
		hg11(1)<='0';
		hg12(1)<='0';
		hg21(1)<='0';
		hg22(1)<='0';
		
		hg11(2)<='0';
		hg12(2)<='1';
		hg21(2)<='1';
		hg22(2)<='1';
when yd122=>
		nexn<=Y2;
		hg11(0)<='1';
		hg12(0)<='0';
		hg21(0)<='0';
		hg22(0)<='0';
		
		hg11(1)<='0';
		hg12(1)<='0';
		hg21(1)<='0';
		hg22(1)<='0';
		
		hg11(2)<='0';
		hg12(2)<='1';
		hg21(2)<='1';
		hg22(2)<='1';
		
when Y2=>
		nexn<=yd231;
		hg11(0)<='1';
		hg12(0)<='0';
		hg21(0)<='0';
		hg22(0)<='0';
		
		hg11(1)<='0';
		hg12(1)<='1';
		hg21(1)<='0';
		hg22(1)<='0';
		
		hg11(2)<='0';
		hg12(2)<='0';
		hg21(2)<='1';
		hg22(2)<='1';
		
when yd231=>
		nexn<=yd232;
		hg11(0)<='0';
		hg12(0)<='1';
		hg21(0)<='0';
		hg22(0)<='0';
		
		hg11(1)<='0';
		hg12(1)<='0';
		hg21(1)<='0';
		hg22(1)<='0';
		
		hg11(2)<='1';
		hg12(2)<='0';
		hg21(2)<='1';
		hg22(2)<='1';
		
when yd232=>
		nexn<=Y3;
		hg11(0)<='0';
		hg12(0)<='1';
		hg21(0)<='0';
		hg22(0)<='0';
		
		hg11(1)<='0';
		hg12(1)<='0';
		hg21(1)<='0';
		hg22(1)<='0';
		
		hg11(2)<='1';
		hg12(2)<='0';
		hg21(2)<='1';
		hg22(2)<='1';

when Y3=>
		nexn<=yd341;
		hg11(0)<='0';
		hg12(0)<='1';
		hg21(0)<='0';
		hg22(0)<='0';
		
		hg11(1)<='0';
		hg12(1)<='0';
		hg21(1)<='1';
		hg22(1)<='0';
		
		hg11(2)<='1';
		hg12(2)<='0';
		hg21(2)<='0';
		hg22(2)<='1';
when yd341=>
		nexn<=yd342;
		hg11(0)<='0';
		hg12(0)<='0';
		hg21(0)<='1';
		hg22(0)<='0';
		
		hg11(1)<='0';
		hg12(1)<='0';
		hg21(1)<='0';
		hg22(1)<='0';
		
		hg11(2)<='1';
		hg12(2)<='1';
		hg21(2)<='0';
		hg22(2)<='1';
		
when yd342=>
		nexn<=Y4;
		hg11(0)<='0';
		hg12(0)<='0';
		hg21(0)<='1';
		hg22(0)<='0';
		
		hg11(1)<='0';
		hg12(1)<='0';
		hg21(1)<='0';
		hg22(1)<='0';
		
		hg11(2)<='1';
		hg12(2)<='1';
		hg21(2)<='0';
		hg22(2)<='1';
		
		
when Y4=>
		nexn<=yd411;
		hg11(0)<='0';
		hg12(0)<='0';
		hg21(0)<='1';
		hg22(0)<='0';
		
		hg11(1)<='0';
		hg12(1)<='0';
		hg21(1)<='0';
		hg22(1)<='1';
		
		hg11(2)<='1';
		hg12(2)<='1';
		hg21(2)<='0';
		hg22(2)<='0';
		
		
when yd411=>
		nexn<=yd412;
		hg11(0)<='0';
		hg12(0)<='0';
		hg21(0)<='0';
		hg22(0)<='1';
		
		hg11(1)<='0';
		hg12(1)<='0';
		hg21(1)<='0';
		hg22(1)<='0';
		
		hg11(2)<='1';
		hg12(2)<='1';
		hg21(2)<='1';
		hg22(2)<='0';
		
when yd412=>
		nexn<=Y1;
		hg11(0)<='0';
		hg12(0)<='0';
		hg21(0)<='0';
		hg22(0)<='1';
		
		hg11(1)<='0';
		hg12(1)<='0';
		hg21(1)<='0';
		hg22(1)<='0';
		
		hg11(2)<='1';
		hg12(2)<='1';
		hg21(2)<='1';
		hg22(2)<='0';
when Y1=>
		nexn<=yd121;
		hg11(0)<='0';
		hg12(0)<='0';
		hg21(0)<='0';
		hg22(0)<='1';
		
		hg11(1)<='1';
		hg12(1)<='0';
		hg21(1)<='0';
		hg22(1)<='0';
		
		hg11(2)<='0';
		hg12(2)<='1';
		hg21(2)<='1';
		hg22(2)<='0';
end case;
end process;
end Behavioral;

