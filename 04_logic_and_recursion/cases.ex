# Cases:
# ======================
#
# Case let's you pattern match inside of a funciton clause.
# It will not evaluate anything after matching the right pattern.
# It reads as [this] yields [value of expression]
# As in OCaml, you can use "_" (Underscore) to match any remaining cases. Always put the match-all case last.

defmodule Drop do
  def fall_velocity(planemo, distance) when distance >= 0 do
    case planemo do
      :earth -> :math.sqrt(2 * 9.8 * distance)
      :moon -> :math.sqrt(2 * 1.6 * distance)
      :mars -> :math.sqrt(2 * 3.71 * distance)
    end
  end
end

# You can also write it like this for more clarity:
defmodule Drop do
  def fall_velocity(planemo, distance) when distance >= 0 do
    gravity =
      case planemo do
        :earth -> 9.8
        :moon -> 1.6
        :mars -> 3.71
      end

    :math.sqrt(2 * gravity * distance)
  end
end

# Cases can also contain guard clauses:
defmodule Drop do
  def fall_velocity(planemo, distance) do
    gravity =
      case planemo do
        :earth when distance >= 0 -> 9.8
        :moon when distance >= 0 -> 1.6
        :mars when distance >= 0 -> 3.71
      end

    :math.sqrt(2 * gravity * distance)
  end
end
