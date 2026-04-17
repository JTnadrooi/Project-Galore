

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
        { "angels-concrete-brick", 10 },
        { "angels-solid-soil",     20 },
        { "advanced-circuit",      2 },
        { "angels-crop-farm",      1 },
    })
    data.raw["recipe"]["angels-desert-farm"].ingredients = vgal.build.table({
        { "angels-concrete-brick", 10 },
        { "angels-solid-sand",     20 },
        { "advanced-circuit",      2 },
        { "angels-crop-farm",      1 },
    })
    data.raw["recipe"]["angels-swamp-farm"].ingredients = vgal.build.table({
        { "angels-concrete-brick", 10 },
        { "angels-solid-mud",      20 },
        { "advanced-circuit",      2 },
        { "angels-crop-farm",      1 },
    })
    data.raw["recipe"]["angels-swamp-farm"].ingredients = vgal.build.table({
        { "angels-concrete-brick", 10 },
        { "angels-solid-mud",      20 },
        { "advanced-circuit",      2 },
        { "angels-crop-farm",      1 },
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
end

-- use ore2 for more distinct color, but copy rest
for _, ore_state in ipairs(agal.defines.ore_states) do
    data.raw["recipe"]["angels-ore2-" .. ore_state .. "-processing"].results =
        table.deepcopy(data.raw["recipe"]["angels-ore1-" .. ore_state .. "-processing"].results)
end

-- align ore processing
vgal.recipe.replace_ingredient("angels-ore2-crystal", "angels-liquid-hydrofluoric-acid", "angels-liquid-sulfuric-acid")
vgal.recipe.replace_result("angels-ore2-chunk", "angels-water-greenyellow-waste", "angels-water-yellow-waste")

-- remove the alien tokens things
vgal.recipe.all.remove_ingredient("angels-token-bio")
vgal.recipe.all.remove_result("angels-token-bio")

for _, environment in ipairs(agal.defines.environments) do
    vgal.recipe.deephide(environment .. "-garden-b")
    vgal.recipe.deephide(environment .. "-garden-cultivating-a")
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

-- soil crafting speed tweaks
data.raw["recipe"]["angels-solid-soil"].energy_required = 1.5
data.raw["recipe"]["angels-solid-soil-alternative"].energy_required = 1.5

-- commented-bc: the molten concrete recipe gets unlocked way to late.
-- -- concrete fixes (the vanilla recipe is kinda OP)
-- data.raw["recipe"]["concrete"].ingredients = vgal.table.build({}, {
--     { "angels-liquid-molten-concrete", 100 }
-- })
-- vgal.data.trim("angels-concrete")

-- minor angels-concrete tweak.
vgal.recipe.multiply("angels-concrete", 1.25)
data.raw["recipe"]["angels-concrete"].energy_required = 5

-- misc balancing.
data.raw["recipe"]["angels-gas-methanol-from-wood"].show_amount_in_title = false
data.raw["recipe"]["angels-ingot-copper-3"].energy_required = 3
vgal.data.trim("angels-solid-salt-from-saline") -- bc of productivity
data.raw["recipe"]["angels-solid-mud-landfill"].energy_required = 0.5

-- make crushing recipes early early game.
for _, ore_index in ipairs(agal.defines.ore_indexes) do
    vgal.tech.remove_recipe("angels-ore-crushing", "angels-ore" .. ore_index .. "-crushed")
    data.raw["recipe"]["angels-ore" .. ore_index .. "-crushed"].enabled = true
    data.raw["recipe"]["angels-ore" .. ore_index .. "-crushed"].additional_categories = { "angels-manual-crafting" }
end

for _, metal in pairs(vgal.defines.metals) do
    data.raw["recipe"][metal.plate].enabled = true
end

-- restore module recipes as they dont require bioprocessing anymore.
for _, module in ipairs(vgal.defines.modules) do
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

-- remove the stone uncrushing recipe + handle consequences
for _, metal in pairs(vgal.defines.metals) do
    data.raw["recipe"][metal.crushed].results = vgal.build.table({
        { metal.crushed,          2 },
        { "angels-stone-crushed", 1, { probability = 0.5 } },
        { "stone",                1, { probability = 0.25 } },
    })
end

vgal.data.trim("angels-stone-from-crushed-stone")
vgal.data.trim("angels-water-viscous-mud")

-- remove slag sources that aren't smelting (nuclear can stay though, I see slag being generated from that.)
-- just electrolyzing as the alt angels sorting is not with us rn
vgal.recipe.remove_result("angels-dirt-water-separation", "angels-slag")
vgal.recipe.remove_result("angels-dirt-water-separation-2", "angels-slag")

vgal.recipe.add_result("angels-dirt-water-separation", { "angels-solid-sand", 1 })
vgal.recipe.add_result("angels-dirt-water-separation-2", { "angels-solid-sand", 1 })

-- add slag to smelting, more stuff added -> more slag

vgal.recipe.add_result("angels-anode-copper", { "angels-slag", 1 })
vgal.recipe.add_result("angels-ingot-copper-2", { "angels-slag", 1 })

vgal.recipe.add_result("angels-ingot-iron-2", { "angels-slag", 1 })
vgal.recipe.add_result("angels-ingot-iron-3", { "angels-slag", nil, { amount_min = 1, amount_max = 2 } })
