-- casting recipe tweaks
for _, metal in pairs(vgal.defines.metals) do
    data.raw.recipe[metal.pebbles .. "-smelting"].energy_required = 6.4
    data.raw.recipe[metal.nugget .. "-smelting"].energy_required = 6.4

    data.raw.recipe[metal.plate].energy_required = 9.6
    data.raw.recipe[metal.angels_plate_recipe_name].energy_required = 1
    vgal.recipe.multiply(metal.angels_plate_recipe_name, 1.25)
end

data.raw.recipe["angels-plate-steel"].energy_required = 1
vgal.recipe.multiply("angels-plate-steel", 1.25)

-- add uranium source
-- data.raw.recipe["slag-processing-9"].results = vgal.build.table({
--     { "uranium-ore", 1, { probability = 0.8 } },
-- })

-- buff rocket fuel recipe
vgal.recipe.set_ingredient_amount("rocket-fuel", 1)

-- normalize building recipes
do
    data.raw["recipe"]["angels-blast-furnace"].ingredients = vgal.build.table({
        { "iron-plate",         10 },
        { "electronic-circuit", 5 },
        { "stone-brick",        20 },
        { "pipe",               12 },
    })
    data.raw["recipe"]["angels-induction-furnace"].ingredients = vgal.build.table({
        { "iron-plate",         10 },
        { "electronic-circuit", 5 },
        { "iron-gear-wheel",    20 },
        { "stone-brick",        15 },
    })
    data.raw["recipe"]["angels-chemical-furnace"].ingredients = vgal.build.table({
        { "iron-plate",         10 },
        { "electronic-circuit", 5 },
        { "stone-brick",        15 },
        { "pipe",               20 },
    })
    data.raw["recipe"]["angels-casting-machine"].ingredients = vgal.build.table({
        { "iron-gear-wheel", 15 },
        { "pipe",            10 },
        { "stone-brick",     5 },
    })
    data.raw["recipe"]["angels-strand-casting-machine"].ingredients = vgal.build.table({
        { "iron-gear-wheel",    15 },
        { "pipe",               10 },
        { "steel-plate",        10 },
        { "electronic-circuit", 12 },
    })
    data.raw["recipe"]["angels-ore-crusher"].ingredients = vgal.build.table({
        { "iron-gear-wheel",           5 },
        { "iron-plate",                10 },
        { "electronic-circuit",        2 },
        { "angels-burner-ore-crusher", 1 },
    })
    data.raw["recipe"]["angels-ore-sorting-facility"].ingredients = vgal.build.table({
        { "iron-gear-wheel",    20 },
        { "iron-plate",         25 },
        { "electronic-circuit", 6 },
        { "stone-brick",        20 },
    })
    data.raw["recipe"]["angels-ore-sorting-facility-2"].ingredients = vgal.build.table({
        { "angels-ore-sorting-facility", 1 },
        { "iron-gear-wheel",             25 },
        { "steel-plate",                 10 },
        { "electronic-circuit",          15 },
    })
    data.raw["recipe"]["angels-ore-floatation-cell"].ingredients = vgal.build.table({
        { "pipe",               20 },
        { "steel-plate",        12 },
        { "electronic-circuit", 5 },
    })
    data.raw["recipe"]["angels-ore-leaching-plant"].ingredients = vgal.build.table({
        { "pipe",                  30 },
        { "steel-plate",           15 },
        { "angels-concrete-brick", 10 },
        { "advanced-circuit",      10 },
    })
    data.raw["recipe"]["angels-ore-refinery"].ingredients = vgal.build.table({
        { "iron-gear-wheel",       50 },
        { "steel-plate",           30 },
        { "angels-concrete-brick", 20 },
        { "processing-unit",       10 },
    })
    data.raw["recipe"]["angels-thermal-bore"].ingredients = vgal.build.table({
        { "steel-plate", 10 },
        { "pipe",        20 },
        { "pump",        5 },
    })
    data.raw["recipe"]["angels-thermal-extractor"].ingredients = vgal.build.table({
        { "steel-plate",         25 },
        { "pipe",                20 },
        { "advanced-circuit",    5 },
        { "angels-thermal-bore", 1 },
    })
    data.raw["recipe"]["angels-filtration-unit"].ingredients = vgal.build.table({
        { "pipe",               20 },
        { "steel-plate",        15 },
        { "electronic-circuit", 5 },
    })
    data.raw["recipe"]["angels-crystallizer"].ingredients = vgal.build.table({
        { "pipe",               15 },
        { "steel-plate",        20 },
        { "electronic-circuit", 6 },
    })
    data.raw["recipe"]["angels-ore-processing-machine"].ingredients = vgal.build.table({
        { "stone-brick",     15 },
        { "iron-gear-wheel", 20 },
        { "steel-plate",     10 },
    })
    data.raw["recipe"]["angels-pellet-press"].ingredients = vgal.build.table({
        { "angels-concrete-brick", 12 },
        { "iron-gear-wheel",       30 },
        { "steel-plate",           12 },
    })
    data.raw["recipe"]["angels-powder-mixer"].ingredients = vgal.build.table({
        { "stone-brick",     8 },
        { "iron-gear-wheel", 10 },
        { "steel-plate",     6 },
    })
    data.raw["recipe"]["angels-powderizer"].ingredients = vgal.build.table({
        { "stone-brick",     10 },
        { "iron-gear-wheel", 5 },
        { "steel-plate",     5 },
    })

    -- PETRO
    data.raw["recipe"]["angels-hydro-plant"].ingredients = vgal.build.table({
        { "pipe",               25 },
        { "iron-plate",         15 },
        { "stone-brick",        10 },
        { "electronic-circuit", 5 },
    })
    data.raw["recipe"]["angels-salination-plant"].ingredients = vgal.build.table({
        { "pipe",                  30 },
        { "steel-plate",           25 },
        { "angels-concrete-brick", 20 },
        { "advanced-circuit",      5 },
    })
    data.raw["recipe"]["angels-cooling-tower"].ingredients = vgal.build.table({
        { "pipe",        15 },
        { "steel-plate", 10 },
        { "pump",        2 },
    })
    data.raw["recipe"]["angels-clarifier"].ingredients = vgal.build.table({
        { "pipe",            10 },
        { "iron-gear-wheel", 16 },
        { "iron-plate",      10 },
        { "stone-brick",     15 },
    })
    data.raw["recipe"]["angels-flare-stack"].ingredients = vgal.build.table({
        { "pipe",         12 },
        { "stone-brick",  15 },
        { "copper-cable", 10 },
    })
    data.raw["recipe"]["angels-ground-water-pump"].ingredients = vgal.build.table({
        { "pipe",            5 },
        { "iron-gear-wheel", 2 },
        { "stone-brick",     5 },
    })
    data.raw["recipe"]["angels-seafloor-pump"].ingredients = vgal.build.table({
        { "pipe",            8 },
        { "iron-gear-wheel", 5 },
        { "stone-brick",     10 },
    })
    data.raw["recipe"]["angels-sea-pump"].ingredients = vgal.build.table({
        { "angels-seafloor-pump",  1 },
        { "iron-gear-wheel",       20 },
        { "angels-concrete-brick", 10 },
        { "steel-plate",           15 },
    })
    data.raw["recipe"]["angels-sea-pump"].ingredients = vgal.build.table({
        { "angels-seafloor-pump",  1 },
        { "iron-gear-wheel",       20 },
        { "angels-concrete-brick", 10 },
        { "steel-plate",           15 },
    })
    data.raw["recipe"]["angels-washing-plant"].ingredients = vgal.build.table({
        { "pipe",               20 },
        { "iron-plate",         25 },
        { "electronic-circuit", 5 },
    })
    data.raw["recipe"]["angels-washing-plant"].ingredients = vgal.build.table({
        { "pipe",               20 },
        { "iron-plate",         25 },
        { "electronic-circuit", 5 },
    })
    data.raw["recipe"]["angels-electrolyser"].ingredients = vgal.build.table({
        { "pipe",               10 },
        { "iron-plate",         25 },
        { "electronic-circuit", 5 },
    })
    data.raw["recipe"]["angels-electrolyser-2"].ingredients = vgal.build.table({
        { "angels-electrolyser", 1 },
        { "steel-plate",         20 },
        { "electronic-circuit",  10 },
    })
    data.raw["recipe"]["angels-electric-boiler"].ingredients = vgal.build.table({
        { "boiler",             1 },
        { "electronic-circuit", 5 },
        { "steel-plate",        8 },
        { "copper-plate",       10 },
    })
    data.raw["recipe"]["angels-air-filter"].ingredients = vgal.build.table({
        { "pipe",               8 },
        { "iron-gear-wheel",    10 },
        { "stone-brick",        15 },
        { "electronic-circuit", 5 },
    })
    data.raw["recipe"]["angels-liquifier"].ingredients = vgal.build.table({
        { "pipe",               2 },
        { "iron-gear-wheel",    5 },
        { "iron-plate",         10 },
        { "electronic-circuit", 5 },
    })
    data.raw["recipe"]["angels-liquifier-2"].ingredients = vgal.build.table({
        { "angels-liquifier",   1 },
        { "iron-gear-wheel",    15 },
        { "steel-plate",        10 },
        { "electronic-circuit", 8 },
    })
    data.raw["recipe"]["chemical-plant"].ingredients = vgal.build.table({
        { "pipe",               5 },
        { "iron-gear-wheel",    5 },
        { "iron-plate",         15 },
        { "electronic-circuit", 5 },
    })
    data.raw["recipe"]["angels-chemical-plant-2"].ingredients = vgal.build.table({
        { "chemical-plant",     1 },
        { "iron-gear-wheel",    15 },
        { "steel-plate",        10 },
        { "electronic-circuit", 8 },
    })
    data.raw["recipe"]["angels-advanced-chemical-plant"].ingredients = vgal.build.table({
        { "pipe",               8 },
        { "iron-gear-wheel",    15 },
        { "steel-plate",        25 },
        { "electronic-circuit", 10 },
    })
    data.raw["recipe"]["angels-advanced-chemical-plant-2"].ingredients = vgal.build.table({
        { "angels-advanced-chemical-plant", 1 },
        { "steel-plate",                    25 },
        { "angels-concrete-brick",          20 },
        { "processing-unit",                5 },
    })
    data.raw["recipe"]["oil-refinery"].ingredients = vgal.build.table({
        { "steel-plate",        15 },
        { "stone-brick",        10 },
        { "pipe",               10 },
        { "electronic-circuit", 10 },
    })
    data.raw["recipe"]["angels-gas-refinery-small"].ingredients = vgal.build.table({
        { "steel-plate",        10 },
        { "stone-brick",        15 },
        { "pipe",               12 },
        { "electronic-circuit", 10 },
    })
    data.raw["recipe"]["angels-gas-refinery"].ingredients = vgal.build.table({
        { "steel-plate",           25 },
        { "angels-concrete-brick", 30 },
        { "pipe",                  30 },
        { "advanced-circuit",      10 },
    })
    data.raw["recipe"]["angels-separator"].ingredients = vgal.build.table({
        { "pipe",               10 },
        { "iron-gear-wheel",    5 },
        { "steel-plate",        8 },
        { "electronic-circuit", 5 },
    })
    data.raw["recipe"]["angels-separator-2"].ingredients = vgal.build.table({
        { "angels-separator",      1 },
        { "angels-concrete-brick", 20 },
        { "steel-plate",           12 },
        { "advanced-circuit",      5 },
    })
    data.raw["recipe"]["angels-steam-cracker"].ingredients = vgal.build.table({
        { "pipe",               10 },
        { "iron-gear-wheel",    20 },
        { "steel-plate",        25 },
        { "electronic-circuit", 10 },
    })

    -- BIO
    data.raw["recipe"]["angels-crop-farm"].ingredients = vgal.build.table({
        { "stone-brick",        10 },
        { "steel-plate",        10 },
        { "angels-solid-soil",  10 },
        { "electronic-circuit", 2 },
    })
    data.raw["recipe"]["angels-temperate-farm"].ingredients = vgal.build.table({
        { "angels-concrete-brick",             10 },
        { "angels-solid-soil",                 20 },
        { "angels-solid-alienated-fertilizer", 1 },
        { "advanced-circuit",                  2 },
        { "angels-crop-farm",                  1 },
    })
    data.raw["recipe"]["angels-desert-farm"].ingredients = vgal.build.table({
        { "angels-concrete-brick",             10 },
        { "angels-solid-sand",                 20 },
        { "angels-solid-alienated-fertilizer", 1 },
        { "advanced-circuit",                  2 },
        { "angels-crop-farm",                  1 },
    })
    data.raw["recipe"]["angels-swamp-farm"].ingredients = vgal.build.table({
        { "angels-concrete-brick",             10 },
        { "angels-solid-mud",                  20 },
        { "angels-solid-alienated-fertilizer", 1 },
        { "advanced-circuit",                  2 },
        { "angels-crop-farm",                  1 },
    })
    data.raw["recipe"]["angels-seed-extractor"].ingredients = vgal.build.table({
        { "iron-gear-wheel",    10 },
        { "steel-plate",        5 },
        { "electronic-circuit", 2 },
    })
    data.raw["recipe"]["angels-composter"].ingredients = vgal.build.table({
        { "iron-gear-wheel",    10 },
        { "iron-plate",         8 },
        { "electronic-circuit", 2 },
        { "stone-brick",        5 },
    })
    data.raw["recipe"]["angels-bio-processor"].ingredients = vgal.build.table({
        { "iron-gear-wheel",    10 },
        { "steel-plate",        10 },
        { "electronic-circuit", 5 },
    })
    data.raw["recipe"]["angels-bio-press"].ingredients = vgal.build.table({
        { "iron-gear-wheel",    12 },
        { "steel-plate",        10 },
        { "electronic-circuit", 2 },
        { "pipe",               5 },
    })
    data.raw["recipe"]["angels-nutrient-extractor"].ingredients = vgal.build.table({
        { "iron-gear-wheel",    10 },
        { "steel-plate",        10 },
        { "electronic-circuit", 5 },
        { "pipe",               5 },
    })
    data.raw["recipe"]["angels-algae-farm"].ingredients = vgal.build.table({
        { "stone-brick",        10 },
        { "iron-plate",         15 },
        { "electronic-circuit", 5 },
        { "pipe",               10 },
    })
    data.raw["recipe"]["angels-algae-farm-2"].ingredients = vgal.build.table({
        { "angels-algae-farm",  1 },
        { "steel-plate",        15 },
        { "electronic-circuit", 5 },
    })
    data.raw["recipe"]["angels-bio-generator-temperate-1"].ingredients = vgal.build.table({
        { "stone-brick",        10 },
        { "iron-plate",         15 },
        { "electronic-circuit", 5 },
    })
    data.raw["recipe"]["angels-bio-arboretum-1"].ingredients = vgal.build.table({
        { "stone-brick",        10 },
        { "iron-plate",         15 },
        { "angels-solid-soil",  10 },
        { "electronic-circuit", 5 },
    })
    data.raw["recipe"]["angels-bio-refugium-fish"].ingredients = vgal.build.table({
        { "steel-plate",        20 },
        { "pipe",               15 },
        { "electronic-circuit", 10 },
    })
    data.raw["recipe"]["angels-bio-butchery"].ingredients = vgal.build.table({
        { "steel-plate",        10 },
        { "iron-gear-wheel",    12 },
        { "stone-brick",        5 },
        { "electronic-circuit", 2 },
    })
    data.raw["recipe"]["angels-bio-hatchery"].ingredients = vgal.build.table({
        { "steel-plate",           10 },
        { "angels-concrete-brick", 15 },
        { "small-lamp",            6 },
    })
    data.raw["recipe"]["angels-bio-refugium-puffer"].ingredients = vgal.build.table({
        { "angels-concrete-brick", 15 },
        { "steel-plate",           20 },
        { "pipe",                  15 },
        { "advanced-circuit",      5 },
    })
    data.raw["recipe"]["angels-bio-refugium-biter"].ingredients = vgal.build.table({
        { "angels-concrete-brick", 15 },
        { "steel-plate",           20 },
        { "pipe",                  30 },
        { "processing-unit",       5 },
    })

    -- NUCLEAR
    data.raw["recipe"]["angels-burner-reactor"].ingredients = vgal.build.table({
        { "angels-concrete-brick", 500 },
        { "processing-unit",       500 },
        { "steel-plate",           350 },
        { "copper-plate",          400 },
    })

    -- STORAGE
    data.raw["recipe"]["angels-storage-tank-1"].ingredients = vgal.build.table({
        { "pipe",        50 },
        { "steel-plate", 15 },
        { "stone-brick", 12 },
    })
    data.raw["recipe"]["angels-storage-tank-2"].ingredients = vgal.build.table({
        { "pipe",        30 },
        { "steel-plate", 12 },
        { "stone-brick", 10 },
    })
    data.raw["recipe"]["angels-storage-tank-3"].ingredients = vgal.build.table({
        { "iron-plate",  10 },
        { "steel-plate", 5 },
        { "stone-brick", 5 },
    })
end

-- use ore2 for more distinct color, but copy rest
for _, ore_state in ipairs(agal.defines.ore_states) do
    data.raw["recipe"]["angels-ore2-" .. ore_state .. "-processing"].results =
        table.deepcopy(data.raw["recipe"]["angels-ore1-" .. ore_state .. "-processing"].results)
end

-- restore refining recipes.
local function unhide(name)
    local recipe = data.raw["recipe"][name]
    if recipe then
        recipe.hidden = false
        recipe.hidden_in_factoriopedia = false
    end

    local item = data.raw["item"][name]
    if item then
        item.hidden = false
        item.hidden_in_factoriopedia = false
    end
end

-- unhide nuggets and pebbles.
for _, metal in pairs(vgal.defines.metals) do
    unhide(metal.pebbles)
    -- unhide("angels-" .. metal .. "-pebbles-smelting")
    unhide(metal.nugget)
    -- unhide("angels-" .. metal .. "-nugget-smelting")
    unhide(metal.slag)
    -- unhide("angels-" .. metal .. "-slag-smelting")
    unhide(metal.plate)
end

-- prepare recipe for next loop. (the recipe amount will not apply otherwise)
vgal.recipe.replace_result("angels-ore2-chunk", "angels-water-greenyellow-waste", "angels-water-yellow-waste")

-- the acid change is done in final fixes, it doesn't work otherwise

-- fix ores, both time normalizing as ore density (see docs/ore-density)
for _, ore_index in ipairs(agal.defines.ore_indexes) do
    -- chunk
    data.raw["recipe"]["angels-ore" .. ore_index .. "-chunk"].energy_required = 3.2
    vgal.recipe.set_ingredient_amount("angels-ore" .. ore_index .. "-chunk", 6, "angels-ore" .. ore_index .. "-crushed")
    vgal.recipe.set_result_amount("angels-ore" .. ore_index .. "-chunk", 4, "angels-ore" .. ore_index .. "-chunk")
    vgal.recipe.set_result_amount("angels-ore" .. ore_index .. "-chunk", 50, "angels-water-yellow-waste")

    -- chunk geode removal
    if ore_index == 2 then
        vgal.recipe.set_result_amount("angels-ore" .. ore_index .. "-chunk", 0, "angels-geode-purple")
    else
        vgal.recipe.set_result_amount("angels-ore" .. ore_index .. "-chunk", 0, "angels-geode-yellow")
    end

    -- crystal
    vgal.recipe.set_ingredient_amount("angels-ore" .. ore_index .. "-crystal", 5, "angels-liquid-sulfuric-acid")
    vgal.recipe.set_ingredient_amount("angels-ore" .. ore_index .. "-crystal", 5, "angels-ore" .. ore_index .. "-chunk")
    vgal.recipe.set_result_amount("angels-ore" .. ore_index .. "-crystal", 4, "angels-ore" .. ore_index .. "-crystal")

    -- pure
    vgal.recipe.set_ingredient_amount("angels-ore" .. ore_index .. "-pure", 4, "angels-ore" .. ore_index .. "-crystal")
    vgal.recipe.set_result_amount("angels-ore" .. ore_index .. "-pure", 2, "angels-ore" .. ore_index .. "-pure")

    -- processing
    vgal.recipe.set_ingredient_amount("angels-ore" .. ore_index .. "-chunk-processing", 4,
        "angels-ore" .. ore_index .. "-chunk")
    vgal.recipe.set_ingredient_amount("angels-ore" .. ore_index .. "-crystal-processing", 4,
        "angels-ore" .. ore_index .. "-crystal")
    vgal.recipe.set_ingredient_amount("angels-ore" .. ore_index .. "-pure-processing", 2, -- should be 2.25
        "angels-ore" .. ore_index .. "-pure")
end

-- restore processing recipes.
data.raw["recipe"]["angels-ore3-crushed-processing"].results = vgal.build.table({
    { "iron-ore",            1 },
    { "angels-iron-nugget",  1 },
    { "angels-iron-pebbles", 2 },
})
data.raw["recipe"]["angels-ore3-chunk-processing"].results = vgal.build.table({
    { "iron-ore",            1 },
    { "angels-iron-nugget",  2 },
    { "angels-iron-pebbles", 4 },
})
data.raw["recipe"]["angels-ore3-crystal-processing"].results = vgal.build.table({
    { "iron-ore",            2 },
    { "angels-iron-nugget",  3 },
    { "angels-iron-pebbles", 3 },
    { "angels-iron-slag",    1 },
})
data.raw["recipe"]["angels-ore3-pure-processing"].results = vgal.build.table({
    { "iron-ore",            2 },
    { "angels-iron-nugget",  5 },
    { "angels-iron-pebbles", 3 },
    { "angels-iron-slag",    1 },
})

data.raw["recipe"]["angels-ore2-crushed-processing"].results = vgal.build.table({
    { "copper-ore",           2 },
    { "angels-copper-nugget", 1 },
})
data.raw["recipe"]["angels-ore2-chunk-processing"].results = vgal.build.table({
    { "copper-ore",            2 },
    { "angels-copper-nugget",  2 },
    { "angels-copper-pebbles", 2 },
})
data.raw["recipe"]["angels-ore2-crystal-processing"].results = vgal.build.table({
    { "copper-ore",            4 },
    { "angels-copper-nugget",  2 },
    { "angels-copper-pebbles", 3 },
    { "angels-copper-slag",    1 },
})
data.raw["recipe"]["angels-ore2-pure-processing"].results = vgal.build.table({
    { "copper-ore",            3 },
    { "angels-copper-nugget",  4 },
    { "angels-copper-pebbles", 5 },
    { "angels-copper-slag",    1 },
})

for _, metal in pairs(vgal.defines.metals) do
    data.raw["recipe"][metal.plate].ingredients = vgal.build.table({
        { metal.crushed, 3 }
    })
end

-- remove the alien tokens things
vgal.recipe.all.remove_ingredient("angels-token-bio")
vgal.recipe.all.remove_result("angels-token-bio")

for _, environment in pairs(agal.defines.environments) do
    vgal.recipe.deephide(environment.garden .. "-b")
    vgal.recipe.deephide(environment.garden .. "-cultivating-a")
end

-- buff plastic
vgal.recipe.multiply("angels-solid-plastic", 1.25)

local PLASTIC_MULTIPLIER = 5
vgal.recipe.multiply_results("angels-liquid-plastic", PLASTIC_MULTIPLIER)
vgal.recipe.multiply_results("angels-liquid-plastic-2", PLASTIC_MULTIPLIER)
vgal.recipe.multiply_results("angels-liquid-plastic-3", PLASTIC_MULTIPLIER)
vgal.recipe.set_result_amount("angels-liquid-plastic-bio-1", 80)
vgal.recipe.set_result_amount("angels-liquid-plastic-bio-2", 150)

-- commentedbc: its a pain, and slag should be the result from smelting, not processing
-- -- add slag result to processing recipes.
-- for _, metal in pairs(vgal.defines.metals) do
--     vgal.recipe.multiply(metal.processed, 1.5)
--     vgal.recipe.add_result(metal.processed, vgal.table.to_longform({ "angels-slag", 1, { probability = 0.5 } }, "item"))

--     -- make roll casting faster.
--     data.raw["recipe"][metal.roll].energy_required = 1
-- end

-- remove hand recipes
vgal.data.trim("angels-ore1-crushed-hand")
vgal.data.trim("angels-ore3-crushed-hand")

-- crystal overhaul/restore
vgal.recipe.multiply("angels-crystal-powder-slurry", 10)

-- crafting speed restores
data.raw["recipe"]["angels-liquid-molten-copper"].energy_required = 1
data.raw["recipe"]["angels-liquid-molten-steel"].energy_required = 1
data.raw["recipe"]["angels-liquid-molten-iron"].energy_required = 1

data.raw["recipe"]["angels-air-separation"].energy_required = 1
data.raw["recipe"]["angels-gas-compressed-air"].energy_required = 1

-- remove persentaged results
vgal.recipe.set_result_amount("angels-bio-tile", 2)
vgal.recipe.set_result_amount("angels-alien-goo", 10)

-- soil crafting speed tweaks (buff)
vgal.recipe.multiply("angels-solid-soil", 5)
vgal.recipe.multiply("angels-solid-soil-alternative", 5)
data.raw["recipe"]["angels-solid-soil"].energy_required = 2
data.raw["recipe"]["angels-solid-soil-alternative"].energy_required = 2

-- commented-bc: the molten concrete recipe gets unlocked way to late.
-- -- concrete fixes (the vanilla recipe is kinda OP)
-- data.raw["recipe"]["concrete"].ingredients = vgal.table.build({}, {
--     { "angels-liquid-molten-concrete", 100 }
-- })
-- vgal.data.trim("angels-concrete")


-- reduce crafting times as galore severelly reduces some machine speeds
-- liquifier
data.raw["recipe"]["angels-gas-methanol-from-wood"].energy_required = 5
data.raw["recipe"]["angels-gas-ammonia-from-blue-fiber"].energy_required = 5
data.raw["recipe"]["angels-solid-coke-sulfur"].energy_required = 2
data.raw["recipe"]["angels-gas-carbon-monoxide"].energy_required = 0.5

-- gas refinery
-- all are half duration
data.raw["recipe"]["angels-gas-refining"].energy_required = 3
data.raw["recipe"]["angels-gas-fractioning"].energy_required = 3
data.raw["recipe"]["angels-nutrients-refining-1"].energy_required = 2
data.raw["recipe"]["angels-nutrients-refining-2"].energy_required = 2
data.raw["recipe"]["angels-nutrients-refining-3"].energy_required = 2

-- show_amount_in_title overrides (might move to locale overrides.lua)
data.raw["recipe"]["angels-gas-methanol-from-wood"].show_amount_in_title = false

-- misc balancing.
data.raw["recipe"]["angels-ingot-copper-3"].energy_required = 3
vgal.data.trim("angels-solid-salt-from-saline")                       -- bc of productivity
data.raw["recipe"]["angels-solid-mud-landfill"].energy_required = 0.5 -- to make it inline with vanilla landfill
vgal.recipe.set_result_amount("angels-cellulose-fiber-raw-wood", 6)   -- cellulose fiber fuel value has been reduced as well
vgal.recipe.set_ingredient_amount("angels-wood-pellets", 8)           -- from 12. 1.5 coal != 9 cellulose fiber worth

-- make crushing recipes early early game.
for _, ore_index in ipairs(agal.defines.ore_indexes) do
    vgal.tech.remove_recipe("angels-ore-crushing", "angels-ore" .. ore_index .. "-crushed")
    data.raw["recipe"]["angels-ore" .. ore_index .. "-crushed"].enabled = true
    data.raw["recipe"]["angels-ore" .. ore_index .. "-crushed"].additional_categories = { "angels-manual-crafting" }
end

for _, metal in pairs(vgal.defines.metals) do
    data.raw["recipe"][metal.plate].enabled = true
end

-- restore module recipes as they dont require bioprocessing anymore
for _, module in pairs(vgal.defines.modules) do
    for tier, tiered_name in ipairs(module.tiers) do
        local recipe = data.raw.recipe[tiered_name]

        if tier == 1 then
            recipe.ingredients = vgal.build.table({
                { "electronic-circuit", 5 },
                { "advanced-circuit",   5 },
            })
        elseif tier == 2 then
            recipe.ingredients = vgal.build.table({
                { module.tiers[1],    4 },
                { "advanced-circuit", 5 },
                { "processing-unit",  5 },
            })
        elseif tier == 3 then
            recipe.ingredients = vgal.build.table({
                { module.tiers[2],    4 },
                { "advanced-circuit", 5 },
                { "processing-unit",  5 },
            })
        end
    end
end

-- restore beacon recipes as it doesn't require bioprocessing anymore
vgal.recipe.remove_ingredient("beacon", "angels-crystal-full-harmonic")

-- remove the stone uncrushing recipe
vgal.data.trim("angels-stone-from-crushed-stone")

-- commentedbc: stone as byproduct is repetitive with how you already have slag and crushed stone to deal with
-- for _, metal in pairs(vgal.defines.metals) do
--     data.raw["recipe"][metal.crushed].results = vgal.build.table({
--         { metal.crushed,          2 },
--         { "angels-stone-crushed", 1, { probability = 0.5 } },
--         { "stone",                1, { probability = 0.25 } },
--     })
-- end

-- remove vsicous water recipe as it will break with prod
vgal.data.trim("angels-water-viscous-mud")

-- commentedbc: need stone on demand
-- -- remove slag sources that aren't smelting (nuclear can stay though, I see slag being generated from that.)
-- -- just electrolyzing as the alt angels sorting is not with us rn
-- vgal.recipe.remove_result("angels-dirt-water-separation", "angels-slag")
-- vgal.recipe.remove_result("angels-dirt-water-separation-2", "angels-slag")

-- vgal.recipe.add_result("angels-dirt-water-separation", { "angels-solid-sand", 1 })
-- vgal.recipe.add_result("angels-dirt-water-separation-2", { "angels-solid-sand", 1 })

-- add slag to smelting, more stuff added -> more slag
vgal.recipe.add_result("angels-anode-copper", { "angels-slag", 1 })
vgal.recipe.add_result("angels-ingot-copper-2", { "angels-slag", 1 })

vgal.recipe.add_result("angels-ingot-iron-2", { "angels-slag", 1 })
vgal.recipe.add_result("angels-ingot-iron-3", { "angels-slag", nil, { amount_min = 1, amount_max = 2 } })

-- add clay requirement to pellet pressing
for _, metal in pairs(vgal.defines.metals) do
    vgal.recipe.add_ingredient(metal.pellet, { "angels-solid-clay", 1 })
end

-- commentedbc: just one machine for 1 yellow belt seems a bit to fast
-- -- increase stone to mineral water speed (og: 1)
-- data.raw["recipe"]["angels-water-mineralized"].energy_required = 0.5

-- make angels-stone-crushed recipe default stone crushing recipe (from stone)
data.raw["recipe"]["angels-stone-crushed"].ingredients = vgal.build.table({
    { "stone", 2 },
})
data.raw["recipe"]["angels-stone-crushed"].enabled = true
vgal.tech.remove_recipe("angels-ore-crushing", "angels-stone-crushed")

local function fix_mud_in_washing_recipe(recipe_name)
    -- local recipe = vgal.throw.if_recipe_not_found(recipe_name)

    vgal.recipe.remove_result(recipe_name, "angels-solid-mud")
    -- vgal.recipe.add_result(recipe_name, { type = "item", name = "angels-solid-mud", amount_min = 1, amount_max = 2 })
    vgal.recipe.add_result(recipe_name, { type = "item", name = "angels-solid-mud", amount = 1, probability = 0.75 })
end

fix_mud_in_washing_recipe("angels-water-heavy-mud")
fix_mud_in_washing_recipe("angels-water-concentrated-mud")
fix_mud_in_washing_recipe("angels-water-light-mud")
fix_mud_in_washing_recipe("angels-water-thin-mud")
fix_mud_in_washing_recipe("angels-water-saline")

-- add leafs (?!) to tree sawing recipes
-- vgal.recipe.add_result("angels-wood-sawing-1", { "angels-solid-leafs", 1 }) -- commentedbc: nuh uh, you only get net positive nutrient stuff if u use fancy saws
vgal.recipe.add_result("angels-wood-sawing-2", { "angels-solid-leafs", nil, { amount_min = 0, amount_max = 3 } })
vgal.recipe.add_result("angels-wood-sawing-3", { "angels-solid-leafs", nil, { amount_min = 2, amount_max = 4 } })

-- make default calcium carbonate recipe the limestone one
data.raw["recipe"]["angels-solid-calcium-carbonate"].ingredients = vgal.build.table({
    { "angels-solid-lime", 1 },
}, {
    { "angels-gas-carbon-dioxide", 20 }, -- more that creating lime ouputs, lossy process (can be fixed with prod tho.. I'm allowing it)
})
data.raw["recipe"]["angels-solid-calcium-carbonate"].results = vgal.build.table({
    { "angels-solid-calcium-carbonate", 1 },
})
data.raw["recipe"]["angels-solid-calcium-carbonate"].energy_required = 2
vgal.tech.move_recipe("angels-bio-processing-red", "angels-stone-smelting-1", "angels-solid-calcium-carbonate")

-- normalize alien spores recipe
data.raw["recipe"]["angels-alien-spores"].results = vgal.build.table({
}, {
    { "angels-alien-spores",       20 }, -- prev way more (75)
    { "angels-water-yellow-waste", 80 },
})
-- compensate bacteria recipe a bit (and remove hydrochloric acid ingredient)
data.raw["recipe"]["angels-alien-bacteria"].ingredients = vgal.build.table({
    { "angels-solid-calcium-carbonate", 1 },
}, {
    { "angels-alien-spores", 10 },                              -- prev 50
    { "angels-water-saline", 50 },                              -- a bit more streamlined with how you could be using it from brown algae already for the calcium carbonate
})
data.raw["recipe"]["angels-alien-bacteria"].energy_required = 5 -- prev 3
-- vgal.recipe.set_result_amount("angels-alien-bacteria", 1)

-- nerf alt alien bacteria recipe, even with the other recipe buff its still way to OP
vgal.recipe.set_result_amount("angels-sorting-swamp-5", 1, "angels-alien-bacteria")

-- alien goo recipe tweak
vgal.recipe.multiply("angels-alien-goo", 5)
data.raw["recipe"]["angels-alien-goo"].energy_required = 5

-- increase alien goo needed recipes, as its cheaper now
-- has the side effect of nicer numbers
vgal.recipe.set_ingredient_amount("angels-solid-alienated-fertilizer", 10, "angels-alien-goo") -- prev 5
vgal.recipe.set_ingredient_amount("angels-bio-alien-processed-meat", 5, "angels-alien-goo")    -- prev 2

-- fix cement/concrete recipes
data.raw["recipe"]["angels-solid-cement"].ingredients = vgal.build.table({
    { "angels-stone-crushed", 1 },
    { "angels-solid-lime",    1 },
})
data.raw["recipe"]["angels-solid-cement"].energy_required = 1 -- prev 4 (no one is gonna pave their base if u have to place 1000(~40) powdermixers for like a t1 belt of concrete)
data.raw["recipe"]["concrete"].ingredients = vgal.build.table({
    { "angels-iron-pebbles", 1 },
    { "stone-brick",         5 },
}, {
    { "water", 100 },
})
vgal.recipe.multiply("angels-concrete-brick", 1.25)
data.raw["recipe"]["angels-concrete-brick"].energy_required = 5
vgal.recipe.multiply("angels-concrete", 1.25)
data.raw["recipe"]["angels-concrete"].energy_required = 5

-- buff concrete recipe so its a more.. more? better way to making solid concrete than the vanilla recipe
vgal.recipe.set_result_amount("angels-liquid-concrete", 150)
vgal.recipe.set_ingredient_amount("angels-liquid-concrete", 150, "water")

-- add gem result to ore pure processing
-- (you get way less crystal/ore than in angels (from chunks))
vgal.recipe.add_result("angels-ore2-pure", "angels-geode-yellow")
vgal.recipe.add_result("angels-ore2-pure", { "angels-geode-lightgreen", 1, { probability = 0.08 } })

vgal.recipe.add_result("angels-ore3-pure", "angels-geode-blue")
vgal.recipe.add_result("angels-ore3-pure", { "angels-geode-cyan", 1, { probability = 0.12 } })

-- normalize recipes using crystal slurry
for _, color in ipairs({ "blue", "red", "green" }) do
    for _, tier in ipairs({ "splinter", "shard", "full" }) do
        vgal.recipe.set_ingredient_amount("angels-crystal-" .. tier .. "-" .. color, 5, "angels-crystal-slurry")
    end
end

-- garden overhaul (supported by token removal)
-- remove the garden from nothin' recipe
vgal.data.trim("angels-garden-cultivating")

-- for each environment logic
for _, environment in pairs(agal.defines.environments) do
    -- remove garden duplication recipe
    vgal.data.trim(environment.garden)

    -- add alt seeds recipe
    local seed_recipe = data.raw["recipe"][environment.garden .. "-a"]
    local alt_seeds_ingredients = { { type = "item", name = "angels-filter-ceramic", amount = 1 } }

    local alt_seeds_results = table.deepcopy(seed_recipe.results)
    ---@diagnostic disable-next-line: param-type-mismatch
    table.insert(alt_seeds_results,
        { type = "item", name = "angels-filter-ceramic-used", amount = 1, ignored_by_productivity = 1 } --[[@as data.ItemProductPrototype]])

    local alt_seeds_order = nil
    if environment.name == "temperate" then
        alt_seeds_order = "ca"
    elseif environment.name == "swamp" then
        alt_seeds_order = "cb"
    else -- desert
        alt_seeds_order = "cc"
    end

    local alt_seeds_icons = angelsmods.functions.create_gas_recipe_icon(
        {
            environment.seeds[1],
            environment.seeds[2],
            environment.seeds[3],
        },
        { { 180, 180, 225 }, { 150, 150, 187 }, { 120, 120, 150 } },
        {
            environment.seeds[4],
            environment.seeds[5],
        }
    )

    vgal.data.extend({
        {
            name = environment.name .. "-seeds",
            prefix = "vgal",
            icons = alt_seeds_icons,
            energy_required = 300,
            technology = "angels-gardens",
            raw_ingredients = alt_seeds_ingredients,
            raw_results = alt_seeds_results,
            show_amount_in_title = false,
            order = alt_seeds_order,
            subgroup = "angels-farming-gardens",
            category = "angels-petrochem-air-filtering",
        }
    }, {
        type = "recipe",
    })

    -- buff garden to seeds recipe, so it returns all seeds and is slightly faster
    -- also allow it to be done by the player for some reason
    local recipe = data.raw["recipe"][environment.garden .. "-a"]
    for _, result in ipairs(recipe.results) do
        result.probability = nil
    end
    recipe.energy_required = 100
    recipe.additional_categories = { "angels-manual-crafting" }
end

-- fix ceramic filter recipe
vgal.recipe.replace_ingredient("angels-filter-ceramic", "angels-solid-aluminium-oxide", "angels-solid-lime")

-- tweak atmospheric separation recipe (it will also work better with space age this way, gleba will have the higher ox yield one)
data.raw["recipe"]["angels-air-separation"].results = vgal.build.table({}, {
    { "angels-gas-oxygen",   20 },
    { "angels-gas-nitrogen", 80 },
})
