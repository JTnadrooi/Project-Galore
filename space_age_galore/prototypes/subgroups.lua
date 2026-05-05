---@type vgal.SubgroupOverrideCollection[]
local subgroups = {
    {
        name = "circuits-t4",
        group = "intermediate-products",
        order = "gcd",
        entries = { "quantum-processor" }
    },
    {
        name = "bacteria",
        group = "intermediate-products",
        order = "ma",
        entries = { "iron-bacteria", "copper-bacteria" }
    },
    {
        name = "nutrients",
        group = "intermediate-products",
        order = "mb",
        entries = { "nutrients" },
        cleaning_entries = {
            "nutrients-from-fish",
            "nutrients-from-biter-egg",
            "nutrients-from-spoilage",
            "nutrients-from-yumako-mash",
            "nutrients-from-bioflux",
        }
    },
    {
        name = "crushing",
        group = "intermediate-products",
        order = "bb",
        entries = {},
        -- when_settings = { "vgal-crushing-recipes" },
    },
    {
        name = "scrap",
        group = "intermediate-products",
        order = "bc",
        entries = { "scrap" }
    },
    {
        name = "water",
        group = "intermediate-products",
        order = "ab",
        entries = { "ice", "water", "steam" }
    },
    {
        name = "oil-fluids",
        group = "intermediate-products",
        order = "ac",
        entries = { "heavy-oil", "light-oil", "petroleum-gas", "crude-oil" }
    },
    {
        name = "oil-cracking",
        group = "intermediate-products",
        order = "aca",
        entries = {}
    },
    {
        name = "fulgora-fluids",
        group = "intermediate-products",
        order = "acb",
        entries = { "holmium-solution", "electrolyte" }
    },
    {
        name = "ammonia",
        group = "intermediate-products",
        order = "acc",
        entries = { "ammonia", "ammoniacal-solution" }
    },
    {
        name = "intermediate-casting",
        group = "intermediate-products",
        order = "ka",
        entries = {}
    },
    {
        name = "molten-metals",
        group = "intermediate-products",
        order = "kb",
        entries = { "molten-iron", "molten-copper", "lava" }
    },
    {
        name = "belt-t4",
        group = "logistics",
        order = "bad",
        entries = { "turbo-transport-belt", "turbo-splitter", "turbo-underground-belt" },
        when_settings = { "vgal-belts" },
    },
    {
        name = "soil",
        group = "logistics",
        order = "x",
        entries = { "artificial-yumako-soil", "artificial-jellynut-soil", "landfill", "foundation", "overgrowth-yumako-soil", "overgrowth-jellynut-soil", "ice-platform" },
    },

    {
        name = "space-science-pack",
        group = "intermediate-products",
        order = "yf",
        entries = { "space-science-pack" },
        when_settings = { "vgal-science-packs" },
    },
    {
        name = "planetary-science-pack",
        group = "intermediate-products",
        order = "yg",
        entries =
        {
            "metallurgic-science-pack",
            "electromagnetic-science-pack",
            "agricultural-science-pack",
        },
        when_settings = { "vgal-science-packs" },
    },
    {
        name = "endgame-science-pack",
        group = "intermediate-products",
        order = "yh",
        entries = { "cryogenic-science-pack", "promethium-science-pack", },
        when_settings = { "vgal-science-packs" },
    },
    {
        name = "space-advanced",
        group = "space",
        order = "hb",
        entries = {},
    },
}

local toClean = {
    "fluoroketone-cooling",
    "ammoniacal-solution-separation",
    "solid-fuel-from-ammonia",
    "ammonia-rocket-fuel",
    "iron-bacteria-cultivation",
    "copper-bacteria-cultivation",
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
    "pentapod-egg",
}

for _, value in ipairs(toClean) do
    vgal.subgroup.clean_recipe(value)
end

vgal.subgroup.process_override_subgroups(subgroups)

data.raw["recipe"]["molten-iron-from-lava"].main_product = "molten-iron"
data.raw["recipe"]["molten-copper-from-lava"].main_product = "molten-copper"
data.raw["recipe"]["ammoniacal-solution-separation"].main_product = "ammonia"
data.raw["recipe"]["ammoniacal-solution-separation"].subgroup = "vgal-water"
data.raw["recipe"]["acid-neutralisation"].main_product = "steam"

data.raw["item"]["pentapod-egg"].subgroup = "agriculture-products"
data.raw["item"]["pentapod-egg"].order = "c-b"

data.raw["recipe"]["iron-bacteria-cultivation"].order = "aa"
data.raw["recipe"]["copper-bacteria-cultivation"].order = "ba"
data.raw["recipe"]["iron-bacteria"].order = "axa"
data.raw["recipe"]["copper-bacteria"].order = "bxa"

vgal.subgroup.set_for("fusion-power-cell", "uranium-processing")
vgal.subgroup.set_for("lithium-plate", "vgal-smelting")
vgal.subgroup.set_for("lithium", "raw-resource")
vgal.subgroup.set_for("fluoroketone-hot", "fluid-recipes")
vgal.subgroup.set_for("fluoroketone-cold", "fluid-recipes")
vgal.subgroup.set_for("sulfuric-acid", "fluid-recipes")
vgal.subgroup.set_for("fusion-plasma", "fluid-recipes")

vgal.subgroup.set_for("fluorine", "fluid-recipes")
vgal.subgroup.set_for("lithium-brine", "fluid-recipes")
vgal.subgroup.set_for("thruster-oxidizer", "space-processing")
vgal.subgroup.set_for("thruster-fuel", "space-processing")

vgal.subgroup.set_for("carbon-fiber", "intermediate-product")
vgal.subgroup.set_for("raw-fish", "agriculture-processes")
vgal.subgroup.set_for("wood", "agriculture-processes")
vgal.subgroup.set_for("tree-seed", "agriculture-processes")

vgal.subgroup.set_for("supercapacitor", "intermediate-product")
vgal.subgroup.set_for("superconductor", "vgal-chemistry-products")
vgal.subgroup.set_for("holmium-plate", "vgal-smelting")

vgal.subgroup.set_for("tungsten-plate", "vgal-smelting")
vgal.subgroup.set_for("tungsten-carbide", "vgal-chemistry-products")

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

data.raw["recipe"]["advanced-metallic-asteroid-crushing"].order = "aa"
data.raw["recipe"]["advanced-carbonic-asteroid-crushing"].order = "ab"
data.raw["recipe"]["advanced-oxide-asteroid-crushing"].order = "ac"
data.raw["recipe"]["advanced-metallic-asteroid-crushing"].subgroup = "vgal-space-advanced"
data.raw["recipe"]["advanced-carbonic-asteroid-crushing"].subgroup = "vgal-space-advanced"
data.raw["recipe"]["advanced-oxide-asteroid-crushing"].subgroup = "vgal-space-advanced"

data.raw["recipe"]["simple-coal-liquefaction"].subgroup = "vgal-oil"
data.raw["recipe"]["scrap-recycling"].subgroup = "vgal-scrap"

-- restore clean/cleared properties with updated order and subgroup for compat reasons
for _, value in ipairs(toClean) do
    vgal.subgroup.restore(value)
end
