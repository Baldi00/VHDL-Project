------------------------STATE MACHINE---------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity project_reti_logiche is
	port (
		i_clk : in std_logic;
		i_rst : in std_logic;
		i_start : in std_logic;
		i_data : in std_logic_vector(7 downto 0);
		o_address : out std_logic_vector(15 downto 0);
		o_done : out std_logic;
		o_en : out std_logic;
		o_we : out std_logic;
		o_data : out std_logic_vector (7 downto 0)
	);
end project_reti_logiche;

architecture Behavioral of project_reti_logiche is
component datapath is
    port ( i_clk : in std_logic;
           i_rst : in std_logic;
           i_data : in std_logic_vector (7 downto 0);
           o_data : out std_logic_vector (7 downto 0);
           o_address : out std_logic_vector (15 downto 0);
           r1_load : in std_logic;
           r2_load : in std_logic;
           r3_load : in std_logic;
           r4_load : in std_logic;
           r5_load : in std_logic;
           r6_load : in std_logic;
           ffd1_load : in std_logic;
           ffd2_load : in std_logic;
           uk_load : in std_logic;
           pk_load : in std_logic;
           r1_sel : in std_logic;
           r3_reset : in std_logic;
           r4_reset : in std_logic;
           internal_reset : in std_logic;
           o_addr_sel : in std_logic_vector (1 downto 0);
           d_sel : in std_logic_vector (2 downto 0);
           o_end : out std_logic);
end component;
signal r1_load : std_logic;
signal r2_load : std_logic;
signal r3_load : std_logic;
signal r4_load : std_logic;
signal r5_load : std_logic;
signal r6_load : std_logic;
signal ffd1_load : std_logic;
signal ffd2_load : std_logic;
signal uk_load : std_logic;
signal pk_load : std_logic;
signal r1_sel : std_logic;
signal r3_reset : std_logic;
signal r4_reset : std_logic;
signal internal_reset : std_logic;
signal o_addr_sel : std_logic_vector (1 downto 0);
signal d_sel : std_logic_vector (2 downto 0);
signal o_end : std_logic;
type S is (S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16,S17,S18,S19,S20);
signal cur_state, next_state : S;
begin
    DATAPATH0: datapath port map(
        i_clk,
        i_rst,
        i_data,
        o_data,
        o_address,
        r1_load,
        r2_load,
        r3_load,
        r4_load,
        r5_load,
        r6_load,
        ffd1_load,
        ffd2_load,
        uk_load,
        pk_load,
        r1_sel,
        r3_reset,
        r4_reset,
        internal_reset,
        o_addr_sel,
        d_sel,
        o_end
    );
    
    process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            cur_state <= S0;
        elsif i_clk'event and i_clk = '1' then
            cur_state <= next_state;
        end if;
    end process;
    
    process(cur_state, i_start, o_end)
    begin
        next_state <= cur_state;
        case cur_state is
            when S0 =>
                if i_start = '1' then
                    next_state <= S1;
                end if;
            when S1 =>
                next_state <= S2;
            when S2 =>
                next_state <= S3;
            when S3 =>
                next_state <= S4;
            when S4 =>
                next_state <= S5;
            when S5 =>
                next_state <= S6;
            when S6 =>
                next_state <= S7;
            when S7 =>
                next_state <= S8;
            when S8 =>
                next_state <= S9;
            when S9 =>
                next_state <= S10;
            when S10 =>
                next_state <= S11;
            when S11 =>
                next_state <= S12;
            when S12 =>
                next_state <= S13;
            when S13 =>
                next_state <= S14;
            when S14 =>
                next_state <= S15;
            when S15 =>
                next_state <= S16;
            when S16 =>
                next_state <= S17;
            when S17 =>
                next_state <= S18;
            when S18 =>
                if o_end = '1' then
                    next_state <= S20;
                else
                    next_state <= S19;
                end if;
            when S19 =>
                next_state <= S4;
            when S20 =>
                if i_start = '1' then
                    next_state <= S20;
                else
                    next_state <= S0;
                end if;
        end case;
    end process;
    
    process(cur_state)
    begin
        r1_load <= '0';
        r2_load <= '0';
        r3_load <= '0';
        r4_load <= '0';
        r5_load <= '0';
        r6_load <= '0';
        ffd1_load <= '0';
        ffd2_load <= '0';
        uk_load <= '0';
        pk_load <= '0';
        r1_sel <= '0';
        r3_reset <= '0';
        r4_reset <= '0';
        internal_reset <= '0';
        o_addr_sel <= "00";
        d_sel <= "000";
        o_en <= '0';
        o_we <= '0';
        o_done <= '0';
        
        case cur_state is
            when S0 =>
            when S1 =>
                o_addr_sel <= "01";
                r6_load <= '1';
                o_en <= '1';
            when S2 =>
                r1_load <= '1';
                r5_load <= '1';
                r3_reset <= '1';
                r3_load <= '1';
                r4_reset <= '1';
                r4_load <= '1';
            when S3 =>
                r6_load <= '1';
            when S4 =>
                o_en <= '1';
            when S5 =>
                r2_load <= '1';
            when S6 =>
                ffd1_load <= '1';
                ffd2_load <= '1';
                uk_load <= '1';
                pk_load <= '1';
            when S7 =>
                d_sel <= "001";
                ffd1_load <= '1';
                ffd2_load <= '1';
                uk_load <= '1';
                pk_load <= '1';
            when S8 =>
                d_sel <= "010";
                r4_load <= '1';
                ffd1_load <= '1';
                ffd2_load <= '1';
                uk_load <= '1';
                pk_load <= '1';
            when S9 =>
                d_sel <= "011";
                r4_load <= '1';
                ffd1_load <= '1';
                ffd2_load <= '1';
                uk_load <= '1';
                pk_load <= '1';
            when S10 =>
                d_sel <= "100";
                r4_load <= '1';
                ffd1_load <= '1';
                ffd2_load <= '1';
                uk_load <= '1';
                pk_load <= '1';
            when S11 =>
                d_sel <= "101";
                r4_load <= '1';
                o_addr_sel <= "10";
                r6_load <= '1';
                ffd1_load <= '1';
                ffd2_load <= '1';
                uk_load <= '1';
                pk_load <= '1';
            when S12 =>
                o_en <= '1';
                o_we <= '1';
            when S13 =>
                r4_reset <= '1';
                r4_load <= '1';
                r3_load <= '1';
            when S14 =>
                d_sel <= "110";
                r4_load <= '1';
                ffd1_load <= '1';
                ffd2_load <= '1';
                uk_load <= '1';
                pk_load <= '1';
            when S15 =>
                d_sel <= "111";
                r4_load <= '1';
                ffd1_load <= '1';
                ffd2_load <= '1';
                uk_load <= '1';
                pk_load <= '1';
            when S16 =>
                d_sel <= "000";
                r4_load <= '1';
                pk_load <= '1';
            when S17 =>
                d_sel <= "001";
                r4_load <= '1';
                o_addr_sel <= "10";
                r6_load <= '1';
                pk_load <= '1';
                r1_sel <= '1';
                r1_load <= '1';
            when S18 =>
                o_en <= '1';
                o_we <= '1';
            when S19 =>
                r6_load <= '1';
                r4_reset <= '1';
                r4_load <= '1';
                r3_load <= '1';
            when S20 =>
                internal_reset <= '1';
                o_done <= '1';
        end case;
    end process;
    
end Behavioral;




---------------------------DATAPATH-----------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity datapath is
    port ( i_clk : in std_logic;
           i_rst : in std_logic;
           i_data : in std_logic_vector (7 downto 0);
           o_data : out std_logic_vector (7 downto 0);
           o_address : out std_logic_vector (15 downto 0);
           r1_load : in std_logic;
           r2_load : in std_logic;
           r3_load : in std_logic;
           r4_load : in std_logic;
           r5_load : in std_logic;
           r6_load : in std_logic;
           ffd1_load : in std_logic;
           ffd2_load : in std_logic;
           uk_load : in std_logic;
           pk_load : in std_logic;
           r1_sel : in std_logic;
           r3_reset : in std_logic;
           r4_reset : in std_logic;
           internal_reset : in std_logic;
           o_addr_sel : in std_logic_vector (1 downto 0);
           d_sel : in std_logic_vector (2 downto 0);
           o_end : out std_logic);
end datapath;

architecture Behavioral of datapath is
signal o_reg1 : std_logic_vector (7 downto 0);
signal o_reg2 : std_logic_vector (7 downto 0);
signal o_reg3 : std_logic_vector (15 downto 0);
signal o_reg4 : std_logic_vector (7 downto 0);
signal o_reg5 : std_logic_vector (15 downto 0);
signal o_reg6 : std_logic_vector (15 downto 0);
signal mux_reg1 : std_logic_vector(7 downto 0);
signal mux_reg2 : std_logic;
signal mux_reg3 : std_logic_vector(15 downto 0);
signal mux_reg4 : std_logic_vector(7 downto 0);
signal mux_reg6 : std_logic_vector(15 downto 0);
signal mux_out11 : std_logic_vector(7 downto 0);
signal mux_out12 : std_logic_vector(7 downto 0);
signal mux_out21 : std_logic_vector(7 downto 0);
signal mux_out22 : std_logic_vector(7 downto 0);
signal dif_reg1 : std_logic_vector(7 downto 0);
signal sum_reg3 : std_logic_vector(15 downto 0);
signal sum_reg4 : std_logic_vector(7 downto 0);
signal sum_reg5 : std_logic_vector(15 downto 0);
signal dif_reg5 : std_logic_vector(15 downto 0);
signal sum_out : std_logic_vector(7 downto 0);
signal pk1 : std_logic;
signal pk2 : std_logic;
signal uk : std_logic;
signal uk1 : std_logic;
signal uk2 : std_logic;
signal d2_sel : std_logic_vector (2 downto 0);


begin
	
	--REGISTERS

	--Reg1
    process(i_clk, i_rst)
    begin
        if(i_rst = '1' or internal_reset = '1') then
            o_reg1 <= "00000000";
        elsif i_clk'event and i_clk = '1' then
            if(r1_load = '1') then
                o_reg1 <= mux_reg1;
            end if;
        end if;
    end process;
    
	--Reg2
    process(i_clk, i_rst)
    begin
        if(i_rst = '1' or internal_reset = '1') then
            o_reg2 <= "00000000";
        elsif i_clk'event and i_clk = '1' then
            if(r2_load = '1') then
                o_reg2 <= i_data;
            end if;
        end if;
    end process;
    
	--Reg3
    process(i_clk, i_rst)
    begin
        if(i_rst = '1' or internal_reset = '1') then
            o_reg3 <= "0000000000000000";
        elsif i_clk'event and i_clk = '1' then
            if(r3_load = '1') then
                o_reg3 <= mux_reg3;
            end if;
        end if;
    end process;
    
	--Reg4 & OData
    process(i_clk, i_rst)
    begin
        if(i_rst = '1' or internal_reset = '1') then
            o_reg4 <= "00000000";
            o_data <= "00000000";
        elsif i_clk'event and i_clk = '1' then
            if(r4_load = '1') then
                o_reg4 <= mux_reg4;
                o_data <= mux_reg4;
            end if;
        end if;
    end process;
    
	--Reg5
    process(i_clk, i_rst)
    begin
        if(i_rst = '1' or internal_reset = '1') then
            o_reg5 <= "0000000000000000";
        elsif i_clk'event and i_clk = '1' then
            if(r5_load = '1') then
                o_reg5 <= sum_reg5;
            end if;
        end if;
    end process;
    
	--Reg6 & OAddress
    process(i_clk, i_rst)
    begin
        if(i_rst = '1' or internal_reset = '1') then
            o_reg6 <= "0000000000000000";
            o_address <= "0000000000000000";
        elsif i_clk'event and i_clk = '1' then
            if(r6_load = '1') then
                o_reg6 <= mux_reg6;
                o_address <= mux_reg6;
            end if;
        end if;
    end process;
    
	--Uk
    process (i_clk, i_rst)
    begin
        if(i_rst = '1' or internal_reset = '1') then
            uk <= '0';
        elsif(rising_edge(i_clk) and uk_load = '1') then
            uk <= mux_reg2;
        end if;
    end process;
    
	--Uk1
    process (i_clk, i_rst, r1_load)
    begin
        if(i_rst = '1' or internal_reset = '1') then
            uk1 <= '0';
        elsif(rising_edge(i_clk) and ffd1_load = '1') then
            uk1 <= uk;
        end if;
    end process;
    
	--Uk2
    process (i_clk, i_rst, r1_load)
    begin
        if(i_rst = '1' or internal_reset = '1') then
            uk2 <= '0';
        elsif(rising_edge(i_clk) and ffd2_load = '1') then
            uk2 <= uk1;
        end if;
    end process;
    
	--Pk1 & Pk2
    process (i_clk, i_rst)
    begin
        if(i_rst = '1' or internal_reset = '1') then
            pk1 <= '0';
            pk2 <= '0';
        elsif(rising_edge(i_clk) and pk_load = '1') then
            pk1 <= uk xor uk2;
            pk2 <= uk xor uk1 xor uk2;
        end if;
    end process;



    --MULTIPLEXERS

    --MuxReg1
    with r1_sel select
        mux_reg1 <= i_data when '0',
                    dif_reg1 when '1',
                    "XXXXXXXX" when others;
             
    --MuxReg2       
    with d_sel select
        mux_reg2 <= o_reg2(7) when "000",
                    o_reg2(6) when "001",
                    o_reg2(5) when "010",
                    o_reg2(4) when "011",
                    o_reg2(3) when "100",
                    o_reg2(2) when "101",
                    o_reg2(1) when "110",
                    o_reg2(0) when "111",
                    'X' when others;
             
    --MuxReg3       
    with r3_reset select
        mux_reg3 <= sum_reg3 when '0',
                    "0000001111101000" when '1',
                    "XXXXXXXXXXXXXXXX" when others;
             
    --MuxReg4       
    with r4_reset select
        mux_reg4 <= sum_reg4 when '0',
                    "00000000" when '1',
                    "XXXXXXXX" when others;
             
    --MuxReg6       
    with o_addr_sel select
        mux_reg6 <= dif_reg5 when "00",
                    "0000000000000000" when "01",
                    o_reg3 when "10",
                    "XXXXXXXXXXXXXXXX" when others;
             
    --MuxOut11       
    with d2_sel select
        mux_out11 <= "10000000" when "000",
                    "00100000" when "001",
                    "00001000" when "010",
                    "00000010" when "011",
                    "10000000" when "100",
                    "00100000" when "101",
                    "00001000" when "110",
                    "00000010" when "111",
                    "XXXXXXXX" when others;
    
    --MuxOut12
    with pk1 select
        mux_out12 <= "00000000" when '0',
                    mux_out11 when '1',
                    "XXXXXXXX" when others;
    
    --MuxOut21
    with d2_sel select
        mux_out21 <= "01000000" when "000",
                    "00010000" when "001",
                    "00000100" when "010",
                    "00000001" when "011",
                    "01000000" when "100",
                    "00010000" when "101",
                    "00000100" when "110",
                    "00000001" when "111",
                    "XXXXXXXX" when others;
    
    --MuxOut22
    with pk2 select
        mux_out22 <= "00000000" when '0',
                    mux_out21 when '1',
                    "XXXXXXXX" when others;
    


    --ADDERS

    sum_reg3 <= o_reg3 + "0000000000000001";

    sum_reg4 <= sum_out + o_reg4;
    
    sum_reg5 <= ("00000000" & mux_reg1) + "0000000000000001";
    
    sum_out <= mux_out12 + mux_out22;
    
    dif_reg1 <= o_reg1 - "00000001";
    
    dif_reg5 <= o_reg5 - ("00000000" & o_reg1);
    
    d2_sel <= d_sel - "010";
    


    --END CHECK

    o_end <= '1' when (o_reg1 = "00000000") else '0';
    
end Behavioral;