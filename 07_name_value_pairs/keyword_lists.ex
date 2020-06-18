# Keyword Lists:
# ======================
#
# Keyword lists are lists that contain tuples of two elements, one being the key and the other the value.
# This sounds like a primitive hack at best but is a legit data structure in Elixir.
# The key must be an atom, the value can be whatever.

_kw_list = [{:first_name, "Oliver"}, {:last_name, "Tanner"}]

# Use the Keyword module to manipulate such a list.

_first_name = Keyword.get(_kw_list, :first_name)

# You can put more than one Key inside a keyword list
#
_kw_list = [{:hydrogen, :H, 1.008}, {:carbon, :C, 12.011}]
List.keyfind(_kw_list, :H, 1)
