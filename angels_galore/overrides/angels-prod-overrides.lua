--- prod fixes ---

local function allow_prod(recipe_name)
    data.raw["recipe"][recipe_name].allow_productivity = true
end

local PROD_MACHINES = {
    "bio-press", "bio-generator-temperate-1", "bio-generator-swamp-1", "bio-generator-desert-1",
    "crop-farm", "temperate-farm", "swamp-farm", "desert-farm", "composter", "bio-processor", "nutrient-extractor",
    "algae-farm",
    "salination-plant", "induction-furnace", "casting-machine", "strand-casting-machine", "ore-sorting-facility",
    "ore-crusher", "ore-floatation-cell", "ore-leaching-plant", "ore-refinery", "ore-powderizer", "filtration-unit",
    "crystallizer", "ore-processing-machine", "pellet-press", "powder-mixer", "blast-furnace",
    "washing-plant", "angels-chemical-furnace", "oil-refinery", -- chem furnace is removed but just to be sure..
    "gas-refinery-small", "gas-refinery", "separator",
}
local PROD_CATEGORIES = {}
for _, machine_name in ipairs(PROD_MACHINES) do
    local machine = data.raw["assembling-machine"][machine_name] or data.raw["furnace"][machine_name]
    if not machine then
        error(machine_name)
    end
    local categories = machine.crafting_categories or {}
    for _, category in ipairs(categories) do
        PROD_CATEGORIES[category] = true
    end
    machine.allowed_effects = { "speed", "productivity", "consumption", "pollution", "quality" }
end

for _, recipe in pairs(data.raw["recipe"]) do
    if PROD_CATEGORIES[recipe.category] then
        if recipe.allow_productivity ~= false then
            allow_prod(recipe.name)
        end
    end
end

vgal.recipe.add_productivity_entry("liquid-plastic")
vgal.recipe.add_productivity_entry("rocket-booster")
vgal.recipe.add_productivity_entry("solid-carbon")
vgal.recipe.add_productivity_entry("cellolose-fiber")
vgal.recipe.add_productivity_entry("red-cellolose-fiber")
vgal.recipe.add_productivity_entry("blue-cellolose-fiber")
vgal.recipe.add_productivity_entry("crystal-slurry")
vgal.recipe.add_productivity_entry("slag-slurry")
vgal.recipe.add_productivity_entry("concrete")


allow_prod("rocket-fuel-capsule")
allow_prod("rocket-oxidizer-capsule")
allow_prod("rocket-booster-1")
allow_prod("rocket-booster-2")
allow_prod("rocket-fuel-capsule")
allow_prod("solid-nitroglycerin")
allow_prod("solid-trinitrotoluene")
allow_prod("angels-electrode")

allow_prod("coal-cracking-1")
allow_prod("coal-cracking-2") -- w
allow_prod("coal-cracking-3")

allow_prod("coal-crushed")
allow_prod("solid-coke")
allow_prod("solid-coke-sulfur")
allow_prod("coke-purification")
allow_prod("coke-purification-2")
allow_prod("mineral-oil-lubricant")
allow_prod("steam-cracking-fuel-oil")
allow_prod("pellet-coke")
allow_prod("carbon-separation-1")
allow_prod("carbon-separation-2")
allow_prod("liquid-plastic-1")
allow_prod("liquid-plastic-2")
allow_prod("liquid-plastic-3")

allow_prod("solid-fuel-methane")
allow_prod("solid-fuel-naphtha")
allow_prod("solid-fuel-fuel-oil")
allow_prod("solid-fuel-synthesis")
allow_prod("solid-fuel-hydrazine")
allow_prod("catalyst-metal-carrier")

allow_prod("gas-acid-catalyst") -- w
allow_prod("solid-ammonium-nitrate")
allow_prod("solid-ammonium-perchlorate")

--- new section ---

allow_prod("coolant")
allow_prod("water-saline")
allow_prod("solid-salt-dissolving")
allow_prod("solid-salt")

--- new section ---

allow_prod("cellulose-fiber-algae")
allow_prod("cellulose-fiber-raw-wood")
allow_prod("paste-cellulose")
allow_prod("gas-ammonia-from-blue-fiber")
allow_prod("wood-pellets")
allow_prod("wood-bricks")
allow_prod("gas-carbon-dioxide-from-wood")
allow_prod("wood-charcoal")
allow_prod("solid-soil")
allow_prod("solid-soil-alternative")
allow_prod("solid-fertilizer")
allow_prod("solid-alienated-fertilizer")
allow_prod("solid-saw")
allow_prod("solid-crystal-tipped-saw")
allow_prod("solid-crystal-full-saw")
allow_prod("alien-goo")
allow_prod("solid-sodium-carbonate") -- hmm
allow_prod("solid-calcium-carbonate")

--- new section ---

allow_prod("gas-puffer-atmosphere")
allow_prod("biter-small-eggsperiment")
allow_prod("biter-medium-eggsperiment")
allow_prod("biter-big-eggsperiment")
allow_prod("alien-processed-meat")
allow_prod("petri-dish")
allow_prod("crystal-enhancer")
allow_prod("crystal-grindstone")

--- new section ---

allow_prod("fermentation-corn")
allow_prod("fermentation-fruit")
allow_prod("aerobic-fermentation")
allow_prod("anaerobic-fermentation")

--- new section ---

allow_prod("geode-blue-liquify")
allow_prod("geode-purple-liquify")
allow_prod("geode-yellow-liquify")
allow_prod("geode-lightgreen-liquify")
allow_prod("geode-cyan-liquify")
allow_prod("geode-red-liquify")
allow_prod("crystal-dust-liquify")
allow_prod("crystal-powder-slurry")
allow_prod("slag-processing-dissolution")
allow_prod("stone-crushed-dissolution")

--- metallugy ---

allow_prod("angels-clay-brick-raw")

--- casting ---

allow_prod("angelsore1-crushed-smelting")
allow_prod("angelsore3-crushed-smelting")

local METALS = { "copper", "iron" }
for _, metal in ipairs(METALS) do
    allow_prod("angels-" .. metal .. "-pebbles-smelting")
    allow_prod("angels-" .. metal .. "-nugget-smelting")
    allow_prod(metal .. "-plate")
    allow_prod("angels-plate-" .. metal)
    -- allow_prod("roll-" .. metal .. "-casting")
    -- allow_prod("roll-" .. metal .. "-casting-fast")
    -- allow_prod("angels-wire-coil-" .. metal .. "-casting")
    -- allow_prod("angels-wire-coil-" .. metal .. "-casting-fast")
end

allow_prod("concrete-mixture-1")
allow_prod("concrete-mixture-2")
allow_prod("angels-reinforced-concrete-brick")
allow_prod("angels-concrete-brick")
