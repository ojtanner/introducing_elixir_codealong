# Recursion with lists:
# ======================
#
# The head | tail pattern matching is great for recursion.

defmodule Overall do
  def product([]) do
    0
  end

  def product(list) do
    product(list, 1)
  end

  def product([], accumulated_product) do
    accumulated_product
  end

  def product([head | tail], accumulated_product) do
    product(tail, head * accumulated_product)
  end

  def falls(list) do
    falls(list, [])
  end

  def falls([], result) do
    result
  end

  def falls([head | tail], result) do
    falls(tail, [head * 2 | result])
  end
end
