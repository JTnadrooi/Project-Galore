--- ore removal ---

-- (actual)catalyst fixes
vgal.data.trim("angels-catalyst-metal-red")
vgal.recipe.all.replace_ingredient("angels-catalyst-metal-red",
    { type = "item", name = "angels-catalyst-metal-yellow", amount = 1 })

vgal.data.trim("angels-catalyst-metal-green")
vgal.recipe.all.replace_ingredient("angels-catalyst-metal-green",
    { type = "item", name = "angels-catalyst-metal-blue", amount = 1 })

-- remove the NORMAL ores and their processing recipes
for _, ore in ipairs(agal.constants.REMOVED_ORE_INDEXES) do
    vgal.data.deephide(data.raw["item"]["angels-ore" .. ore])

    for _, state in ipairs(agal.constants.ORE_STATES) do
        vgal.data.trim("angels-ore" .. ore .. "-" .. state .. "-processing")
        vgal.data.trim("angels-ore" .. ore .. "-" .. state)
        vgal.data.deephide(data.raw["item"]["angels-ore" .. ore .. "-" .. state])
    end
end

-- remove the ALT ores and their processing recipes
for _, ore in ipairs(agal.constants.REMOVED_ALT_ORE_INDEXES) do
    for _, state in ipairs(agal.constants.ALT_ORE_STATES) do
        vgal.data.trim("angels-ore" .. ore .. "-" .. state .. "-processing")
        vgal.data.trim("angels-ore" .. ore .. "-" .. state)
        vgal.data.deephide(data.raw["item"]["angels-ore" .. ore .. "-" .. state])
    end

    for _, state in ipairs(agal.constants.FLUID_ALT_ORE_STATES) do
        vgal.data.trim("angels-ore" .. ore .. "-" .. state)
        vgal.data.deephide(data.raw["fluid"]["angels-ore" .. ore .. "-" .. state])
    end

    vgal.data.trim("angels-ore" .. ore .. "-anode-sludge")
end

-- remove mix recipes. (I will have my own ones)
for i = 1, 6 do
    for _, state in ipairs(agal.constants.ORE_STATES) do
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

--- remove removed ore smelting techs, items and fluids ---

-- techs first.
for i = 1, 4 do
    for _, metal_name in ipairs(agal.constants.REMOVED_METAL_NAMES) do
        for _, suffix in ipairs({ "smelting", "casting" }) do
            local tech = data.raw["technology"]["angels-" .. metal_name .. "-" .. suffix .. "-" .. i]

            if tech then
                vgal.tech.techs_to_splice[tech.name] = tech
            end
        end
    end
end

-- remove extra angels smelting items and fluids
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

for _, metal_name in ipairs(agal.constants.REMOVED_METAL_NAMES) do
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

--- funny yellow module removal ---
local BIO_MODULES = { "angels-bio-yield-module", "angels-bio-yield-module-2", "angels-bio-yield-module-3" }
for _, bio_module in ipairs(BIO_MODULES) do
    vgal.data.deephide(data.raw["module"][bio_module])
    vgal.data.deephide(data.raw["technology"][bio_module])
    vgal.data.trim(bio_module)
end

--- removal of direct fluids --- (direct fluids: fluids used for like one purpose)

-- bio plastic - liquid-cellulose-acetate
vgal.data.trim("angels-liquid-cellulose-acetate")
vgal.data.deephide(data.raw["fluid"]["angels-liquid-cellulose-acetate"])
vgal.recipe.replace_ingredient("angels-liquid-plastic-bio-1", "angels-liquid-cellulose-acetate",
    "angels-liquid-cellulose-acetate-mixture")

-- plastic 3 - gas-formaldehyde
vgal.data.trim("angels-gas-formaldehyde")
vgal.data.deephide(data.raw["fluid"]["angels-gas-formaldehyde"])
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
vgal.data.deephide(data.raw["fluid"]["angels-gas-epichlorohydrin"])
vgal.data.trim("angels-gas-allylchlorid")
vgal.data.deephide(data.raw["fluid"]["angels-gas-allylchlorid"])

-- data.raw.recipe["angels-gas-hydrazine"].ingredients = vgal.build.table({
--     { "angels-solid-sodium-hypochlorite", 5 },
-- }, {
--     { "angels-gas-ammonia", 250 },
-- })
-- vgal.data.deep_hide(data.raw["fluid"]["angels-gas-monochloramine"])
-- vgal.data.trim("angels-gas-monochloramine")

-- data.raw.recipe["angels-rocket-fuel-capsule"].ingredients = vgal.build.table({
--     { "solid-fuel", 1 },
-- }, {
--     { "angels-gas-dimethylhydrazine", 10 },
-- })
-- vgal.recipe.set_result_amount("angels-rocket-fuel-capsule", 1)



-- fix results and energy_required.
data.raw.recipe["angels-rocket-oxidizer-capsule"].energy_required = 5
vgal.recipe.set_result_amount("angels-rocket-oxidizer-capsule", 1)

data.raw.recipe["angels-rocket-fuel-capsule"].energy_required = 5
vgal.recipe.set_result_amount("angels-rocket-fuel-capsule", 1)

--- remove extra trees ---
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

--- mark empty techs for splicing --- (can't do this in final-fixes bc of galorelib, but this should work)
-- AND remove hidden effects, I could use queue_to_clean... hmm...
local function startsWith(str, prefix)
    return string.sub(str, 1, #prefix) == prefix
end

for _, tech in pairs(data.raw["technology"]) do
    if startsWith(tech.name, "angels")
        and not startsWith(tech.name, "angels-hidden")
        and tech.effects then
        local tech_is_without_relevant_effects = true

        for i = #tech.effects, 1, -1 do
            local effect = tech.effects[i]

            local is_hidden_recipe_unlock = effect.type == "unlock-recipe" and data.raw["recipe"][effect.recipe].hidden

            if effect.hidden or is_hidden_recipe_unlock then
                table.remove(tech.effects, i)
            else
                tech_is_without_relevant_effects = false
            end
        end

        if tech_is_without_relevant_effects then
            vgal.tech.techs_to_splice[tech.name] = tech
        end
    end
end
