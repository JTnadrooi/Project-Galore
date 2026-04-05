require("lib.agal")

require("prototypes.subgroups")

data.raw["underground-belt"]["underground-belt"].max_distance = 8
data.raw["underground-belt"]["fast-underground-belt"].max_distance = 10
data.raw["underground-belt"]["express-underground-belt"].max_distance = 12

for _, inserter in pairs(data.raw["inserter"]) do
    inserter.stack_size_bonus = (inserter.stack_size_bonus or 0) + 2
end

require("prototypes.metal-both")
require("prototypes.sorting")
