---@diagnostic disable: param-type-mismatch

vgal.tech.totrim = vgal.tech.totrim or {}

---@param techName (string)
---@param recipeName (string)
function vgal.tech.add_recipe(techName, recipeName)
    if techName ~= "" and not data.raw.technology[techName] then
        error("technology with name: " .. techName .. "does not exist")
    end
    table.insert(
        data.raw.technology[techName].effects,
        {
            type = "unlock-recipe",
            recipe = recipeName,
        }
    )
end

function vgal.tech.add_productivity_change(techName, recipeName, change, hidden)
    local tech = data.raw["technology"][techName]
    if tech then
        table.insert(
            tech.effects,
            {
                type = "change-recipe-productivity",
                recipe = recipeName,
                change = change or 0.1,
                hidden = hidden,
            }
        )
    end
end

function vgal.tech.queue_to_clean(recipeName)
    table.insert(vgal.tech.totrim, recipeName)
end

function vgal.tech.remove_prerequisite(techName, prerequisite)
    local tech = data.raw["technology"][techName]
    for i, pre in ipairs(tech.prerequisites) do
        if pre == prerequisite then
            table.remove(tech.prerequisites, i)
            return
        end
    end
    error()
end

function vgal.tech.multiply_unit_count(techName, amount, roundingNumber)
    roundingNumber = roundingNumber or 1
    if roundingNumber < 1 then
        roundingNumber = 1
    end
    if data.raw["technology"][techName].unit.count_formula then
        return
    end
    data.raw["technology"][techName].unit.count = math.floor(((data.raw["technology"][techName].unit.count or 1) * amount) /
        roundingNumber) * roundingNumber
    if data.raw["technology"][techName].unit.count < 1 then
        data.raw["technology"][techName].unit.count = 1
    end
end

function vgal.tech.is_modded(techName, modtag)
    if data.raw["technology"][techName].icon then
        return string.find(data.raw["technology"][techName].icon, modtag)
    else
        return false
    end
end

---@param techName (string)
--- Removes prerequisites.
function vgal.tech.set_as_initial(techName)
    data.raw["technology"][techName].prerequisites = {}
end

---@param techName (string)
---@param recipeName (string)
--- Ensures a recipe is not in the effects of the technology.
function vgal.tech.remove_recipe(techName, recipeName)
    if not data.raw.technology[techName] then
        error("tech to remove recipe from not found")
    end
    for index, ingredient in ipairs(data.raw.technology[techName].effects) do
        if ingredient.type == "unlock-recipe" and ingredient.recipe == recipeName then
            table.remove(data.raw.technology[techName].effects, index)
            break
        end
    end
end

---@param techName (string)
---@param otherTechName (string)
--- Add a prerequisite to a technology.
function vgal.tech.add_prerequisite(techName, otherTechName)
    table.insert(data.raw.technology[techName].prerequisites, otherTechName)
end

---@param techName (string)
--- Shallowly (?) remove a technology from the game. The game will throw an error if this function is misused. I recommend shallow-ly hiding the tech instead.
function vgal.tech.shallow_remove(techName)
    data.raw["technology"][techName] = nil
end

---@param techName (string)
function vgal.tech.shallow_remove_chain(techName)
    vgal.tech.shallow_remove(techName)
    for index, _ in ipairs({ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }) do
        vgal.tech.shallow_remove(techName .. "-" .. index)
    end
end

vgal.tech.iconDirectory = "__vanilla_galore__/graphics/tech/"
function vgal.tech.set_icon_directory(directoryName)
    vgal.tech.iconDirectory = directoryName
end

function vgal.tech.create_empty(techName, tier, units, unitCount, unitTime, prerequisites, order, icons)
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
        name = techName,
        icons = icons or {
            {
                icon = vgal.tech.iconDirectory .. techName .. ".png",
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
            table.insert(prerequisites, techName)
        else
            table.insert(prerequisites, techName .. "-" .. (tier - 1))
        end
    end
    for _, value in ipairs(units) do
        table.insert(toret.unit.ingredients, { value, 1 })
    end
    return toret
end

---@param techName (string)
function vgal.tech.deep_remove(techName)
    if data.raw["technology"][techName] then
        if data.raw["technology"][techName].effects then
            for _, effect in pairs(data.raw["technology"][techName].effects) do
                data.raw["recipe"][effect.recipe] = nil
            end
        end
    end
    data.raw["technology"][techName] = nil
end

---@param techName (string)
function vgal.tech.deep_hide(techName)
    if data.raw["technology"][techName] then
        if data.raw["technology"][techName].effects then
            for _, effect in pairs(data.raw["technology"][techName].effects) do
                if effect.recipe then
                    data.raw["recipe"][effect.recipe].hidden = true
                end
            end
        end
    end
    data.raw["technology"][techName].hidden = true
end

---@param techName (string)
function vgal.tech.remove_miltary(techName)
    vgal.tech.remove_ingredient(techName, "military-science-pack")
end

function vgal.tech.merge(tech_name_from, tech_name_to)
    local tech_from = data.raw["technology"][tech_name_from]
    local tech_to = data.raw["technology"][tech_name_to]
    for _, eff in ipairs(tech_from.effects) do
        table.insert(tech_to.effects, eff)
    end
    data.raw["technology"][tech_name_from] = nil
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

---@param techName (string)
function vgal.tech.remove_ingredient(techName, sciencePackName)
    if data.raw["technology"][techName] then
        if data.raw["technology"][techName].unit.ingredients then
            for index, effect in ipairs(data.raw["technology"][techName].unit.ingredients) do
                if effect[1] == sciencePackName then
                    table.remove(data.raw["technology"][techName].unit.ingredients, index)
                end
            end
        end
    end
end

function vgal.tech.add_ingredient(techName, sciencePackName)
    if data.raw["technology"][techName] then
        for _, value in ipairs(data.raw["technology"][techName].unit.ingredients) do
            if value[1] == sciencePackName then
                return
            end
        end
        table.insert(data.raw["technology"][techName].unit.ingredients, { sciencePackName, 1 })
    end
end

function vgal.tech.shallow_hide_search(techName, untilTechName)
    if data.raw["technology"][techName] then
        for _, value in ipairs(data.raw["technology"][techName].prerequisites) do
            if value ~= untilTechName then

            end
        end
    end
    data.raw["technology"][techName].hidden = true
end

---@param techName (string)
function vgal.tech.deep_remove_chain(techName)
    vgal.tech.deep_remove(techName)
    for index, _ in ipairs({ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }) do
        vgal.tech.deep_remove(techName .. "-" .. index)
    end
end

---@param techName (string)
function vgal.tech.hide(techName)
    data.raw["technology"][techName].hidden = true
end

---@param techName (string)
function vgal.tech.hide_chain(techName)
    vgal.tech.hide(techName)
    for index, _ in ipairs({ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }) do
        if data.raw["technology"][techName .. "-" .. index] then
            vgal.tech.hide(techName .. "-" .. index)
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
