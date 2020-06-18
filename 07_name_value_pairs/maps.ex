# Maps:
# ======================
#
# Maps are a somewhat new data structure replacing key-value lists.
# You can use anything as key, but atoms are custom.

_a_map = %{:earth => 9.8, :moon => 1.6, :mars => 3.71}

_a_map = %{earth: 9.8, moon: 1.6, mars: 3.71}

# Functional Updates with maps

_new_map = %{ _a_map | earth: 12 }

# You can pattern match maps

{earth: _earth_gravity} = _new_map
