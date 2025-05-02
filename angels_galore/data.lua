require("constants")
require("overrides.angels-order-overrides")
require("prototypes.subgroups")
require("overrides.angels-prod-overrides")
require("overrides.angels-recipe-overrides")
require("overrides.angels-overrides")

data.raw["underground-belt"]["underground-belt"].max_distance = 8
data.raw["underground-belt"]["fast-underground-belt"].max_distance = 10
data.raw["underground-belt"]["express-underground-belt"].max_distance = 12

for _, inserter in pairs(data.raw["inserter"]) do
    inserter.stack_size_bonus = (inserter.stack_size_bonus or 0) + 2
end
