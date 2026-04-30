-- remove removed ores
-- update metal catalysts so they dont use the remvoed ores.
data.raw.recipe["angels-catalyst-metal-yellow"].ingredients = vgal.build.table({
    { "angels-catalyst-metal-carrier", 10 },
    { "angels-ore2",                   1 },
})
data.raw.recipe["angels-catalyst-metal-blue"].ingredients = vgal.build.table({
    { "angels-catalyst-metal-carrier", 10 },
    { "angels-ore3",                   1 },
})

-- also fix their tech localtions
vgal.tech.move_recipe("angels-advanced-chemistry-5", "angels-basic-chemistry-3", "angels-catalyst-metal-yellow")
vgal.tech.move_recipe("angels-advanced-chemistry-3", "angels-basic-chemistry-3", "angels-catalyst-metal-blue")

-- upgrade kit removal.
for _, environment in pairs(agal.defines.environments) do
    vgal.recipe.deephide("angels-" .. environment.name .. "-upgrade")
    vgal.data.deephide(data.raw["item"]["angels-" .. environment.name .. "-upgrade"])
    local building_recipe = data.raw["recipe"][environment.farm]
    for i, ingredient in ipairs(building_recipe.ingredients) do
        if ingredient.name == ("angels-" .. environment.name .. "-upgrade") then
            table.remove(building_recipe.ingredients, i)
            break
        end
    end
end

-- (actual)catalyst fixes
vgal.data.trim("angels-catalyst-metal-red")
vgal.data.deephide(data.raw["item"]["angels-catalyst-metal-red"])
vgal.recipe.all.replace_ingredient("angels-catalyst-metal-red",
    { type = "item", name = "angels-catalyst-metal-yellow", amount = 1 })

vgal.data.trim("angels-catalyst-metal-green")
vgal.data.deephide(data.raw["item"]["angels-catalyst-metal-green"])
vgal.recipe.all.replace_ingredient("angels-catalyst-metal-green",
    { type = "item", name = "angels-catalyst-metal-blue", amount = 1 })

-- remove the NORMAL ores and their processing recipes
for _, ore in ipairs(agal.defines.removed_ore_indexes) do
    vgal.data.deephide(data.raw["item"]["angels-ore" .. ore])

    for _, state in ipairs(agal.defines.ore_states) do
        vgal.data.trim("angels-ore" .. ore .. "-" .. state .. "-processing")
        vgal.data.trim("angels-ore" .. ore .. "-" .. state)
        vgal.data.deephide(data.raw["item"]["angels-ore" .. ore .. "-" .. state])
    end
end

-- remove the ALT ores and their processing recipes
for _, ore in ipairs(agal.defines.removed_alt_ore_indexes) do
    for _, state in ipairs(agal.defines.alt_ore_states) do
        vgal.data.trim("angels-ore" .. ore .. "-" .. state .. "-processing")
        vgal.data.trim("angels-ore" .. ore .. "-" .. state)
        vgal.data.deephide(data.raw["item"]["angels-ore" .. ore .. "-" .. state])
    end

    for _, state in ipairs(agal.defines.fluid_alt_ore_states) do
        vgal.data.trim("angels-ore" .. ore .. "-" .. state)
        vgal.data.deephide(data.raw["fluid"]["angels-ore" .. ore .. "-" .. state])
    end

    vgal.data.trim("angels-ore" .. ore .. "-anode-sludge")
end

-- remove mix recipes. (I will have my own ones)
for i = 1, 6 do
    for _, state in ipairs(agal.defines.ore_states) do
        local recipe = data.raw["recipe"]["angels-ore-" .. state .. "-mix" .. i .. "-processing"]

        if recipe then
            vgal.data.deephide(recipe)
        end
    end
end

-- remove mineral sludge to ores recipes. (I will have my own ones)
vgal.recipe.deephide("angels-slag-processing-1")
vgal.recipe.deephide("angels-slag-processing-2")
vgal.recipe.deephide("angels-slag-processing-3")

-- remove extra molten metal recipes
for _, metal_name in ipairs({ "iron", "steel" }) do -- copper doesn't have any extra smelting recipes
    for i = 2, 6 do
        local recipe = data.raw["recipe"]["angels-liquid-molten-" .. metal_name .. "-" .. i]
        if recipe then
            vgal.recipe.deephide(recipe.name)
            vgal.data.trim(recipe.name)
        end
    end
end

-- remove removed ore smelting techs, items and fluids.
-- techs first.
for i = 1, 4 do
    for _, metal_name in ipairs(agal.defines.removed_metal_names) do
        for _, suffix in ipairs({ "smelting", "casting" }) do
            local tech = data.raw["technology"]["angels-" .. metal_name .. "-" .. suffix .. "-" .. i]

            if tech then
                vgal.tech.techs_to_splice[tech.name] = tech
            end
        end
    end
end

-- remove extra angels smelting items and fluids.
local function dh_fluid(name)
    local fluid = data.raw["fluid"][name]
    if fluid then
        vgal.data.deephide(fluid)
    end
end

local function dh_item(name)
    local item = data.raw["item"][name]
    if item then
        vgal.data.deephide(item)
    end
end

for _, metal_name in ipairs(agal.defines.removed_metal_names) do
    dh_fluid("angels-liquid-molten-" .. metal_name)
    dh_fluid("angels-liquid-" .. metal_name .. "-tetrachloride")
    dh_fluid("angels-gas-" .. metal_name .. "-hexafluoride")

    dh_item("angels-" .. metal_name .. "-ore")
    dh_item("angels-processed-" .. metal_name)
    dh_item("angels-cathode-" .. metal_name)
    dh_item("angels-pellet-" .. metal_name)
    dh_item("angels-solid-" .. metal_name .. "-hydroxide")
    dh_item("angels-solid-" .. metal_name .. "-oxide")
    dh_item("angels-ingot-" .. metal_name)
    dh_item("angels-powder-" .. metal_name)
    dh_item("angels-solid-" .. metal_name .. "-carbonyl")
    dh_item("angels-sponge-" .. metal_name)
    dh_item("angels-casting-powder-" .. metal_name)

    dh_item("angels-roll-" .. metal_name)
    dh_item("angels-plate-" .. metal_name)
end

-- misfits
vgal.data.deephide(data.raw["item"]["angels-bauxite-ore"])      -- aluminium ore
vgal.data.deephide(data.raw["item"]["angels-quartz"])           -- silicon ore (will make a comeback)
vgal.data.deephide(data.raw["item"]["angels-rutile-ore"])       -- titanium ore
vgal.data.deephide(data.raw["item"]["angels-processed-silica"]) -- silicon processed
vgal.data.deephide(data.raw["item"]["angels-pellet-silica"])    -- silicon pellet

-- specifics (items)
vgal.data.deephide(data.raw["item"]["angels-solid-sodium-aluminate"])
vgal.data.deephide(data.raw["item"]["angels-solid-chromate"])
vgal.data.deephide(data.raw["item"]["angels-solid-dichromate"])
vgal.data.deephide(data.raw["item"]["angels-solid-ammonium-paratungstate"])
vgal.data.deephide(data.raw["item"]["angels-silver-ore"]) -- this is the only mention of silver anywhere.
-- vgal.data.deep_hide(data.raw["item"]["angels-thorium-ore"]) -- this is the only mention of thorium anywhere. | commentedbc: not sure.

-- specifics (fluids)
vgal.data.deephide(data.raw["fluid"]["angels-liquid-trichlorosilane"])
vgal.data.deephide(data.raw["fluid"]["angels-gas-silane"])
vgal.data.deephide(data.raw["fluid"]["angels-liquid-tungstic-acid"])

-- remove yellow modules (COMEBACKAT)
local BIO_MODULES = { "angels-bio-yield-module", "angels-bio-yield-module-2", "angels-bio-yield-module-3" }
for _, bio_module in ipairs(BIO_MODULES) do
    vgal.data.deephide(data.raw["module"][bio_module])
    vgal.data.deephide(data.raw["technology"][bio_module])
    vgal.data.trim(bio_module)
end

-- removal of direct fluids (direct fluids: fluids used for like one purpose)

-- bio plastic - liquid-cellulose-acetate
vgal.data.trim("angels-liquid-cellulose-acetate")
vgal.data.deephide(data.raw["fluid"]["angels-liquid-cellulose-acetate"])
-- plastic recipe is just created with new ingredient (mixture)

-- plastic 3 - gas-formaldehyde
vgal.data.trim("angels-gas-formaldehyde")
vgal.data.deephide(data.raw["fluid"]["angels-gas-formaldehyde"])
-- plastic recipe is just created with new ingredient (methanol)

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
vgal.data.deephide(data.raw["fluid"]["angels-gas-epichlorohydrin"])
vgal.data.trim("angels-gas-allylchlorid")
vgal.data.deephide(data.raw["fluid"]["angels-gas-allylchlorid"])

-- rocket fuel changes (from top of crafting tree to bottom)
-- rocket fuel ox capsule is removed, fuel capsule isn't
data.raw.recipe["rocket-fuel"].ingredients = vgal.build.table({
    { "angels-rocket-fuel-capsule", 1 }
}, {
    { "angels-liquid-nitric-acid", 25 },
})

-- fuel crafting chain branch fixes
data.raw.recipe["angels-rocket-fuel-capsule"].ingredients = vgal.build.table({
    { "plastic-bar", 1 },
}, {
    { "angels-gas-hydrazine", 20 },
})
data.raw.recipe["angels-rocket-fuel-capsule"].energy_required = 5
vgal.recipe.set_result_amount("angels-rocket-fuel-capsule", 1)

vgal.data.deephide(data.raw["fluid"]["angels-gas-dimethylamine"])
vgal.data.trim("angels-gas-dimethylamine")

vgal.data.deephide(data.raw["fluid"]["angels-gas-dimethylhydrazine"])
vgal.data.trim("angels-gas-dimethylhydrazine")

vgal.data.deephide(data.raw["fluid"]["angels-gas-methylamine"])
vgal.data.trim("angels-gas-methylamine")

-- ox crafting chain branch fixes
vgal.data.deephide(data.raw["item"]["angels-rocket-oxidizer-capsule"])
vgal.data.trim("angels-rocket-oxidizer-capsule")

vgal.data.deephide(data.raw["fluid"]["angels-gas-dinitrogen-tetroxide"])
vgal.data.trim("angels-gas-dinitrogen-tetroxide")

data.raw.recipe["angels-gas-nitrogen-dioxide"].ingredients = vgal.build.table({
    { "angels-catalyst-metal-blue", 1 }
}, {
    { "angels-gas-ammonia", 40 }, -- 20h
    { "angels-gas-oxygen",  60 }, -- 60ox
})

data.raw.recipe["angels-gas-nitrogen-dioxide"].results = vgal.build.table({
    { "angels-catalyst-metal-carrier", 1 }
}, {
    { "angels-gas-nitrogen-dioxide", 100 },
    { "angels-water-purified",       30 }, -- 60h = 100h2o so 20h = 33h2o (angels chemistry, I think I did it correctly)
})
data.raw.recipe["angels-gas-nitrogen-dioxide"].main_product = "angels-gas-nitrogen-dioxide"

vgal.data.deephide(data.raw["fluid"]["angels-gas-nitrogen-monoxide"])
vgal.data.trim("angels-gas-nitrogen-monoxide")
vgal.data.trim("angels-solid-sodium-nitrate-processing")

-- brick removal (clay/reinforced)
vgal.data.deephide(data.raw["item"]["angels-reinforced-concrete-brick"])
vgal.data.trim("angels-reinforced-concrete-brick")
vgal.data.deephide(data.raw["item"]["angels-clay-brick"])
vgal.data.trim("angels-clay-brick")
vgal.data.deephide(data.raw["item"]["angels-clay-brick-raw"])
vgal.data.trim("angels-clay-brick-raw")
vgal.recipe.all.replace_ingredient("angels-reinforced-concrete-brick",
    { type = "item", name = "angels-concrete-brick", amount = 1 })
vgal.recipe.all.replace_ingredient("clay-brick",
    { type = "item", name = "stone-brick", amount = 1 })

-- remove liquid plastic as well as liquid plastic recipes (replaced by vgal)
-- why? they dont fit well with the plastic buff needed to equalize with vgal/sagal
vgal.data.deephide(data.raw["fluid"]["angels-liquid-plastic"])
vgal.data.trim("angels-solid-plastic")
vgal.data.trim("angels-liquid-plastic")
vgal.data.trim("angels-liquid-plastic-2")
vgal.data.trim("angels-liquid-plastic-3")
vgal.data.trim("angels-liquid-plastic-bio-1")
vgal.data.trim("angels-liquid-plastic-bio-2")

-- remove extra trees
vgal.data.trim("angels-tree-arboretum-0")
vgal.data.deephide(data.raw["item"]["angels-temperate-tree"])
vgal.data.deephide(data.raw["item"]["angels-swamp-tree"])
vgal.data.deephide(data.raw["item"]["angels-desert-tree"])

for _, environment in ipairs({ "temperate", "swamp", "desert" }) do
    local tree = data.raw["tree"]["angels-" .. environment .. "-tree"]
    tree.autoplace = {
        probability_expression = "0"
    }
    vgal.data.deephide(tree)
end

-- remove copper wire coil (copper wire recipe gets reordered during final fixes)
vgal.data.trim("angels-wire-coil-copper")
vgal.data.trim("angels-wire-coil-copper-2")
vgal.data.trim("angels-wire-copper-2")
