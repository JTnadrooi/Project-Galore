-- there are also some vanilla overrides in loot-overrides.

-- increase underground belt distances (seems only fair with the huge new machines)
data.raw["underground-belt"]["underground-belt"].max_distance = 8
data.raw["underground-belt"]["fast-underground-belt"].max_distance = 10
data.raw["underground-belt"]["express-underground-belt"].max_distance = 12

-- increase power reach (huge machines, looking at sorting machine rn)
data.raw["electric-pole"]["small-electric-pole"].maximum_wire_distance = 8.5 -- 1 tile increase for the sorting machine. (also makes it reach past ec miner + belt + ec miner)
data.raw["electric-pole"]["medium-electric-pole"].maximum_wire_distance = 10.5

data.raw["pipe-to-ground"]["pipe-to-ground"].fluid_box.pipe_connections[2].max_underground_distance = 14
-- increase inserter hand sizes (lots of new fast outputting recipes alsooooo)
for _, inserter in pairs(data.raw["inserter"]) do
    inserter.stack_size_bonus = (inserter.stack_size_bonus or 0) + 2
end

vgal.recipe.replace_ingredient("explosives", "water", "angels-water-purified")
