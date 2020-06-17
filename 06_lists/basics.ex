# Lists:
# ======================
#
# Lists are sequential data structures. Many programming languages rely on them.
# A string literal looks like this:

_list = [1, 2, 3, 4]

# Since Elixir is dynamic, you are not constrained to a single type within an existing list.

_list = [1, "two", {:three}]

# You can pattern match lists in elixir.

[1, _x, 3, _y] = [1, 2, 3, 4]

# As with any good functional language, you can destructure the list into head and tail.

[head | tail] = [1, 2, 3, 4]

# You can also create new lists. The syntax is funny if you come from a language like OCaml.

_list = [1 | [2, 3]]
