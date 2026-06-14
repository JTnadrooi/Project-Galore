vgal.recipe.replace_ingredient("explosives", "water", "angels-water-purified")

-- trim unsavable recipes
vgal.data.trim("vgal-petroleum-gas-rocket-fuel")
vgal.data.trim("vgal-plastic-bar-lubricant")
vgal.data.trim("vgal-coal-sulfur")
vgal.data.trim("vgal-steam-sulfur")
vgal.data.trim("vgal-steam-concrete")
vgal.data.trim("vgal-iron-stick-concrete")
vgal.data.trim("vgal-copper-cable-plastic-bar")

-- trim out-of-place-ified recipes
vgal.data.trim("vgal-coal-uranium-235-nuclear-fuel")
vgal.data.trim("vgal-low-density-structure-uranium-fuel-cell")

-- wood circuits too OP
vgal.data.trim("vgal-wood-electronic-circuit")
vgal.data.trim("vgal-wood-heavy-oil-electronic-circuit")

if settings.startup["vgal-remove-steel-intermediate-crafting"].value then
    vgal.data.trim("vgal-steel-plate-iron-gear-wheel")
    vgal.data.trim("vgal-steel-plate-iron-stick")
end

vgal.recipe.replace_ingredient("vgal-bulk-inserter-chemical-science-pack", "angels-gas-methane", "angels-gas-methanol")
vgal.recipe.set_ingredient_amount("vgal-bulk-inserter-chemical-science-pack", 180, "angels-gas-methanol")

-- casting recipe tweaks
for _, metal in pairs(vgal.defines.metals) do
    data.raw.recipe[metal.pebbles .. "-smelting"].energy_required = 6.4
    data.raw.recipe[metal.nugget .. "-smelting"].energy_required = 6.4

    data.raw.recipe[metal.plate].energy_required = 9.6
    data.raw.recipe[metal.angels_plate_recipe_name].energy_required = 2
    vgal.recipe.multiply(metal.angels_plate_recipe_name, 1.25)

    data.raw.recipe[metal.roll].energy_required = 1
end

data.raw.recipe["angels-plate-steel"].energy_required = 2
vgal.recipe.multiply("angels-plate-steel", 1.25)

data.raw.recipe["angels-roll-steel"].energy_required = 1

vgal.recipe.replace_ingredient("nuclear-fuel", "rocket-fuel", "angels-rocket-fuel-capsule")
vgal.recipe.replace_ingredient("angels-nuclear-fuel", "rocket-fuel", "angels-rocket-fuel-capsule")
vgal.recipe.replace_ingredient("angels-nuclear-fuel-2", "rocket-fuel", "angels-rocket-fuel-capsule")

-- normalize building recipes
do
    data.raw["recipe"]["angels-blast-furnace"].ingredients = vgal.build.table({
        { "iron-plate",         10 },
        { "electronic-circuit", 5 },
        { "stone-brick",        20 },
        { "pipe",               12 },
    })
    data.raw["recipe"]["angels-sintering-oven"].ingredients = vgal.build.table({
        { "steel-plate",        12 },
        { "electronic-circuit", 5 },
        { "stone-brick",        20 },
        { "pipe",               5 },
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
        { "pipe",             30 },
        { "steel-plate",      15 },
        { "concrete",         10 },
        { "advanced-circuit", 10 },
    })
    data.raw["recipe"]["angels-ore-refinery"].ingredients = vgal.build.table({
        { "iron-gear-wheel",  50 },
        { "steel-plate",      30 },
        { "refined-concrete", 35 },
        { "processing-unit",  10 },
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
        { "concrete",        12 },
        { "iron-gear-wheel", 30 },
        { "steel-plate",     12 },
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
        { "pipe",             30 },
        { "steel-plate",      25 },
        { "concrete",         20 },
        { "advanced-circuit", 5 },
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
        { "angels-seafloor-pump", 1 },
        { "iron-gear-wheel",      20 },
        { "concrete",             10 },
        { "steel-plate",          15 },
    })
    data.raw["recipe"]["angels-sea-pump"].ingredients = vgal.build.table({
        { "angels-seafloor-pump", 1 },
        { "iron-gear-wheel",      20 },
        { "concrete",             10 },
        { "steel-plate",          15 },
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
        { "concrete",                       20 },
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
        { "steel-plate",      25 },
        { "concrete",         30 },
        { "pipe",             30 },
        { "advanced-circuit", 10 },
    })
    data.raw["recipe"]["angels-separator"].ingredients = vgal.build.table({
        { "pipe",               10 },
        { "iron-gear-wheel",    5 },
        { "steel-plate",        8 },
        { "electronic-circuit", 5 },
    })
    data.raw["recipe"]["angels-separator-2"].ingredients = vgal.build.table({
        { "angels-separator", 1 },
        { "concrete",         20 },
        { "steel-plate",      12 },
        { "advanced-circuit", 5 },
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
        { "concrete",                          10 },
        { "angels-solid-soil",                 20 },
        { "angels-solid-alienated-fertilizer", 1 },
        { "advanced-circuit",                  2 },
        { "angels-crop-farm",                  1 },
    })
    data.raw["recipe"]["angels-desert-farm"].ingredients = vgal.build.table({
        { "concrete",                          10 },
        { "angels-solid-sand",                 20 },
        { "angels-solid-alienated-fertilizer", 1 },
        { "advanced-circuit",                  2 },
        { "angels-crop-farm",                  1 },
    })
    data.raw["recipe"]["angels-swamp-farm"].ingredients = vgal.build.table({
        { "concrete",                          10 },
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
        { "steel-plate", 10 },
        { "concrete",    15 },
        { "small-lamp",  6 },
    })
    data.raw["recipe"]["angels-bio-refugium-puffer"].ingredients = vgal.build.table({
        { "concrete",         15 },
        { "steel-plate",      20 },
        { "pipe",             15 },
        { "advanced-circuit", 5 },
    })
    data.raw["recipe"]["angels-bio-refugium-biter"].ingredients = vgal.build.table({
        { "concrete",        15 },
        { "steel-plate",     20 },
        { "pipe",            30 },
        { "processing-unit", 5 },
    })

    -- NUCLEAR
    data.raw["recipe"]["angels-burner-reactor"].ingredients = vgal.build.table({
        { "concrete",        500 },
        { "processing-unit", 500 },
        { "steel-plate",     350 },
        { "copper-plate",    400 },
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
for _, ore_state in ipairs(vgal.defines.ore_states) do
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

-- fix ores
for _, metal in pairs(vgal.defines.metals) do
    data.raw["recipe"][metal.chunk].energy_required = 1
    data.raw["recipe"][metal.crystal].energy_required = 0.5
    data.raw["recipe"][metal.pure].energy_required = 0.5

    -- sulfur tweaks
    vgal.recipe.set_result_amount(metal.chunk, 25, "angels-water-yellow-waste")
    vgal.recipe.set_ingredient_amount(metal.chunk, 25, "angels-water-purified")
    vgal.recipe.set_ingredient_amount(metal.crystal, 10, "sulfuric-acid")

    -- geode tweaks
    if metal.name == "copper" then
        vgal.recipe.remove_result(metal.chunk, "angels-geode-purple")
        vgal.recipe.add_result(metal.pure, "angels-geode-yellow")
        vgal.recipe.add_result(metal.pure, { "angels-crystal-dust", 1, { probability = 0.20 } })
    else
        vgal.recipe.remove_result(metal.chunk, "angels-geode-yellow")
        vgal.recipe.add_result(metal.pure, "angels-geode-blue")
        vgal.recipe.add_result(metal.pure, { "angels-crystal-dust", 1, { probability = 0.25 } })
    end

    -- tiny buff
    vgal.recipe.set_ingredient_amount(metal.pure .. "-processing", 8, metal.pure) -- og: 9

    -- make it so the sorting recipes take longer the higher tier they are
    -- except pure
    data.raw["recipe"][metal.chunk .. "-processing"].energy_required = 2   -- og: 1.5
    data.raw["recipe"][metal.crystal .. "-processing"].energy_required = 3 -- og: 2
    data.raw["recipe"][metal.pure .. "-processing"].energy_required = 3    -- og: 2
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

for _, environment in pairs(vgal.defines.environments) do
    vgal.recipe.deephide(environment.garden .. "-b")
    vgal.recipe.deephide(environment.garden .. "-cultivating-a")
end

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
data.raw["recipe"]["angels-gas-carbon-monoxide"].energy_required = 1

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
for _, ore_index in ipairs(vgal.defines.ore_indexes) do
    vgal.tech.remove_recipe("angels-ore-crushing", "angels-ore" .. ore_index .. "-crushed")
    data.raw["recipe"]["angels-ore" .. ore_index .. "-crushed"].enabled = true
    data.raw["recipe"]["angels-ore" .. ore_index .. "-crushed"].additional_categories = { "angels-manual-crafting" }
end

for _, metal in pairs(vgal.defines.metals) do
    data.raw["recipe"][metal.plate].enabled = true
end

-- restore module recipes as they dont require bioprocessing anymore
if mods["bobmodules"] then
    local module_data_store = {
        { "speed",            "blue" },
        { "efficiency",       "green" },
        { "productivity",     "red" },
        { "pollution-clean",  "harmonic" },
        { "pollution-create", "harmonic" },
    }

    if mods["quality"] then
        table.insert(module_data_store, { "quality", "harmonic" })
    end

    for _, module_data in ipairs(module_data_store) do
        vgal.recipe.remove_ingredient("bob-" .. module_data[1] .. "-processor",
            "angels-crystal-splinter-" .. module_data[2])
        vgal.recipe.remove_ingredient("bob-" .. module_data[1] .. "-processor-2",
            "angels-crystal-shard-" .. module_data[2])
        vgal.recipe.remove_ingredient("bob-" .. module_data[1] .. "-processor-3",
            "angels-crystal-full-" .. module_data[2])
    end
else
    local module_data_store = {
        { "speed",        "blue" },
        { "efficiency",   "green" },
        { "productivity", "red" },
    }

    if mods["quality"] then
        table.insert(module_data_store, { "quality", "harmonic" })
    end

    for _, module_data in ipairs(module_data_store) do
        vgal.recipe.remove_ingredient(module_data[1] .. "-module",
            "angels-crystal-splinter-" .. module_data[2])
        vgal.recipe.remove_ingredient(module_data[1] .. "-module-2",
            "angels-crystal-shard-" .. module_data[2])
        vgal.recipe.remove_ingredient(module_data[1] .. "-module-3",
            "angels-crystal-full-" .. module_data[2])
    end
end

-- restore beacon recipes as it doesn't require bioprocessing anymore
-- bob modules does some other stuff ofc
if mods["bobmodules"] then
    vgal.recipe.remove_ingredient("beacon", "angels-crystal-splinter-harmonic")
    vgal.recipe.remove_ingredient("bob-beacon-2", "angels-crystal-shard-harmonic")
    vgal.recipe.remove_ingredient("bob-beacon-3", "angels-crystal-full-harmonic")
else
    vgal.recipe.remove_ingredient("beacon", "angels-crystal-full-harmonic")
end

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

-- reduce salt needed for sodium recipe as salt is more expensive now
vgal.recipe.set_ingredient_amount("angels-solid-salt-separation", 5, "angels-solid-salt")

-- commentedbc: just one machine for 1 yellow belt seems a bit to fast
-- -- increase stone to mineral water speed (og: 1)
-- data.raw["recipe"]["angels-water-mineralized"].energy_required = 0.5

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
    { "angels-water-yellow-waste", 80, { allow_productivity = false } },
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
for _, environment in pairs(vgal.defines.environments) do
    -- remove garden duplication recipe
    vgal.data.trim(environment.garden)

    -- add alt seeds recipe
    local seed_recipe = data.raw["recipe"][environment.garden .. "-a"]
    local alt_seeds_ingredients = { { type = "item", name = "angels-filter-coal", amount = 1 } }

    local alt_seeds_results = table.deepcopy(seed_recipe.results)
    ---@diagnostic disable-next-line: param-type-mismatch
    table.insert(alt_seeds_results,
        { type = "item", name = "angels-filter-frame", amount = 1, ignored_by_productivity = 1 } --[[@as data.ItemProductPrototype]])

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
            allow_productivity = false,
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
vgal.recipe.replace_ingredient("angels-filter-ceramic", "angels-solid-aluminium-oxide", "angels-clay-brick")

-- tweak atmospheric separation recipe (it will also work better with space age this way, gleba will have the higher ox yield one)
data.raw["recipe"]["angels-air-separation"].results = vgal.build.table({}, {
    { "angels-gas-oxygen",   20 },
    { "angels-gas-nitrogen", 80 },
})

-- press coke pellet in pellet press
data.raw["recipe"]["angels-pellet-coke"].category = "angels-pellet-pressing"

-- buff sodium carbonate from algae recipe so it can compete with the other recipes
data.raw["recipe"]["angels-algae-brown-burning-wash"].ingredients = vgal.build.table({
    { "angels-algae-brown", 6 },
}, {
    { "angels-water-purified", 20 },
})
data.raw["recipe"]["angels-algae-brown-burning-wash"].energy_required = 3

-- make filter recipes faster (og's: 4 to 8)
data.raw["recipe"]["angels-liquid-raw-vegetable-oil-filtering-1"].energy_required = 2
data.raw["recipe"]["angels-liquid-raw-vegetable-oil-filtering-2"].energy_required = 2
data.raw["recipe"]["angels-liquid-raw-fish-oil-filtering-1"].energy_required = 2
data.raw["recipe"]["angels-liquid-raw-fish-oil-filtering-2"].energy_required = 2

-- make puffer atm faster
-- also helps with machine buffers as puffers get going
data.raw["recipe"]["angels-gas-puffer-atmosphere"].energy_required = 4 -- og: 30

-- commentedbc: wrong, the buff above fixes most issues
-- buff waste puffing
-- its unsure if the non-sulfuric waste puffing recipes need this as most waste is still unobtainable as of writing this, but I buff them all for consistency reasons
-- all og; 100
-- vgal.recipe.set_result_amount("angels-puffer-puffing-12", 200, "angels-gas-hydrogen-sulfide")
-- vgal.recipe.set_result_amount("angels-puffer-puffing-13", 200, "angels-gas-ammonia")
-- vgal.recipe.set_result_amount("angels-puffer-puffing-14", 200, "angels-gas-hydrogen-fluoride")
-- vgal.recipe.set_result_amount("angels-puffer-puffing-15", 200, "angels-gas-hydrogen-chloride")

-- commentedbc: I should spread the buff over ingredients instead of being lazy
-- commentedbc2: I need my spreadsheet
-- -- buff explosive recipes
-- vgal.recipe.set_result_amount("angels-solid-nitroglycerin", 10, "explosives")
-- vgal.recipe.set_result_amount("angels-solid-trinitrotoluene", 8, "explosives")

-- solid fuel cost fixes
vgal.recipe.set_result_amount("angels-solid-fuel-methane", 4)
vgal.recipe.set_result_amount("angels-solid-fuel-naphtha", 4)
vgal.recipe.set_result_amount("angels-solid-fuel-fuel-oil", 4)
vgal.recipe.set_result_amount("angels-solid-fuel-synthesis", 4)
-- vgal.recipe.set_result_amount("angels-solid-fuel-hydrazine", 5)

vgal.data.trim("angels-solid-fuel-hydrazine") -- It could not be saved with the how new rocket fuel recipe is a way better use of hydrazine and unlocks at about the same time

-- make fish to oil recipes faster
data.raw["recipe"]["angels-fish-pressing-0"].energy_required = 6
data.raw["recipe"]["angels-fish-pressing-1"].energy_required = 4
data.raw["recipe"]["angels-fish-pressing-2"].energy_required = 3
data.raw["recipe"]["angels-fish-pressing-3"].energy_required = 2

-- nerf saline water recipes
-- also helps nerf desert plants
-- 100% chance I will add "better" alternative recipes tho
vgal.recipe.set_result_amount("angels-water-saline-from-water", 250)
vgal.recipe.set_result_amount("angels-solid-salt", 2)

-- make metal solution recipes more suitable for voiding
for _, metal in pairs(vgal.defines.metals) do
    data.raw.recipe[metal.solution].energy_required = 1
    data.raw.recipe[metal.solution].ingredients = vgal.build.table({
        { metal.pebbles, 6 },
    }, {
        { "angels-water-purified", 60 },
        { "angels-gas-chlorine",   15 },
    })
    vgal.recipe.set_result_amount(metal.solution, 60)
    data.raw.recipe[metal.solution].category = "chemistry"
end

-- make slag from crushed stone use slightly less sulfuric acid
vgal.recipe.set_ingredient_amount("angels-stone-crushed-dissolution", 10, "sulfuric-acid")

-- make sulfuric acid chain recipes faster
-- done to compensate overral slower chem/liquifier speeds
data.raw["recipe"]["angels-liquid-sulfuric-acid"].energy_required = 1 -- og; 2
data.raw["recipe"]["angels-gas-sulfur-dioxide"].energy_required = 1   -- og; 2

-- make washing recipes faster
-- also done to compensate + washing plant will get more uses, and I don't want bases to be 50% washing plants
for _, water_name in ipairs({
    "angels-water-heavy-mud",
    "angels-water-concentrated-mud",
    "angels-water-light-mud",
    "angels-water-thin-mud",
    "angels-water-saline",
}) do
    data.raw["recipe"][water_name].energy_required = 3 -- og; 5

    -- buff mud yield a bit (past prod, so fix that)
    data.raw["recipe"][water_name].results = vgal.build.table({
        { "angels-solid-mud", nil, { amount_min = 1, amount_max = 2 } },
    }, {
        { water_name, 200, { allow_productivity = false } }
    })
end
data.raw["recipe"]["angels-solid-clay"].energy_required = 3      -- og; 5
data.raw["recipe"]["angels-solid-limestone"].energy_required = 2 -- og; 5
data.raw["recipe"]["angels-solid-sand"].energy_required = 1      -- og; 5

-- but also reduce sand yield a bit
vgal.recipe.set_result_amount("angels-solid-sand", 3) -- og; 5

-- buff fermentation base fermentation recipes
vgal.recipe.set_result_amount("angels-liquid-acetic-acid", 80, "angels-liquid-acetic-acid")
vgal.recipe.set_result_amount("angels-gas-ethanol", 100, "angels-gas-ethanol")

-- make catalyst frame casting faster, usefull for when quickly stocking up builds on catalyst carriers
data.raw["recipe"]["angels-catalyst-metal-carrier"].energy_required = 1

-- nerf coal cracking
-- commetedbc; rember og OG:
-- data.raw["recipe"]["angels-coal-cracking-1"].results = vgal.build.table({ -- ingredients value: 30
--     { "angels-solid-coke", 6 },                                           -- 30
-- }, {
--     { "angels-gas-hydrogen-sulfide", 50 },                                -- 30
--     { "angels-gas-benzene",          30 },                                -- 15
--     { "angels-gas-methane",          70 },                                -- 35
-- })
-- nerfed:
data.raw["recipe"]["angels-coal-cracking-1"].results = vgal.build.table({ -- ingredients value: 30
    { "angels-solid-coke", 4 },
}, {
    { "angels-gas-hydrogen-sulfide", 25 },
    { "angels-gas-benzene",          20 },
    { "angels-gas-methane",          40 },
})

-- more coal nerfs
data.raw["recipe"]["angels-coal-cracking-2"].results = vgal.build.table({ -- ingredients value: 30
    { "angels-solid-coke",             4 },
    { "angels-catalyst-metal-carrier", 1 },
}, {
    { "angels-liquid-naphtha",     40 }, -- og 60
    { "angels-liquid-ngl",         30 },
    { "angels-liquid-mineral-oil", 15 }, -- og 20
})

-- the third cracking recipe is kinda inefficient (for syngas) so it can stay as is

-- improve ratio a bit
data.raw["recipe"]["angels-fermentation-corn"].energy_required = 3 -- og; 4

-- bio tile changes
data.raw["recipe"]["angels-bio-tile"].ingredients = vgal.build.table({
    { "angels-solid-soil",     5 },
    { "angels-concrete-brick", 1 },
    -- { "angels-alienated-fertilizer", 1 },
})
data.raw["recipe"]["angels-bio-tile"].energy_required = 5
vgal.recipe.set_result_amount("angels-bio-tile", 1)

-- liquid concrete recipe fixes
data.raw["recipe"]["angels-liquid-concrete"].ingredients = vgal.build.table({
    { "angels-slag",         1 },
    { "angels-solid-cement", 2 },
    -- { "angels-alienated-fertilizer", 1 },
}, {
    { "water", 40 }
})
data.raw["recipe"]["angels-liquid-concrete"].energy_required = 2
vgal.recipe.set_result_amount("angels-liquid-concrete", 40)
