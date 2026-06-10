-- add nutrients recipes
local nutrientable_recipe_names = {
    "angels-solid-beans-nutrients",
    "angels-solid-corn-nutrients",
    "angels-solid-nuts-nutrients",
    "angels-solid-pips-nutrients",
    "angels-solid-fruit-nutrients",

    -- no nutrients from meat
    -- also not from leaves/leafs(!), they aren't nutrienty enough
}

for _, nutrientable_recipe_name in ipairs(nutrientable_recipe_names) do
    local nutrientable_recipe = vgal.throw.if_recipe_not_found(nutrientable_recipe_name)
    local ingredient = nutrientable_recipe.ingredients[1]
    local nutrients_count = nutrientable_recipe.results[1].amount * 0.3

    nutrients_count = math.floor(nutrients_count / 10) * 10
    nutrients_count = math.max(nutrients_count, 10)

    vgal.data.extend({
        {
            name = ingredient.name .. "-nutrients",
            prefix = "vgal",
            icons = vgal.icon.register {
                vgal.icon.get("nutrients"),
                vgal.icon.get_in(ingredient.name),
            },
            energy_required = nutrientable_recipe.energy_required * 2,
            technology = "agriculture",
            ingredients = {
                { ingredient.name, ingredient.amount },
            },
            results = {
                { "nutrients", nutrients_count },
            },
            category = "organic",
            additional_categories = { "crafting" }
        },
    }, {
        type = "recipe",
    })
end

for _, plant in pairs(vgal.defines.gleba_plants) do
    vgal.data.extend({
        {
            name = plant.name .. "-" .. plant.seed,
            prefix = "vgal",
            icons = vgal.icon.register {
                vgal.icon.get(plant.seed),
            },
            energy_required = 0.5,
            technology = plant.name,
            ingredients = {
                { plant.dormant_seed, 5 },
            },
            results = {
                { plant.seed, 5 },
                { plant.seed, 1, { probability = 0.05 } },
            },
            category = "angels-seed-extractor",

            order = "a-" .. ((plant.name == "yumako") and "a" or "b")
        },
    }, {
        type = "recipe",
    })
end
