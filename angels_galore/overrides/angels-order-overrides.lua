-- no subgroup prototypes will be created here, thats done in "subgroups.lua".

local SUBGROUP_DOMAINS = {
    { "angels-petrochem-refining",    "angels-water-treatment" },
    { "angels-bio-processing-nauvis", "angels-bio-processing-vegetables", },
    { "angels-resource-refining",     "angels-smelting",                  "angels-casting" },
    { "logistics",                    "angels-fluid-control", },
}
for _, domain in ipairs(SUBGROUP_DOMAINS) do
    for i, group in ipairs(domain) do
        for _, subgroup in pairs(data.raw["item-subgroup"]) do
            if (i ~= 1) and subgroup.group == group then
                subgroup.group = domain[1]
                local prefix = ""
                if i == 2 then
                    prefix = "x-"
                elseif i == 3 then
                    prefix = "y-"
                end
                subgroup.order = prefix .. subgroup.order
            end
        end
        if not data.raw["item-group"][group] then
            error("No group with name '" .. group .. "'found.")
        end
    end
end

data.raw["item-subgroup"]["angels-geode-processing-1"].order = "e-aa"
data.raw["item-subgroup"]["angels-copper-casting"].order = "y-ec"
data.raw["item-subgroup"]["angels-iron-casting"].order = "y-fc"
data.raw["item-subgroup"]["angels-steel-casting"].order = "y-gc"

data.raw["item-subgroup"]["angels-fluid-tanks"].order = "db"
data.raw["item-subgroup"]["angels-fluid-control"].order = "dc"

data.raw["item"]["angels-ingot-steel"].subgroup = "angels-steel-casting"
data.raw["item"]["angels-ingot-steel"].order = "ib"

for _, metal in ipairs(vgal.constants.METALS) do
    data.raw["item"]["angels-" .. metal .. "-pebbles"].subgroup = "angels-" .. metal
    data.raw["item"]["angels-" .. metal .. "-pebbles"].order = "c"
end
