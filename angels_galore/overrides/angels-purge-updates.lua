--- remove removed ore smelting techs, items and fluids ---

-- techs first.
local smelting_techs = {} -- will hold techs that are removed-ore-smelting-related.

for i = 1, 4 do
    for _, metal in ipairs(agal.constants.REMOVED_METALS) do
        for _, suffix in ipairs({ "smelting", "casting" }) do
            local tech = data.raw["technology"]["angels-" .. metal .. "-" .. suffix .. "-" .. i]

            if tech then
                smelting_techs[tech.name] = tech
            end
        end
    end
end

for _, tech in pairs(data.raw["technology"]) do
    ::fix_prerequisites::
    for _, prerequisite in ipairs(tech.prerequisites or {}) do
        if smelting_techs[prerequisite] then
            tech.prerequisites = smelting_techs[prerequisite].prerequisites
            goto fix_prerequisites
        end
    end
end

for tech_name, _ in pairs(smelting_techs) do
    vgal.tech.deep_hide(tech_name)
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
vgal.data.deep_hide(data.raw["item"]["angels-silver-ore"])  -- this is the only mention of silver anywhere.
vgal.data.deep_hide(data.raw["item"]["angels-thorium-ore"]) -- this is the only mention of thorium anywhere.

-- specifics (fluids)
vgal.data.deep_hide(data.raw["fluid"]["angels-liquid-trichlorosilane"])
vgal.data.deep_hide(data.raw["fluid"]["angels-gas-silane"])
vgal.data.deep_hide(data.raw["fluid"]["angels-liquid-tungstic-acid"])
