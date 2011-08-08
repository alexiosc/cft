package body utils is

  -- Convert bit_vector to IEEE std_logic_vector format
  -- (attributes LENGTH and RANGE are described below)
  function bv2slv (b:bit_vector) return std_logic_vector is
    variable result: std_logic_vector(b'LENGTH-1 downto 0);
  begin
    for i in result'RANGE loop
      case b(i) is
        when '0' => result(i) := '0';
        when '1' => result(i) := '1';
      end case;
    end loop;
    return result;
  end;
  
  -- Convert std_logic_vector to bit_vector format
  -- (attributes LENGTH and RANGE are described below)
  function slv2bv (b:std_logic_vector) return bit_vector is
    variable result: bit_vector(b'LENGTH-1 downto 0);
  begin
    for i in result'RANGE loop
      case b(i) is
        when '0' => result(i) := '0';
        when others => result(i) := '1';
      end case;
    end loop;
    return result;
  end;
  

  -- Convert bit_vector to unsigned (natural) value 
  function b2n (B: bit_vector) return Natural is
    variable S: bit_vector(B'Length - 1 downto 0) := B;
    variable N: Natural := 0;
  begin
    for i in S'Right to S'Left loop
      if S(i) = '1' then
        N := N + (2**i);
      end if;
    end loop;
    return N;
  end;

  ----------------------------------------------------------------
  -- natural_to_slv
  --
  -- Convert natural to bit vector encoded unsigned integer.
  -- (length is used as the size of the result.)
  ----------------------------------------------------------------

  function natural_to_slv(nat : in natural;
      	      	      	 length : in natural) return std_logic_vector is

    variable temp : natural := nat;
    variable result : std_logic_vector(0 to length-1);

  begin
    for index in result'reverse_range loop
      if (temp rem 2) = 0 then
        result(index) := '0';
      else
        result(index) := '1';
      end if;
      temp := temp / 2;
    end loop;
    return result;
  end natural_to_slv;


  function unsigned_to_slv(uns : in unsigned;
      	      	      	 length : in natural) return std_logic_vector is

    variable temp : unsigned (length downto 0) := uns;
    variable result : std_logic_vector(0 to length-1);

  begin
    for index in result'reverse_range loop
      if (temp rem 2) = 0 then
        result(index) := '0';
      else
        result(index) := '1';
      end if;
      temp := temp / 2;
    end loop;
    return result;
  end unsigned_to_slv;


  function slv_to_unsigned(slv : in std_logic_vector;
      	      	      	 length : in natural) return unsigned is

    variable result : unsigned(0 to length-1);

  begin
    for index in result'reverse_range loop
      result := result * 2;
      if slv(index) /= '0' then
        result := result + 1;
      end if;
    end loop;
    return result;
  end slv_to_unsigned;

end utils;
