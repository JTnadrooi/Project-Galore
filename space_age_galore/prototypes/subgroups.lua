local subgroups = {
    {
        name = "circuits-t4",
        tab = "intermediate-products",
        order = "gcd",
        entries = { "quantum-processor" }
    },
    {
        name = "nutrients",
        tab = "intermediate-products",
        order = "ma",
        entries = { "nutrients" }
    },
    {
        name = "crushing",
        tab = "intermediate-products",
        order = "bb",
        entries = {}
    },
    {
        name = "scrap",
        tab = "intermediate-products",
        order = "bc",
        entries = { "scrap" }
    },
    {
        name = "water",
        tab = "intermediate-products",
        order = "ab",
        entries = { "ice", "water", "steam" }
    },
    {
        name = "oil-fluids",
        tab = "intermediate-products",
        order = "ac",
        entries = { "heavy-oil", "light-oil", "petroleum-gas", "crude-oil" }
    },
    {
        name = "intermediate-casting",
        tab = "intermediate-products",
        order = "ka",
        entries = {}
    },
    {
        name = "molten-metals",
        tab = "intermediate-products",
        order = "kb",
        entries = { "molten-iron", "molten-copper", "lava" }
    },
}

local toClean = {
    "fluoroketone-cooling",
    "ammoniacal-solution-separation",
    "solid-fuel-from-ammonia",
    "ammonia-rocket-fuel",
    "nutrients-from-fish",
    "nutrients-from-biter-egg",
    "nutrients-from-spoilage",
    "nutrients-from-yumako-mash",
    "nutrients-from-bioflux",
    "rocket-fuel-from-jelly",
    "bioplastic",
    "biosulfur",
    "biolubricant",
    "burnt-spoilage",
    "fluoroketone",
    "fish-breeding",
    "wood-processing",
    "ice-melting",
    "steam-condensation",
    "molten-iron-from-lava",
    "molten-copper-from-lava",
    "lithium",
    "acid-neutralisation",
}
for _, value in ipairs(toClean) do
    data.raw["recipe"][value].order = nil
    data.raw["recipe"][value].subgroup = nil
end

for _, value in ipairs(subgroups) do
    vgal.subgroup.new("vgal-" .. value.name, value.entries, value.tab, value.order)
end
data.raw["recipe"]["molten-iron-from-lava"].main_product = "molten-iron"
data.raw["recipe"]["molten-copper-from-lava"].main_product = "molten-copper"
data.raw["recipe"]["ammoniacal-solution-separation"].main_product = "ammonia"
data.raw["recipe"]["ammoniacal-solution-separation"].subgroup = "vgal-water"
data.raw["recipe"]["acid-neutralisation"].main_product = "steam"

vgal.subgroup.set_item_or_fluid("fusion-power-cell", "uranium-processing")
vgal.subgroup.set_item_or_fluid("lithium-plate", "vgal-smelting")
vgal.subgroup.set_item_or_fluid("lithium", "raw-resource")
vgal.subgroup.set_item_or_fluid("fluoroketone-hot", "fluid-recipes")
vgal.subgroup.set_item_or_fluid("fluoroketone-cold", "fluid-recipes")
vgal.subgroup.set_item_or_fluid("sulfuric-acid", "fluid-recipes")
vgal.subgroup.set_item_or_fluid("fusion-plasma", "fluid-recipes")

vgal.subgroup.set_item_or_fluid("ammonia", "fluid-recipes")
vgal.subgroup.set_item_or_fluid("ammoniacal-solution", "fluid-recipes")
vgal.subgroup.set_item_or_fluid("fluorine", "fluid-recipes")
vgal.subgroup.set_item_or_fluid("holmium-solution", "fluid-recipes")
vgal.subgroup.set_item_or_fluid("electrolyte", "fluid-recipes")
vgal.subgroup.set_item_or_fluid("lithium-brine", "fluid-recipes")
vgal.subgroup.set_item_or_fluid("thruster-oxidizer", "space-processing")
vgal.subgroup.set_item_or_fluid("thruster-fuel", "space-processing")

vgal.subgroup.set_item_or_fluid("carbon-fiber", "intermediate-product")
vgal.subgroup.set_item_or_fluid("raw-fish", "agriculture-processes")
vgal.subgroup.set_item_or_fluid("wood", "agriculture-processes")
vgal.subgroup.set_item_or_fluid("tree-seed", "agriculture-processes")

vgal.subgroup.set_item_or_fluid("supercapacitor", "intermediate-product")
vgal.subgroup.set_item_or_fluid("superconductor", "vgal-chemistry-products")
vgal.subgroup.set_item_or_fluid("holmium-plate", "vgal-smelting")

vgal.subgroup.set_item_or_fluid("tungsten-plate", "vgal-smelting")
vgal.subgroup.set_item_or_fluid("tungsten-carbide", "vgal-chemistry-products")

data.raw["recipe"]["casting-iron"].subgroup = "vgal-intermediate-casting"
data.raw["recipe"]["casting-copper"].subgroup = "vgal-intermediate-casting"
data.raw["recipe"]["casting-steel"].subgroup = "vgal-intermediate-casting"
data.raw["recipe"]["casting-iron-gear-wheel"].subgroup = "vgal-intermediate-casting"
data.raw["recipe"]["casting-iron-stick"].subgroup = "vgal-intermediate-casting"
data.raw["recipe"]["casting-copper-cable"].subgroup = "vgal-intermediate-casting"

data.raw["recipe"]["metallic-asteroid-crushing"].subgroup = "vgal-crushing"
data.raw["recipe"]["carbonic-asteroid-crushing"].subgroup = "vgal-crushing"
data.raw["recipe"]["oxide-asteroid-crushing"].subgroup = "vgal-crushing"
data.raw["recipe"]["scrap-recycling"].subgroup = "vgal-scrap"

data.raw["recipe"]["coal-liquefaction"].subgroup = "vgal-oil-fluids"
data.raw["recipe"]["advanced-oil-processing"].subgroup = "vgal-oil-fluids"
data.raw["recipe"]["basic-oil-processing"].subgroup = "vgal-oil-fluids"
data.raw["recipe"]["heavy-oil-cracking"].subgroup = "vgal-oil-fluids"
data.raw["recipe"]["light-oil-cracking"].subgroup = "vgal-oil-fluids"
data.raw["recipe"]["simple-coal-liquefaction"].subgroup = "vgal-oil-fluids"
data.raw["recipe"]["coal-liquefaction"].subgroup = "vgal-oil-fluids"
