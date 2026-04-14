-- no subgroup prototypes will be created here, thats done in "subgroups.lua".

local SUBGROUP_DOMAINS = {
    -- { "angels-petrochem-refining",    "angels-water-treatment" },
    -- { "angels-bio-processing-nauvis", "angels-bio-processing-vegetables", },
    -- { "angels-resource-refining",     "angels-smelting",                  "angels-casting" },
    { "angels-smelting", "angels-casting" },
    { "logistics",       "angels-fluid-control", },
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

data.raw["item-subgroup"]["angels-stone-casting"].order = "y-nb"

data.raw["item-subgroup"]["angels-fluid-tanks"].order = "db"
data.raw["item-subgroup"]["angels-fluid-control"].order = "dc"

data.raw["item"]["angels-ingot-steel"].subgroup = "angels-steel-casting"
data.raw["item"]["angels-ingot-steel"].order = "ib"

for _, metal in pairs(vgal.defines.metals) do
    data.raw["item"][metal.pebbles].subgroup = "angels-" .. metal.name
    data.raw["item"][metal.pebbles].order = "c"
end

for index, value in ipairs({
    "concrete", "hazard-concrete",
    "refined-concrete", "refined-hazard-concrete",
}) do
    data.raw["item"][value].order = vgal.subgroup.order_from_number(index)
    data.raw["item"][value].subgroup = "vgal-angels-solid-concrete"
end

vgal.subgroup.set_for("angels-liquifier", "vgal-angels-chemistry-machines")
data.raw["item"]["angels-liquifier"].order = "b"
vgal.subgroup.set_for("angels-liquifier-2", "vgal-angels-chemistry-machines")
data.raw["item"]["angels-liquifier-2"].order = "c"
vgal.subgroup.set_for("stone-brick", "vgal-angels-cement-concrete")
data.raw["item"]["stone-brick"].order = "c"
data.raw["recipe"]["stone-brick"].order = nil

vgal.subgroup.clean_recipe("angels-solid-plastic")


data.raw["recipe"]["angels-americium-regeneration"].main_product = "angels-plutonium-239"
data.raw["recipe"]["angels-plutonium-breeding"].main_product = "angels-plutonium-239"
