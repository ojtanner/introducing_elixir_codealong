# Hash Dictionaries:
# ======================
#
# Hash Dictionaries are good ol' hashmaps.

_hash_dict = Enum.into([earth: 9.8, moon: 1.6, mars: 3.71], HashDict.new())

HashDict.has_key?(_hash_dict, :earth)
