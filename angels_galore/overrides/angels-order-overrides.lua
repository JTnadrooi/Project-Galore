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
data.raw["item-subgroup"]["angels-bio-arboretum"].order = "ea"

data.raw["item-subgroup"]["angels-stone-casting"].order = "y-nb"

data.raw["item-subgroup"]["angels-fluid-tanks"].order = "db"
data.raw["item-subgroup"]["angels-fluid-control"].order = "dc"

for _, metal in pairs(vgal.defines.metals) do
    data.raw["item"][metal.pebbles].subgroup = "angels-" .. metal.name
    data.raw["item"][metal.pebbles].order = "c"
end

for index, value in ipairs({
    "concrete", "hazard-concrete",
    "refined-concrete", "refined-hazard-concrete",
}) do
    data.raw["item"][value].order = vgal.subgroup.order_from_number(index)
    data.raw["item"][value].subgroup = "vgal-solid-concrete"
end

vgal.subgroup.set_for("angels-liquifier", "vgal-chemistry-machines")
data.raw["item"]["angels-liquifier"].order = "b"
vgal.subgroup.set_for("angels-liquifier-2", "vgal-chemistry-machines")
data.raw["item"]["angels-liquifier-2"].order = "c"
vgal.subgroup.set_for("stone-brick", "vgal-cement-concrete")
data.raw["item"]["stone-brick"].order = "c"
data.raw["recipe"]["stone-brick"].order = nil

vgal.subgroup.clean_recipe("angels-solid-plastic")

data.raw["recipe"]["angels-electrode-used"].main_product = "angels-electrode"

data.raw["recipe"]["angels-solid-geodes"].order = "-z"
data.raw["recipe"]["angels-solid-geodes"].subgroup = "angels-geode-processing-2"

data.raw["recipe"]["angels-concrete"].order = "bb"

data.raw["recipe"]["angels-solid-nitroglycerin"].order = "ab"
data.raw["recipe"]["angels-solid-trinitrotoluene"].order = "ac"

data.raw["recipe"]["angels-solid-salt-separation"].order = "cb"
data.raw["recipe"]["angels-solid-sodium-sulfate-separation"].order = "cc"

data.raw["recipe"]["angels-coke-purification-2"].order = "ab"
data.raw["recipe"]["angels-carbon-from-charcoal"].order = "ac"

data.raw["recipe"]["angels-liquid-aqueous-sodium-hydroxide-reverse"].order = "cb"

data.raw["recipe"]["angels-steam-cracking-naphtha"].order = "bb"
data.raw["recipe"]["angels-steam-cracking-mineral-oil"].order = "bc"
data.raw["recipe"]["angels-steam-cracking-fuel-oil"].order = "bd"
data.raw["recipe"]["angels-steam-cracking-naphtha"].subgroup = "angels-petrochem-carbon-synthesis"
data.raw["recipe"]["angels-steam-cracking-mineral-oil"].subgroup = "angels-petrochem-carbon-synthesis"
data.raw["recipe"]["angels-steam-cracking-fuel-oil"].subgroup = "angels-petrochem-carbon-synthesis"

data.raw["recipe"]["angels-algae-brown-burning-wash"].order = "bb"
