vgal = {}

vgal.data = vgal.data or {}
vgal.table = vgal.table or {}
vgal.math = vgal.math or {}
vgal.category = vgal.category or {}
vgal.subgroup = vgal.subgroup or {}
vgal.icon = vgal.icon or {}
vgal.recipe = vgal.recipe or {}
vgal.tech = vgal.tech or {}
vgal.item = vgal.item or {}
vgal.fluid = vgal.fluid or {}
vgal.entity = vgal.entity or {}
vgal.any = vgal.any or {}


function vgal.log(toLog)
    if settings.startup["vgal-log"].value then
        log("vgal.log-[" .. toLog .. "]")
    end
end

function vgal.get_tier_tint(tier)
    if tier == 1 then
        return { a = 1, b = 88 / 255, g = 204 / 255, r = 119 / 255 } -- #58cc77
    end
    if tier == 2 then
        return { a = 1, b = 84 / 255, g = 208 / 255, r = 222 / 255 } -- #54d0de
    end
    if tier == 3 then
        return { a = 1, b = 250 / 255, g = 120 / 255, r = 194 / 255 } -- #fa78c2
    end
    if tier == 4 then
        return { a = 1, b = 250 / 255, g = 120 / 255, r = 130 / 255 } -- #fa7885
    end
    if tier == 5 then
        return { a = 1, b = 215 / 255, g = 250 / 255, r = 120 / 255 } -- #d7fa78
    end
    if tier == 6 then
        -- return { a = 1, b = 0.5, g = 0.5, r = 0.5 }
    end
    return { a = 1, b = 0.5, g = 0.5, r = 0.5 }
end

function normalizeSync(single, multiple)
    if single then
        if multiple then
            error("'single' and 'multiple' set at the same time.")
        end
        return { single }
    end
    return multiple
end

function shortHand(inTable, newType)
    local transformed = {}
    for _, item in ipairs(inTable) do
        if item[3] then
            table.insert(transformed, { type = newType, name = item[1], amount = item[2], probability = item[3] })
        elseif item[4] then
            table.insert(transformed, { type = newType, name = item[1], amount = item[2], probability = item[3], amount_min=item[4], amount_max=item[5] })
        else
            table.insert(transformed, { type = newType, name = item[1], amount = item[2] })
        end
    end
    return transformed
end

---Register a recipe to the vgal (Vanilla Galore - Continued) ecosystem.
---@param recipes vgal.VgalRecipe[]
function vgal.data.extend(recipes)
    for _, recipe in ipairs(recipes) do

        recipe.technologies = normalizeSync(recipe.technology, recipe.technologies)

        -- if any needed fields are missing this fills them in.
        if recipe.dependent_recipe then
            local dependent_recipe = data.raw["recipe"][recipe.dependent_recipe]
            recipe.category = recipe.category or dependent_recipe.category
            recipe.results = recipe.results or dependent_recipe.results
            recipe.ingredients = recipe.ingredients or dependent_recipe.ingredients
            recipe.icons = recipe.icons or dependent_recipe.icons
            recipe.energy_required = recipe.energy_required or dependent_recipe.energy_required
            recipe.main_product = recipe.main_product or dependent_recipe.main_product
        end

        -- name components
        recipe.tier = recipe.tier == 1 and nil or recipe.tier
        recipe.name = (recipe.prefix and (recipe.prefix .. "-") or "") .. recipe.name .. (recipe.tier and ("-" .. recipe.tier) or "")

        -- name components
        recipe.enabled = (recipe.enabled ~= nil) or not recipe.technologies

        -- null stuff
        recipe.fluid_ingredients = recipe.fluid_ingredients or {}
        recipe.fluid_results = recipe.fluid_results or {}
        recipe.ingredients = recipe.ingredients or {}
        recipe.results = recipe.results or {}

        -- name components
        if recipe.icon then
            if recipe.icons then
                error()
            end
            recipe.icons = {
                {
                    icon = recipe.icon,
                    icon_size = recipe.icon_size or 32,
                }
            }
            recipe.icon = nil
            recipe.icon_size = nil
        end

        -- validate
        if not recipe.energy_required then
            error()
        end
        recipe.ingredients = shortHand(recipe.ingredients, "item")
        recipe.results = shortHand(recipe.results, "item")
        
        recipe.fluid_ingredients = shortHand(recipe.fluid_ingredients, "fluid")
        recipe.fluid_results = shortHand(recipe.fluid_results, "fluid")

        for _, value in pairs(recipe.fluid_ingredients) do
            table.insert(recipe.ingredients, { type = "fluid", name = value.name, amount = value.amount })
        end
        for _, value in pairs(recipe.fluid_results) do
            table.insert(recipe.results, { type = "fluid", name = value.name, amount = value.amount })
        end

        if not recipe.main_product then
            recipe.main_product = recipe.results[1].name
        end

        vgal.log("registering: " .. recipe.name)

        data:extend(
            {
                {
                    type = "recipe",
                    name = recipe.name,
                    enabled = recipe.enabled,

                    icons = recipe.icons,

                    energy_required = recipe.energy_required,
                    ingredients = recipe.ingredients,
                    results = recipe.results,
                    category = recipe.category,

                    subgroup = recipe.subgroup,
                    order = recipe.order,
                    main_product = recipe.main_product,
                    -- localised_name = { "item-name." .. recipe.main_product, " x" .. recipe.results[1].amount },
                    -- localised_name = { "item-name." .. recipe.main_product },
                    localised_name = nil,
                    -- localised_name = { "", { "item-name.iron-plate" }, ": ", tostring(60) }
                },
            }
        )

        if recipe.technologies then
            if type(recipe.technologies[1]) == "table" then
                for i, preColl in ipairs(recipe.technologies) do
                    local techName = recipe.name .. "-tech" .. i
                    data:extend({
                        vgal.tech.create_empty(techName, 1, { 1, 2, 3 }, 100, 30, preColl, "a", recipe.icons)
                    })
                    vgal.tech.add_recipe(techName, recipe.name)
                    ---@diagnostic disable-next-line: param-type-mismatch
                    -- for _, prereq in ipairs(preColl) do
                    --     vgal.tech.add_prerequisite(techName, prereq)
                    -- end
                end



            elseif type(recipe.technologies[1]) == "string" then
                for _, tech in ipairs(recipe.technologies) do
                    vgal.tech.add_recipe(tech, recipe.name)
                end
            else
                error()
            end
        end
    end
end

function vgal.finalize()
    --if(vgal.recipe.toclean["ore-crusher"]) then error("aaa") end
    -- if(toclean and toclean["ore-crusher"] ~= nil) then error("aaa") end
    -- if(toclean and contains(toclean, "ore-crusher")) then error("aaa") end
    for _, recipe in pairs(data.raw["recipe"]) do
        if vgal.recipe.has_item(recipe.name, "vgal-invalid-item") or
            recipe.category == "vgal-invalid-category" then
            vgal.recipe.queue_to_clean(recipe.name)
        end
    end
    for _, tech in pairs(data.raw["technology"]) do
        if tech.prerequisites then
            local new_prerequisites = {}
            for _, prerequisite in ipairs(tech.prerequisites) do
                if (data.raw["technology"][prerequisite].hidden == true) or (vgal.table.slow_contains(vgal.tech.toclean, prerequisite or "plsnoonepickthisname")) then

                else
                    table.insert(new_prerequisites, prerequisite)
                end
            end
        end

        if tech.effects then
            local new_effects = {}
            for _, effect in pairs(tech.effects) do
                if vgal.table.slow_contains(vgal.recipe.toclean, effect.recipe or "vgal") then
                    --    if effect.recipe and (string.starts(effect.recipe or "notvgalxd", "vgal-") or (vgal.table.slow_contains(vgal.recipe.toclean, effect.recipe or "plsnoonepickthisname")))  then
                    --if effect.recipe and data.raw["recipe"][effect.recipe] and data.raw["recipe"][effect.recipe].hidden then

                    if data.raw["recipe"][effect.recipe] then
                        vgal.recipe.hide(effect.recipe)
                        --data.raw["recipe"][effect.recipe] = nil
                    end
                else
                    table.insert(new_effects, effect)
                end
            end
            tech.effects = new_effects
        end
    end
    for _, value in ipairs(vgal.recipe.toclean) do
        if data.raw["recipe"][value] then
            vgal.recipe.hide(value)
            --data.raw["recipe"][value] = nil
            if string.find(value, "angels-ore2") then
                --error("A")
            end
            data.raw["recipe"][value].enabled = false
        end

        --vgal.recipe.toclean[index] = nil

        -- data.raw["recipe"][value] = nil
        -- vgal.recipe.toclean[index] = nil
    end
end

require("classes")
require("table")
require("math")
require("subgroup")
require("icon")
require("recipe")
require("tech")
require("category")
require("item")
require("fluid")
require("entity")

data:extend(
    {
        {
            type = "recipe",
            name = "vgal-petroleum-gas-heavy-oil",
            category = "oil-processing",
            energy_required = 2,
            ingredients = {
                { type = "item",  name = "coal",          amount = 1 },
                { type = "fluid", name = "petroleum-gas", amount = 20 },
            },
            results = {
                { type = "fluid", name = "heavy-oil", amount = 30 },
            },
            icons = vgal.icon.register {
                vgal.icon.get("heavy-oil", "fluid"),
                vgal.icon.get_in("petroleum-gas", "fluid"),
            },
            subgroup = data.raw.fluid["heavy-oil"].subgroup,
            order = data.raw.fluid["heavy-oil"].order,
            
            enabled = false
        },
    }
)

return vgal
