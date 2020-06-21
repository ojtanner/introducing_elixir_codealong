# Protocols:
# ======================
#
# Protocols are Interfaces that need to be explicitly instantiated for specific use cases.
# They are very very useful when paired with structs.

defmodule NaturalNumber do
  defstruct number: 0
end

defprotocol Valid do
  @doc "Returns true if the data is considered valid"
  def valid?(data)
end

defimpl Valid, for: NaturalNumber do
  def valid?(data) do
    data >= 0
  end
end

# You can implement Protocols for every data type.
# Or every custom data type you create.

defimpl Valid, for: Integer do
  def valid?(data) do
    :true
end
