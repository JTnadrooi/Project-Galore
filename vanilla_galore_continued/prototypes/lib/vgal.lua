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
vgal.localise = vgal.localise or {}
vgal.build = vgal.build or {}

require("classes")
require("icon")
require("localise")
require("math")
require("recipe")
require("subgroup")
require("tech")
require("table")
require("build")

function vgal.log(toLog)
    if settings.startup["vgal-log"].value then
        log("vgal.log-[" .. toLog .. "]")
    end
end

---Register a recipe to the vgal (Vanilla Galore - Continued) ecosystem.
---@param recipes vgal.VgalRecipe[]
function vgal.data.extend(recipes)
    for _, recipe in ipairs(recipes) do
        recipe.groups = recipe.groups or {}
        local exclude = false
        for _, group in ipairs(recipe.groups) do
            if (not settings.startup["vgal-rocket-parts"].value and group == "alternate-rocket-part") or
                (not settings.startup["vgal-analog-circuits"].value and group == "analog-circuit") or
                (not settings.startup["vgal-wood-recipes"].value and group == "wood-recipe") or
                (not settings.startup["vgal-alternate-science"].value and group == "alternate-science") then
                exclude = true
                break
            end
        end
        if exclude then goto continue end


        recipe.technologies = vgal.table.ensure(recipe.technology, recipe.technologies)

        if recipe.complementairy_recipe then
            local complementairy_recipe = data.raw["recipe"][recipe.complementairy_recipe]
            recipe.order = recipe.order or complementairy_recipe.order
            recipe.subgroup = recipe.subgroup or complementairy_recipe.subgroup
        end


        -- if any needed fields are missing this fills them in.
        if recipe.dependent_recipe then
            local dependent_recipe = data.raw["recipe"][recipe.dependent_recipe]
            recipe.category = recipe.category or dependent_recipe.category
            recipe.results = recipe.results or dependent_recipe.results
            recipe.ingredients = recipe.ingredients or dependent_recipe.ingredients
            recipe.icons = recipe.icons or dependent_recipe.icons
            recipe.energy_required = recipe.energy_required or dependent_recipe.energy_required
            recipe.main_product = recipe.main_product or dependent_recipe.main_product
            recipe.order = recipe.order or dependent_recipe.order
            recipe.subgroup = recipe.subgroup or dependent_recipe.subgroup
        end

        -- name components
        recipe.tier = recipe.tier == 1 and nil or recipe.tier
        recipe.name = vgal.build.name(recipe.prefix, recipe.name, recipe.tier)

        -- tech kinda, real stuff happens later.
        recipe.enabled = (recipe.enabled ~= nil) or not recipe.technologies

        -- null stuff
        recipe.fluid_ingredients = recipe.fluid_ingredients or {}
        recipe.fluid_results = recipe.fluid_results or {}
        recipe.ingredients = recipe.ingredients or {}
        recipe.results = recipe.results or {}
        recipe.module_allows = recipe.module_allows or {}

        -- icon stuff
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

        -- inline propetries
        -- recipe.ingredients = vgal.table.get_shorthand(recipe.ingredients, "item")
        -- recipe.results = vgal.table.get_shorthand(recipe.results, "item")
        -- recipe.fluid_ingredients = vgal.table.get_shorthand(recipe.fluid_ingredients, "fluid")
        -- recipe.fluid_results = vgal.table.get_shorthand(recipe.fluid_results, "fluid")

        -- for _, value in pairs(recipe.fluid_ingredients) do
        --     ---@diagnostic disable-next-line: undefined-field
        --     table.insert(recipe.ingredients, { type = "fluid", name = value.name, amount = value.amount })
        -- end
        -- for _, value in pairs(recipe.fluid_results) do
        --     ---@diagnostic disable-next-line: undefined-field
        --     table.insert(recipe.results, { type = "fluid", name = value.name, amount = value.amount })
        -- end

        recipe.ingredients = vgal.build.table(recipe.ingredients, recipe.fluid_ingredients)
        recipe.results = vgal.build.table(recipe.results, recipe.fluid_results)

        if not recipe.main_product then
            ---@diagnostic disable-next-line: undefined-field
            recipe.main_product = recipe.results[1].name
        end

        recipe.allow_productivity = (recipe.allow_productivity ~= nil) and recipe.allow_productivity or
            vgal.recipe.get_if_productivity(recipe.main_product)

        recipe.localised_name = { "?",
            { "", { "recipe-name." .. recipe.name } },
            { "", vgal.localise.get_lazy(recipe.main_product) },
        }
        recipe.localised_description = vgal.localise.get_from_group(recipe)
        recipe.type = "recipe"
        recipe.auto_recycle = false
        recipe.allow_decomposition = false
        recipe.allow_as_intermediate = false

        vgal.log("registering: " .. recipe.name)

        data:extend(
            {
                recipe
            }
        )

        if recipe.technologies then
            if type(recipe.technologies[1]) == "table" then
                for i, preCollection in ipairs(recipe.technologies) do
                    ---@cast preCollection table

                    local techName = recipe.name .. "-node" .. i

                    local eventualUnitsWorth = 0
                    local eventualUnits = {}
                    for _, prerequisite in ipairs(preCollection) do
                        tech = data.raw["technology"][prerequisite]
                        units = vgal.tech.extract_units(tech)
                        unitsWorth = vgal.table.sum(units)
                        if unitsWorth > eventualUnitsWorth then
                            eventualUnits = units
                            eventualUnitsWorth = unitsWorth
                        end
                    end

                    data:extend({
                        vgal.tech.create_empty(techName, 1, eventualUnits, #eventualUnits * 5,
                            #eventualUnits >= 4 and 30 or 15, preCollection,
                            "a", {
                                {
                                    icon = "__vanilla_galore_continued__/graphics/" .. "node.png",
                                    icon_size = 256,
                                },
                                {
                                    icon = recipe.icons[1].icon,
                                    icon_size = recipe.icons[1].icon_size,
                                    scale = 1.5,
                                },
                            })
                    })
                    local tech = data.raw["technology"][techName]

                    local pureTrigger = true
                    for _, pre in ipairs(preCollection) do
                        if data.raw["technology"][pre].research_trigger == nil then
                            pureTrigger = false
                        end
                    end
                    if pureTrigger then
                        tech.research_trigger = data.raw["technology"][preCollection[1]].research_trigger
                        tech.unit = nil
                    end
                    data.raw.technology[techName].localised_name = { "?",
                        { "", "Galore Tech Node: ", { "recipe-name." .. recipe.name } },
                        { "", "Galore Tech Node: ", vgal.localise.get_lazy(recipe.main_product) },
                    }
                    data.raw.technology[techName].localised_description = {
                        "", { "recipe-description." .. recipe.name },
                    }
                    vgal.tech.add_recipe(techName, recipe.name)
                    ---@diagnostic disable-next-line: param-type-mismatch
                end
            elseif type(recipe.technologies[1]) == "string" then
                for _, techName in ipairs(recipe.technologies) do
                    ---@cast techName string
                    vgal.tech.add_recipe(techName, recipe.name)
                end
            else
                error()
            end
        end
        if recipe.productivity_technology ~= "" then
            if data.raw["technology"][recipe.main_product .. "-productivity"] then
                recipe.productivity_technology = recipe.main_product .. "-productivity"
            end
            if recipe.productivity_technology then
                if type(recipe.productivity_technology) == "string" then
                    vgal.tech.add_productivity_change(recipe.productivity_technology, recipe.name)
                else
                    vgal.tech.add_productivity_change(
                        recipe.productivity_technology[1],
                        recipe.name,
                        recipe.productivity_technology[2]
                    )
                end
            end
        end


        ::continue::
    end
end

function vgal.data.trim(recipeName)
    vgal.tech.queue_to_clean(recipeName)
    data.raw["recipe"][recipeName] = nil
end

function vgal.any(anyName, includeRecipes)
    local categories = { "item", "tool", "fluid", "ammo", "capsule", "module", "repair-tool", "item-with-entity-data",
    "rail-planner" }
    if includeRecipes then
        table.insert(categories, "recipe")
    end
    for _, category in ipairs(categories) do
        if data.raw[category][anyName] then
            return data.raw[category][anyName]
        end
    end
    error("item '" .. anyName .. "' does not exist")
end

function vgal.data.finalise()
    local potential_singles = {}
    for _, tech in pairs(data.raw["technology"]) do
        if tech.effects and #tech.effects > 0 then
            local i = 1
            while i <= #tech.effects do
                local effect = tech.effects[i]
                local should_remove = false
                for _, toclean in ipairs(vgal.tech.totrim) do
                    if effect.recipe == toclean then
                        should_remove = true
                        break
                    end
                end
                if should_remove then
                    table.remove(tech.effects, i)
                else
                    i = i + 1
                end
            end
        end
        if tech.effects and #tech.effects == 0 then
            table.insert(potential_singles, tech.name)
        end
    end
end

return vgal
