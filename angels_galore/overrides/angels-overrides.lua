--- ore gen removal ---
for _, ore in pairs(agal.constants.REMOVED_ORE_INDEXES) do
    data.raw["resource"][ore] = nil
    data.raw["autoplace-control"][ore] = nil
    data.raw["planet"]["nauvis"].map_gen_settings.autoplace_controls[ore] = nil
    data.raw["planet"]["nauvis"].map_gen_settings.autoplace_settings.entity.settings[ore] = nil
end

for _, preset in pairs(data.raw["map-gen-presets"].default) do
    if preset.basic_settings and preset.basic_settings.autoplace_controls then
        for _, ore in pairs(agal.constants.REMOVED_ORE_INDEXES) do
            preset.basic_settings.autoplace_controls[ore] = nil
        end
    end
end

--- wipe alien samples of the planet !! ---
local alien_sample_tech_names = {}
for _, tech in pairs(data.raw.technology) do
    if tech.unit and tech.unit.ingredients then
        for i, ingredient in ipairs(tech.unit.ingredients) do
            if ingredient[1] == "token-bio" then
                table.remove(tech.unit.ingredients, i)
                table.insert(alien_sample_tech_names, tech.name)
                break;
            end
        end
    end
end

for _, tech_name in ipairs(alien_sample_tech_names) do
    local tech = data.raw["technology"][tech_name]
    local multiplier = 1
    for _, ingredient in ipairs(tech.unit.ingredients) do
        if ingredient[2] ~= 1 then
            multiplier = ingredient[2]
            ingredient[2] = 1
        end
    end
    if multiplier ~= 1 then
        tech.unit.count = multiplier * 40
    end
end

vgal.data.deep_hide(data.raw["tool"]["angels-token-bio"])

--- tech ---
data.raw["technology"]["angels-basic-chemistry"].unit.count = 40
-- vgal.tech.add_prerequisite("ore-refining", "bio-processing-alien-1")

--- fuel ---
data.raw["item"]["angels-coal-crushed"].fuel_value = "2.5MJ"
data.raw["item"]["angels-solid-coke"].fuel_value = "3.5MJ"
data.raw["item"]["angels-pellet-coke"].fuel_value = "18MJ"
data.raw["item"]["solid-fuel"].fuel_value = "12MJ" -- angels changes it
data.raw["item"]["angels-red-cellulose-fiber"].fuel_category = "chemical"
data.raw["item"]["angels-red-cellulose-fiber"].fuel_value = "0.25MJ"
data.raw["item"]["angels-blue-cellulose-fiber"].fuel_category = "chemical"
data.raw["item"]["angels-blue-cellulose-fiber"].fuel_value = "3MJ"

-- vgal.recipe.unhide("thermal-water-purification")
-- vgal.tech.add_recipe("vgal-hydrochloric-intermediates", "thermal-water-purification")

data.raw.recipe["angels-catalyst-metal-green"].ingredients = vgal.build.table({
    { "angels-catalyst-metal-carrier", 10 },
    { "angels-ore3",                   1 },
})
data.raw.recipe["angels-catalyst-metal-red"].ingredients = vgal.build.table({
    { "angels-catalyst-metal-carrier", 10 },
    { "angels-ore2",                   1 },
})

--- upgrade kit removal ---
for _, environment in ipairs(agal.constants.ENVIRONMENTS) do
    vgal.recipe.deep_hide(environment .. "-upgrade")
    local building_recipe = data.raw["recipe"][environment .. "-farm"]
    for i, ingredient in ipairs(building_recipe.ingredients) do
        if ingredient.name == (environment .. "-upgrade") then
            table.remove(building_recipe.ingredients, i)
            break
        end
    end
end

for index, value in ipairs({
    "concrete", "hazard-concrete",
    "refined-concrete", "refined-hazard-concrete",
}) do
    data.raw["item"][value].order = vgal.subgroup.order_from_number(index)
    data.raw["item"][value].subgroup = "vgal-angels-solid-concrete"
end

--- tech ---
data.raw["technology"]["angels-ore-crushing"].prerequisites = { "automation" }
vgal.tech.merge("angels-flare-stack", "angels-basic-chemistry")
table.insert(data.raw["technology"]["angels-water-treatment"].prerequisites, "angels-water-washing-1")

--- lab inputs ---
vgal.table.remove(data.raw["lab"]["lab"].inputs, "angels-token-bio")

--- brick removal (clay/reinforced) ---
vgal.data.trim("angels-reinforced-concrete-brick")
vgal.data.trim("angels-clay-brick")
vgal.data.trim("angels-clay-brick-raw")
vgal.recipe.all.replace_ingredient("angels-reinforced-concrete-brick",
    { type = "item", name = "angels-concrete-brick", amount = 1 })
vgal.recipe.all.replace_ingredient("clay-brick",
    { type = "item", name = "stone-brick", amount = 1 })

--- casting recipe tweaks ---
for _, metal in ipairs(vgal.constants.METALS) do
    data.raw.recipe["angels-" .. metal .. "-pebbles-smelting"].energy_required = 6.4
    data.raw.recipe["angels-" .. metal .. "-nugget-smelting"].energy_required = 6.4

    data.raw.recipe[metal .. "-plate"].energy_required = 9.6
    data.raw.recipe["angels-plate-" .. metal].energy_required = 1
    vgal.recipe.multiply("angels-plate-" .. metal, 1.25)
end

-- for _, ore_index in ipairs(agal.constants.ORE_INDEXES) do
--     data.raw.recipe["angels-ore" .. ore_index .. "-crushed-smelting"].energy_required = 6.4
-- end

data.raw.recipe["angels-plate-steel"].energy_required = 1
vgal.recipe.multiply("angels-plate-steel", 1.25)

--- uranium ---
-- data.raw.recipe["slag-processing-9"].results = vgal.build.table({
--     { "uranium-ore", 1, { probability = 0.8 } },
-- })

--- rocket fuel ---
vgal.recipe.set_ingredient_amount("rocket-fuel", 1)

--- trees ---
vgal.recipe.replace_ingredient("angels-bio-generator-temperate-1", "angels-temperate-tree", "angels-solid-tree")

--- normalize building recipes ---
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
-- data.raw["recipe"]["pellet-press-1"].ingredients = vgal.build.table({
--     { "iron-gear-wheel",    15 },
--     { "pipe",               10 },
--     { "steel-plate",        10 },
--     { "electronic-circuit", 5 },
-- })
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
-- petro
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
-- bio
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

--- use ore2 for more distinct color, but copy rest ---
for _, ore_state in ipairs(agal.constants.ORE_STATES) do
    data.raw["recipe"]["angels-ore2-" .. ore_state .. "-processing"].results =
        table.deepcopy(data.raw["recipe"]["angels-ore1-" .. ore_state .. "-processing"].results)
end

--- algae fix ---
table.insert(data.raw["technology"]["angels-bio-processing-green"].unit.ingredients, { "logistic-science-pack", 1 })
table.insert(data.raw["technology"]["angels-bio-processing-green"].prerequisites, "angels-bio-nutrient-paste")
vgal.tech.move_recipe("angels-bio-processing-green", "angels-water-treatment", "angels-water-mineralized")

--- align ore processing ---
vgal.recipe.replace_ingredient("angels-ore2-crystal", "angels-liquid-hydrofluoric-acid", "angels-liquid-sulfuric-acid")
vgal.recipe.replace_result("angels-ore2-chunk", "angels-water-greenyellow-waste", "angels-water-yellow-waste")

--- align mining time
data.raw["resource"]["angels-ore2"].minable.mining_time = 1
