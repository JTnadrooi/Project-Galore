-- vgal.recipe.unhide("thermal-water-purification")
-- vgal.tech.add_recipe("vgal-hydrochloric-intermediates", "thermal-water-purification")


data.raw.recipe["angelsore-crystal-mix1-processing"].ingredients = vgal.build.table({
    { "angels-ore1-crystal", 2 },
    { "angels-ore3-crystal", 2 },
})
data.raw.recipe["angelsore-pure-mix1-processing"].ingredients = vgal.build.table({
    { "angels-ore1-pure", 2 },
    { "angels-ore3-pure", 2 },
})

vgal.recipe.set_ingredient_amount("angelsore-pure-mix1-processing", 1)
vgal.recipe.multiply("angelsore-pure-mix1-processing", 2, nil, true)
vgal.recipe.set_ingredient_amount("angelsore-crystal-mix1-processing", 1)

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
data.raw["technology"]["ore-crushing"].prerequisites = { "automation" }
vgal.tech.merge("angels-flare-stack", "basic-chemistry")
table.insert(data.raw["technology"]["water-treatment"].prerequisites, "water-washing-1")

--- lab inputs ---
vgal.table.remove(data.raw["lab"]["lab"].inputs, "token-bio")

--- catalysts ---

data.raw.recipe["catalyst-metal-green"].ingredients = vgal.build.table({
    { "catalyst-metal-carrier", 10 },
    { "angels-ore3",            1 },
})
data.raw.recipe["catalyst-metal-red"].ingredients = vgal.build.table({
    { "catalyst-metal-carrier", 10 },
    { "angels-ore1",            1 },
})

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
data.raw.recipe["angelsore1-crushed-smelting"].energy_required = 6.4
data.raw.recipe["angelsore3-crushed-smelting"].energy_required = 6.4

--- uranium ---
data.raw.recipe["slag-processing-9"].results = vgal.build.table({
    { "uranium-ore", 1, { probability = 0.8 } },
})

--- rocket fuel ---
vgal.recipe.set_ingredient_amount("rocket-fuel", 1)

--- trees ---
vgal.recipe.replace_ingredient("bio-generator-temperate-1", "temperate-tree", "solid-tree")

--- building overrides ---
-- local function angels_building_normalise(building_name)
--     local recipe = data.raw["recipe"][building_name]
--     local to_build = {}

--     for _, ingredient in ipairs(recipe.ingredients) do

--     end
-- end

data.raw["recipe"]["blast-furnace"].ingredients = vgal.build.table({
    { "iron-plate",         10 },
    { "electronic-circuit", 5 },
    { "stone-brick",        20 },
    { "pipe",               12 },
})
data.raw["recipe"]["induction-furnace"].ingredients = vgal.build.table({
    { "iron-plate",         10 },
    { "electronic-circuit", 5 },
    { "iron-gear-wheel",    20 },
    { "stone-brick",        15 },
})
data.raw["recipe"]["casting-machine"].ingredients = vgal.build.table({
    { "iron-gear-wheel", 15 },
    { "pipe",            10 },
    { "stone-brick",     5 },
})
data.raw["recipe"]["strand-casting-machine"].ingredients = vgal.build.table({
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
data.raw["recipe"]["ore-crusher"].ingredients = vgal.build.table({
    { "iron-gear-wheel",    5 },
    { "iron-plate",         10 },
    { "electronic-circuit", 2 },
    { "burner-ore-crusher", 1 },
})
data.raw["recipe"]["ore-sorting-facility"].ingredients = vgal.build.table({
    { "iron-gear-wheel",    20 },
    { "iron-plate",         25 },
    { "electronic-circuit", 6 },
    { "stone-brick",        20 },
})
data.raw["recipe"]["ore-sorting-facility-2"].ingredients = vgal.build.table({
    { "iron-gear-wheel",      25 },
    { "steel-plate",          10 },
    { "electronic-circuit",   15 },
    { "ore-sorting-facility", 1 },
})
data.raw["recipe"]["ore-floatation-cell"].ingredients = vgal.build.table({
    { "pipe",               20 },
    { "steel-plate",        12 },
    { "electronic-circuit", 5 },
})
data.raw["recipe"]["ore-leaching-plant"].ingredients = vgal.build.table({
    { "pipe",             30 },
    { "steel-plate",      15 },
    { "concrete-brick",   10 },
    { "advanced-circuit", 10 },
})
data.raw["recipe"]["ore-refinery"].ingredients = vgal.build.table({
    { "iron-gear-wheel", 50 },
    { "steel-plate",     30 },
    { "concrete-brick",  20 },
    { "processing-unit", 10 },
})
data.raw["recipe"]["thermal-bore"].ingredients = vgal.build.table({
    { "steel-plate", 10 },
    { "pipe",        20 },
    { "pump",        5 },
})
data.raw["recipe"]["thermal-extractor"].ingredients = vgal.build.table({
    { "steel-plate",      25 },
    { "pipe",             20 },
    { "advanced-circuit", 5 },
    { "thermal-bore",     1 },
})
data.raw["recipe"]["filtration-unit"].ingredients = vgal.build.table({
    { "pipe",               20 },
    { "steel-plate",        15 },
    { "electronic-circuit", 5 },
})
data.raw["recipe"]["crystallizer"].ingredients = vgal.build.table({
    { "pipe",               15 },
    { "steel-plate",        20 },
    { "electronic-circuit", 6 },
})
-- petro
data.raw["recipe"]["hydro-plant"].ingredients = vgal.build.table({
    { "pipe",               25 },
    { "iron-plate",         15 },
    { "stone-brick",        10 },
    { "electronic-circuit", 5 },
})
data.raw["recipe"]["salination-plant"].ingredients = vgal.build.table({
    { "pipe",             30 },
    { "steel-plate",      25 },
    { "concrete-brick",   20 },
    { "advanced-circuit", 5 },
})
data.raw["recipe"]["cooling-tower"].ingredients = vgal.build.table({
    { "pipe",        15 },
    { "steel-plate", 10 },
    { "pump",        2 },
})
data.raw["recipe"]["clarifier"].ingredients = vgal.build.table({
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
data.raw["recipe"]["ground-water-pump"].ingredients = vgal.build.table({
    { "pipe",            5 },
    { "iron-gear-wheel", 2 },
    { "stone-brick",     5 },
})
data.raw["recipe"]["seafloor-pump"].ingredients = vgal.build.table({
    { "pipe",            8 },
    { "iron-gear-wheel", 5 },
    { "stone-brick",     10 },
})
data.raw["recipe"]["sea-pump"].ingredients = vgal.build.table({
    { "seafloor-pump",   1 },
    { "iron-gear-wheel", 20 },
    { "concrete-brick",  10 },
    { "steel-plate",     15 },
})
data.raw["recipe"]["sea-pump"].ingredients = vgal.build.table({
    { "seafloor-pump",   1 },
    { "iron-gear-wheel", 20 },
    { "concrete-brick",  10 },
    { "steel-plate",     15 },
})
data.raw["recipe"]["washing-plant"].ingredients = vgal.build.table({
    { "pipe",               20 },
    { "iron-plate",         25 },
    { "electronic-circuit", 5 },
})
data.raw["recipe"]["washing-plant"].ingredients = vgal.build.table({
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
data.raw["recipe"]["liquifier"].ingredients = vgal.build.table({
    { "pipe",               2 },
    { "iron-gear-wheel",    5 },
    { "iron-plate",         10 },
    { "electronic-circuit", 5 },
})
data.raw["recipe"]["liquifier-2"].ingredients = vgal.build.table({
    { "liquifier",          1 },
    { "iron-gear-wheel",    15 },
    { "steel-plate",        10 },
    { "electronic-circuit", 8 },
})
data.raw["recipe"]["angels-chemical-plant"].ingredients = vgal.build.table({
    { "pipe",               5 },
    { "iron-gear-wheel",    5 },
    { "iron-plate",         15 },
    { "electronic-circuit", 5 },
})
data.raw["recipe"]["angels-chemical-plant-2"].ingredients = vgal.build.table({
    { "angels-chemical-plant", 1 },
    { "iron-gear-wheel",       15 },
    { "steel-plate",           10 },
    { "electronic-circuit",    8 },
})
data.raw["recipe"]["advanced-chemical-plant"].ingredients = vgal.build.table({
    { "pipe",               8 },
    { "iron-gear-wheel",    15 },
    { "steel-plate",        25 },
    { "electronic-circuit", 10 },
})
data.raw["recipe"]["advanced-chemical-plant-2"].ingredients = vgal.build.table({
    { "advanced-chemical-plant", 1 },
    { "steel-plate",             25 },
    { "concrete-brick",          20 },
    { "processing-unit",         5 },
})
data.raw["recipe"]["oil-refinery"].ingredients = vgal.build.table({
    { "steel-plate",        15 },
    { "stone-brick",        10 },
    { "pipe",               10 },
    { "electronic-circuit", 10 },
})
data.raw["recipe"]["gas-refinery-small"].ingredients = vgal.build.table({
    { "steel-plate",        10 },
    { "stone-brick",        15 },
    { "pipe",               12 },
    { "electronic-circuit", 10 },
})
data.raw["recipe"]["gas-refinery"].ingredients = vgal.build.table({
    { "steel-plate",      25 },
    { "concrete-brick",   30 },
    { "pipe",             30 },
    { "advanced-circuit", 10 },
})
data.raw["recipe"]["separator"].ingredients = vgal.build.table({
    { "pipe",               10 },
    { "iron-gear-wheel",    5 },
    { "steel-plate",        8 },
    { "electronic-circuit", 5 },
})
data.raw["recipe"]["separator-2"].ingredients = vgal.build.table({
    { "separator",        1 },
    { "concrete-brick",   20 },
    { "steel-plate",      12 },
    { "advanced-circuit", 5 },
})
-- bio
data.raw["recipe"]["crop-farm"].ingredients = vgal.build.table({
    { "stone-brick",        10 },
    { "steel-plate",        10 },
    { "solid-soil",         10 },
    { "electronic-circuit", 2 },
})
data.raw["recipe"]["temperate-farm"].ingredients = vgal.build.table({
    { "concrete-brick",   10 },
    { "solid-soil",       20 },
    { "advanced-circuit", 2 },
    { "crop-farm",        1 },
})
data.raw["recipe"]["desert-farm"].ingredients = vgal.build.table({
    { "concrete-brick",   10 },
    { "solid-sand",       20 },
    { "advanced-circuit", 2 },
    { "crop-farm",        1 },
})
data.raw["recipe"]["swamp-farm"].ingredients = vgal.build.table({
    { "concrete-brick",   10 },
    { "solid-mud",        20 },
    { "advanced-circuit", 2 },
    { "crop-farm",        1 },
})
data.raw["recipe"]["swamp-farm"].ingredients = vgal.build.table({
    { "concrete-brick",   10 },
    { "solid-mud",        20 },
    { "advanced-circuit", 2 },
    { "crop-farm",        1 },
})
data.raw["recipe"]["seed-extractor"].ingredients = vgal.build.table({
    { "iron-gear-wheel",    10 },
    { "steel-plate",        5 },
    { "electronic-circuit", 2 },
})
data.raw["recipe"]["composter"].ingredients = vgal.build.table({
    { "iron-gear-wheel",    10 },
    { "iron-plate",         8 },
    { "electronic-circuit", 2 },
    { "stone-brick",        5 },
})
data.raw["recipe"]["bio-processor"].ingredients = vgal.build.table({
    { "iron-gear-wheel",    10 },
    { "steel-plate",        10 },
    { "electronic-circuit", 5 },
})
data.raw["recipe"]["bio-press"].ingredients = vgal.build.table({
    { "iron-gear-wheel",    12 },
    { "steel-plate",        10 },
    { "electronic-circuit", 2 },
    { "pipe",               5 },
})
data.raw["recipe"]["nutrient-extractor"].ingredients = vgal.build.table({
    { "iron-gear-wheel",    10 },
    { "steel-plate",        10 },
    { "electronic-circuit", 5 },
    { "pipe",               5 },
})
data.raw["recipe"]["algae-farm"].ingredients = vgal.build.table({
    { "stone-brick",        10 },
    { "iron-plate",         15 },
    { "electronic-circuit", 5 },
    { "pipe",               10 },
})
data.raw["recipe"]["algae-farm-2"].ingredients = vgal.build.table({
    { "steel-plate",        15 },
    { "electronic-circuit", 5 },
    { "algae-farm",         1 },
})
data.raw["recipe"]["bio-generator-temperate-1"].ingredients = vgal.build.table({
    { "stone-brick",        10 },
    { "iron-plate",         15 },
    { "electronic-circuit", 5 },
})
data.raw["recipe"]["bio-arboretum-1"].ingredients = vgal.build.table({
    { "stone-brick",        10 },
    { "iron-plate",         15 },
    { "solid-soil",         10 },
    { "electronic-circuit", 5 },
})
data.raw["recipe"]["bio-refugium-fish"].ingredients = vgal.build.table({
    { "steel-plate",        20 },
    { "pipe",               15 },
    { "electronic-circuit", 10 },
})
data.raw["recipe"]["bio-butchery"].ingredients = vgal.build.table({
    { "steel-plate",        10 },
    { "iron-gear-wheel",    12 },
    { "stone-brick",        5 },
    { "electronic-circuit", 2 },
})
data.raw["recipe"]["bio-hatchery"].ingredients = vgal.build.table({
    { "steel-plate",    10 },
    { "concrete-brick", 15 },
    { "small-lamp",     6 },
})
data.raw["recipe"]["bio-refugium-puffer"].ingredients = vgal.build.table({
    { "concrete-brick",   15 },
    { "steel-plate",      20 },
    { "pipe",             15 },
    { "advanced-circuit", 5 },
})
data.raw["recipe"]["bio-refugium-biter"].ingredients = vgal.build.table({
    { "concrete-brick",  15 },
    { "steel-plate",     20 },
    { "pipe",            30 },
    { "processing-unit", 5 },
})

--- algae fix ---
table.insert(data.raw["technology"]["bio-processing-green"].unit.ingredients, { "logistic-science-pack", 1 })
table.insert(data.raw["technology"]["bio-processing-green"].prerequisites, "bio-nutrient-paste")
vgal.tech.move_recipe("bio-processing-green", "water-treatment", "water-mineralized")
