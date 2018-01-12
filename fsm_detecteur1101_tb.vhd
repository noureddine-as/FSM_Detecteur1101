LIBRARY ieee  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_arith.all  ; 
USE ieee.STD_LOGIC_UNSIGNED.all  ; 
ENTITY fsm_detecteur1101_tb  IS 
END ; 
 
ARCHITECTURE fsm_detecteur1101_tb_arch OF fsm_detecteur1101_tb IS
  SIGNAL Input   :  STD_LOGIC  ; 
  SIGNAL Output   :  STD_LOGIC  ; 
  SIGNAL RST   :  STD_LOGIC  ; 
  SIGNAL CLK   :  STD_LOGIC  ; 
  COMPONENT FSM_Detecteur1101  
    PORT ( 
      Input  : in STD_LOGIC ; 
      Output  : out STD_LOGIC ; 
      RST  : in STD_LOGIC ; 
      CLK  : in STD_LOGIC ); 
  END COMPONENT ; 
BEGIN
  DUT  : FSM_Detecteur1101  
    PORT MAP ( 
      Input   => Input  ,
      Output   => Output  ,
      RST   => RST  ,
      CLK   => CLK   ) ; 
      
  RST <= '1', '0' after 100 ns; 
  
  process
  begin
    CLK <= '1';
    wait for 25 ns;
    CLK <= '0';
    wait for 25 ns;
  end process;   
  
  Input  <= '0',  '1' after 100 ns,
                  '0' after 150 ns,
                  '0' after 200 ns,
                  '1' after 250 ns,
                  '1' after 300 ns,
                  '0' after 350 ns,
                  '1' after 400 ns, -- Sortie <= 1
                  '1' after 450 ns,
                  '0' after 500 ns,
                  '1' after 550 ns, -- Sortie <= 1
                  '1' after 600 ns,
                  '1' after 650 ns,
                  '0' after 700 ns,
                  '1' after 750 ns, -- Sortie <= 1
                  '0' after 800 ns;
END ; 

