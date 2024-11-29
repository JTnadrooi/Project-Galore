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
    log("vgal.log-[" .. toLog .. "]")
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

vgal.default_synced_items = {
    -- {
    --     input = "water",
    --     output = "steam",
    --     item_type = "fluid"
    -- },
    -- {
    --     input = "water-purified",
    --     output = "steam",
    --     item_type = "fluid"
    -- },
    {
        input = "catalyst-metal-red",
        output = "catalyst-metal-carrier",
        item_type = "item"
    },
    {
        input = "catalyst-metal-green",
        output = "catalyst-metal-carrier",
        item_type = "item"
    },
    {
        input = "apm_crusher_drums",
        output = "apm_crusher_drums_used",
        item_type = "item"
    },
}
-- vgal.default_synced_items[1]["output"] = "mud"

---@param recipes vgal.VgalRecipe[]
function vgal.data.extend(recipes)
    for _, recipe in ipairs(recipes) do
        if recipe.type and (not (recipe.type == "recipe")) then
            error()
        end

        recipe.complementary_recipe = recipe.complementary_recipe or recipe.dependent_recipe

        if recipe.complementary_recipe then
            local complementary_recipe = data.raw["recipe"][recipe.complementary_recipe]
            recipe.order = recipe.order or complementary_recipe.order
            recipe.subgroup = recipe.subgroup or complementary_recipe.subgroup
            recipe.main_product = recipe.main_product or complementary_recipe.main_product
            local main_product_valid = false
            if recipe.main_product then
                for _, result in ipairs(recipe.results) do
                    if result == recipe.main_product then
                        main_product_valid = true
                    end
                end
            end
            if not main_product_valid then
                recipe.main_product = nil
            end
        end

        if recipe.dependent_recipe then
            local dependent_recipe = data.raw["recipe"][recipe.dependent_recipe]
            recipe.category = recipe.category or dependent_recipe.category
            recipe.results = recipe.results or dependent_recipe.results
            recipe.ingredients = recipe.ingredients or dependent_recipe.ingredients
            recipe.icons = recipe.icons or dependent_recipe.icons
            recipe.energy_required = recipe.energy_required or dependent_recipe.energy_required
            recipe.main_product = recipe.main_product or dependent_recipe.main_product
        end

        recipe.prefix = recipe.prefix or ""

        recipe.tier = recipe.tier == 1 and nil or recipe.tier

        recipe.name = recipe.prefix .. recipe.name .. (recipe.tier and ("-" .. recipe.tier) or "")

        if recipe.icon_method then

        end

        if recipe.technology then
            if recipe.technologies then
                error()
            end
            recipe.technologies = {
                recipe.technology
            }
        end


        recipe.enabled = (recipe.enabled ~= nil) or not recipe.technologies

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

        if not recipe.energy_required then
            error()
        end

        if recipe.synced_items then
            for _, synced_item in ipairs(recipe.synced_items) do
                for _, ingredient in ipairs(recipe.ingredients) do
                    if ingredient.name == synced_item.input and ingredient.type == synced_item.item_type then
                        table.insert(recipe.results,
                            {
                                type = synced_item.item_type,
                                name = synced_item.output,
                                amount = ingredient.amount *
                                    (synced_item.multiplier or 1)
                            })
                    end
                end
            end
        end

        data:extend({ {
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
        } })
        if recipe.technologies then
            for _, tech in ipairs(recipe.technologies) do
                vgal.tech.add_recipe(tech, recipe.name)
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
    for index, value in ipairs(vgal.recipe.toclean) do
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


return vgal
