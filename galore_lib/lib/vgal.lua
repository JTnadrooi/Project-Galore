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

---@type vgal.VgalRecipePrototype[]
vgal.recipes = {}
---@type vgal.VgalToggleGroupPrototype[]
vgal.groups = {}
vgal.productivity_entries = {}


-- for _, groupTuple in ipairs(vgal.groups) do
--     local key = groupTuple[1]
--     if settings.startup[key] and settings.startup[key].value == true then
--         vgal.enabled_groups[groupTuple[2]] = true
--     end
-- end
---Register a entry to the vgal (Vanilla Galore) ecosystem.
---@param entriesToExtend vgal.VgalRecipePrototype[]|vgal.VgalToggleGroupPrototype[]
---@param fillInWith? vgal.VgalRecipePrototype|vgal.VgalToggleGroupPrototype
function vgal.data.extend(entriesToExtend, fillInWith)
    fillInWith = fillInWith or {}

    fillInWith.groups = vgal.table.ensure(fillInWith.group, fillInWith.groups)

    for _, entry in ipairs(entriesToExtend) do
        entry = vgal.table.fill_in_from(entry, fillInWith)

        if entry.type == "recipe" then
            ---@cast entry vgal.VgalRecipePrototype
            local hidden = false
            entry.groups = vgal.table.ensure(entry.group, entry.groups)
            for _, group in ipairs(entry.groups) do
                if not vgal.groups[group] then
                    error("group with name " .. group .. " does not exist")
                end
                if not vgal.groups[group].enabled then
                    hidden = true
                    break
                end
            end

            entry.technologies = vgal.table.ensure(entry.technology, entry.technologies)

            if entry.complementairy_recipe then
                local complementairy_recipe = data.raw["recipe"][entry.complementairy_recipe]
                entry.order = entry.order or complementairy_recipe.order
                entry.subgroup = entry.subgroup or complementairy_recipe.subgroup
                entry.crafting_machine_tint = entry.crafting_machine_tint or complementairy_recipe.crafting_machine_tint
            end

            -- if any needed fields are missing this fills them in.
            if entry.dependent_recipe then
                local dependent_recipe = data.raw["recipe"][entry.dependent_recipe]

                entry.category = entry.category or dependent_recipe.category
                entry.results = entry.results or dependent_recipe.results
                entry.ingredients = entry.ingredients or dependent_recipe.ingredients
                entry.icons = entry.icons or dependent_recipe.icons
                entry.energy_required = entry.energy_required or dependent_recipe.energy_required
                entry.main_product = entry.main_product or dependent_recipe.main_product
                entry.order = entry.order or dependent_recipe.order
                entry.subgroup = entry.subgroup or dependent_recipe.subgroup
            end

            -- name components
            entry.tier = entry.tier == 1 and nil or entry.tier
            entry.name = vgal.build.name(entry.prefix, entry.name, entry.tier)

            -- tech kinda, real stuff happens later.
            entry.enabled = (entry.enabled ~= nil) or not entry.technologies

            -- null stuff
            entry.fluid_ingredients = entry.fluid_ingredients or {}
            entry.fluid_results = entry.fluid_results or {}
            entry.ingredients = entry.ingredients or {}
            entry.results = entry.results or {}
            entry.module_allows = entry.module_allows or {}

            entry.hidden = hidden
            entry.hidden_in_factoriopedia = hidden
            entry.hide_from_player_crafting = hidden
            entry.hide_from_signal_gui = hidden
            entry.hide_from_stats = hidden

            -- icon stuff
            if entry.icon then
                if entry.icons then
                    error()
                end
                entry.icons = {
                    {
                        icon = entry.icon,
                        icon_size = entry.icon_size or 32,
                    }
                }
                entry.icon = nil
                entry.icon_size = nil
            end

            -- validate
            if not entry.energy_required then
                error()
            end

            entry.ingredients = vgal.build.table(entry.ingredients, entry.fluid_ingredients)
            entry.results = vgal.build.table(entry.results, entry.fluid_results)

            if not entry.main_product then
                ---@diagnostic disable-next-line: undefined-field
                entry.main_product = entry.results[1].name
            end

            entry.allow_productivity = (entry.allow_productivity ~= nil) and entry.allow_productivity or
                vgal.recipe.get_if_productivity(entry.main_product)

            entry.crafting_machine_tint = entry.crafting_machine_tint
                or vgal.recipe.get_preferred_crafting_machine_tint(entry)

            if entry.locale_source then
                entry.localised_name_source = entry.locale_source
                entry.localised_description_source = entry.locale_source
            end
            if entry.localised_name_source then
                entry.localised_name = vgal.recipe.get_preferred_localised_name(data.raw["recipe"]
                    [entry.localised_name_source])
            end
            if entry.localised_description_source then
                entry.localised_description = vgal.recipe.get_preferred_localised_description(data.raw["recipe"]
                    [entry.localised_description_source])
            end
            entry.localised_name = vgal.recipe.get_preferred_localised_name(entry)
            entry.localised_description = vgal.recipe.get_preferred_localised_description(entry)

            entry.type = "recipe"
            entry.auto_recycle = false
            entry.allow_decomposition = false
            entry.allow_as_intermediate = false

            vgal.log("registering: " .. entry.name)

            ---@diagnostic disable-next-line: assign-type-mismatch
            data:extend { entry }
            vgal.recipes[entry.name] = entry

            if entry.technologies then
                if type(entry.technologies[1]) == "table" then
                    for i, preCollection in ipairs(entry.technologies) do
                        ---@cast preCollection table

                        local techName = entry.name .. "-node" .. i

                        local eventualUnitsWorth = 0
                        local eventualUnits = {}
                        for _, prerequisite in ipairs(preCollection) do
                            local tech = data.raw["technology"][prerequisite]

                            local units = vgal.tech.extract_units(tech)
                            local unitsWorth = vgal.tech.get_units_worth(units)
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
                                        icon = entry.icons[1].icon,
                                        icon_size = entry.icons[1].icon_size,
                                        scale = 2.2,
                                    },
                                    {
                                        icon = "__galore_lib__/graphics/node.png",
                                        icon_size = 256,
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
                            { "", { "vgal-internal.tech-node" }, ": ", { "recipe-name." .. entry.name } },
                            { "", { "vgal-internal.tech-node" }, ": ", vgal.locale.get_lazy(entry.main_product) },
                        }
                        tech.localised_description = {
                            "", { "recipe-description." .. entry.name },
                        }
                        vgal.tech.add_recipe(techName, entry.name)
                        tech.hidden = hidden
                        tech.hidden_in_factoriopedia = hidden
                    end
                elseif type(entry.technologies[1]) == "string" then
                    for _, techName in ipairs(entry.technologies) do
                        ---@cast techName string
                        vgal.tech.add_recipe(techName, entry.name)
                    end
                else
                    error()
                end
            end
            if entry.productivity_technology ~= "" then -- so if "", no prod even when tech exists
                entry.productivity_technology = entry.productivity_technology or vgal.recipe.get_productivity_tech_name(
                    entry.main_product)
                if entry.productivity_technology then
                    if type(entry.productivity_technology) == "string" then
                        vgal.tech.add_productivity_change(entry.productivity_technology, entry.name, nil, entry.hidden)
                    else
                        vgal.tech.add_productivity_change(
                            entry.productivity_technology[1],
                            entry.name,
                            entry.productivity_technology[2],
                            entry.hidden
                        )
                    end
                end
            end
        elseif entry.type == "toggle-group" then
            ---@cast entry vgal.VgalToggleGroupPrototype
            ---@

            if entry.enabled == nil then
                if entry.enabled_setting then
                    ---@diagnostic disable-next-line: assign-type-mismatch
                    entry.enabled = settings.startup[entry.enabled_setting].value
                else
                    ---@diagnostic disable-next-line: assign-type-mismatch
                    entry.enabled = settings.startup[entry.name].value
                end
            end

            -- entry.enabled = true
            vgal.groups[entry.name] = entry
        else
            error(entry.name)
        end
    end
end

function vgal.data.trim(recipeName)
    vgal.tech.queue_to_clean(recipeName)
    vgal.recipe.deep_hide(recipeName)
    -- data.raw["recipe"][recipeName] = nil
    -- vgal.recipes[recipeName] = nil
end

function vgal.data.deep_hide(entry)
    entry.hidden = true
    entry.hidden_in_factoriopedia = true
    entry.hide_from_signal_gui = true
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
    local requiredTechs = {}
    local toRemove = {}
    for _, tech in pairs(data.raw["technology"]) do
        for _, p in ipairs(tech.prerequisites or {}) do -- create techs needed for others.
            requiredTechs[p] = true
        end
        if tech.effects and #tech.effects > 0 then -- if tech even has effects..
            for _, effect in ipairs(tech.effects) do
                for _, toclean in ipairs(vgal.tech.totrim) do
                    if effect.recipe == toclean then -- for each toclean, check if its the effect.
                        effect.hidden = true
                        break
                    end
                end
            end
            toRemove[tech.name] = true
            for _, effect in ipairs(tech.effects) do
                if not effect.hidden then
                    toRemove[tech.name] = nil
                end
            end
        end
    end
    for _, tech in pairs(data.raw["technology"]) do
        ---@diagnostic disable-next-line: undefined-field
        if toRemove[tech.name] and tech.vgal_can_remove and (not requiredTechs[tech.name]) then
            tech.hidden = true
            tech.hidden_in_factoriopedia = true
        end
    end
end

return vgal
