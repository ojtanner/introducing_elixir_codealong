# Modules and Functions:
# ======================
#
# Functions normally go inside of modules.
# Normally you define one module per file. File-name and module-name must be the same (File = lowercase, Module = uppercase).
#
defmodule Basics do
  @moduledoc """
  This is the documentation for the module Basic.
  """

  # Regular Imports are written with the uppercase module name.
  import Example
  # Erlang libraries are importet with : underscore library name.
  import :math
  # If you only want to import a subset of module functions, do the following:
  # Note that the format is [function:arity]
  import Example, only: [value:0]

  # Functions, much like OCaml do not have return statements but return the last expression produced that is not stored in a variable.

  # Public functions are defined with def FUNCTION NAME do [code] end
  @doc """
    This is the documentation for the function my_function/1
  """

  # Function signatures can also be specified with the following notation:
  @spec my_function(number()) :: number()
  def my_function(number) do
    number * 2
  end

  # Functions can be declared with a short-hand for one-liners.
  def one_liner(number), do: number

  # You can obviously import other modules to use their code in your module/function.
  def function_with_import do
    import Example

    value * 2
  end
end
