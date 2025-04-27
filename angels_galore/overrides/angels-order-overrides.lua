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
            end
        end
    end
end

-- rest in done in subgroups.lua
