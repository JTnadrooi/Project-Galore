require("overrides.angels-overrides-final-fixes")

-- commentedbc: big lab setups ftw
-- for _, tech in pairs(data.raw.technology) do
--     if tech.unit then
--         -- for index, value in ipairs(tech.unit.ingredients or {}) do
--         --     if value[1] == "military-science-pack" then
--         --         table.remove(tech.unit.ingredients, index)
--         --     end
--         -- end
--         tech.unit.time = 5
--     end
-- end

-- because this doesnt listen in subgroups and im not putting that in final fixes
data.raw["item"]["chemical-plant"].subgroup = "vgal-angels-chemistry-machines"
data.raw["item"]["chemical-plant"].order = "d"
data.raw["item"]["oil-refinery"].subgroup = "vgal-angels-petrochem-machines"
data.raw["item"]["oil-refinery"].order = "a"
data.raw["item"]["offshore-pump"].subgroup = "vgal-angels-water-machines"
data.raw["item"]["offshore-pump"].order = "a"
