local function gcd(a, b)
    while b ~= 0 do
        a, b = b, a % b
    end
    return a
end

local function lcm(a, b)
    return (a * b) / gcd(a, b)
end

local function create_with_barrel(recipeName, techName)
    local recipe = data.raw.recipe[recipeName]
    if not recipe or not recipe.ingredients then
        return
    end

    local fluidIngredients = {}
    local nonFluidIngredients = {}

    -- Separate fluid and non-fluid ingredients
    for _, ingredient in ipairs(recipe.ingredients) do
        if ingredient.type == "fluid" then
            if ingredient.amount > 50 or ingredient.amount < 5 then
                return -- Skip recipes with invalid fluid amounts
            end
            table.insert(fluidIngredients, ingredient)
        else
            table.insert(nonFluidIngredients, ingredient)
        end
    end

    if #fluidIngredients == 0 then
        return -- Skip if there are no fluid ingredients
    end

    -- Determine the best multiplier to make results and fluid ingredients fit perfectly
    local multiplier = 1
    for _, fluid in ipairs(fluidIngredients) do
        multiplier = lcm(multiplier, math.ceil(50 / fluid.amount))
    end

    -- Create the new recipe
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
        energy_required = (recipe.energy_required or 1) * multiplier, -- Adjust energy requirement
        ingredients = {},
        results = {},
        allow_productivity = recipe.allow_productivity
    }

    -- Add non-fluid ingredients (scaled by the multiplier)
    for _, ingredient in ipairs(nonFluidIngredients) do
        table.insert(newRecipe.ingredients, {
            type = ingredient.type,
            name = ingredient.name,
            amount = ingredient.amount * multiplier
        })
    end

    -- Add barreled fluid ingredients (correct fluid amount per barrel)
    for _, fluid in ipairs(fluidIngredients) do
        local barrelsRequired = math.ceil(fluid.amount * multiplier / 50) -- One barrel holds 50 fluid units
        table.insert(newRecipe.ingredients, {
            type = "item",
            name = fluid.name .. "-barrel", -- Assumes barreled item name follows this pattern
            amount = barrelsRequired
        })
    end

    -- Add results (scaled by the multiplier)
    for _, result in ipairs(recipe.results or { { type = "item", name = recipeName, amount = 1 } }) do
        table.insert(newRecipe.results, {
            type = result.type,
            name = result.name,
            amount = (result.amount or 1) * multiplier
        })
    end

    -- Add empty barrels to results (correct barrel amount)
    for _, fluid in ipairs(fluidIngredients) do
        local barrelsReturned = math.ceil(fluid.amount * multiplier / 50)
        table.insert(newRecipe.results, {
            type = "item",
            name = "barrel",
            amount = barrelsReturned
        })
    end

    -- Register the new recipe
    data:extend({ newRecipe })

    vgal.tech.add_recipe(techName, newRecipe.name)
end
-- Example usage
create_with_barrel("processing-unit", "processing-unit")
create_with_barrel("electric-engine-unit", "electric-engine")

vgal.data.finalise()


-- {
--     type = "recipe",
--     name = "processing-unit",
--     category = "crafting-with-fluid",
--     enabled = false,
--     energy_required = 10,
--     ingredients =
--     {
--       {type = "item", name = "electronic-circuit", amount = 20},
--       {type = "item", name = "advanced-circuit", amount = 2},
--       {type = "fluid", name = "sulfuric-acid", amount = 5}
--     },
--     results = {{type="item", name="processing-unit", amount=1}},
--     allow_productivity = true
--},

-- {
--     type = "recipe",
--     name = "processing-unit-barreled",
--     category = "crafting-with-fluid",
--     enabled = false,
--     energy_required = 100,
--     ingredients =
--     {
--       {type = "item", name = "electronic-circuit", amount = 200},
--       {type = "item", name = "advanced-circuit", amount = 20},
--       {type = "item", name = "barreled-sulfuric-acid", amount = 1} -- one barrel holds 50 fluid
--     },
--     results = {{type="item", name="processing-unit", amount=10}}, -- AND one empty barrel (empty-barrel, an item)
--     allow_productivity = true
--},
