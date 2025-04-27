--- prod fixes ---

vgal.recipe.add_catalyst_entry("angels-electrode-used")
vgal.recipe.add_catalyst_entry("liquid-coolant-used")
vgal.recipe.add_catalyst_entry("catalyst-metal-carrier")

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
    for i = 2, 6 do -- bc categories only get fixed in update subphase.
        local machine_max_try = data.raw["assembling-machine"][machine_name .. "-" .. i] or
            data.raw["furnace"][machine_name .. "-" .. i]
        if machine_max_try then machine = machine_max_try end
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
            vgal.recipe.smart_allow_productivity(recipe.name)
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


vgal.recipe.smart_allow_productivity("rocket-fuel-capsule")
vgal.recipe.smart_allow_productivity("rocket-oxidizer-capsule")
vgal.recipe.smart_allow_productivity("rocket-booster-1")
vgal.recipe.smart_allow_productivity("rocket-booster-2")
vgal.recipe.smart_allow_productivity("rocket-fuel-capsule")
vgal.recipe.smart_allow_productivity("solid-nitroglycerin")
vgal.recipe.smart_allow_productivity("solid-trinitrotoluene")
vgal.recipe.smart_allow_productivity("angels-electrode")

vgal.recipe.smart_allow_productivity("coal-cracking-1")
vgal.recipe.smart_allow_productivity("coal-cracking-2") -- w
vgal.recipe.smart_allow_productivity("coal-cracking-3")

vgal.recipe.smart_allow_productivity("coal-crushed")
vgal.recipe.smart_allow_productivity("solid-coke")
vgal.recipe.smart_allow_productivity("solid-coke-sulfur")
vgal.recipe.smart_allow_productivity("coke-purification")
vgal.recipe.smart_allow_productivity("coke-purification-2")
vgal.recipe.smart_allow_productivity("mineral-oil-lubricant")
vgal.recipe.smart_allow_productivity("steam-cracking-fuel-oil")
vgal.recipe.smart_allow_productivity("pellet-coke")
vgal.recipe.smart_allow_productivity("carbon-separation-1")
vgal.recipe.smart_allow_productivity("carbon-separation-2")
vgal.recipe.smart_allow_productivity("liquid-plastic-1")
vgal.recipe.smart_allow_productivity("liquid-plastic-2")
vgal.recipe.smart_allow_productivity("liquid-plastic-3")

vgal.recipe.smart_allow_productivity("solid-fuel-methane")
vgal.recipe.smart_allow_productivity("solid-fuel-naphtha")
vgal.recipe.smart_allow_productivity("solid-fuel-fuel-oil")
vgal.recipe.smart_allow_productivity("solid-fuel-synthesis")
vgal.recipe.smart_allow_productivity("solid-fuel-hydrazine")
vgal.recipe.smart_allow_productivity("catalyst-metal-carrier")

vgal.recipe.smart_allow_productivity("gas-acid-catalyst") -- w
vgal.recipe.smart_allow_productivity("solid-ammonium-nitrate")
vgal.recipe.smart_allow_productivity("solid-ammonium-perchlorate")

--- new section ---

vgal.recipe.smart_allow_productivity("coolant")
vgal.recipe.smart_allow_productivity("water-saline")
vgal.recipe.smart_allow_productivity("solid-salt-dissolving")
vgal.recipe.smart_allow_productivity("solid-salt")

--- new section ---

vgal.recipe.smart_allow_productivity("cellulose-fiber-algae")
vgal.recipe.smart_allow_productivity("cellulose-fiber-raw-wood")
vgal.recipe.smart_allow_productivity("paste-cellulose")
vgal.recipe.smart_allow_productivity("gas-ammonia-from-blue-fiber")
vgal.recipe.smart_allow_productivity("wood-pellets")
vgal.recipe.smart_allow_productivity("wood-bricks")
vgal.recipe.smart_allow_productivity("gas-carbon-dioxide-from-wood")
vgal.recipe.smart_allow_productivity("wood-charcoal")
vgal.recipe.smart_allow_productivity("solid-soil")
vgal.recipe.smart_allow_productivity("solid-soil-alternative")
vgal.recipe.smart_allow_productivity("solid-fertilizer")
vgal.recipe.smart_allow_productivity("solid-alienated-fertilizer")
vgal.recipe.smart_allow_productivity("solid-saw")
vgal.recipe.smart_allow_productivity("solid-crystal-tipped-saw")
vgal.recipe.smart_allow_productivity("solid-crystal-full-saw")
vgal.recipe.smart_allow_productivity("alien-goo")
vgal.recipe.smart_allow_productivity("solid-sodium-carbonate") -- hmm
vgal.recipe.smart_allow_productivity("solid-calcium-carbonate")

--- new section ---

vgal.recipe.smart_allow_productivity("gas-puffer-atmosphere")
vgal.recipe.smart_allow_productivity("biter-small-eggsperiment")
vgal.recipe.smart_allow_productivity("biter-medium-eggsperiment")
vgal.recipe.smart_allow_productivity("biter-big-eggsperiment")
vgal.recipe.smart_allow_productivity("alien-processed-meat")
vgal.recipe.smart_allow_productivity("petri-dish")
vgal.recipe.smart_allow_productivity("crystal-enhancer")
vgal.recipe.smart_allow_productivity("crystal-grindstone")

--- new section ---

vgal.recipe.smart_allow_productivity("fermentation-corn")
vgal.recipe.smart_allow_productivity("fermentation-fruit")
vgal.recipe.smart_allow_productivity("aerobic-fermentation")
vgal.recipe.smart_allow_productivity("anaerobic-fermentation")

--- new section ---

vgal.recipe.smart_allow_productivity("geode-blue-liquify")
vgal.recipe.smart_allow_productivity("geode-purple-liquify")
vgal.recipe.smart_allow_productivity("geode-yellow-liquify")
vgal.recipe.smart_allow_productivity("geode-lightgreen-liquify")
vgal.recipe.smart_allow_productivity("geode-cyan-liquify")
vgal.recipe.smart_allow_productivity("geode-red-liquify")
vgal.recipe.smart_allow_productivity("crystal-dust-liquify")
vgal.recipe.smart_allow_productivity("crystal-powder-slurry")
vgal.recipe.smart_allow_productivity("slag-processing-dissolution")
vgal.recipe.smart_allow_productivity("stone-crushed-dissolution")

--- metallugy ---

vgal.recipe.smart_allow_productivity("angels-clay-brick-raw")

--- casting ---

vgal.recipe.smart_allow_productivity("angelsore1-crushed-smelting")
vgal.recipe.smart_allow_productivity("angelsore3-crushed-smelting")

local METALS = { "copper", "iron" }
for _, metal in ipairs(METALS) do
    vgal.recipe.smart_allow_productivity("angels-" .. metal .. "-pebbles-smelting")
    vgal.recipe.smart_allow_productivity("angels-" .. metal .. "-nugget-smelting")
    vgal.recipe.smart_allow_productivity(metal .. "-plate")
    vgal.recipe.smart_allow_productivity("angels-plate-" .. metal)
    -- vgal.recipe.smart_allow_productivity("roll-" .. metal .. "-casting")
    -- vgal.recipe.smart_allow_productivity("roll-" .. metal .. "-casting-fast")
    -- vgal.recipe.smart_allow_productivity("angels-wire-coil-" .. metal .. "-casting")
    -- vgal.recipe.smart_allow_productivity("angels-wire-coil-" .. metal .. "-casting-fast")
end

vgal.recipe.smart_allow_productivity("concrete-mixture-1")
vgal.recipe.smart_allow_productivity("concrete-mixture-2")
vgal.recipe.smart_allow_productivity("angels-reinforced-concrete-brick")
vgal.recipe.smart_allow_productivity("angels-concrete-brick")
