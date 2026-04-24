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
data.raw["item"]["chemical-plant"].subgroup = "vgal-chemistry-machines"
data.raw["item"]["chemical-plant"].order = "d"
data.raw["item"]["oil-refinery"].subgroup = "vgal-petrochem-machines"
data.raw["item"]["oil-refinery"].order = "a"
data.raw["item"]["offshore-pump"].subgroup = "vgal-water-machines"
data.raw["item"]["offshore-pump"].order = "a"
data.raw["item"]["uranium-fuel-cell"].subgroup = "vgal-nuclear-cells"
data.raw["item"]["uranium-fuel-cell"].order = "a"
data.raw["item"]["depleted-uranium-fuel-cell"].subgroup = "vgal-nuclear-depleted-cells"
data.raw["item"]["depleted-uranium-fuel-cell"].order = "a"
data.raw["item"]["uranium-238"].subgroup = "vgal-nuclear-rocks"
data.raw["item"]["uranium-238"].order = "a"
data.raw["item"]["uranium-235"].subgroup = "vgal-nuclear-rocks"
data.raw["item"]["uranium-235"].order = "b"
data.raw["item"]["nuclear-fuel"].subgroup = "vgal-fuel-t2"
data.raw["item"]["nuclear-fuel"].order = "a"
vgal.subgroup.clean_recipe("nuclear-fuel")
vgal.subgroup.clean_recipe("vgal-coal-uranium-235-nuclear-fuel")
data.raw["item"]["explosives"].subgroup = "vgal-explosives"
data.raw["item"]["explosives"].order = "a"
data.raw["capsule"]["cliff-explosives"].subgroup = "vgal-explosives"
data.raw["capsule"]["cliff-explosives"].order = "b"
vgal.subgroup.clean_recipe("explosives")
vgal.subgroup.clean_recipe("cliff-explosives")
data.raw["item"]["sulfur"].subgroup = "vgal-petrochem-other-solids"
data.raw["item"]["sulfur"].order = "a"
data.raw["item"]["stone"].subgroup = "vgal-stone"
data.raw["item"]["stone"].order = "a"
data.raw["item"]["landfill"].subgroup = "vgal-solid-concrete"
data.raw["item"]["landfill"].order = "a"
data.raw["item"]["copper-cable"].subgroup = "vgal-basic-intermediate-products"
data.raw["item"]["copper-cable"].order = "p"

for metal in vgal.table.iter_all(vgal.defines.metals, { agal.defines.metal_steel }) do
    data.raw["item"][metal.plate].subgroup = "vgal-" .. metal.name .. "-casting"
    data.raw["item"][metal.plate].order = "c"

    if metal.name ~= "steel" then
        data.raw["item"][metal.ore].subgroup = "vgal-" .. metal.name .. "-sorting-results"
        data.raw["item"][metal.ore].order = "a"
        data.raw["item"][metal.pebbles].subgroup = "vgal-" .. metal.name .. "-sorting-results"
        data.raw["item"][metal.pebbles].order = "b"
        data.raw["item"][metal.nugget].subgroup = "vgal-" .. metal.name .. "-sorting-results"
        data.raw["item"][metal.nugget].order = "c"
        data.raw["item"][metal.slag].subgroup = "vgal-" .. metal.name .. "-sorting-results"
        data.raw["item"][metal.slag].order = "d"
    end
end

data.raw["item"]["concrete"].order = "b"
data.raw["item"]["hazard-concrete"].order = "c"
data.raw["item"]["refined-concrete"].order = "d"
data.raw["item"]["refined-hazard-concrete"].order = "e"

data.raw["recipe"]["nuclear-fuel-reprocessing"].subgroup = "vgal-nuclear-reprocessing"
data.raw["recipe"]["nuclear-fuel-reprocessing"].order = "a"

data.raw["recipe"]["uranium-processing"].subgroup = "vgal-nuclear-processing"
data.raw["recipe"]["uranium-processing"].order = "a"

vgal.subgroup.clean_recipe("uranium-fuel-cell")
vgal.subgroup.clean_recipe("landfill")
vgal.subgroup.clean_recipe("angels-solid-mud-landfill")
