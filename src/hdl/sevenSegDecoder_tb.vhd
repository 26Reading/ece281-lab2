--+----------------------------------------------------------------------------
--| 
--| COPYRIGHT 2017 United States Air Force Academy All rights reserved.
--| 
--| United States Air Force Academy     __  _______ ___    _________ 
--| Dept of Electrical &               / / / / ___//   |  / ____/   |
--| Computer Engineering              / / / /\__ \/ /| | / /_  / /| |
--| 2354 Fairchild Drive Ste 2F6     / /_/ /___/ / ___ |/ __/ / ___ |
--| USAF Academy, CO 80840           \____//____/_/  |_/_/   /_/  |_|
--| 
--| ---------------------------------------------------------------------------
--|
--| FILENAME      : thirtyOneDayMonth_tb.vhd (TEST BENCH)
--| AUTHOR(S)     : Capt Dan Johnson, ***Your Name Here***
--| CREATED       : 12/12/2019 Last Modified 06/24/2020
--| DESCRIPTION   : This file tests to ensure thirtyOneDayMonthMux works properly
--|
--|
--+----------------------------------------------------------------------------
--|
--| REQUIRED FILES :
--|
--|    Libraries : ieee
--|    Packages  : std_logic_1164, numeric_std, unisim
--|    Files     : thirtyOneDayMonth.vhd
--|
--+----------------------------------------------------------------------------
--|
--| NAMING CONVENSIONS :
--|
--|    xb_<port name>           = off-chip bidirectional port ( _pads file )
--|    xi_<port name>           = off-chip input port         ( _pads file )
--|    xo_<port name>           = off-chip output port        ( _pads file )
--|    b_<port name>            = on-chip bidirectional port
--|    i_<port name>            = on-chip input port
--|    o_<port name>            = on-chip output port
--|    c_<signal name>          = combinatorial signal
--|    f_<signal name>          = synchronous signal
--|    ff_<signal name>         = pipeline stage (ff_, fff_, etc.)
--|    <signal name>_n          = active low signal
--|    w_<signal name>          = top level wiring signal
--|    g_<generic name>         = generic
--|    k_<constant name>        = constant
--|    v_<variable name>        = variable
--|    sm_<state machine type>  = state machine type definition
--|    s_<signal name>          = state name
--|
--+----------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  
entity sevenSegDecoder_tb is --notice entity is empty.  The testbench has no external connections.
end sevenSegDecoder_tb;

architecture test_bench of sevenSegDecoder_tb is 
	
     component sevenSegDecoder is
         Port (
             i_D : in  STD_LOGIC_VECTOR (3 downto 0);
             o_S : out STD_LOGIC_VECTOR (6 downto 0)
         );
     end component sevenSegDecoder;
 
     -- signals are wires
     signal sw : STD_LOGIC_VECTOR(3 downto 0) := (others =>'0') ;
     signal seg : STD_LOGIC_VECTOR(6 downto 0)  := (others=>'0');

 begin
 
 
    
     sevenSegDecoder_tb : sevenSegDecoder
     port map (
         i_D => sw,
         o_S => seg
     );
 
    
     testProcess : process
     begin
         -- Test case 1: 
         sw <= "0000";
         wait for 10 ns;
         assert seg = "1000000" report "error on 0000" severity failure;
 
         -- Test case 2: 
         sw <= "0001";
         wait for 10 ns;
         assert seg = "1111001" report "error on 0001" severity failure;
 
         -- Test case 3: 
         sw <= "0010";
         wait for 10 ns;
         assert seg = "0100100" report "error on 0010" severity failure;
 
         -- Test case 4:
         sw <= "0011";
         wait for 10 ns;
         assert seg = "0110000" report "error on 0011" severity failure;
        
        -- Test case 5:
         sw <= "0100";
         wait for 10 ns;
         assert seg = "0011001" report "error on 0100" severity failure;
 
        -- Test case 6:
         sw <= "0101";
         wait for 10 ns;
         assert seg = "0010010" report "error on 0101" severity failure;
        
        --Test case 7: 
        sw <= "0110";
        wait for 10 ns;
        assert seg = "0000010" report "error on 0110" severity failure;
        
        -- Test case 8:
         sw <= "0111";
         wait for 10 ns;
         assert seg = "1111000" report "error on 0111" severity failure;
        
        --Test case 9: 
         sw <= "1000";
         wait for 10 ns;
         assert seg = "0000000" report "error on 1000" severity failure;
        
        
        --Test case 10: 
         sw <= "1001";
         wait for 10 ns;
         assert seg = "0011000" report "error on 1001" severity failure;
         
         
        --Test case 11:
         sw <= "1010";
         wait for 10 ns;
         assert seg = "0001000" report "error on 1010" severity failure;
         
         -- Test case 12:
         sw <= "1011";
         wait for 10 ns;
         assert seg = "0000011" report "error on 1011" severity failure;
         
         
         --Test case 13:
         sw <= "1100";
         wait for 10 ns;
         assert seg = "0100111" report "error on 1100" severity failure;
         
         
         --Test case 14:
         sw <= "1101";
         wait for 10 ns;
         assert seg = "0100001" report "error on 1101" severity failure;
         
         --Test case 15:
         sw<="1110";
         wait for 10 ns;
         assert seg = "0000110" report "error on 1110" severity failure;
         
         --Test case 16:
         sw <= "1111";
         wait for 10 ns;
         assert seg = "0001110" report "error on 1111" severity failure;
         
         -- End of test
         wait;
     end process;
 
	-----------------------------------------------------	
	
end test_bench;
