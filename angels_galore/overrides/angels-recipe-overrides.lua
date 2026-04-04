--- plastic buff ---
vgal.subgroup.clean("angels-solid-plastic")
vgal.recipe.multiply("angels-solid-plastic", 1.25)


--- remove the alien tokens things ---
vgal.recipe.all.remove_ingredient("angels-token-bio")
vgal.recipe.all.remove_result("angels-token-bio")

for _, environment in ipairs(agal.constants.ENVIRONMENTS) do
    vgal.recipe.deep_hide(environment .. "-garden-b")
    vgal.recipe.deep_hide(environment .. "-garden-cultivating-a")
end

--- recipe buffs ---
vgal.recipe.set_result_amount("angels-ingot-iron", 8)

--- plastic buff ---
local PLASTIC_MULTIPLIER = 5
vgal.recipe.multiply_results("angels-liquid-plastic", PLASTIC_MULTIPLIER)
vgal.recipe.multiply_results("angels-liquid-plastic-2", PLASTIC_MULTIPLIER)
vgal.recipe.multiply_results("angels-liquid-plastic-3", PLASTIC_MULTIPLIER)
vgal.recipe.set_result_amount("angels-bio-plastic", 80)
vgal.recipe.set_result_amount("angels-bio-plastic-2", 150)

--- direct fluid removal --- (direct fluids: fluids used for like one purpose)

-- bio plastic - liquid-cellulose-acetate
vgal.data.trim("angels-liquid-cellulose-acetate")
vgal.data.deep_hide(data.raw["fluid"]["angels-liquid-cellulose-acetate"])
vgal.recipe.replace_ingredient("angels-bio-plastic", "angels-liquid-cellulose-acetate",
    "angels-liquid-cellulose-acetate-mixture")

-- plastic 3 - gas-formaldehyde
vgal.data.trim("angels-gas-formaldehyde")
vgal.data.deep_hide(data.raw["fluid"]["angels-gas-formaldehyde"])
vgal.recipe.replace_ingredient("angels-liquid-plastic-3", "angels-gas-formaldehyde", "angels-gas-methanol")

-- chloride variations
data.raw.recipe["angels-liquid-glycerol"].ingredients = vgal.build.table({}, {
    { "angels-gas-propene",    25 },
    { "angels-water-purified", 100 },
    { "angels-gas-chlorine",   50 },
})
data.raw.recipe["angels-liquid-glycerol"].results = vgal.build.table({}, {
    { "angels-liquid-glycerol",       25 },
    { "angels-gas-hydrogen-chloride", 100 },
})
vgal.data.trim("angels-gas-epichlorohydrin")
vgal.data.deep_hide(data.raw["fluid"]["angels-gas-epichlorohydrin"])
vgal.data.trim("angels-gas-allylchlorid")
vgal.data.deep_hide(data.raw["fluid"]["angels-gas-allylchlorid"])

-- rocket - forgor what the gas was
data.raw.recipe["angels-gas-hydrazine"].ingredients = vgal.build.table({
    -- { "catalyst-metal-green",      1 },
    { "angels-solid-sodium-hypochlorite", 5 },
}, {
    { "angels-gas-ammonia", 250 },
})
vgal.recipe.remove_result("angels-gas-hydrazine", "angels-catalyst-metal-carrier")
vgal.data.deep_hide(data.raw["fluid"]["angels-gas-monochloramine"])
vgal.data.trim("angels-gas-monochloramine")

-- fuel - same here
data.raw.recipe["angels-rocket-fuel-capsule"].energy_required = 5
data.raw.recipe["angels-rocket-fuel-capsule"].ingredients = vgal.build.table({
    { "solid-fuel", 1 },
}, {
    { "angels-gas-dimethylhydrazine", 10 },
})
vgal.recipe.set_result_amount("angels-rocket-fuel-capsule", 1)

-- ox
data.raw.recipe["angels-rocket-oxidizer-capsule"].energy_required = 5
-- data.raw.recipe["rocket-oxidizer-capsule"].ingredients = vgal.build.table({}, {
--     { "liquid-nitric-acid",    10 },
-- })
vgal.recipe.set_result_amount("angels-rocket-oxidizer-capsule", 1)

--- uranium ---
-- data.raw.recipe["angels-slag-processing-9"].results = vgal.build.table({
--     { "uranium-ore", 1, { probability = 0.8 } },
-- })

--- trees ---
vgal.data.trim("angels-tree-arboretum-0")
vgal.data.deep_hide(data.raw["item"]["angels-temperate-tree"])
vgal.data.deep_hide(data.raw["item"]["angels-swamp-tree"])
vgal.data.deep_hide(data.raw["item"]["angels-desert-tree"])

-- data.raw.recipe["gas-dimethylhydrazine"].ingredients = vgal.build.table({
--     { "solid-sodium-hypochlorite", 5 },
-- }, {
--     { "gas-ammonia",  150 },
--     { "gas-methanol", 50 },
-- })
-- vgal.recipe.set_result_amount("gas-dimethylhydrazine", 50, "water-purified")

-- vgal.data.trim("gas-methylamine")
-- vgal.data.deep_hide(data.raw["fluid"]["gas-methylamine"])
-- vgal.data.trim("gas-dimethylamine")
-- vgal.data.deep_hide(data.raw["fluid"]["gas-dimethylamine"])

-- vgal.recipe.set_ingredient_amount("gas-methylamine", 100, "gas-methanol")
-- vgal.recipe.replace_ingredient("gas-dimethylhydrazine", "gas-dimethylamine", "gas-methylamine")
-- vgal.data.trim("gas-dimethylamine")
-- vgal.data.deep_hide(data.raw["fluid"]["gas-dimethylamine"])

--- rocket overhaul


--- refining durations (see docs/ore-density) ---
for _, ore_index in ipairs(agal.constants.ORE_INDEXES) do
    -- chunk
    data.raw["recipe"]["angels-ore" .. ore_index .. "-chunk"].energy_required = 1.6
    vgal.recipe.set_ingredient_amount("angels-ore" .. ore_index .. "-chunk", 6, "angels-ore" .. ore_index .. "-crushed")
    vgal.recipe.set_result_amount("angels-ore" .. ore_index .. "-chunk", 4, "angels-ore" .. ore_index .. "-chunk")

    -- chunk geode removal
    if ore_index == 2 then
        vgal.recipe.set_result_amount("angels-ore" .. ore_index .. "-chunk", 0, "geode-purple")
    else
        vgal.recipe.set_result_amount("angels-ore" .. ore_index .. "-chunk", 0, "geode-yellow")
    end

    -- crystal
    vgal.recipe.set_ingredient_amount("angels-ore" .. ore_index .. "-crystal", 5, "sulfuric-acid")
    vgal.recipe.set_ingredient_amount("angels-ore" .. ore_index .. "-crystal", 5, "angels-ore" .. ore_index .. "-chunk")
    vgal.recipe.set_result_amount("angels-ore" .. ore_index .. "-crystal", 4, "angels-ore" .. ore_index .. "-crystal")

    -- pure
    vgal.recipe.set_ingredient_amount("angels-ore" .. ore_index .. "-pure", 4, "angels-ore" .. ore_index .. "-crystal")
    vgal.recipe.set_result_amount("angels-ore" .. ore_index .. "-pure", 2, "angels-ore" .. ore_index .. "-pure")

    -- processing
    vgal.recipe.set_ingredient_amount("angels-ore" .. ore_index .. "-chunk-processing", 4,
        "angels-ore" .. ore_index .. "-chunk")
    vgal.recipe.set_ingredient_amount("angels-ore" .. ore_index .. "-crystal-processing", 4,
        "angels-ore" .. ore_index .. "-crystal")
    vgal.recipe.set_ingredient_amount("angels-ore" .. ore_index .. "-pure-processing", 2, -- should be 2.25
        "angels-ore" .. ore_index .. "-pure")
end

for _, metal in ipairs(vgal.constants.METALS) do
    vgal.recipe.multiply("angels-processed-" .. metal, 1.5)
    vgal.recipe.add_result("angels-processed-" .. metal,
        vgal.table.get_single_shorthand({ "angels-slag", 1, { probability = 0.5 } }, "item"))
    data.raw["recipe"]["angels-roll-" .. metal].energy_required = 1
end
-- data.raw["recipe"]["roll-steel-casting"].energy_required = 1

data.raw["recipe"]["angels-wire-coil-copper"].energy_required = 2
data.raw["recipe"]["angels-wire-coil-copper-2"].energy_required = 1
vgal.recipe.multiply("angels-wire-coil-copper", 2)
vgal.recipe.multiply("angels-wire-coil-copper-2", 2)

--- remove hand recipes ---
vgal.data.trim("angels-ore1-crushed-hand")
vgal.data.trim("angels-ore3-crushed-hand")
-- table.insert(data.raw["recipe"]["angels-ore1-crushed-hand"].additional_categories,)

--- crystal overhaul/restore ---
vgal.recipe.multiply("angels-crystal-powder-slurry", 10)

-- misc worth fixes --

--- crafting speed restores ---
data.raw["recipe"]["angels-liquid-molten-copper"].energy_required = 1
data.raw["recipe"]["angels-liquid-molten-steel"].energy_required = 1
data.raw["recipe"]["angels-liquid-molten-iron"].energy_required = 1

data.raw["recipe"]["angels-air-separation"].energy_required = 1
data.raw["recipe"]["angels-gas-compressed-air"].energy_required = 1

--- normalising ---
vgal.recipe.set_result_amount("angels-bio-tile", 2)
vgal.recipe.set_result_amount("angels-alien-goo", 10)

--- misc ---
vgal.data.trim("angels-powder-silicon")
vgal.data.trim("angels-solid-salt-from-saline")
data.raw["recipe"]["angels-ingot-copper-3"].category = "angels-blast-smelting" -- bc the chem furnace is removed.
data.raw["recipe"]["angels-solid-soil"].energy_required = 1.5
data.raw["recipe"]["angels-solid-soil-alternative"].energy_required = 1.5
data.raw["recipe"]["angels-gas-methanol-from-wood"].energy_required = 3
