# Atoms, Tuples and Pattern Matching
# =================================
#
# Atoms: Atoms are unique values that resolve to themselfs, much like in clojure.
#
# Tuples: Tuples are a datastructure in which the position of the element is important.
#
# Pattern Matching: Much like in OCaml, pattern matching is used to distinguish between cases.

defmodule Basics do
  # Use atoms to distinguish between cases:
  def hello_world(:english) do
   "Hello world!"
  end

  def hello_world(:german) do
    "Hallo Welt!"
  end

  def hello_world(:spanish) do
    "Hola mundo!"
  end

  # Guards are used to distinguish between arguments where certain conditions are met.
  def invert_number(number) when number > 0 do
    "This number is bigger than 0"
  end

  def invert_number(number) when number < 0 do
    "This number is smaller than 0"
  end

  def invert_number(number) when number == 0 do
    "This number is exactly 0"
  end

  # Use underscores to denote that you do not care about an argument.
  def ignore_one(age, _) when age < 16 do
   "You are too young for alcohol!"
  end

  def ignore_one(age, drink) when age >=16 do
    "Here is your " ++ drink ++ " :)"
  end

  # Tuples are defined by putting values into curly braces.
  _a_tuple = {:english, 69, "Hello there"}

  # You can destructure tuples.
  def tuplerino({age, first_name, last_name}) do
    Integer.to_string(age) ++ " is the age of " ++ first_name ++ " " ++ last_name
  end

  def tuplerino(tupleroni) do
    {age, first_name, last_name} = tupleroni
    Integer.to_string(age) ++ " is the age of " ++ first_name ++ " " ++ last_name
  end
end
