library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FSM_Detecteur1101 is
Port ( CLK, RST : in  STD_LOGIC;
       Input : in  STD_LOGIC;
       Output : out  STD_LOGIC);
end FSM_Detecteur1101;

architecture RTL of FSM_Detecteur1101 is
  type type_etat is (A, B, C, D);
  signal etat: type_etat;
begin 
  
  process(CLK,Input, RST)
    
  begin
    
    if RST = '1' then
      etat <= A;
      Output <= '0' ;
  else
    if (rising_edge(CLK)) then
      case etat is
        when A =>
          if(Input = '0') then
            etat <= A;
            Output <= '0' ;
          else
            etat <= B;
            Output <= '0' ;
          end if;
        when B =>
          if(Input = '0') then
            etat <= A;
            Output <= '0' ;
          else
            etat <= C;
            Output <= '0' ;
          end if;
        When C =>
          if(Input = '0') then
            etat <= D;
            Output <= '0' ;
          else
            etat <= C;
            Output <= '0' ;
          end if;
        When D =>
          if(Input = '0') then          
            etat <= A;
            Output <= '0' ;
          else
            etat <= B;
            Output <= '1' ;
          end if;
    end case;
    end if;
      end if;
  end process;
  
  
end;


