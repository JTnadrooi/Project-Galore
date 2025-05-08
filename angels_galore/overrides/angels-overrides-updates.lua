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
