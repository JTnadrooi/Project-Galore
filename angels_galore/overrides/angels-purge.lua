--- ore removal ---

-- (actual)catalyst fixes
vgal.recipe.all.replace_ingredient("angels-catalyst-metal-yellow",
    { type = "item", name = "angels-catalyst-metal-red", amount = 1 })
vgal.recipe.all.replace_ingredient("angels-catalyst-metal-blue",
    { type = "item", name = "angels-catalyst-metal-green", amount = 1 })

vgal.data.trim("angels-catalyst-metal-blue")
vgal.data.trim("angels-catalyst-metal-yellow")

-- remove the NORMAL ores and their processing recipes
for _, ore in ipairs(agal.constants.REMOVED_ORE_INDEXES) do
    vgal.data.deep_hide(data.raw["item"]["angels-ore" .. ore])

    for _, state in ipairs(agal.constants.ORE_STATES) do
        vgal.data.trim("angels-ore" .. ore .. "-" .. state .. "-processing")
        vgal.data.trim("angels-ore" .. ore .. "-" .. state)
        vgal.data.deep_hide(data.raw["item"]["angels-ore" .. ore .. "-" .. state])
    end
end

-- remove the ALT ores and their processing recipes
for _, ore in ipairs(agal.constants.REMOVED_ALT_ORE_INDEXES) do
    for _, state in ipairs(agal.constants.ALT_ORE_STATES) do
        vgal.data.trim("angels-ore" .. ore .. "-" .. state .. "-processing")
        vgal.data.trim("angels-ore" .. ore .. "-" .. state)
        vgal.data.deep_hide(data.raw["item"]["angels-ore" .. ore .. "-" .. state])
    end

    for _, state in ipairs(agal.constants.FLUID_ALT_ORE_STATES) do
        vgal.data.trim("angels-ore" .. ore .. "-" .. state)
        vgal.data.deep_hide(data.raw["fluid"]["angels-ore" .. ore .. "-" .. state])
    end

    vgal.data.trim("angels-ore" .. ore .. "-anode-sludge")
end

-- remove mix recipes. (I will have my own ones)
for i = 1, 6 do
    for _, state in ipairs(agal.constants.ORE_STATES) do
        local recipe = data.raw["recipe"]["angels-ore-" .. state .. "-mix" .. i .. "-processing"]

        if recipe then
            vgal.data.deep_hide(recipe)
        end
    end
end

-- remove mineral sludge to ores recipes. (I will have my own ones)
vgal.recipe.deep_hide("angels-slag-processing-1")
vgal.recipe.deep_hide("angels-slag-processing-2")
vgal.recipe.deep_hide("angels-slag-processing-3")

for _, ore_index in ipairs(agal.constants.REMOVED_ORE_INDEXES) do
    vgal.data.deep_hide(data.raw["resource"]["angels-ore" .. ore_index])
end

-- remove extra molten metal recipes
for _, metal in ipairs({ "iron", "steel" }) do -- copper doesn't have any extra smelting recipes
    for i = 2, 6 do
        local recipe = data.raw["recipe"]["angels-liquid-molten-" .. metal .. "-" .. i]
        if recipe then
            vgal.recipe.deep_hide(recipe.name)
            vgal.data.trim(recipe.name)
        end
    end
end

--- remove removed ore smelting techs, items and fluids ---

-- techs first.
for i = 1, 4 do
    for _, metal in ipairs(agal.constants.REMOVED_METALS) do
        for _, suffix in ipairs({ "smelting", "casting" }) do
            local tech = data.raw["technology"]["angels-" .. metal .. "-" .. suffix .. "-" .. i]

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
        vgal.data.deep_hide(fluid)
    end
end

local function dh_item(name)
    local item = data.raw["item"][name]
    if item then
        vgal.data.deep_hide(item)
    end
end

for _, metal in ipairs(agal.constants.REMOVED_METALS) do
    dh_fluid("angels-liquid-molten-" .. metal)
    dh_fluid("angels-liquid-" .. metal .. "-tetrachloride")
    dh_fluid("angels-gas-" .. metal .. "-hexafluoride")

    dh_item("angels-" .. metal .. "-ore")
    dh_item("angels-processed-" .. metal)
    dh_item("angels-cathode-" .. metal)
    dh_item("angels-pellet-" .. metal)
    dh_item("angels-solid-" .. metal .. "-hydroxide")
    dh_item("angels-solid-" .. metal .. "-oxide")
    dh_item("angels-ingot-" .. metal)
    dh_item("angels-powder-" .. metal)
    dh_item("angels-solid-" .. metal .. "-carbonyl")
    dh_item("angels-sponge-" .. metal)
    dh_item("angels-casting-powder-" .. metal)

    dh_item("angels-roll-" .. metal)
    dh_item("angels-plate-" .. metal)
end

-- misfits
vgal.data.deep_hide(data.raw["item"]["angels-bauxite-ore"])      -- aluminium ore
vgal.data.deep_hide(data.raw["item"]["angels-quartz"])           -- silicon ore (will make a comeback)
vgal.data.deep_hide(data.raw["item"]["angels-rutile-ore"])       -- titanium ore
vgal.data.deep_hide(data.raw["item"]["angels-processed-silica"]) -- silicon processed
vgal.data.deep_hide(data.raw["item"]["angels-pellet-silica"])    -- silicon pellet

-- specifics (items)
vgal.data.deep_hide(data.raw["item"]["angels-solid-sodium-aluminate"])
vgal.data.deep_hide(data.raw["item"]["angels-solid-chromate"])
vgal.data.deep_hide(data.raw["item"]["angels-solid-dichromate"])
vgal.data.deep_hide(data.raw["item"]["angels-solid-ammonium-paratungstate"])
vgal.data.deep_hide(data.raw["item"]["angels-silver-ore"]) -- this is the only mention of silver anywhere.
-- vgal.data.deep_hide(data.raw["item"]["angels-thorium-ore"]) -- this is the only mention of thorium anywhere.

-- specifics (fluids)
vgal.data.deep_hide(data.raw["fluid"]["angels-liquid-trichlorosilane"])
vgal.data.deep_hide(data.raw["fluid"]["angels-gas-silane"])
vgal.data.deep_hide(data.raw["fluid"]["angels-liquid-tungstic-acid"])

--- remove empty techs --- (can't do this in final-fixes bc of galorelib, but this should work)
local function startsWith(str, prefix)
    return string.sub(str, 1, #prefix) == prefix
end

for _, tech in pairs(data.raw["technology"]) do
    if startsWith(tech.name, "angels") and (not startsWith(tech.name, "angels-hidden")) and tech.effects then
        local tech_is_without_relevant_effects = true
        for _, effect in pairs(tech.effects) do -- techs without effects stay.
            if not effect.hidden then
                if effect.type == "unlock-recipe" then
                    if not data.raw["recipe"][effect.recipe].hidden then
                        tech_is_without_relevant_effects = false
                        break
                    end
                else
                    tech_is_without_relevant_effects = false
                    break
                end
            end
        end

        if tech_is_without_relevant_effects then
            vgal.tech.techs_to_splice[tech.name] = tech
        end
    end
end

--- funny yellow module removal ---
local BIO_MODULES = { "angels-bio-yield-module", "angels-bio-yield-module-2", "angels-bio-yield-module-3" }
for _, bio_module in ipairs(BIO_MODULES) do
    vgal.data.deep_hide(data.raw["module"][bio_module])
    vgal.data.trim(bio_module)
end
