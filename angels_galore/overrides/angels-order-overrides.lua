local SUBGROUP_DOMAINS = {
    { "petrochem-refining",    "water-treatment" },
    { "bio-processing-nauvis", "bio-processing-vegetables", },
    { "resource-refining",     "angels-smelting",           "angels-casting" },
}
for _, subgroup in pairs(data.raw["item-subgroup"]) do
    for _, domain in ipairs(SUBGROUP_DOMAINS) do
        for i, group in ipairs(domain) do
            if (i ~= 1) and subgroup.group == group then
                subgroup.group = domain[1]
                subgroup.order = (i == 1 and "" or ({ "unused", "x-", "y-" })[i]) .. subgroup.order
            end
        end
    end
end

data.raw["item-subgroup"]["geode-processing-1"].order = "e-aa"
data.raw["item-subgroup"]["angels-copper-casting"].order = "y-ec"

local subgroups_to_clean = {
    ["angels-copper"] = true,
    ["angels-copper-casting"] = true,
}

-- for _, item in pairs(data.raw["item"]) do
--     if subgroups_to_clean[item.subgroup] then
--         item.order = nil
--     end
-- end

-- for _, fluid in pairs(data.raw["fluid"]) do
--     if subgroups_to_clean[fluid.subgroup] then
--         fluid.order = nil
--     end
-- end

for _, recipe in pairs(data.raw["recipe"]) do
    if subgroups_to_clean[recipe.subgroup] then
        recipe.order = nil
        recipe.subgroup = nil
    end
end

-- rest in done in subgroups.lua
