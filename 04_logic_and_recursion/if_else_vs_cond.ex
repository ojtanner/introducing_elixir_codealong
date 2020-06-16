# Cond and If-Else:
# ======================
#
# If-Else allows you to match for a single boolean value and let's you specify what should happen if it is not true.
#
# Cond is a construct that behaves like an if-else statement, but is more elegant.
# You must match on the condition being true, instead of matching on a specific value.

defmodule Cond do
  def measure_cat(weight) do
    if weight < 5 do
      "That's a nice cat you got there!"
    else
      "That's a chubby chungus!"
    end
  end

  def measure_doggo_boyo(weight) do
    cond do
      weight <= 0 -> "Yer dog's dead, m8"
      weight < 5 and weight > 0 -> "That's a small pupper alright"
      weight > 5 and weight < 10 -> "That's a normal sized dog (i guess)"
      weight >= 10 -> "That's a absolute unit of a dog!"
    end
  end
end
