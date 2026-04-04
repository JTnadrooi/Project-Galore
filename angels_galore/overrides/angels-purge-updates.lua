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
        vgal.log("=== Checking tech: " .. tech.name .. " ===")

        local tech_is_without_relevant_effects = true
        local effect_count = 0

        for idx, effect in pairs(tech.effects) do
            effect_count = effect_count + 1
            vgal.log(string.format("  Effect #%d: type='%s', hidden=%s", idx, effect.type, tostring(effect.hidden)))

            if not effect.hidden then
                vgal.log("    -> Non-hidden effect found, checking further...")

                if effect.type == "unlock-recipe" then
                    local recipe = data.raw["recipe"][effect.recipe]
                    if recipe then
                        vgal.log(string.format("    -> Recipe '%s' hidden=%s", effect.recipe, tostring(recipe.hidden)))
                        if not recipe.hidden then
                            vgal.log("    -> Recipe is NOT hidden -> tech has relevant effect")
                            tech_is_without_relevant_effects = false
                        else
                            vgal.log("    -> Recipe is hidden -> ignoring this effect")
                        end
                    else
                        vgal.log("    -> WARNING: Recipe '" .. effect.recipe .. "' not found!")
                        tech_is_without_relevant_effects = false -- Missing recipe is suspicious, treat as relevant
                    end
                else
                    vgal.log(string.format("    -> Non-recipe effect type '%s' -> tech has relevant effect", effect.type))
                    tech_is_without_relevant_effects = false
                end
                break
            else
                vgal.log("    -> Effect is hidden, skipping...")
            end
        end

        if effect_count == 0 then
            vgal.log("  -> No effects at all!")
        end

        vgal.log(string.format("Result for %s: tech_is_without_relevant_effects = %s", tech.name,
            tostring(tech_is_without_relevant_effects)))

        if tech_is_without_relevant_effects then
            vgal.log("  -> ADDING to techs_to_splice")
            vgal.tech.techs_to_splice[tech.name] = tech
        else
            vgal.log("  -> NOT adding to techs_to_splice")
        end

        vgal.log("")
    end
end

vgal.log(string.format("Total techs marked for splicing: %d", #vgal.tech.techs_to_splice))
