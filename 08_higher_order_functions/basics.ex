# Higher-Order Functions:
# ======================
#
# Elixir is a functional language. It has higher order functions. Duh.

defmodule Hof do
  def do_something(number, function) do
    function.(number)
  end
end

Hof.do_something(2, fn x -> x * 3 end)

Hof.do_something(3, &(&1 * 3))

curry = Hof.do_something(2)

curry.(&(&1 * 3))
