if not mods["maraxsis"] then return end
if data.raw["technology"]["maraxsis-deepsea-research"] then
    vgal.log("maraxsis-deepsea-research tech not found.")
    return
end


local pack_fluids = {
    ["automation-science-pack"] = { "maraxsis-saline-water", 50 },
    ["logistic-science-pack"] = { "maraxsis-brackish-water", 50 },
    ["military-science-pack"] = { "lava", 50 },
    ["chemical-science-pack"] = { "water", 50 },
    ["production-science-pack"] = { "oxygen", 30 },
    ["utility-science-pack"] = { "hydrogen", 60 },
}
local new_recipes = {}
for _, recipe in vgal.data.domain_pairs("vgal", "recipe") do
    ---@diagnostic disable-next-line: param-type-mismatch
    if recipe.name:match("%-science%-pack$") then
        ---@diagnostic disable-next-line: undefined-field
        local result_pack = recipe.results[1].name
        ---@diagnostic disable-next-line: assign-type-mismatch
        local new_recipe = table.deepcopy(recipe)
        if pack_fluids[result_pack] then
            ---@diagnostic disable-next-line: cast-type-mismatch
            ---@cast new_recipe data.RecipePrototype
            local result_amount = new_recipe.results[1].amount
            table.insert(new_recipe.ingredients,
                {
                    type = "fluid",
                    name = pack_fluids[result_pack][1],
                    amount = pack_fluids[result_pack][2] *
                        result_amount
                })

            new_recipe.results[1].amount = result_amount * 2 -- double amounts
            new_recipe.category = "maraxsis-hydro-plant"
            new_recipe.surface_conditions = { {
                property = "pressure",
                min = 400000,
                max = 400000,
            } }
            new_recipe.order = "y"
            local fluid = data.raw["fluid"][pack_fluids[result_pack][1]]
            table.insert(new_recipe.icons,
                { icon = fluid.icon, icon_size = fluid.icon_size, scale = 0.4, shift = { 6, 6 } })

            new_recipe.name = "vgal-maraxsis-deepsea-research-" .. string.sub(new_recipe.name, 6)
            table.insert(new_recipes, new_recipe)
            table.insert(data.raw["technology"]["maraxsis-deepsea-research"].effects,
                { type = "unlock-recipe", recipe = new_recipe.name })
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

data:extend(new_recipes)
for key, _ in pairs(pack_fluids) do
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
if data.raw["recipe"]["vgal-thruster-fuel-thruster-oxidizer-solid-fuel-rocket-fuel"] then
    data.raw["recipe"]["vgal-thruster-fuel-thruster-oxidizer-solid-fuel-rocket-fuel"].category =
    "maraxsis-hydro-plant-or-chemistry"
end
