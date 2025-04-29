local SUBGROUP_DOMAINS = {
    { "petrochem-refining",    "water-treatment" },
    { "bio-processing-nauvis", "bio-processing-vegetables", },
    { "resource-refining",     "angels-smelting",           "angels-casting" },
    { "logistics",             "angels-fluid-control", },
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
data.raw["item-subgroup"]["angels-iron-casting"].order = "y-fc"
data.raw["item-subgroup"]["angels-steel-casting"].order = "y-g"

data.raw["item-subgroup"]["angels-fluid-tanks"].order = "db"
data.raw["item-subgroup"]["angels-fluid-control"].order = "dc"

-- rest in done in subgroups.lua
