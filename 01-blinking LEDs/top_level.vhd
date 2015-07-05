-- Blink a few LEDs
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY top_level IS
	PORT(
		SIGNAL LEDR     : OUT std_logic_vector(9 DOWNTO 0);
		SIGNAL CLOCK_50 : IN  std_logic
	);
END top_level;

ARCHITECTURE logic OF top_level IS
	CONSTANT FREQUENCY      : INTEGER := 50000000;
	CONSTANT FLIP_FREQUENCY : INTEGER := 2;
	CONSTANT COUNTREACHED   : INTEGER := FREQUENCY / FLIP_FREQUENCY;
	SIGNAL counter          : unsigned(25 DOWNTO 0);
	SIGNAL ledSignal        : std_logic;
	SIGNAL clockSignal      : std_logic;

BEGIN
	-- assign the value of board dependent CLOCK_50 to internal signal "clock" 
	clockSignal <= CLOCK_50;

	-- Invoke this stuff if clock changes state
	PROCESS(clockSignal)
	BEGIN
		IF rising_edge(clockSignal) THEN
			IF counter = COUNTREACHED THEN
				counter   <= to_unsigned(0, 26);
				-- Flip the current value of ledSignal
				ledSignal <= NOT ledSignal;
			ELSE
				counter <= counter + 1;
			END IF;
		END IF;
	END PROCESS;
	LEDR(0) <= ledSignal;
	LEDR(1) <= NOT ledSignal;
END ARCHITECTURE logic;
