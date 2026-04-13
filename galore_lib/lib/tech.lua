---@diagnostic disable: param-type-mismatch
vgal.tech = vgal.tech or {}

vgal.tech.recipes_to_remove_from_techs = vgal.tech.recipes_to_remove_from_techs or {} -- array
vgal.tech.techs_to_splice = vgal.tech.techs_to_splice or {}                           -- table
vgal.tech.units = {
    ["automation-science-pack"] = {
        name = "automation-science-pack",
        value = 1,
    },
    ["logistic-science-pack"] = {
        name = "logistic-science-pack",
        value = 2,
    },
    ["military-science-pack"] = {
        name = "military-science-pack",
        value = 2,
    },
    ["chemical-science-pack"] = {
        name = "chemical-science-pack",
        value = 3,
    },
    ["production-science-pack"] = {
        name = "production-science-pack",
        value = 4,
    },
    ["utility-science-pack"] = {
        name = "utility-science-pack",
        value = 5,
    },
    ["space-science-pack"] = {
        name = "space-science-pack",
        value = 6,
    },
}

---@param tech_name (string)
---@param recipe_name (string)
function vgal.tech.add_recipe(tech_name, recipe_name)
    local tech = vgal.throw.if_tech_not_found(tech_name)
    table.insert(
        tech.effects,
        {
            type = "unlock-recipe",
            recipe = recipe_name,
        }
    )
end

---@param tech_name string
---@param old_recipe string
---@param new_recipe string
function vgal.tech.replace_recipe(tech_name, old_recipe, new_recipe)
    local tech = vgal.throw.if_tech_not_found(tech_name)

    local effects = tech.effects
    local replaced = false

    for _, effect in ipairs(effects) do
        if effect.type == "unlock-recipe" and effect.recipe == old_recipe then
            effect.recipe = new_recipe
            replaced = true
            break
        end
    end

    if not replaced then
        error("No effect with recipe: " .. old_recipe .. " found in technology: " .. tech_name)
    end
end

function vgal.tech.add_productivity_change(tech_name, recipe_name, change, hidden)
    local tech = vgal.throw.if_tech_not_found(tech_name)
    if tech then
        tech.effects = tech.effects or {}
        table.insert(
            tech.effects,
            {
                type = "change-recipe-productivity",
                recipe = recipe_name,
                change = change or 0.1,
                hidden = hidden,
            }
        )
    end
end

function vgal.tech.queue_to_clean(recipe_name)
    vgal.throw.if_recipe_not_found(recipe_name)

    table.insert(vgal.tech.recipes_to_remove_from_techs, recipe_name)
end

function vgal.tech.remove_prerequisite(tech_name, prerequisite)
    local tech = vgal.throw.if_tech_not_found(tech_name)
    for i, pre in ipairs(tech.prerequisites) do
        if pre == prerequisite then
            table.remove(tech.prerequisites, i)
            return
        end
    end
    error("Prerequisite'" .. prerequisite .. "'not found in " .. tech_name)
end

---@param tech_name (string)
---@param recipe_name (string)
--- Ensures a recipe is not in the effects of the technology.
function vgal.tech.remove_recipe(tech_name, recipe_name)
    local tech = vgal.throw.if_tech_not_found(tech_name)
    for index, ingredient in ipairs(tech.effects) do
        if ingredient.type == "unlock-recipe" and ingredient.recipe == recipe_name then
            table.remove(tech.effects, index)
            break
        end
    end
end

---@param tech_name (string)
---@param prerequisite (string)
--- Add a prerequisite to a technology.
function vgal.tech.add_prerequisite(tech_name, prerequisite)
    local tech = vgal.throw.if_tech_not_found(tech_name)
    table.insert(tech.prerequisites, prerequisite)
end

function vgal.tech.create_empty(tech_name, tier, units, unit_count, unit_time, prerequisites, order, icons)
    tier = tier or 1

    if not unit_time then
        if unit_count > 120 then
            unit_time = 60
        else
            unit_time = 30
        end
    end

    local result = {
        type = "technology",
        name = tech_name,
        icons = icons or {
            {
                icon = vgal.icon.directory.tech .. tech_name .. ".png",
                icon_size = 400,
                tint = nil,
            }
        },
        effects = {},
        prerequisites = prerequisites,
        unit = {
            count = unit_count,
            ingredients = {},
            time = unit_time
        },
        order = order or "c"
    }

    if tier ~= 1 then
        result.name = result.name .. "-" .. tier
        if tier == 2 then
            table.insert(prerequisites, tech_name)
        else
            table.insert(prerequisites, tech_name .. "-" .. (tier - 1))
        end
    end

    for _, unit in ipairs(units) do
        table.insert(result.unit.ingredients, { unit, 1 })
    end

    return result
end

---@param tech_name (string)
function vgal.tech.deep_hide(tech_name)
    local tech = vgal.throw.if_tech_not_found(tech_name)

    if tech.effects then
        for _, effect in pairs(tech.effects) do
            if effect.recipe then
                vgal.recipe.deephide(effect.recipe)
            end
        end
    end

    vgal.data.deephide(tech)
end

---@param tech_name (string)
function vgal.tech.remove_miltary(tech_name)
    vgal.tech.remove_ingredient(tech_name, "military-science-pack")
end

function vgal.tech.merge(tech_name_from, tech_name_to)
    local tech_from = vgal.throw.if_tech_not_found(tech_name_from)
    local tech_to = vgal.throw.if_tech_not_found(tech_name_to)

    for _, eff in ipairs(tech_from.effects) do
        table.insert(tech_to.effects, eff)
    end

    tech_from.effects = {}
    vgal.data.deephide(tech_from)
end

function vgal.tech.move_recipe(tech_name_from, tech_name_to, recipe_name)
    local tech_from = vgal.throw.if_tech_not_found(tech_name_from)
    local tech_to = vgal.throw.if_tech_not_found(tech_name_to)

    for i, eff in ipairs(tech_from.effects) do
        if eff.type == "unlock-recipe" and eff.recipe == recipe_name then
            table.insert(tech_to.effects, eff)
            table.remove(tech_from.effects, i)
            return
        end
    end
end

---@param tech_name (string)
function vgal.tech.remove_ingredient(tech_name, unit_name)
    local tech = vgal.throw.if_tech_not_found(tech_name)

    if tech.unit.ingredients then
        for i, ingredient in ipairs(tech.unit.ingredients) do
            if ingredient[1] == unit_name then
                table.remove(tech.unit.ingredients, i)
                return
            end
        end
    end
end

function vgal.tech.add_ingredient(tech_name, unit_name)
    local tech = vgal.throw.if_tech_not_found(tech_name)

    for _, value in ipairs(tech.unit.ingredients) do
        if value[1] == unit_name then
            return
        end
    end
    table.insert(tech.unit.ingredients, { unit_name, 1 })
end

---@param tech_name (string)
function vgal.tech.deephide(tech_name)
    vgal.data.deephide(data.raw["technology"][tech_name])
end

---@param tech data.TechnologyPrototype
function vgal.tech.extract_units(tech)
    local units = {}
    if not tech.unit then
        return {}
    end
    for _, value in ipairs(tech.unit.ingredients) do
        table.insert(units, value[1])
    end
    return units
end

function vgal.tech.get_units_worth(units)
    local worth = 0

    for _, unit in ipairs(units) do
        local unit_data = vgal.tech.units[unit]
        if unit_data then
            worth = worth + vgal.tech.units[unit].value
        end
        worth = worth + 1
    end

    return worth
end
