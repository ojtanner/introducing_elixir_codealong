# Structs:
# ======================
#
# Structs are structured data. They work similar to maps, but the keys are fixed.

defmodule My_Struct do
  defstruct first_name: nil, last_name: nil, birthday: 0
end

_my_struct = %My_Struct{}

_another_struct = %My_Struct{first_name: "Oliver"}

_another_struct.first_name

# Pattern Matching Structs in functions

defmodule Example do
  def greeter(p = %My_Struct{}) do
    IO.puts("Hello" <> " #{p.first_name}")
  end
end
