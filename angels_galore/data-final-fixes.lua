require("overrides.angels-overrides-final-fixes")

for _, tech in pairs(data.raw.technology) do
    if tech.unit then
        -- for index, value in ipairs(tech.unit.ingredients or {}) do
        --     if value[1] == "military-science-pack" then
        --         table.remove(tech.unit.ingredients, index)
        --     end
        -- end
        tech.unit.time = 5
    end
end

data.raw["recipe"]["copper-ore-smelting"].order = "da"
data.raw["recipe"]["processed-copper-smelting"].order = "db"
data.raw["recipe"]["anode-copper-smelting"].order = "dc"
data.raw["recipe"]["iron-ore-smelting"].order = "ca"
data.raw["recipe"]["processed-iron-smelting"].order = "cb"
data.raw["recipe"]["pellet-iron-smelting"].order = "cc"
