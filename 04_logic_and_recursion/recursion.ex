# Recursion:
# ======================
#
# I won't explain recursion to you here. Bite me!
#
# Also, please

defmodule Count do
  def count_down(from) when from > 0 do
    IO.inspect(from)
    count_down(from - 1)
  end

  def count_down(_from) do
    IO.puts("blastoff!")
  end
end
