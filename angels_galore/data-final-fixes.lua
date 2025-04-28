require("overrides.angels-order-overrides")
require("overrides.angels-overrides-final-fixes")

local PREFIXES = { "angels-", "ore-", "strand-casting", "water-treatment", "powder-metallugy", "slag-processing" } -- Add any other prefixes here
local function has_any_visible_effect(tech)
    if not tech.effects then return false end
    for _, eff in pairs(tech.effects) do
        if not eff.hidden then
            return true
        end
    end
    return false
end

-- identify all techs with the specified prefixes that are hidden OR effectively have no effects
local to_remove = {}
for name, tech in pairs(data.raw.technology) do
    for _, prefix in ipairs(PREFIXES) do
        if name:sub(1, #prefix) == prefix then
            if tech.hidden or not has_any_visible_effect(tech) then
                to_remove[name] = tech
            end
        end
    end
end

-- rewire prerequisites on remaining techs.
for name, tech in pairs(data.raw.technology) do
    if tech.prerequisites then
        local new_prereqs = {}

        for _, prereq in ipairs(tech.prerequisites) do
            if to_remove[prereq] then
                -- this prereq is being removed; splice in *its* prerequisites instead.
                local parent_list = to_remove[prereq].prerequisites or {}
                for _, parent in ipairs(parent_list) do
                    if not to_remove[parent] then
                        table.insert(new_prereqs, parent)
                    end
                end
            else
                -- keep original prereq.
                table.insert(new_prereqs, prereq)
            end
        end

        -- dedupe and reassign.
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
