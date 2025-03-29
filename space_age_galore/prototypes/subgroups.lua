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
        entries = {},
        -- when = { "vgal-crushing-recipes" },
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
        name = "oil-cracking",
        tab = "intermediate-products",
        order = "aca",
        entries = {}
    },
    {
        name = "fulgora-fluids",
        tab = "intermediate-products",
        order = "acb",
        entries = { "holmium-solution", "electrolyte" }
    },
    {
        name = "ammonia",
        tab = "intermediate-products",
        order = "acc",
        entries = { "ammonia", "ammoniacal-solution" }
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
    {
        name = "belt-t4",
        tab = "logistics",
        order = "bad",
        entries = { "turbo-transport-belt", "turbo-splitter", "turbo-underground-belt" },
        when = { "vgal-belts" },
    },
    {
        name = "soil",
        tab = "logistics",
        order = "x",
        entries = { "artificial-yumako-soil", "artificial-jellynut-soil", "landfill", "foundation", "overgrowth-yumako-soil", "overgrowth-jellynut-soil", "ice-platform" },
    },
    {
        name = "module-quality",
        tab = "production",
        order = "yd",
        entries = { "quality-module", "quality-module-2", "quality-module-3" },
        when = { "vgal-modules" },
    },

    {
        name = "space-science-pack",
        tab = "intermediate-products",
        order = "yf",
        entries = { "space-science-pack" },
        when = { "vgal-science-packs" },
    },
    {
        name = "planetary-science-pack",
        tab = "intermediate-products",
        order = "yg",
        entries =
        {
            "metallurgic-science-pack",
            "electromagnetic-science-pack",
            "agricultural-science-pack",
        },
        when = { "vgal-science-packs" },
    },
    {
        name = "endgame-science-pack",
        tab = "intermediate-products",
        order = "yh",
        entries = { "cryogenic-science-pack", "promethium-science-pack", },
        when = { "vgal-science-packs" },
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
    "casting-pipe",
    "casting-pipe-to-ground",
}
for _, value in ipairs(toClean) do
    data.raw["recipe"][value].order = nil
    data.raw["recipe"][value].subgroup = nil
end

for _, value in ipairs(subgroups) do
    for _, whenItem in ipairs(value.when or {}) do
        if not settings.startup[whenItem].value then
            value.entries = {}
        end
    end
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

-- vgal.subgroup.set_item_or_fluid("ammonia", "fluid-recipes")
-- vgal.subgroup.set_item_or_fluid("ammoniacal-solution", "fluid-recipes")
vgal.subgroup.set_item_or_fluid("fluorine", "fluid-recipes")
-- vgal.subgroup.set_item_or_fluid("holmium-solution", "fluid-recipes")
-- vgal.subgroup.set_item_or_fluid("electrolyte", "fluid-recipes")
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

data.raw["recipe"]["vgal-steam-heavy-oil-light-oil"].subgroup = "vgal-oil-cracking"
data.raw["recipe"]["vgal-steam-light-oil-petroleum-gas"].subgroup = "vgal-oil-cracking"
data.raw["recipe"]["heavy-oil-cracking"].subgroup = "vgal-oil-cracking"
data.raw["recipe"]["light-oil-cracking"].subgroup = "vgal-oil-cracking"

data.raw["ammo"]["tesla-ammo"].order = "eb"

data.raw["recipe"]["advanced-metallic-asteroid-crushing"].order = "ea"
data.raw["recipe"]["advanced-carbonic-asteroid-crushing"].order = "eb"
data.raw["recipe"]["advanced-oxide-asteroid-crushing"].order = "ec"

data.raw["recipe"]["thruster-fuel"].order = "ba"
data.raw["recipe"]["advanced-thruster-fuel"].order = "bb"
data.raw["recipe"]["thruster-oxidizer"].order = "ca"
data.raw["recipe"]["advanced-thruster-oxidizer"].order = "cb"

data.raw["recipe"]["burnt-spoilage"].order = "b[chemistry]-f[carbon]-a"


-- if settings.startup["vgal-crushing-recipes"].value then
--     data.raw["recipe"]["metallic-asteroid-crushing"].subgroup = "vgal-crushing"
--     data.raw["recipe"]["carbonic-asteroid-crushing"].subgroup = "vgal-crushing"
--     data.raw["recipe"]["oxide-asteroid-crushing"].subgroup = "vgal-crushing"

--     data.raw["recipe"]["advanced-metallic-asteroid-crushing"].subgroup = "vgal-crushing"
--     data.raw["recipe"]["advanced-carbonic-asteroid-crushing"].subgroup = "vgal-crushing"
--     data.raw["recipe"]["advanced-oxide-asteroid-crushing"].subgroup = "vgal-crushing"
-- end
data.raw["recipe"]["scrap-recycling"].subgroup = "vgal-scrap"

for _, value in ipairs(toClean) do
    vgal.subgroup.restore(value)
end


-- data.raw["recipe"]["coal-liquefaction"].subgroup = "vgal-oil-fluids"
-- data.raw["recipe"]["advanced-oil-processing"].subgroup = "vgal-oil-fluids"
-- data.raw["recipe"]["basic-oil-processing"].subgroup = "vgal-oil-fluids"
-- data.raw["recipe"]["heavy-oil-cracking"].subgroup = "vgal-oil-fluids"
-- data.raw["recipe"]["light-oil-cracking"].subgroup = "vgal-oil-fluids"
-- data.raw["recipe"]["simple-coal-liquefaction"].subgroup = "vgal-oil-fluids"
-- data.raw["recipe"]["coal-liquefaction"].subgroup = "vgal-oil-fluids"
