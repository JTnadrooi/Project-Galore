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
for _, environment in pairs(vgal.defines.environments) do
    vgal.recipe.hide("angels-" .. environment.name .. "-upgrade")
    vgal.item.hide("angels-" .. environment.name .. "-upgrade")
    local building_recipe = data.raw["recipe"][environment.farm]
    for i, ingredient in ipairs(building_recipe.ingredients) do
        if ingredient.name == ("angels-" .. environment.name .. "-upgrade") then
            table.remove(building_recipe.ingredients, i)
            break
        end
    end
end

-- (actual)catalyst fixes
vgal.recipe.hide_and_queue_for_tech_removal("angels-catalyst-metal-red")
vgal.item.hide("angels-catalyst-metal-red")
vgal.recipe.all.replace_ingredient("angels-catalyst-metal-red", { type = "item", name = "angels-catalyst-metal-yellow", amount = 1 })

vgal.recipe.hide_and_queue_for_tech_removal("angels-catalyst-metal-green")
vgal.item.hide("angels-catalyst-metal-green")
vgal.recipe.all.replace_ingredient("angels-catalyst-metal-green", { type = "item", name = "angels-catalyst-metal-blue", amount = 1 })

-- remove the NORMAL ores and their processing recipes
for _, ore in ipairs(vgal.defines.removed_ore_indexes) do
    vgal.item.hide("angels-ore" .. ore)

    for _, state in ipairs(vgal.defines.ore_states) do
        vgal.recipe.hide_and_queue_for_tech_removal("angels-ore" .. ore .. "-" .. state .. "-processing")
        vgal.recipe.hide_and_queue_for_tech_removal("angels-ore" .. ore .. "-" .. state)
        vgal.item.hide("angels-ore" .. ore .. "-" .. state)
    end
end

-- remove the ALT ores and their processing recipes
for _, ore in ipairs(vgal.defines.removed_alt_ore_indexes) do
    for _, state in ipairs(vgal.defines.alt_ore_states) do
        vgal.recipe.hide_and_queue_for_tech_removal("angels-ore" .. ore .. "-" .. state .. "-processing")
        vgal.recipe.hide_and_queue_for_tech_removal("angels-ore" .. ore .. "-" .. state)
        vgal.item.hide("angels-ore" .. ore .. "-" .. state)
    end

    for _, state in ipairs(vgal.defines.fluid_alt_ore_states) do
        vgal.recipe.hide_and_queue_for_tech_removal("angels-ore" .. ore .. "-" .. state)
        vgal.fluid.hide("angels-ore" .. ore .. "-" .. state)
    end

    vgal.recipe.hide_and_queue_for_tech_removal("angels-ore" .. ore .. "-anode-sludge")
    vgal.fluid.hide("angels-ore" .. ore .. "-anode-sludge")
end

-- remove mix recipes. (I will have my own ones)
for i = 1, 6 do
    for _, state in ipairs(vgal.defines.ore_states) do
        local recipe = data.raw["recipe"]["angels-ore-" .. state .. "-mix" .. i .. "-processing"]

        if recipe then
            vgal.recipe.hide(recipe)
        end
    end
end

-- remove mineral sludge to ores recipes. (I will have my own ones)
vgal.recipe.hide("angels-slag-processing-1")
vgal.recipe.hide("angels-slag-processing-2")
vgal.recipe.hide("angels-slag-processing-3")

-- remove extra molten metal recipes
for _, metal_name in ipairs({ "iron", "steel" }) do -- copper doesn't have any extra smelting recipes
    for i = 2, 6 do
        local recipe = data.raw["recipe"]["angels-liquid-molten-" .. metal_name .. "-" .. i]
        if recipe then
            vgal.recipe.hide(recipe)
            vgal.recipe.hide_and_queue_for_tech_removal(recipe.name)
        end
    end
end

-- remove removed ore smelting techs, items and fluids.
-- techs first.
for i = 1, 4 do
    for _, metal_name in ipairs(vgal.defines.removed_metal_names) do
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
        vgal.fluid.hide(fluid)
    end
end

local function dh_item(name)
    local item = data.raw["item"][name]
    if item then
        vgal.item.hide(item)
    end
end

for _, metal_name in ipairs(vgal.defines.removed_metal_names) do
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
vgal.item.hide("angels-bauxite-ore")      -- aluminium ore
vgal.item.hide("angels-quartz")           -- silicon ore (will make a comeback)
vgal.item.hide("angels-rutile-ore")       -- titanium ore
vgal.item.hide("angels-processed-silica") -- silicon processed
vgal.item.hide("angels-pellet-silica")    -- silicon pellet

-- specifics (items)
vgal.item.hide("angels-solid-sodium-aluminate")
vgal.item.hide("angels-solid-chromate")
vgal.item.hide("angels-solid-dichromate")
vgal.item.hide("angels-solid-ammonium-paratungstate")
vgal.item.hide("angels-silver-ore") -- this is the only mention of silver anywhere.
-- vgal.data.deep_hide(data.raw["item"]["angels-thorium-ore"]) -- this is the only mention of thorium anywhere. | commentedbc: not sure.

-- specifics (fluids)
vgal.fluid.hide("angels-liquid-trichlorosilane")
vgal.fluid.hide("angels-gas-silane")
vgal.fluid.hide("angels-liquid-tungstic-acid")

-- remove yellow modules (COMEBACKAT)
local bio_modules = { "angels-bio-yield-module", "angels-bio-yield-module-2", "angels-bio-yield-module-3" }
for _, bio_module in ipairs(bio_modules) do
    vgal.data.hide(data.raw["module"][bio_module])
    vgal.tech.hide(bio_module)
    vgal.recipe.hide_and_queue_for_tech_removal(bio_module)
end

-- removal of direct fluids (direct fluids: fluids used for like one purpose)

-- bio plastic - liquid-cellulose-acetate
vgal.recipe.hide_and_queue_for_tech_removal("angels-liquid-cellulose-acetate")
vgal.fluid.hide("angels-liquid-cellulose-acetate")
-- plastic recipe is just created with new ingredient (mixture)

-- plastic 3 - gas-formaldehyde
vgal.recipe.hide_and_queue_for_tech_removal("angels-gas-formaldehyde")
vgal.fluid.hide("angels-gas-formaldehyde")
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
data.raw.recipe["angels-liquid-glycerol"].categories = { "angels-advanced-chemistry" }
data.raw.recipe["angels-liquid-glycerol"].main_product = "angels-liquid-glycerol"
vgal.recipe.hide_and_queue_for_tech_removal("angels-gas-epichlorohydrin")
vgal.fluid.hide("angels-gas-epichlorohydrin")
vgal.recipe.hide_and_queue_for_tech_removal("angels-gas-allylchlorid")
vgal.fluid.hide("angels-gas-allylchlorid")

-- rocket fuel changes (from top of crafting tree to bottom)
-- rocket fuel ox capsule is removed, fuel capsule isn't
data.raw.recipe["rocket-fuel"].ingredients = vgal.build.table({ -- 200 (same as vanilla)
    { "angels-rocket-fuel-capsule", 1 }                         -- 175
}, {
    { "angels-liquid-nitric-acid", 25 },                        -- 25
})

-- fuel crafting chain branch fixes
data.raw.recipe["angels-rocket-fuel-capsule"].ingredients = vgal.build.table({
    { "plastic-bar", 1 },           -- 15c
}, {
    { "angels-gas-hydrazine", 40 }, -- 160c
})
data.raw.recipe["angels-rocket-fuel-capsule"].energy_required = 5
vgal.recipe.set_result_amount("angels-rocket-fuel-capsule", 1)

vgal.fluid.hide("angels-gas-dimethylamine")
vgal.recipe.hide_and_queue_for_tech_removal("angels-gas-dimethylamine")

vgal.fluid.hide("angels-gas-dimethylhydrazine")
vgal.recipe.hide_and_queue_for_tech_removal("angels-gas-dimethylhydrazine")

vgal.fluid.hide("angels-gas-methylamine")
vgal.recipe.hide_and_queue_for_tech_removal("angels-gas-methylamine")

-- ox crafting chain branch fixes
vgal.item.hide("angels-rocket-oxidizer-capsule")
vgal.recipe.hide_and_queue_for_tech_removal("angels-rocket-oxidizer-capsule")

vgal.fluid.hide("angels-gas-dinitrogen-tetroxide")
vgal.recipe.hide_and_queue_for_tech_removal("angels-gas-dinitrogen-tetroxide")

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

vgal.fluid.hide("angels-gas-nitrogen-monoxide")
vgal.recipe.hide_and_queue_for_tech_removal("angels-gas-nitrogen-monoxide")
vgal.recipe.hide_and_queue_for_tech_removal("angels-solid-sodium-nitrate-processing")

-- brick removal (clay/reinforced)
vgal.item.hide("angels-reinforced-concrete-brick")
vgal.recipe.hide_and_queue_for_tech_removal("angels-reinforced-concrete-brick")
vgal.item.hide("angels-clay-brick-raw")
vgal.recipe.hide_and_queue_for_tech_removal("angels-clay-brick-raw")
data.raw.recipe["angels-clay-brick"].ingredients = vgal.build.table({
    { "angels-solid-clay", 2 }
})
data.raw.recipe["angels-clay-brick"].results = vgal.build.table({
    { "angels-clay-brick", 1 }
})
data.raw.recipe["angels-clay-brick"].energy_required = 3.2
vgal.recipe.all.replace_ingredient("angels-reinforced-concrete-brick",
    { type = "item", name = "concrete", amount = 1 })

-- remove liquid plastic as well as liquid plastic recipes (replaced by vgal)
-- why? they dont fit well with the plastic buff needed to equalize with vgal/sagal
vgal.fluid.hide("angels-liquid-plastic")
vgal.recipe.hide_and_queue_for_tech_removal("angels-solid-plastic")
vgal.recipe.hide_and_queue_for_tech_removal("angels-liquid-plastic")
vgal.recipe.hide_and_queue_for_tech_removal("angels-liquid-plastic-2")
vgal.recipe.hide_and_queue_for_tech_removal("angels-liquid-plastic-3")
vgal.recipe.hide_and_queue_for_tech_removal("angels-liquid-plastic-bio-1")
vgal.recipe.hide_and_queue_for_tech_removal("angels-liquid-plastic-bio-2")

-- remove rocket boosters
vgal.recipe.hide_and_queue_for_tech_removal("angels-rocket-booster")
vgal.recipe.hide_and_queue_for_tech_removal("angels-rocket-booster-2")
vgal.item.hide("angels-rocket-booster")
data.raw.recipe["rocket"].ingredients = vgal.build.table({
    { "explosives", 1 },
    { "iron-plate", 2 },
})
vgal.recipe.remove_ingredient("atomic-bomb", "angels-rocket-booster")
vgal.recipe.remove_ingredient("angels-atomic-bomb", "angels-rocket-booster")
vgal.recipe.remove_ingredient("angels-atomic-bomb-2", "angels-rocket-booster")

-- remove extra trees
vgal.recipe.hide_and_queue_for_tech_removal("angels-tree-arboretum-0")
vgal.item.hide("angels-temperate-tree")
vgal.item.hide("angels-swamp-tree")
vgal.item.hide("angels-desert-tree")

for _, environment in ipairs({ "temperate", "swamp", "desert" }) do
    local tree = data.raw["tree"]["angels-" .. environment .. "-tree"]
    tree.autoplace = {
        probability_expression = "0"
    }
    vgal.data.hide(tree)
end

-- remove copper wire coil (copper wire recipe gets reordered during final fixes)
vgal.recipe.hide_and_queue_for_tech_removal("angels-wire-coil-copper")
vgal.recipe.hide_and_queue_for_tech_removal("angels-wire-coil-copper-2")
vgal.recipe.hide_and_queue_for_tech_removal("angels-wire-copper-2")

-- remove thermal water to sludge recipes (and tech)
vgal.tech.deep_hide("angels-thermal-water-processing")
