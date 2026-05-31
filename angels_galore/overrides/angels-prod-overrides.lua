-- only override file that runs in the datastage, why? so prod/catalyst entries get registered before any recipes get added.
-- recipes decide what items get prod and what not according to the catalyst and prod entry lists

-- register catalysts (catalysts don't work with productivity)
vgal.recipe.add_catalyst_entry("angels-electrode-used")
vgal.recipe.add_catalyst_entry("angels-liquid-coolant-used")
vgal.recipe.add_catalyst_entry("angels-liquid-coolant")
vgal.recipe.add_catalyst_entry("angels-filter-ceramic-used")
vgal.recipe.add_catalyst_entry("angels-filter-frame")
vgal.recipe.add_catalyst_entry("angels-catalyst-metal-carrier")
vgal.recipe.add_catalyst_entry("angels-water-yellow-waste")
vgal.recipe.add_catalyst_entry("angels-water-greenyellow-waste")
vgal.recipe.add_catalyst_entry("angels-water-green-waste")
vgal.recipe.add_catalyst_entry("angels-liquid-polluted-fish-atmosphere")
vgal.recipe.add_catalyst_entry("angels-solid-saw")
vgal.recipe.add_catalyst_entry("angels-solid-crystal-tipped-saw")
vgal.recipe.add_catalyst_entry("angels-solid-crystal-full-saw")

vgal.recipe.add_catalyst_entry("angels-water-heavy-mud")
vgal.recipe.add_catalyst_entry("angels-water-concentrated-mud")
vgal.recipe.add_catalyst_entry("angels-water-thin-mud")
vgal.recipe.add_catalyst_entry("angels-water-light-mud")
vgal.recipe.add_catalyst_entry("angels-water-saline")

-- for puffer_index = 1, 5 do
--     vgal.recipe.add_catalyst_entry("angels-bio-puffer-" .. puffer_index)
-- end

-- vgal.recipe.add_catalyst_entry("raw-fish")
-- for fish_index = 1, 3 do vgal.recipe.add_catalyst_entry("angels-alien-fish-" .. fish_index .. "-raw") end

-- for puffer_index = 1, 5 do vgal.recipe.add_catalyst_entry("angels-bio-puffer-" .. puffer_index) end

for i = 3, 5 do
    for _, environment in pairs(agal.defines.environments) do
        vgal.recipe.add_catalyst_entry("angels-" .. environment.name .. "-" .. i .. "-seed-dormant")
    end
end

-- machines that can benefit from productivity, no corrections needed
local productivity_machines = {
    "angels-bio-press", "angels-bio-generator-temperate-1",
    "angels-crop-farm", "angels-temperate-farm", "angels-swamp-farm", "angels-desert-farm", "angels-composter",
    "angels-bio-processor",
    "angels-nutrient-extractor",
    "angels-algae-farm", "angels-bio-refugium-puffer", "angels-bio-refugium-fish", "angels-bio-butchery",
    "angels-bio-hatchery",
    "angels-bio-arboretum-1",
    "angels-seed-extractor",
    "angels-salination-plant", "angels-induction-furnace", "angels-casting-machine", "angels-strand-casting-machine",
    "angels-ore-sorting-facility",
    "angels-ore-crusher", "angels-ore-floatation-cell", "angels-ore-leaching-plant", "angels-ore-refinery",
    "angels-powderizer",
    "angels-filtration-unit",
    "angels-crystallizer", "angels-ore-processing-machine", "angels-pellet-press", "angels-powder-mixer",
    "angels-blast-furnace",
    "angels-washing-plant", "oil-refinery", "angels-chemical-furnace",
    "angels-gas-refinery-small", "angels-gas-refinery", "angels-separator",
}

-- will be filled with crafting categories that should benefit from productivity
local productivity_categories = {}

-- make sure machines allow productivity.
for _, machine_name in ipairs(productivity_machines) do
    local machine = data.raw["assembling-machine"][machine_name] or data.raw["furnace"][machine_name]
    if not machine then
        error("Machine does not exist: " .. machine_name)
    end
    for i = 2, 6 do -- bc categories only get fixed in update subphase.
        local max_tiered_machine = data.raw["assembling-machine"][machine_name .. "-" .. i] or
            data.raw["furnace"][machine_name .. "-" .. i]
        if max_tiered_machine then machine = max_tiered_machine end
    end
    local categories = machine.crafting_categories or {}
    for _, category in ipairs(categories) do
        productivity_categories[category] = machine_name
    end
    machine.allowed_effects = { "speed", "productivity", "consumption", "pollution", "quality" } -- might be a bit too hard-codey
end

for _, recipe in pairs(data.raw["recipe"]) do
    if productivity_categories[recipe.category] then
        if agal.is_angels(recipe) then
            vgal.recipe.smart_allow_productivity(recipe.name)
        end
    end
end

-- CHEM
vgal.recipe.smart_allow_productivity("angels-rocket-fuel-capsule")
vgal.recipe.smart_allow_productivity("angels-electrode")

vgal.recipe.smart_allow_productivity("angels-coal-cracking-1")
vgal.recipe.smart_allow_productivity("angels-coal-cracking-2")
vgal.recipe.smart_allow_productivity("angels-coal-cracking-3")

vgal.recipe.smart_allow_productivity("angels-filter-frame")
vgal.recipe.smart_allow_productivity("angels-coal-crushed")
vgal.recipe.smart_allow_productivity("angels-solid-coke")
vgal.recipe.smart_allow_productivity("angels-solid-coke-sulfur")
vgal.recipe.smart_allow_productivity("angels-solid-carbon")
vgal.recipe.smart_allow_productivity("angels-coke-purification-2")
vgal.recipe.smart_allow_productivity("angels-mineral-oil-lubricant")
vgal.recipe.smart_allow_productivity("angels-steam-cracking-fuel-oil")
vgal.recipe.smart_allow_productivity("angels-pellet-coke")
vgal.recipe.smart_allow_productivity("angels-gas-carbon-monoxide") -- hmmmmmm
vgal.recipe.smart_allow_productivity("angels-gas-carbon-dioxide")

vgal.recipe.smart_allow_productivity("angels-solid-fuel-methane")
vgal.recipe.smart_allow_productivity("angels-solid-fuel-naphtha")
vgal.recipe.smart_allow_productivity("angels-solid-fuel-fuel-oil")
vgal.recipe.smart_allow_productivity("angels-solid-fuel-synthesis")
vgal.recipe.smart_allow_productivity("angels-solid-fuel-hydrazine")
vgal.recipe.smart_allow_productivity("angels-catalyst-metal-carrier")

vgal.recipe.smart_allow_productivity("angels-gas-acid-catalyst")
vgal.recipe.smart_allow_productivity("angels-solid-ammonium-nitrate")
vgal.recipe.smart_allow_productivity("angels-solid-ammonium-perchlorate")

-- WATER
vgal.recipe.smart_allow_productivity("angels-liquid-coolant")

-- BIO
vgal.recipe.smart_allow_productivity("angels-fermentation-corn")
vgal.recipe.smart_allow_productivity("angels-fermentation-fruit")
-- commentecbc; other (chem)path doesnt allow prod, might be unfair
-- vgal.recipe.smart_allow_productivity("angels-liquid-acetic-acid")
-- vgal.recipe.smart_allow_productivity("angels-gas-ethanol")

vgal.recipe.smart_allow_productivity("angels-liquid-cellulose-acetate-mixture")
vgal.recipe.smart_allow_productivity("angels-electrode")
vgal.recipe.smart_allow_productivity("angels-paste-cellulose")

vgal.recipe.smart_allow_productivity("angels-blue-cellulose-fiber")
vgal.recipe.smart_allow_productivity("angels-red-cellulose-fiber")
vgal.recipe.smart_allow_productivity("angels-cellulose-fiber")
vgal.recipe.smart_allow_productivity("angels-cellulose-fiber-raw-wood")
vgal.recipe.smart_allow_productivity("angels-paste-cellulose")
vgal.recipe.smart_allow_productivity("angels-gas-ammonia-from-blue-fiber")
vgal.recipe.smart_allow_productivity("angels-wood-pellets")
vgal.recipe.smart_allow_productivity("angels-wood-bricks")
vgal.recipe.smart_allow_productivity("angels-gas-carbon-dioxide-from-wood")
vgal.recipe.smart_allow_productivity("angels-wood-charcoal")
vgal.recipe.smart_allow_productivity("angels-solid-soil")
vgal.recipe.smart_allow_productivity("angels-solid-soil-alternative")
vgal.recipe.smart_allow_productivity("angels-solid-fertilizer")
vgal.recipe.smart_allow_productivity("angels-solid-alienated-fertilizer")
vgal.recipe.smart_allow_productivity("angels-solid-saw")
vgal.recipe.smart_allow_productivity("angels-solid-crystal-tipped-saw")
vgal.recipe.smart_allow_productivity("angels-solid-crystal-full-saw")
vgal.recipe.smart_allow_productivity("angels-alien-goo")
vgal.recipe.smart_allow_productivity("angels-solid-calcium-carbonate")
vgal.recipe.smart_allow_productivity("angels-gas-methanol-from-wood")
vgal.recipe.smart_allow_productivity("angels-carbon-from-charcoal")
vgal.recipe.smart_allow_productivity("angels-algae-brown-burning-wash")
vgal.recipe.smart_allow_productivity("angels-wood-sawing-1")
vgal.recipe.smart_allow_productivity("angels-wood-sawing-2")
vgal.recipe.smart_allow_productivity("angels-wood-sawing-3")

-- FAUNA
vgal.recipe.smart_allow_productivity("angels-gas-puffer-atmosphere")
vgal.recipe.smart_allow_productivity("angels-biter-small-egg")
vgal.recipe.smart_allow_productivity("angels-biter-medium-egg")
vgal.recipe.smart_allow_productivity("angels-biter-big-egg")
vgal.recipe.smart_allow_productivity("angels-bio-alien-processed-meat")
vgal.recipe.smart_allow_productivity("angels-petri-dish")
vgal.recipe.smart_allow_productivity("angels-substrate-dish")
vgal.recipe.smart_allow_productivity("angels-seeded-dish")
vgal.recipe.smart_allow_productivity("angels-crystal-seed")
vgal.recipe.smart_allow_productivity("angels-egg-shell-seed")
vgal.recipe.smart_allow_productivity("angels-crystal-enhancer")
vgal.recipe.smart_allow_productivity("angels-crystal-grindstone")
vgal.recipe.smart_allow_productivity("angels-alien-spores")

-- MINERALS
vgal.recipe.smart_allow_productivity("angels-geode-blue-liquify")
vgal.recipe.smart_allow_productivity("angels-geode-purple-liquify")
vgal.recipe.smart_allow_productivity("angels-geode-yellow-liquify")
vgal.recipe.smart_allow_productivity("angels-geode-lightgreen-liquify")
vgal.recipe.smart_allow_productivity("angels-geode-cyan-liquify")
vgal.recipe.smart_allow_productivity("angels-geode-red-liquify")
vgal.recipe.smart_allow_productivity("angels-crystal-dust-liquify")
vgal.recipe.smart_allow_productivity("angels-crystal-powder-slurry")
vgal.recipe.smart_allow_productivity("angels-slag-processing-dissolution")
vgal.recipe.smart_allow_productivity("angels-stone-crushed-dissolution")
vgal.recipe.smart_allow_productivity("angels-liquid-concrete")

-- METALLURGY
for _, metal in pairs(vgal.defines.metals --[[@as table<string, agal.Metal>]]) do
    vgal.recipe.smart_allow_productivity(metal.pebbles .. "-smelting")
    vgal.recipe.smart_allow_productivity(metal.nugget .. "-smelting")
    vgal.recipe.smart_allow_productivity(metal.plate)
    vgal.recipe.smart_allow_productivity(metal.angels_plate_recipe_name)
end

-- MISC
-- concrete is an intermediate now (angel's says so as well)
data.raw["recipe"]["concrete"].allow_productivity = true
data.raw["recipe"]["angels-nuclear-fuel"].allow_productivity = true
data.raw["recipe"]["angels-nuclear-fuel-2"].allow_productivity = true
data.raw["recipe"]["angels-milling-drum"].allow_productivity = true
data.raw["recipe"]["angels-steam-cracking-oil-residual"].allow_productivity = true
vgal.recipe.smart_allow_productivity("angels-filter-lime-used-cleaning")

-- fixes
vgal.recipe.allow_productivity_for_all_results("angels-gas-separation")
vgal.recipe.allow_productivity_for_all_results("angels-oil-separation")

-- PROD DISALLOW

data.raw["recipe"]["angels-solid-salt-dissolving"].allow_productivity = false
data.raw["recipe"]["angels-solid-salt"].allow_productivity = false
data.raw["recipe"]["angels-water-saline-from-water"].allow_productivity = false
data.raw["recipe"]["angels-concrete-brick"].allow_productivity = false
data.raw["recipe"]["angels-clay-brick"].allow_productivity = false
data.raw["recipe"]["nuclear-fuel-reprocessing"].allow_productivity = false
data.raw["recipe"]["angels-coolant-used-filtration-1"].allow_productivity = false
data.raw["recipe"]["angels-coolant-used-filtration-2"].allow_productivity = false
vgal.recipe.disallow_productivity_for_result("angels-coke-purification-2", "angels-solid-sodium-carbonate")
vgal.recipe.disallow_productivity_for_result("angels-coke-purification-2", "water")

-- ADD PROD ENTRIES (that didnt get added with the smart_allow_productivity calls)

vgal.recipe.add_productivity_entry("angels-thorium-ore")
for _, metal in pairs(vgal.defines.metals --[[@as table<string, agal.Metal>]]) do
    vgal.recipe.add_productivity_entry(metal.nugget)
    vgal.recipe.add_productivity_entry(metal.slag)
end
