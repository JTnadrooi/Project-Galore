-- PURGE EXTRA MACHINE TIERS

-- non angel entries must be before "angels-" prefixed ones.
-- <Name> = <Max Level>
local UNNEEDED_BUILDINGS = {
    ["angels-oil-refinery"] = 1,
    ["oil-refinery"] = 1,
    ["angels-steam-cracker"] = 1,
    ["angels-liquifier"] = 1,
    ["angels-electrolyser"] = 1,
    ["angels-chemical-plant"] = 1,
    ["chemical-plant"] = 1,
    ["angels-advanced-chemical-plant"] = 1,
    ["angels-separator"] = 1,
    ["angels-gas-refinery-small"] = 1,
    ["angels-gas-refinery"] = 1,
    ["angels-air-filter"] = 1,

    ["angels-hydro-plant"] = 1,
    ["angels-washing-plant"] = 1,
    ["angels-electric-boiler"] = 1,
    ["angels-salination-plant"] = 1,

    ["angels-algae-farm"] = 2,

    ["angels-induction-furnace"] = 1,
    ["angels-casting-machine"] = 1,
    ["angels-strand-casting-machine"] = 1,

    ["angels-ore-sorting-facility"] = 2,
    ["angels-ore-crusher"] = 1,
    ["angels-ore-floatation-cell"] = 1,
    ["angels-ore-leaching-plant"] = 1,
    ["angels-ore-processing-machine"] = 1,
    ["angels-ore-refinery"] = 1,
    ["angels-powderizer"] = 1,   -- z..
    ["angels-filtration-unit"] = 1,
    ["angels-crystallizer"] = 1, -- z 2..

    ["angels-pellet-press"] = 1,
    ["angels-powder-mixer"] = 1,
    ["angels-blast-furnace"] = 1,
    ["angels-chemical-furnace"] = 1,
    ["angels-sintering-oven"] = 0,        -- removes it.
    ["angels-electro-whinning-cell"] = 0, -- removes it. (whinning?)
}

local MODULE_COUNT_BLACKLIST = {
    ["angels-air-filter"] = true,
    ["oil-refinery"] = true,
    ["angels-electric-boiler"] = true,
}

local partial_angels_category_buffer = {}

for building_name, max_tier in pairs(UNNEEDED_BUILDINGS) do
    local max_categories = nil
    local buildings = {}
    local is_partial_angels = UNNEEDED_BUILDINGS["angels-" .. building_name] or
        UNNEEDED_BUILDINGS[building_name:gsub("^angels%-", "")]

    -- for every tier except tier 1 trim if above max and edit module slots.
    for i = 2, 5 do
        local building = data.raw["assembling-machine"][building_name .. "-" .. i]
        if building then
            max_categories = building.crafting_categories
            if not MODULE_COUNT_BLACKLIST[building_name] then
                building.module_slots = 1 + i
            end
        end
        if (i > max_tier) and building then
            vgal.data.deephide(building)
            vgal.data.deephide(data.raw["item"][building_name .. "-" .. i])
            vgal.data.trim(building_name .. "-" .. i)
            building.next_upgrade = nil
        else
            table.insert(buildings, building)
        end
    end

    -- max tier should not have next_upgrade.
    local building_max = data.raw["assembling-machine"][building_name .. "-" .. max_tier] or
        data.raw["assembling-machine"][building_name]
    if building_max then
        building_max.next_upgrade = nil
    else
        if not is_partial_angels then
            error(building_name)
        end
    end

    -- base tier should be included in all the buildings and fix module slots.
    local building_min = data.raw["assembling-machine"][building_name] or
        data.raw["assembling-machine"][building_name .. "-" .. max_tier]
    if building_min then
        table.insert(buildings, building_min)
        if (not MODULE_COUNT_BLACKLIST[building_name]) then
            building_min.module_slots = 2
        end
    else
        if not is_partial_angels then
            error(building_name)
        end
    end

    if not max_categories and is_partial_angels then
        max_categories = partial_angels_category_buffer["angels-" .. building_name]
    end

    -- make all builings craft everything.
    for _, tier_building in ipairs(buildings) do
        tier_building.crafting_categories = max_categories
    end

    if is_partial_angels then
        partial_angels_category_buffer[building_name] = max_categories
    end

    if max_tier == 0 then
        vgal.data.deephide(data.raw["assembling-machine"][building_name])
        vgal.data.deephide(data.raw["item"][building_name])
        vgal.data.trim(building_name)
    end
end

-- more specific module slot fixes.
data.raw["mining-drill"]["angels-thermal-extractor"].module_slots = 4
data.raw["assembling-machine"]["angels-ore-sorting-facility"].module_slots = 2
data.raw["assembling-machine"]["angels-ore-sorting-facility-2"].module_slots = 3
data.raw["assembling-machine"]["angels-strand-casting-machine"].module_slots = 3
data.raw["assembling-machine"]["angels-gas-refinery"].module_slots = 4
data.raw["assembling-machine"]["angels-advanced-chemical-plant"].module_slots = 3
data.raw["assembling-machine"]["angels-advanced-chemical-plant-2"].module_slots = 4
data.raw["assembling-machine"]["angels-salination-plant"].module_slots = 4
data.raw["assembling-machine"]["angels-powderizer"].module_slots = 3
data.raw["assembling-machine"]["angels-electric-boiler"].module_slots = 0
data.raw["assembling-machine"]["angels-electric-boiler-2"].module_slots = 0

data.raw["assembling-machine"]["angels-crop-farm"].module_slots = 1
for _, environment in ipairs(agal.defines.environments) do
    data.raw["assembling-machine"][environment .. "-farm"].module_slots = 3
end

-- CRAFTING SPEED NORMALIZATION.
data.raw["assembling-machine"]["oil-refinery"].crafting_speed = 2
data.raw["assembling-machine"]["angels-liquifier"].crafting_speed = 1
data.raw["assembling-machine"]["angels-liquifier-2"].crafting_speed = 2
data.raw["assembling-machine"]["chemical-plant"].crafting_speed = 1
data.raw["assembling-machine"]["angels-chemical-plant-2"].crafting_speed = 2
data.raw["assembling-machine"]["angels-advanced-chemical-plant"].crafting_speed = 1
data.raw["assembling-machine"]["angels-advanced-chemical-plant-2"].crafting_speed = 2
data.raw["assembling-machine"]["angels-gas-refinery-small"].crafting_speed = 1
data.raw["assembling-machine"]["angels-gas-refinery"].crafting_speed = 2
data.raw["assembling-machine"]["angels-separator-2"].crafting_speed = 2

data.raw["assembling-machine"]["angels-washing-plant"].crafting_speed = 2
-- data.raw["assembling-machine"]["angels-electric-boiler-2"].crafting_speed = 2

data.raw["assembling-machine"]["angels-ore-floatation-cell"].crafting_speed = 1
data.raw["assembling-machine"]["angels-ore-leaching-plant"].crafting_speed = 1
data.raw["assembling-machine"]["angels-ore-refinery"].crafting_speed = 1
data.raw["assembling-machine"]["angels-ore-crusher"].crafting_speed = 2
data.raw["assembling-machine"]["angels-powderizer"].crafting_speed = 2
data.raw["assembling-machine"]["angels-crystallizer"].crafting_speed = 1
data.raw["assembling-machine"]["angels-electrolyser-2"].crafting_speed = 2
data.raw["assembling-machine"]["angels-ore-sorting-facility"].crafting_speed = 1
data.raw["assembling-machine"]["angels-ore-sorting-facility-2"].crafting_speed = 2
data.raw["assembling-machine"]["angels-filtration-unit"].crafting_speed = 1

data.raw["assembling-machine"]["angels-bio-refugium-fish"].crafting_speed = 1
data.raw["assembling-machine"]["angels-bio-refugium-puffer"].crafting_speed = 1
data.raw["assembling-machine"]["angels-algae-farm"].crafting_speed = 1
data.raw["assembling-machine"]["angels-algae-farm-2"].crafting_speed = 2
data.raw["assembling-machine"]["angels-seed-extractor"].crafting_speed = 1
data.raw["assembling-machine"]["angels-bio-generator-temperate-1"].crafting_speed = 1
data.raw["assembling-machine"]["angels-bio-arboretum-1"].crafting_speed = 1

data.raw["mining-drill"]["angels-thermal-bore"].mining_speed = 1

-- commentedbc: its not needed, although compost cust
-- -- add builtin prod, both to mimic space age as to make the farming a bit easier.
-- for _, environment in ipairs(agal.defines.environments) do
--     data.raw["assembling-machine"][environment .. "-farm"].effect_receiver = { base_effect = { productivity = 0.5 } }
-- end

-- remove seed generators.
vgal.data.deephide(data.raw["assembling-machine"]["angels-bio-generator-swamp-1"])
vgal.data.deephide(data.raw["item"]["angels-bio-generator-swamp-1"])
vgal.data.trim("angels-bio-generator-swamp-1")

vgal.data.deephide(data.raw["assembling-machine"]["angels-bio-generator-desert-1"])
vgal.data.deephide(data.raw["item"]["angels-bio-generator-desert-1"])
vgal.data.trim("angels-bio-generator-desert-1")

-- remove sintering ovens
-- for i = 1, 5 do
--     if data.raw["assembling-machine"]["angels-sintering-oven-" .. i] then
--         vgal.data.deep_hide(data.raw["assembling-machine"]["angels-sintering-oven-" .. i])
--         vgal.data.deep_hide(data.raw["item"]["angels-sintering-oven-" .. i])
--         vgal.data.trim("angels-sintering-oven-" .. i)
--     end
-- end

-- remove t2 offshore pump: sea pump (not viscous mud pump)
vgal.data.deephide(data.raw["mining-drill"]["angels-sea-pump"])
vgal.data.deephide(data.raw["offshore-pump"]["angels-sea-pump-placeable"])
vgal.data.deephide(data.raw["item"]["angels-sea-pump"])
vgal.data.trim("angels-sea-pump")

-- remove t2 thermal water extractor (and copy locale)
vgal.data.deephide(data.raw["mining-drill"]["angels-thermal-extractor"])
vgal.data.deephide(data.raw["item"]["angels-thermal-extractor"])
vgal.data.trim("angels-thermal-extractor")
data.raw["mining-drill"]["angels-thermal-bore"].localised_description = { "entity-description.angels-thermal-extractor" }
data.raw["item"]["angels-thermal-bore"].localised_description = { "entity-description.angels-thermal-extractor" }

-- increase thermal water extrator (t1) electricity usage
-- og: 90kw, but still, this is only like 4 radars.
data.raw["mining-drill"]["angels-thermal-bore"].energy_usage = "1200kW"
