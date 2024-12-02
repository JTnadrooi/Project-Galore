---@diagnostic disable: param-type-mismatch

vgal.tech.toclean = vgal.tech.toclean or {}

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
            recipe = recipeName
        }
    )
end

function vgal.tech.queue_to_clean(techName) -- no work
    table.insert(vgal.tech.toclean, techName)
end

function vgal.tech.remove_prerequisite(techName, prerequisite) -- no work
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
    --vgal.any.is_modded(data.raw["technology"][techName], modtag)
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
                -- icon = "__vanilla_galore__/graphics/tech/".."analog-electronics"..".png",
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
        --if data.raw["technology"]["vgal-"..techName.."-"..(tier - 1)] or data.raw["technology"]["vgal-"..techName] then
        if tier == 2 then
            table.insert(prerequisites, techName)
        else
            table.insert(prerequisites, techName .. "-" .. (tier - 1))
        end
        --end
    end
    -- toret.icons[1].tint = vgal.get_tier_tint(tier)
    for _, value in ipairs(units) do
        if type(value) ~= "string" then
            if value == 1 then
                value = "automation-science-pack"
            end
            if value == 2 then
                value = "logistic-science-pack"
            end
            if value == 3 then
                value = "chemical-science-pack"
            end
            if value == 4 then
                value = "production-science-pack"
            end
            if value == 5 then
                value = "utility-science-pack"
            end
            if value == 6 then
                value = "space-science-pack"
            end
        end
        table.insert(toret.unit.ingredients, { value, 1 })
    end
    return toret
end

--tech = vgal.tech.create_empty("vgal-cheap-iron-gear", 120, {1,2}, {"iron-gear", "electronics"})

---@param techName (string)
function vgal.tech.deep_remove(techName)
    if data.raw["technology"][techName] then
        if data.raw["technology"][techName].effects then
            for _, effect in pairs(data.raw["technology"][techName].effects) do
                -- if string.starts(effect.recipe, "vgal-") then
                --     data.raw["recipe"][effect.recipe] = nil
                -- end
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
                -- if string.starts(effect.recipe, "vgal-") then
                --     data.raw["recipe"][effect.recipe] = nil
                -- end
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
    vgal.tech.remove_ingredient("military-science-pack")
end

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
    --data.raw["technology"][techName].hidden = true
end

function vgal.tech.add_ingredient(techName, sciencePackName)
    if data.raw["technology"][techName] then
        for index, value in ipairs(data.raw["technology"][techName].unit.ingredients) do
            if value[1] == sciencePackName then
                return
            end
        end
        table.insert(data.raw["technology"][techName].unit.ingredients, { sciencePackName, 1 })
    end
end

function vgal.tech.validate_recipes(technologies)
    for _, tech in pairs(technologies) do
        local effects = {}
        for _, effect in pairs(tech.effects) do
            if effect.type == "unlock-recipe" then
                if data.raw.recipe[effect.recipe] then
                    table.insert(effects, effect)
                end
            else
                table.insert(effects, effect)
            end
        end
        tech.effects = effects
    end
    return technologies
end

local function recursive_shallow_hide_search(currentTechName)

end
function vgal.tech.shallow_hide_search(techName, untilTechName)
    if data.raw["technology"][techName] then
        for index, value in ipairs(data.raw["technology"][techName].prerequisites) do
            if value ~= untilTechName then

            end
        end
    end
    data.raw["technology"][techName].hidden = true
end

function vgal.tech.new_recipe_effect(recipeName)
    return {
        type = "unlock-recipe",
        recipe = recipeName
    }
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
