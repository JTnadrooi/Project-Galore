---@diagnostic disable: param-type-mismatch

vgal.tech.totrim = vgal.tech.totrim or {}

---@param tech_name (string)
---@param recipe_name (string)
function vgal.tech.add_recipe(tech_name, recipe_name)
    if tech_name ~= "" and not data.raw.technology[tech_name] then
        error("technology with name: " .. tech_name .. "does not exist")
    end
    table.insert(
        data.raw.technology[tech_name].effects,
        {
            type = "unlock-recipe",
            recipe = recipe_name,
        }
    )
end

function vgal.tech.add_productivity_change(tech_name, recipe_name, change, hidden)
    local tech = data.raw["technology"][tech_name]
    if tech then
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
    table.insert(vgal.tech.totrim, recipe_name)
end

function vgal.tech.remove_prerequisite(tech_name, prerequisite)
    local tech = data.raw["technology"][tech_name]
    for i, pre in ipairs(tech.prerequisites) do
        if pre == prerequisite then
            table.remove(tech.prerequisites, i)
            return
        end
    end
    error()
end

function vgal.tech.multiply_unit_count(tech_name, amount, rounding_number)
    rounding_number = rounding_number or 1
    if rounding_number < 1 then
        rounding_number = 1
    end
    if data.raw["technology"][tech_name].unit.count_formula then
        return
    end
    data.raw["technology"][tech_name].unit.count = math.floor(((data.raw["technology"][tech_name].unit.count or 1) * amount) /
        rounding_number) * rounding_number
    if data.raw["technology"][tech_name].unit.count < 1 then
        data.raw["technology"][tech_name].unit.count = 1
    end
end

function vgal.tech.is_modded(tech_name, modtag)
    if data.raw["technology"][tech_name].icon then
        return string.find(data.raw["technology"][tech_name].icon, modtag)
    else
        return false
    end
end

---@param tech_name (string)
--- Removes prerequisites.
function vgal.tech.set_as_initial(tech_name)
    data.raw["technology"][tech_name].prerequisites = {}
end

---@param tech_name (string)
---@param recipe_name (string)
--- Ensures a recipe is not in the effects of the technology.
function vgal.tech.remove_recipe(tech_name, recipe_name)
    if not data.raw.technology[tech_name] then
        error("tech to remove recipe from not found")
    end
    for index, ingredient in ipairs(data.raw.technology[tech_name].effects) do
        if ingredient.type == "unlock-recipe" and ingredient.recipe == recipe_name then
            table.remove(data.raw.technology[tech_name].effects, index)
            break
        end
    end
end

---@param tech_name (string)
---@param othertech_name (string)
--- Add a prerequisite to a technology.
function vgal.tech.add_prerequisite(tech_name, othertech_name)
    table.insert(data.raw.technology[tech_name].prerequisites, othertech_name)
end

---@param tech_name (string)
--- Shallowly (?) remove a technology from the game. The game will throw an error if this function is misused. I recommend shallow-ly hiding the tech instead.
function vgal.tech.shallow_remove(tech_name)
    data.raw["technology"][tech_name] = nil
end

---@param tech_name (string)
function vgal.tech.shallow_remove_chain(tech_name)
    vgal.tech.shallow_remove(tech_name)
    for index, _ in ipairs({ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }) do
        vgal.tech.shallow_remove(tech_name .. "-" .. index)
    end
end

vgal.tech.iconDirectory = "__vanilla_galore__/graphics/tech/"
function vgal.tech.set_icon_directory(directoryName)
    vgal.tech.iconDirectory = directoryName
end

function vgal.tech.create_empty(tech_name, tier, units, unitCount, unitTime, prerequisites, order, icons)
    tier = tier or 1
    if not unitTime then
        if unitCount > 120 then
            unitTime = 60
        else
            unitTime = 30
        end
    end
    local toret = {
        type = "technology",
        name = tech_name,
        icons = icons or {
            {
                icon = vgal.tech.iconDirectory .. tech_name .. ".png",
                icon_size = 400,
                tint = nil,
            }
        },
        effects = {},
        prerequisites = prerequisites,
        unit = {
            count = unitCount,
            ingredients = {},
            time = unitTime
        },
        order = order or "c"
    }
    if tier ~= 1 then
        toret.name = toret.name .. "-" .. tier
        if tier == 2 then
            table.insert(prerequisites, tech_name)
        else
            table.insert(prerequisites, tech_name .. "-" .. (tier - 1))
        end
    end
    for _, value in ipairs(units) do
        table.insert(toret.unit.ingredients, { value, 1 })
    end
    return toret
end

---@param tech_name (string)
function vgal.tech.deep_remove(tech_name)
    if data.raw["technology"][tech_name] then
        if data.raw["technology"][tech_name].effects then
            for _, effect in pairs(data.raw["technology"][tech_name].effects) do
                data.raw["recipe"][effect.recipe] = nil
            end
        end
    end
    data.raw["technology"][tech_name] = nil
end

---@param tech_name (string)
function vgal.tech.deep_hide(tech_name)
    if data.raw["technology"][tech_name] then
        if data.raw["technology"][tech_name].effects then
            for _, effect in pairs(data.raw["technology"][tech_name].effects) do
                if effect.recipe then
                    data.raw["recipe"][effect.recipe].hidden = true
                end
            end
        end
    end
    data.raw["technology"][tech_name].hidden = true
end

---@param tech_name (string)
function vgal.tech.remove_miltary(tech_name)
    vgal.tech.remove_ingredient(tech_name, "military-science-pack")
end

function vgal.tech.merge(tech_name_from, tech_name_to)
    local tech_from = data.raw["technology"][tech_name_from]
    local tech_to = data.raw["technology"][tech_name_to]
    for _, eff in ipairs(tech_from.effects) do
        table.insert(tech_to.effects, eff)
    end
    data.raw["technology"][tech_name_from] = nil
end

function vgal.tech.move_recipe(tech_name_from, tech_name_to, recipe_name)
    local tech_from = data.raw["technology"][tech_name_from]
    local tech_to = data.raw["technology"][tech_name_to]
    for i, eff in ipairs(tech_from.effects) do
        if eff.recipe == recipe_name then
            table.insert(tech_to.effects, eff)
            table.remove(tech_from.effects, i)
            break
        end
    end
end

-- function vgal.tech.move_recipe(tech_name_from, recipe_name, tech_name_to)
--     local tech_from = data.raw["technology"][tech_name_from]
--     local tech_to = data.raw["technology"][tech_name_to]
--     tech_to.effects = tech_to.effects or {}
--     local moved = false
--     for i = #tech_from.effects, 1, -1 do
--         local effect = tech_from.effects[i]
--         if (effect.type == "recipe") and effect.recipe == recipe_name then
--             table.insert(tech_to.effects, effect)
--             table.remove(tech_from.effects, i)
--             moved = true
--         end
--     end
--     if not moved then
--         error("no effect of type '" .. recipe_name .. "' found in '" .. tech_name_from .. "'.")
--     end
--     if not next(tech_from.effects) then
--         data.raw["technology"][tech_name_from] = nil
--     end
-- end

---@param tech_name (string)
function vgal.tech.remove_ingredient(tech_name, unit_name)
    if data.raw["technology"][tech_name] then
        if data.raw["technology"][tech_name].unit.ingredients then
            for i, ingredient in ipairs(data.raw["technology"][tech_name].unit.ingredients) do
                if ingredient[1] == unit_name then
                    table.remove(data.raw["technology"][tech_name].unit.ingredients, i)
                end
            end
        end
    end
end

function vgal.tech.add_ingredient(tech_name, unit_name)
    if data.raw["technology"][tech_name] then
        for _, value in ipairs(data.raw["technology"][tech_name].unit.ingredients) do
            if value[1] == unit_name then
                return
            end
        end
        table.insert(data.raw["technology"][tech_name].unit.ingredients, { unit_name, 1 })
    end
end

---@param tech_name (string)
function vgal.tech.deep_remove_chain(tech_name)
    vgal.tech.deep_remove(tech_name)
    for index, _ in ipairs({ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }) do
        vgal.tech.deep_remove(tech_name .. "-" .. index)
    end
end

---@param tech_name (string)
function vgal.tech.hide(tech_name)
    data.raw["technology"][tech_name].hidden = true
end

---@param tech_name (string)
function vgal.tech.hide_chain(tech_name)
    vgal.tech.hide(tech_name)
    for index, _ in ipairs({ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }) do
        if data.raw["technology"][tech_name .. "-" .. index] then
            vgal.tech.hide(tech_name .. "-" .. index)
        end
    end
end

function vgal.tech.vgal_tech_clean()
    for _, tech in pairs(data.raw["technology"]) do
        if tech.prerequisites then
            local new_prerequisites = {}
            for _, prerequisite in pairs(tech.prerequisites) do
                if ((not data.raw["technology"][prerequisite]) or data.raw["technology"][prerequisite].hidden == true) and prerequisite then
                    -- well
                else
                    table.insert(new_prerequisites, prerequisite)
                end
            end
            tech.prerequisites = new_prerequisites
        end
    end
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
    local values = {
        ["automation-science-pack"] = 1,
        ["logistic-science-pack"] = 2,
        ["chemical-science-pack"] = 3,
        ["space-science-pack"] = 4,
        ["production-science-pack"] = 4,
        ["utility-science-pack"] = 5,
        ["metallurgic-science-pack"] = 5,
        ["agricultural-science-pack"] = 5,
        ["electromagnetic-science-pack"] = 5,
        ["cryogenic-science-pack"] = 8,
        ["promethium-science-pack"] = 10,
    }

    local worth = 0
    for _, unit in ipairs(units) do
        worth = worth + (values[unit] or 0)
    end
    return worth
end
