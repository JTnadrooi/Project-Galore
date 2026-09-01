-- setup; runs in data phase

-- vanilla restores (excludes stuff for both metals)
-- vgal.item.set_rocket_capacity("plastic-bar", 400)
-- vgal.item.set_rocket_capacity("stone", 500)

-- metal both (+steel(?))
for metal in vgal.table.iter_all(vgal.defines.metals, { vgal.defines.metal_steel }) do
    if metal.name ~= "steel" then
        vgal.item.set_rocket_capacity(metal.base_ore, 500)
        vgal.item.set_rocket_capacity(metal.crushed, 500)
        vgal.item.set_rocket_capacity(metal.chunk, 500)
        vgal.item.set_rocket_capacity(metal.crystal, 500)
        vgal.item.set_rocket_capacity(metal.pure, 500)

        vgal.item.set_rocket_capacity(metal.nugget, 400)
        vgal.item.set_rocket_capacity(metal.slag, 400)
        vgal.item.set_rocket_capacity(metal.pebbles, 1000)

        vgal.item.set_rocket_capacity(metal.processed, 500)
        vgal.item.set_rocket_capacity(metal.pellet, 500)
    end

    vgal.item.set_rocket_capacity(metal.ingot, 1000)
    vgal.item.set_rocket_capacity(metal.plate, 1000)
    vgal.item.set_rocket_capacity(metal.roll, 200)
end

-- stone/tiles
vgal.item.set_rocket_capacity("angels-solid-lime", 400)
vgal.item.set_rocket_capacity("angels-solid-limestone", 200)
vgal.item.set_rocket_capacity("angels-stone-crushed", 500)
vgal.item.set_rocket_capacity("angels-solid-sand", 500)
vgal.item.set_rocket_capacity("angels-solid-clay", 800)
vgal.item.set_rocket_capacity("angels-clay-brick", 800)
vgal.item.set_rocket_capacity("angels-bio-tile", 100)
vgal.item.set_rocket_capacity("angels-concrete-brick", 100)
vgal.item.set_rocket_capacity("angels-solid-cement", 200)
vgal.item.set_rocket_capacity("angels-slag", 200)
vgal.item.set_rocket_capacity("angels-solid-mud", 400)

-- geodes/cryst
for _, geode in pairs(vgal.defines.geodes) do
    vgal.item.set_rocket_capacity(geode.name, 200)
end
vgal.item.set_rocket_capacity("angels-crystal-dust", 500)
vgal.item.set_rocket_capacity("angels-crystal-powder", 1000)

-- nuclear
for _, nuclear_rock in pairs(vgal.defines.nuclear_rocks) do
    vgal.item.set_rocket_capacity(nuclear_rock.name, 20)
end

for _, fuel_cell in pairs(vgal.defines.fuel_cells) do
    vgal.item.set_rocket_capacity(fuel_cell.name, 10)
    vgal.item.set_rocket_capacity(fuel_cell.depleted_fuel_cell, 10)
end

vgal.item.set_rocket_capacity("angels-muon-fusion-catalyst", 1)
vgal.item.set_rocket_capacity("angels-deuterium-fuel-cell", 5)
vgal.item.set_rocket_capacity("angels-thorium-ore", 200)

-- chem solids (square)
vgal.item.set_rocket_capacity("angels-solid-calcium-chloride", 500)
vgal.item.set_rocket_capacity("angels-solid-calcium-carbonate", 1000)
vgal.item.set_rocket_capacity("angels-solid-sodium-hypochlorite", 500)
vgal.item.set_rocket_capacity("angels-solid-sodium-perchlorate", 500)
vgal.item.set_rocket_capacity("angels-solid-ammonium-nitrate", 500)

-- chem solids (round)
vgal.item.set_rocket_capacity("angels-solid-salt", 1000)
vgal.item.set_rocket_capacity("angels-solid-sodium-carbonate", 1000)
vgal.item.set_rocket_capacity("angels-solid-sodium-hydroxide", 1000)
vgal.item.set_rocket_capacity("angels-solid-sodium-sulfate", 1000)
vgal.item.set_rocket_capacity("angels-solid-ammonium-perchlorate", 1000)
vgal.item.set_rocket_capacity("angels-solid-ammonium-perchlorate", 500)
vgal.item.set_rocket_capacity("angels-solid-sodium", 1000)
vgal.item.set_rocket_capacity("angels-paste-cellulose", 1000)

-- nuclear fuel
vgal.item.set_rocket_capacity("angels-nuclear-fuel", 10)
vgal.item.set_rocket_capacity("angels-nuclear-fuel-2", 10)

-- coal
vgal.item.set_rocket_capacity("angels-coal-crushed", 500)
vgal.item.set_rocket_capacity("angels-solid-coke", 500)
vgal.item.set_rocket_capacity("angels-pellet-coke", 200)
vgal.item.set_rocket_capacity("angels-solid-carbon", 1000)

-- buildings
vgal.item.set_rocket_capacity("angels-ore-processing-machine", 20)
vgal.item.set_rocket_capacity("angels-pellet-press", 20)
vgal.item.set_rocket_capacity("angels-ore-refinery", 20)
vgal.item.set_rocket_capacity("angels-powderizer", 20)
vgal.item.set_rocket_capacity("angels-powder-mixer", 20)
vgal.item.set_rocket_capacity("angels-electric-boiler", 25)
vgal.item.set_rocket_capacity("angels-clarifier", 25)
vgal.item.set_rocket_capacity("angels-flare-stack", 25)
vgal.item.set_rocket_capacity("angels-cooling-tower", 25)
vgal.item.set_rocket_capacity("angels-liquifier", 20)
vgal.item.set_rocket_capacity("angels-advanced-chemical-plant", 5)
vgal.item.set_rocket_capacity("angels-gas-refinery", 5)
vgal.item.set_rocket_capacity("angels-ore-sorting-facility", 5)
vgal.item.set_rocket_capacity("angels-ore-sorting-facility-2", 5)
vgal.item.set_rocket_capacity("angels-thermal-bore", 5)
vgal.item.set_rocket_capacity("angels-burner-reactor", "too-heavy")
vgal.item.set_rocket_capacity("angels-crop-farm", 20)

for _, environment in pairs(vgal.defines.environments) do
    vgal.item.set_rocket_capacity(environment.farm, 5)
end

vgal.item.set_rocket_capacity("angels-bio-refugium-puffer", 10)
vgal.item.set_rocket_capacity("angels-bio-refugium-biter", 5)
vgal.item.set_rocket_capacity("angels-bio-hatchery", 10)

-- catalysators
for _, catalysator in pairs(vgal.defines.catalysators) do
    vgal.item.set_rocket_capacity(catalysator.name, 50)
end

-- bio
for _, environment in pairs(vgal.defines.environments) do
    for _, seed in ipairs(environment.seeds) do
        local seed = vgal.defines.seeds[seed]

        vgal.item.set_rocket_capacity(seed.name, 100)

        if seed.dormant then
            vgal.item.set_rocket_capacity(seed.dormant, 100)
        end
    end
    for _, plant in ipairs(environment.plants) do
        vgal.item.set_rocket_capacity(plant, 1000)
    end

    vgal.item.set_rocket_capacity(environment.garden, 5)
end

for _, algae in pairs(vgal.defines.algae) do
    vgal.item.set_rocket_capacity(algae.name, 1000)
    if algae.cellulose_fiber then
        vgal.item.set_rocket_capacity(algae.cellulose_fiber, 1000)
    end
end

for _, puffer in pairs(vgal.defines.puffers) do
    vgal.item.set_rocket_capacity(puffer.name, 50)
    vgal.item.set_rocket_capacity(puffer.egg, 200)
end

vgal.item.set_rocket_capacity("angels-solid-tree", 10)
vgal.item.set_rocket_capacity("angels-tree-seed", 100)
vgal.item.set_rocket_capacity("angels-solid-soil", 500)
vgal.item.set_rocket_capacity("angels-solid-compost", 500)
vgal.item.set_rocket_capacity("angels-solid-fertilizer", 500)
vgal.item.set_rocket_capacity("angels-solid-alienated-fertilizer", 250)

vgal.item.set_rocket_capacity("angels-solid-pips", 1000)
vgal.item.set_rocket_capacity("angels-solid-beans", 1000)
vgal.item.set_rocket_capacity("angels-solid-leafs", 2000)
vgal.item.set_rocket_capacity("angels-solid-fruit", 1000)
vgal.item.set_rocket_capacity("angels-solid-nuts", 1000)
vgal.item.set_rocket_capacity("angels-solid-corn", 1000)
vgal.item.set_rocket_capacity("angels-bio-raw-meat", 200)
vgal.item.set_rocket_capacity("angels-bio-alien-processed-meat", 100)
vgal.item.set_rocket_capacity("angels-fish-pulp", 200)

vgal.item.set_rocket_capacity("angels-alien-bacteria", 50)
vgal.item.set_rocket_capacity("angels-petri-dish", 200)
vgal.item.set_rocket_capacity("angels-substrate-dish", 100)
vgal.item.set_rocket_capacity("angels-seeded-dish", 50)
vgal.item.set_rocket_capacity("angels-crystal-seed", 50)
vgal.item.set_rocket_capacity("angels-egg-shell-seed", 50)
vgal.item.set_rocket_capacity("angels-crystal-enhancer", 50)

vgal.item.set_rocket_capacity("angels-wood-pellets", 500)
vgal.item.set_rocket_capacity("angels-wood-bricks", 400)
vgal.item.set_rocket_capacity("angels-wood-charcoal", 500)

for _, biter in pairs(vgal.defines.angels_biters) do
    vgal.item.set_rocket_capacity(biter.egg, 200)
    vgal.item.set_rocket_capacity(biter.name, 50)
end

for _, fish in pairs(vgal.defines.fish) do
    vgal.item.set_rocket_capacity(fish.name, 300)
end

for _, crystal_color in pairs(vgal.defines.angels_crystal_colors) do
    vgal.item.set_rocket_capacity(crystal_color.splinter.raw, 400)
    vgal.item.set_rocket_capacity(crystal_color.splinter.name, 500)
    vgal.item.set_rocket_capacity(crystal_color.shard.raw, 200)
    vgal.item.set_rocket_capacity(crystal_color.shard.name, 250)
    vgal.item.set_rocket_capacity(crystal_color.full.raw, 100)
    vgal.item.set_rocket_capacity(crystal_color.full.name, 200)
end

-- recipe items
vgal.item.set_rocket_capacity("angels-solid-saw", 500)
vgal.item.set_rocket_capacity("angels-solid-crystal-tipped-saw", 250)
vgal.item.set_rocket_capacity("angels-solid-crystal-full-saw", 100)
vgal.item.set_rocket_capacity("angels-electrode", 500)
vgal.item.set_rocket_capacity("angels-electrode-used", 500)
vgal.item.set_rocket_capacity("angels-catalyst-metal-carrier", 500)
vgal.item.set_rocket_capacity("angels-catalyst-metal-yellow", 500)
vgal.item.set_rocket_capacity("angels-catalyst-metal-blue", 500)
vgal.item.set_rocket_capacity("angels-filter-frame", 200)
vgal.item.set_rocket_capacity("angels-filter-coal", 200)
vgal.item.set_rocket_capacity("angels-filter-ceramic", 200)
vgal.item.set_rocket_capacity("angels-filter-lime", 200)
vgal.item.set_rocket_capacity("angels-milling-drum", 500)
vgal.item.set_rocket_capacity("angels-milling-drum-lubricated", 500)
vgal.item.set_rocket_capacity("angels-crystal-grindstone", 500)
