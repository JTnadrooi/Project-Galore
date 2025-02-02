if not mods["maraxsis"] then return end

local packFluids = {
    ["automation-science-pack"] = { "maraxsis-saline-water", 50 },
    ["logistic-science-pack"] = { "maraxsis-brackish-water", 50 },
    ["military-science-pack"] = { "lava", 50 },
    ["chemical-science-pack"] = { "water", 50 },
    ["production-science-pack"] = { "maraxsis-oxygen", 30 },
    ["utility-science-pack"] = { "maraxsis-hydrogen", 60 },
}
local newRecipes = {}
for _, recipe in pairs(vgal.recipes) do
    if recipe.name:match("%-science%-pack$") then
        local resultPack = recipe.results[1].name
        local newRecipe = table.deepcopy(recipe)
        if packFluids[resultPack] then
            ---@cast newRecipe data.RecipePrototype
            local resultAmount = newRecipe.results[1].amount
            table.insert(newRecipe.ingredients,
                { type = "fluid", name = packFluids[resultPack][1], amount = packFluids[resultPack][2] * resultAmount })

            newRecipe.results[1].amount = resultAmount * 2 -- double amounts
            newRecipe.category = "maraxsis-hydro-plant"
            newRecipe.surface_conditions = { {
                property = "pressure",
                min = 400000,
                max = 400000,
            } }
            newRecipe.order = "y"
            local fluid = data.raw["fluid"][packFluids[resultPack][1]]
            table.insert(newRecipe.icons,
                { icon = fluid.icon, icon_size = fluid.icon_size, scale = 0.4, shift = { 6, 6 } })

            newRecipe.name = "vgal-maraxsis-deepsea-research-" .. string.sub(newRecipe.name, 6)
            table.insert(newRecipes, newRecipe)
            table.insert(data.raw["technology"]["maraxsis-deepsea-research"].effects,
                { type = "unlock-recipe", recipe = newRecipe.name })
        end
    elseif recipe.main_product == "electric-engine-unit" or recipe.main_product == "engine-unit" then
        recipe.category = "maraxsis-hydro-plant-or-advanced-crafting"
    elseif recipe.main_product == "chemical-plant" or
        recipe.main_product == "pumpjack" or
        recipe.main_product == "nuclear-reactor" or
        recipe.main_product == "pipe" or
        recipe.main_product == "pipe-to-ground" or
        recipe.main_product == "offshore-pump" or
        recipe.main_product == "pump" then
        recipe.category = "maraxsis-hydro-plant-or-assembling"
    end
end

data:extend(newRecipes)
for key, _ in pairs(packFluids) do
    local recipe = data.raw["recipe"]["maraxsis-deepsea-research-" .. key]
    recipe.subgroup = "vgal-" .. key
    recipe.order = "x"
    recipe.main_product = key
end

local function clean_and_main(recipe_name, main_product)
    local recipe = data.raw["recipe"][recipe_name]
    if recipe then
        recipe.order = nil
        recipe.subgroup = nil
        recipe.main_product = main_product
    end
end

clean_and_main("maraxsis-nutrients-from-tropical-fish", "nutrients")
data.raw["recipe"]["vgal-thruster-fuel-thruster-oxidizer-solid-fuel-rocket-fuel"].category =
"maraxsis-hydro-plant-or-chemistry"
