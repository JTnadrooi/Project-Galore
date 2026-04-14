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
data.raw["item"]["uranium-fuel-cell"].subgroup = "vgal-nuclear-cells"
data.raw["item"]["uranium-fuel-cell"].order = "a"
data.raw["item"]["uranium-238"].subgroup = "vgal-nuclear-rocks"
data.raw["item"]["uranium-238"].order = "a"
data.raw["item"]["uranium-235"].subgroup = "vgal-nuclear-rocks"
data.raw["item"]["uranium-235"].order = "b"

data.raw["recipe"]["nuclear-fuel-reprocessing"].subgroup = "vgal-nuclear-reprocessing"
data.raw["recipe"]["nuclear-fuel-reprocessing"].order = "a"

data.raw["recipe"]["uranium-processing"].subgroup = "vgal-nuclear-processing"
data.raw["recipe"]["uranium-processing"].order = "a"

vgal.subgroup.clean_recipe("uranium-fuel-cell")
