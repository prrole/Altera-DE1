-- Blink a few LEDs
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY top_level IS
	PORT(
		SIGNAL LEDR     : OUT std_logic_vector(9 DOWNTO 0);
		SIGNAL LEDG     : OUT std_logic_vector(8 DOWNTO 0);
		SIGNAL CLOCK_50 : IN  std_logic;
		SIGNAL KEY      : IN  std_logic_vector(3 DOWNTO 0)
	);
END top_level;

ARCHITECTURE logic OF top_level IS
	CONSTANT FREQUENCY      : INTEGER := 50000000;
	CONSTANT FLIP_FREQUENCY : INTEGER := 2;
	CONSTANT COUNTREACHED   : INTEGER := FREQUENCY / FLIP_FREQUENCY;
	SIGNAL clockSignal      : std_logic;
	SIGNAL reset            : std_logic;

BEGIN
	-- assign the value of board dependent CLOCK_50 to internal signal "clock" 
	clockSignal <= CLOCK_50;
	reset       <= NOT KEY(0);

	-- Invoke this stuff if clock changes state
	PROCESS(clockSignal)
		VARIABLE counter   : unsigned(25 DOWNTO 0);
		VARIABLE ledSignal : std_logic;
	BEGIN
		IF rising_edge(clockSignal) THEN
			-- Reset is active
			IF reset = '1' THEN
				counter := (OTHERS => '0');
				-- Light all red LEDs except 0 and 1
				LEDR    <= (0 => '0', 1 => '0', OTHERS => '1');
				-- Light up all green LEDs
				LEDG    <= (OTHERS => '1');
			ELSE
				LEDR(9 DOWNTO 2) <= (OTHERS => '0');
				LEDG             <= (OTHERS => '0');
			END IF;

			IF counter /= COUNTREACHED THEN
				counter := counter + 1;
			ELSE
				counter   := (OTHERS => '0');
				-- Flip the current value of ledSignal
				ledSignal := NOT ledSignal;
				LEDR(0)   <= ledSignal;
				LEDR(1)   <= NOT ledSignal;
			END IF;
		END IF;

	END PROCESS;
END ARCHITECTURE logic;
