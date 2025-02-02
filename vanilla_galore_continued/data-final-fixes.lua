local function create_with_barrel(recipeName, techName)
    local recipe = data.raw.recipe[recipeName]
    if not recipe or not recipe.ingredients then
        return
    end

    local fluidIngredients = {}
    local nonFluidIngredients = {}


    for _, ingredient in ipairs(recipe.ingredients) do
        if ingredient.type == "fluid" then
            if ingredient.amount > 50 or ingredient.amount < 5 then
                return
            end
            table.insert(fluidIngredients, ingredient)
        else
            table.insert(nonFluidIngredients, ingredient)
        end
    end

    if #fluidIngredients == 0 then
        return
    end

    local multiplier = 1
    for _, fluid in ipairs(fluidIngredients) do
        multiplier = vgal.math.lcm(multiplier, math.ceil(50 / fluid.amount))
    end

    local newRecipe = {
        type = "recipe",
        name = recipeName .. "-from-barreled",
        category = recipe.category or "crafting",
        main_result = recipeName,
        order = vgal.any(recipeName, true).order,
        subgroup = vgal.any(recipeName, true).subgroup,
        enabled = recipe.enabled or false,
        icons = vgal.icon.register {
            vgal.icon.get(recipeName),
        },
        localised_name = { "", { "item-name." .. recipeName }, " from barrel" },
        energy_required = (recipe.energy_required or 1) * multiplier,
        ingredients = {},
        results = {},
        allow_productivity = recipe.allow_productivity
    }

    for _, ingredient in ipairs(nonFluidIngredients) do
        table.insert(newRecipe.ingredients, {
            type = ingredient.type,
            name = ingredient.name,
            amount = ingredient.amount * multiplier
        })
    end

    for _, fluid in ipairs(fluidIngredients) do
        local barrelsRequired = math.ceil(fluid.amount * multiplier / 50)
        table.insert(newRecipe.ingredients, {
            type = "item",
            name = fluid.name .. "-barrel",
            amount = barrelsRequired
        })
    end

    for _, result in ipairs(recipe.results or { { type = "item", name = recipeName, amount = 1 } }) do
        table.insert(newRecipe.results, {
            type = result.type,
            name = result.name,
            amount = (result.amount or 1) * multiplier
        })
    end

    for _, fluid in ipairs(fluidIngredients) do
        local barrelsReturned = math.ceil(fluid.amount * multiplier / 50)
        table.insert(newRecipe.results, {
            type = "item",
            name = "barrel",
            amount = barrelsReturned
        })
    end

    data:extend({ newRecipe })

    vgal.tech.add_recipe(techName, newRecipe.name)
end
-- create_with_barrel("processing-unit", "processing-unit")
-- create_with_barrel("electric-engine-unit", "electric-engine")


if settings.startup["vgal-rocket-parts"].value == true then
    data.raw.item["rocket-part"].hidden = false
    data.raw.recipe["rocket-part"].hidden = false
    data.raw.recipe["rocket-part"].hide_from_player_crafting = false
    data.raw["rocket-silo"]["rocket-silo"].fixed_recipe = nil
end


vgal.data.finalise()