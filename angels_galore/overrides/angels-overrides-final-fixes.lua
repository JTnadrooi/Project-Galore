--- barrel hiding ---
for _, recipe in pairs(data.raw["recipe"]) do
    if recipe.category == "barreling-pump" then
        recipe.hide_from_player_crafting = true
    end
end

--- empty tech removing ---
local REMOVE_PREFIXES = { "angels-", "ore-", "strand-casting", "water-treatment", "powder-metallugy", "slag-processing" }
local STAY_PREFIXES = { "angels-hidden-" }

local function has_any_visible_effect(tech)
    if not tech.effects then return false end
    for _, eff in pairs(tech.effects) do
        if not eff.hidden then
            return true
        end
    end
    return false
end

local function has_prefix(name, prefixes)
    for _, prefix in ipairs(prefixes) do
        if name:sub(1, #prefix) == prefix then
            return true
        end
    end
    return false
end

-- identify all techs with the specified prefixes that are hidden OR effectively have no effects
local to_remove = {}
for name, tech in pairs(data.raw.technology) do
    if has_prefix(name, REMOVE_PREFIXES) and not has_prefix(name, STAY_PREFIXES) then
        if tech.hidden or not has_any_visible_effect(tech) then
            to_remove[name] = tech
        end
    end
end

-- rewire prerequisites on remaining techs.
for _, tech in pairs(data.raw.technology) do
    if tech.prerequisites then
        local new_prereqs = {}

        for _, prereq in ipairs(tech.prerequisites) do
            if to_remove[prereq] then
                local parent_list = to_remove[prereq].prerequisites or {}
                for _, parent in ipairs(parent_list) do
                    if not to_remove[parent] then
                        table.insert(new_prereqs, parent)
                    end
                end
            else
                table.insert(new_prereqs, prereq)
            end
        end

        -- dedupe and reassign
        local seen = {}
        tech.prerequisites = {}
        for _, p in ipairs(new_prereqs) do
            if not seen[p] then
                table.insert(tech.prerequisites, p)
                seen[p] = true
            end
        end
    end
end

-- actually remove the unwanted techs.
for name, _ in pairs(to_remove) do
    data.raw.technology[name] = nil
end

--- clean subgroups bc anywhere else this code is just a suggestion ---
local subgroups_to_clean = {
    ["angels-copper"] = true,
    ["angels-copper-casting"] = true,
    ["angels-iron"] = true,
    ["angels-iron-casting"] = true,
    ["angels-steel-casting"] = true,
    ["angels-stone"] = true,
    ["angels-stone-casting"] = true,
}
for _, recipe in pairs(data.raw["recipe"]) do
    if subgroups_to_clean[recipe.subgroup] then
        recipe.order = nil
        recipe.subgroup = nil
    end
end

