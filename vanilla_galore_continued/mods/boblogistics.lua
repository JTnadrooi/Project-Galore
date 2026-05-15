if not mods["boblogistics"] then return end

data.raw["item-with-entity-data"]["locomotive"].subgroup = "bob-locomotive"
data.raw["item-with-entity-data"]["cargo-wagon"].subgroup = "bob-cargo-wagon"
data.raw["item-with-entity-data"]["fluid-wagon"].subgroup = "bob-fluid-wagon"
data.raw["item-with-entity-data"]["artillery-wagon"].subgroup = "transport"
data.raw["item-with-entity-data"]["artillery-wagon"].order = "d"

data.raw["item"]["pipe"].subgroup = "bob-pipe"
data.raw["item"]["pipe-to-ground"].subgroup = "bob-pipe-to-ground"
