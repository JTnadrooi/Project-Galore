vgal = vgal or {}

vgal.data = vgal.data or {}
vgal.table = vgal.table or {}
vgal.math = vgal.math or {}
vgal.category = vgal.category or {}
vgal.subgroup = vgal.subgroup or {}
vgal.icon = vgal.icon or {}
vgal.recipe = vgal.recipe or {}
vgal.recipe.all = vgal.recipe.all or {}
vgal.tech = vgal.tech or {}
vgal.item = vgal.item or {}
vgal.fluid = vgal.fluid or {}
vgal.entity = vgal.entity or {}
vgal.locale = vgal.locale or {}
vgal.build = vgal.build or {}

if vgal.setting ~= nil then
    error()
end

require("classes")
require("icon")
require("localise")
require("math")
require("recipe")
require("recipe-all")
require("fluid")
require("subgroup")
require("tech")
require("table")
require("build")

if mods["James-Oil-Processing"] then
    settings.startup["vgal-oil-recipes"].value = false
end

function vgal.log(toLog)
    if settings.startup["vgal-log"].value then
        log("vgal.log-[" .. toLog .. "]")
    end
end

vgal.groups = {
    { "vgal-rocket-parts",            "vgal-rocket-parts" },
    { "vgal-science-packs",           "vgal-science-packs" },
    { "vgal-buildings",               "vgal-buildings" },
    { "vgal-belts",                   "vgal-belts" },
    { "vgal-equipment",               "vgal-equipment" },
    { "vgal-barrels",                 "vgal-barrels" },
    { "vgal-military",                "vgal-military" },
    { "vgal-wood-recipes",            "vgal-wood-recipes" },
    { "vgal-oil-recipes",             "vgal-oil-recipes" },
    { "vgal-renewable-ores",          "vgal-renewable-ores" },
    { "vgal-crushing-recipes",        "vgal-crushing-recipes" },
    { "vgal-ice-recipes",             "vgal-ice-recipes" },
    { "vgal-silly-recipes",           "vgal-silly-recipes" },
    { "vgal-captive-spawner-recipes", "vgal-captive-spawner-recipes" },
    { "vgal-modules",                 "vgal-modules" },

    { "vgal-convoluted-recipes",      "vgal-convoluted" },
    { "vgal-unsure-recipes",          "vgal-unsure" },
    { "vgal-removed-recipes",         "vgal-removed" },
}

-- function vgal.()

-- end

-- local vgalCoreGroups = {
--     "vgal-rocket-parts",
--     "vgal-science-packs",
--     "vgal-buildings",
--     "vgal-belts",
--     "vgal-equipment",
--     "vgal-barrels",
--     "vgal-military",
--     "vgal-wood-recipes",
--     "vgal-oil-recipes",
--     "vgal-renewable-ores",
--     "vgal-crushing-recipes",
--     "vgal-ice-recipes",
--     "vgal-silly-recipes",
--     "vgal-captive-spawner-recipes",
--     "vgal-modules",
-- }

-- for _, value in ipairs(vgalCoreGroups) do

-- end

vgal.enabled_groups = {}
---@type vgal.VgalRecipe[]
vgal.recipes = {}

for _, groupTuple in ipairs(vgal.groups) do
    local key = groupTuple[1]
    if settings.startup[key] and settings.startup[key].value == true then
        vgal.enabled_groups[groupTuple[2]] = true
    end
end
---Register a recipe to the vgal (Vanilla Galore) ecosystem.
---@param itemsToExtend vgal.VgalRecipe[]
---@param args? table
function vgal.data.extend(itemsToExtend, args)
    args = args or {}

    args.groups = vgal.table.ensure(args.group, args.groups)

    for _, item in ipairs(itemsToExtend) do
        item = vgal.table.deep_merge(item, args)
        if item.type ~= "recipe" then
            error(item.name)
        end
        local hidden = false
        item.groups = vgal.table.ensure(item.group, item.groups)
        for _, group in ipairs(item.groups) do
            if not vgal.enabled_groups[group] then
                hidden = true
                break
            end
        end

        item.technologies = vgal.table.ensure(item.technology, item.technologies)

        if item.complementairy_recipe then
            local complementairy_recipe = data.raw["recipe"][item.complementairy_recipe]
            item.order = item.order or complementairy_recipe.order
            item.subgroup = item.subgroup or complementairy_recipe.subgroup
            item.crafting_machine_tint = item.crafting_machine_tint or complementairy_recipe.crafting_machine_tint
        end


        -- if any needed fields are missing this fills them in.
        if item.dependent_recipe then
            local dependent_recipe = data.raw["recipe"][item.dependent_recipe]

            item.category = item.category or dependent_recipe.category
            item.results = item.results or dependent_recipe.results
            item.ingredients = item.ingredients or dependent_recipe.ingredients
            item.icons = item.icons or dependent_recipe.icons
            item.energy_required = item.energy_required or dependent_recipe.energy_required
            item.main_product = item.main_product or dependent_recipe.main_product
            item.order = item.order or dependent_recipe.order
            item.subgroup = item.subgroup or dependent_recipe.subgroup
        end

        -- name components
        item.tier = item.tier == 1 and nil or item.tier
        item.name = vgal.build.name(item.prefix, item.name, item.tier)

        -- tech kinda, real stuff happens later.
        item.enabled = (item.enabled ~= nil) or not item.technologies

        -- null stuff
        item.fluid_ingredients = item.fluid_ingredients or {}
        item.fluid_results = item.fluid_results or {}
        item.ingredients = item.ingredients or {}
        item.results = item.results or {}
        item.module_allows = item.module_allows or {}

        item.hidden = hidden
        item.hidden_in_factoriopedia = hidden
        item.hide_from_player_crafting = hidden
        item.hide_from_signal_gui = hidden
        item.hide_from_stats = hidden

        -- icon stuff
        if item.icon then
            if item.icons then
                error()
            end
            item.icons = {
                {
                    icon = item.icon,
                    icon_size = item.icon_size or 32,
                }
            }
            item.icon = nil
            item.icon_size = nil
        end

        -- validate
        if not item.energy_required then
            error()
        end

        item.ingredients = vgal.build.table(item.ingredients, item.fluid_ingredients)
        item.results = vgal.build.table(item.results, item.fluid_results)

        if not item.main_product then
            ---@diagnostic disable-next-line: undefined-field
            item.main_product = item.results[1].name
        end

        item.allow_productivity = (item.allow_productivity ~= nil) and item.allow_productivity or
            vgal.recipe.get_if_productivity(item.main_product)

        item.crafting_machine_tint = item.crafting_machine_tint
            or vgal.recipe.get_preferred_crafting_machine_tint(item)

        if item.locale_source then
            item.localised_name_source = item.locale_source
            item.localised_description_source = item.locale_source
        end
        if item.localised_name_source then
            item.localised_name = vgal.recipe.get_preferred_localised_name(data.raw["recipe"]
                [item.localised_name_source])
        end
        if item.localised_description_source then
            item.localised_description = vgal.recipe.get_preferred_localised_name(data.raw["recipe"]
                [item.localised_description_source])
        end
        item.localised_name = vgal.recipe.get_preferred_localised_name(item)
        item.localised_description = vgal.recipe.get_preferred_localised_description(item)

        item.type = "recipe"
        item.auto_recycle = false
        item.allow_decomposition = false
        item.allow_as_intermediate = false

        vgal.log("registering: " .. item.name)

        data:extend { item }
        local dataRecipe

        vgal.recipes[item.name] = item

        if item.technologies then
            if type(item.technologies[1]) == "table" then
                for i, preCollection in ipairs(item.technologies) do
                    ---@cast preCollection table

                    local techName = item.name .. "-node" .. i

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
                                    icon = item.icons[1].icon,
                                    icon_size = item.icons[1].icon_size,
                                    scale = 1.5,
                                },
                            })
                    })
                    local tech = data.raw["technology"][techName]

                    tech.vgal_can_remove = true

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
                    tech.localised_name = { "?",
                        { "", "Galore Tech Node: ", { "recipe-name." .. item.name } },
                        { "", "Galore Tech Node: ", vgal.locale.get_lazy(item.main_product) },
                    }
                    tech.localised_description = {
                        "", { "recipe-description." .. item.name },
                    }
                    vgal.tech.add_recipe(techName, item.name)
                    tech.hidden = hidden
                    tech.hidden_in_factoriopedia = hidden
                end
            elseif type(item.technologies[1]) == "string" then
                for _, techName in ipairs(item.technologies) do
                    ---@cast techName string
                    vgal.tech.add_recipe(techName, item.name)
                end
            else
                error()
            end
        end
        if item.productivity_technology ~= "" then -- so if "", no prod even when tech exists
            if data.raw["technology"][item.main_product .. "-productivity"] then
                item.productivity_technology = item.main_product .. "-productivity"
            end
            if item.productivity_technology then
                if type(item.productivity_technology) == "string" then
                    vgal.tech.add_productivity_change(item.productivity_technology, item.name, nil, item.hidden)
                else
                    vgal.tech.add_productivity_change(
                        item.productivity_technology[1],
                        item.name,
                        item.productivity_technology[2],
                        item.hidden
                    )
                end
            end
        end
        ::continue::
    end
end

function vgal.data.trim(recipeName)
    vgal.tech.queue_to_clean(recipeName)
    vgal.recipe.deep_hide(recipeName)
    -- data.raw["recipe"][recipeName] = nil
    -- vgal.recipes[recipeName] = nil
end

function vgal.any(anyName, includeRecipes)
    local categories = { "item", "fluid", "tool", "ammo", "capsule", "module", "repair-tool", "armor",
        "item-with-entity-data",
        "rail-planner" }
    if includeRecipes then
        table.insert(categories, "recipe")
    end
    for _, category in ipairs(categories) do
        if data.raw[category][anyName] then
            return data.raw[category][anyName]
        end
    end
    error("ANY of name '" .. anyName .. "' does not exist")
end

function vgal.any_get_source(anyName, includeRecipes)
    local categories = { "item", "fluid", "tool", "ammo", "capsule", "module", "repair-tool", "armor",
        "item-with-entity-data",
        "rail-planner" }
    if includeRecipes then
        table.insert(categories, "recipe")
    end
    for _, category in ipairs(categories) do
        if data.raw[category][anyName] then
            return category
        end
    end
    error("ANY_SOURCE of name '" .. anyName .. "' does not exist")
end

function vgal.data.finalise()
    local required_techs = {}
    for _, tech in pairs(data.raw["technology"]) do
        for _, p in ipairs(tech.prerequisites or {}) do
            required_techs[p] = true
        end
        if tech.effects and #tech.effects > 0 then
            local i = 1
            while i <= #tech.effects do
                local effect = tech.effects[i]
                for _, toclean in ipairs(vgal.tech.totrim) do
                    if effect.recipe == toclean then
                        should_remove = true
                        effect.hidden = true
                        break
                    end
                end
                i = i + 1
            end
        end
    end
    for _, tech in pairs(data.raw["technology"]) do
        ---@diagnostic disable-next-line: undefined-field
        if tech.effects and #tech.effects == 0 and tech.vgal_can_remove and (not required_techs[tech.name]) then
            tech.hidden = true
            tech.hidden_in_factoriopedia = true
        end
    end
end

return vgal
