--- plastic buff ---
vgal.subgroup.clean("solid-plastic")
vgal.recipe.multiply("solid-plastic", 1.25)

--- ore removal ---
vgal.recipe.all.replace_ingredient("catalyst-metal-yellow", { type = "item", name = "catalyst-metal-red", amount = 1 })
vgal.recipe.all.replace_ingredient("catalyst-metal-blue", { type = "item", name = "catalyst-metal-green", amount = 1 })
vgal.data.trim("catalyst-metal-blue")
vgal.data.trim("catalyst-metal-yellow")
for _, ore in ipairs(agal.constants.REMOVED_ORE_INDEXES) do
    vgal.data.deep_hide(data.raw["item"]["angels-ore" .. ore])
    for _, state in ipairs(agal.constants.ORE_STATES) do
        vgal.data.trim("angelsore" .. ore .. "-" .. state .. "-processing")
        vgal.data.trim("angelsore" .. ore .. "-" .. state)
        vgal.data.deep_hide(data.raw["item"]["angels-ore" .. ore .. "-" .. state])
    end
end


--- funny yellow module removal ---
local BIO_MODULES = { "angels-bio-yield-module", "angels-bio-yield-module-2", "angels-bio-yield-module-3" }
for _, bio_module in ipairs(BIO_MODULES) do
    vgal.data.deep_hide(data.raw["module"][bio_module])
    vgal.data.trim(bio_module)
end

--- remove the alien tokens things ---
vgal.recipe.all.remove_ingredient("token-bio")
vgal.recipe.all.remove_result("token-bio")

for _, environment in ipairs(agal.constants.ENVIRONMENTS) do
    vgal.recipe.deep_hide(environment .. "-garden-b")
    vgal.recipe.deep_hide(environment .. "-garden-cultivating-a")
end



--- recipe buffs ---
vgal.recipe.set_result_amount("ingot-iron-smelting", 8)

--- plastic buff ---
local PLASTIC_MULTIPLIER = 5
vgal.recipe.multiply_results("liquid-plastic-1", PLASTIC_MULTIPLIER)
vgal.recipe.multiply_results("liquid-plastic-2", PLASTIC_MULTIPLIER)
vgal.recipe.multiply_results("liquid-plastic-3", PLASTIC_MULTIPLIER)
vgal.recipe.set_result_amount("bio-plastic-1", 80)
vgal.recipe.set_result_amount("bio-plastic-2", 150)

--- direct fluid removal ---

-- bio plastic - liquid-cellulose-acetate
vgal.data.trim("liquid-cellulose-acetate")
vgal.data.deep_hide(data.raw["fluid"]["liquid-cellulose-acetate"])
vgal.recipe.replace_ingredient("bio-plastic-1", "liquid-cellulose-acetate", "liquid-cellulose-acetate-mixture")

-- plastic 3 - gas-formaldehyde
vgal.data.trim("gas-formaldehyde-catalyst")
vgal.data.deep_hide(data.raw["fluid"]["gas-formaldehyde"])
vgal.recipe.replace_ingredient("liquid-plastic-3", "gas-formaldehyde", "gas-methanol")

-- chloride variations
data.raw.recipe["liquid-glycerol"].ingredients = vgal.build.table({}, {
    { "gas-propene",    25 },
    { "water-purified", 100 },
    { "gas-chlorine",   50 },
})
data.raw.recipe["liquid-glycerol"].results = vgal.build.table({}, {
    { "liquid-glycerol",       25 },
    { "gas-hydrogen-chloride", 100 },
})
vgal.data.trim("gas-epichlorhydrin")
vgal.data.deep_hide(data.raw["fluid"]["gas-epichlorhydrin"])
vgal.data.trim("gas-allylchlorid")
vgal.data.deep_hide(data.raw["fluid"]["gas-allylchlorid"])

-- rocket

data.raw.recipe["gas-hydrazine"].ingredients = vgal.build.table({
    -- { "catalyst-metal-green",      1 },
    { "solid-sodium-hypochlorite", 5 },
}, {
    { "gas-ammonia", 250 },
})
vgal.recipe.remove_result("gas-hydrazine", "catalyst-metal-carrier")
vgal.data.deep_hide(data.raw["fluid"]["gas-monochloramine"])
vgal.data.trim("gas-monochloramine")

-- fuel
data.raw.recipe["rocket-fuel-capsule"].energy_required = 5
data.raw.recipe["rocket-fuel-capsule"].ingredients = vgal.build.table({
    { "solid-fuel", 1 },
}, {
    { "gas-dimethylhydrazine", 10 },
})
vgal.recipe.set_result_amount("rocket-fuel-capsule", 1)

-- ox
data.raw.recipe["rocket-oxidizer-capsule"].energy_required = 5
-- data.raw.recipe["rocket-oxidizer-capsule"].ingredients = vgal.build.table({}, {
--     { "liquid-nitric-acid",    10 },
-- })
vgal.recipe.set_result_amount("rocket-oxidizer-capsule", 1)

--- uranium ---
data.raw.recipe["slag-processing-9"].results = vgal.build.table({
    { "uranium-ore", 1, { probability = 0.8 } },
})

--- trees ---
vgal.data.trim("tree-arboretum-0")
vgal.data.deep_hide(data.raw["item"]["temperate-tree"])
vgal.data.deep_hide(data.raw["item"]["swamp-tree"])
vgal.data.deep_hide(data.raw["item"]["desert-tree"])

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
    data.raw["recipe"]["angelsore" .. ore_index .. "-chunk"].energy_required = 1.6
    vgal.recipe.set_ingredient_amount("angelsore" .. ore_index .. "-chunk", 6, "angels-ore" .. ore_index .. "-crushed")
    vgal.recipe.set_result_amount("angelsore" .. ore_index .. "-chunk", 4, "angels-ore" .. ore_index .. "-chunk")

    -- chunk geode removal
    if ore_index == 2 then
        vgal.recipe.set_result_amount("angelsore" .. ore_index .. "-chunk", 0, "geode-purple")
    else
        vgal.recipe.set_result_amount("angelsore" .. ore_index .. "-chunk", 0, "geode-yellow")
    end

    -- crystal
    vgal.recipe.set_ingredient_amount("angelsore" .. ore_index .. "-crystal", 5, "sulfuric-acid")
    vgal.recipe.set_ingredient_amount("angelsore" .. ore_index .. "-crystal", 5, "angels-ore" .. ore_index .. "-chunk")
    vgal.recipe.set_result_amount("angelsore" .. ore_index .. "-crystal", 4, "angels-ore" .. ore_index .. "-crystal")

    -- pure
    vgal.recipe.set_ingredient_amount("angelsore" .. ore_index .. "-pure", 4, "angels-ore" .. ore_index .. "-crystal")
    vgal.recipe.set_result_amount("angelsore" .. ore_index .. "-pure", 2, "angels-ore" .. ore_index .. "-pure")

    -- processing
    vgal.recipe.set_ingredient_amount("angelsore" .. ore_index .. "-chunk-processing", 4,
        "angels-ore" .. ore_index .. "-chunk")
    vgal.recipe.set_ingredient_amount("angelsore" .. ore_index .. "-crystal-processing", 4,
        "angels-ore" .. ore_index .. "-crystal")
    vgal.recipe.set_ingredient_amount("angelsore" .. ore_index .. "-pure-processing", 2, -- should be 2.25
        "angels-ore" .. ore_index .. "-pure")
end

for _, metal in ipairs(vgal.constants.METALS) do
    vgal.recipe.multiply(metal .. "-ore-processing", 1.5)
    vgal.recipe.add_result(metal .. "-ore-processing",
        vgal.table.get_single_shorthand({ "slag", 1, { probability = 0.5 } }, "item"))
    data.raw["recipe"]["roll-" .. metal .. "-casting"].energy_required = 1
end
-- data.raw["recipe"]["roll-steel-casting"].energy_required = 1

data.raw["recipe"]["angels-wire-coil-copper-casting"].energy_required = 2
data.raw["recipe"]["angels-wire-coil-copper-casting-fast"].energy_required = 1
vgal.recipe.multiply("angels-wire-coil-copper-casting", 2)
vgal.recipe.multiply("angels-wire-coil-copper-casting-fast", 2)

--- remove hand recipes ---
vgal.data.trim("angelsore1-crushed-hand")
vgal.data.trim("angelsore3-crushed-hand")
-- table.insert(data.raw["recipe"]["angelsore1-crushed-hand"].additional_categories,)

--- remove residual removed ore recipe ---
vgal.data.trim("angelsore1-crushed-smelting")


--- crystal overhaul/restore ---
vgal.recipe.multiply("crystal-powder-slurry", 10)


-- misc worth fixes --

--- crafting speed restores ---
data.raw["recipe"]["molten-copper-smelting"].energy_required = 1
data.raw["recipe"]["molten-steel-smelting-1"].energy_required = 1
data.raw["recipe"]["molten-iron-smelting-1"].energy_required = 1

data.raw["recipe"]["air-separation"].energy_required = 1
data.raw["recipe"]["angels-air-filtering"].energy_required = 1

--- normalising ---
vgal.recipe.set_result_amount("bio-tile", 2)
vgal.recipe.set_result_amount("alien-goo", 10)

--- misc ---
vgal.data.trim("powder-silicon")
vgal.data.trim("solid-salt-from-saline")
data.raw["recipe"]["anode-copper-smelting"].category = "blast-smelting" -- bc the chem furnace is removed.
data.raw["recipe"]["solid-soil"].energy_required = 1.5
data.raw["recipe"]["solid-soil-alternative"].energy_required = 1.5
data.raw["recipe"]["gas-methanol-from-wood"].energy_required = 3
