local UNNEEDED_BUILDINGS = {
    ["oil-refinery"] = 1,
    ["steam-cracker"] = 1,
    ["liquifier"] = 2,
    ["angels-electrolyser"] = 2,
    ["angels-chemical-plant"] = 2,
    ["advanced-chemical-plant"] = 2,
    ["separator"] = 2,
    ["gas-refinery-small"] = 1,
    ["gas-refinery"] = 1,
    ["angels-air-filter"] = 1,

    ["hydro-plant"] = 1,
    ["washing-plant"] = 1,
    ["angels-electric-boiler"] = 2,
    ["salination-plant"] = 1,

    ["algae-farm"] = 2,

    ["induction-furnace"] = 1,
    ["casting-machine"] = 1,
    ["strand-casting-machine"] = 1,

    ["ore-sorting-facility"] = 2,
    ["ore-crusher"] = 1,
    ["ore-floatation-cell"] = 1,
    ["ore-leaching-plant"] = 1,
    ["ore-processing-machine"] = 1,
    ["ore-refinery"] = 1,
    ["ore-powderizer"] = 1, -- z..
    ["filtration-unit"] = 1,
    ["crystallizer"] = 1,   -- z 2..

    ["pellet-press"] = 1,
    ["powder-mixer"] = 1,
    ["blast-furnace"] = 1,
    ["angels-chemical-furnace"] = 1, -- this removes it for some reason, but its ok bc it only has one recipe which I migrate later.
}

local MODULE_COUNT_BLACKLIST = {
    ["angels-air-filter"] = true,
    ["oil-refinery"] = true,
    ["angels-electric-boiler"] = true,
}

for building_name, max_tier in pairs(UNNEEDED_BUILDINGS) do
    local max_categories = {}
    local buildings = {}
    for i = 2, 5 do
        local building = data.raw["assembling-machine"][building_name .. "-" .. i]
        if building then
            max_categories = building.crafting_categories
            if not MODULE_COUNT_BLACKLIST[building_name] then
                building.module_slots = 1 + i
            end
        end
        if (i > max_tier) and building then
            vgal.data.deep_hide(building)
            vgal.data.deep_hide(data.raw["item"][building_name .. "-" .. i])
            vgal.data.trim(building_name .. "-" .. i)
            building.next_upgrade = nil
        else
            table.insert(buildings, building)
        end
    end
    local building_max = data.raw["assembling-machine"][building_name .. "-" .. max_tier] or
        data.raw["assembling-machine"][building_name]
    if building_max then
        building_max.next_upgrade = nil
    else
        error(building_name)
    end
    local building_min = data.raw["assembling-machine"][building_name] or
        data.raw["assembling-machine"][building_name .. "-" .. max_tier]
    if building_min then
        table.insert(buildings, building_min)
        if (not MODULE_COUNT_BLACKLIST[building_name]) then
            building_min.module_slots = 2
        end
    else
        error(building_name)
    end
    for _, tier_building in ipairs(buildings) do
        tier_building.crafting_categories = max_categories
    end
end
--- final module slot fixes P2 ---
data.raw["mining-drill"]["thermal-extractor"].module_slots = 4
data.raw["assembling-machine"]["ore-sorting-facility"].module_slots = 3
data.raw["assembling-machine"]["ore-sorting-facility-2"].module_slots = 4
data.raw["assembling-machine"]["strand-casting-machine"].module_slots = 3
data.raw["assembling-machine"]["gas-refinery"].module_slots = 4
data.raw["assembling-machine"]["advanced-chemical-plant"].module_slots = 3
data.raw["assembling-machine"]["advanced-chemical-plant-2"].module_slots = 4
data.raw["assembling-machine"]["salination-plant"].module_slots = 4
data.raw["assembling-machine"]["ore-powderizer"].module_slots = 3
data.raw["assembling-machine"]["angels-electric-boiler"].module_slots = 0
data.raw["assembling-machine"]["angels-electric-boiler-2"].module_slots = 0

data.raw["assembling-machine"]["crop-farm"].module_slots = 1
for _, environment in ipairs(agal.constants.ENVIRONMENTS) do
    data.raw["assembling-machine"][environment .. "-farm"].module_slots = 3
end

--- crafting speed fixes ---
data.raw["assembling-machine"]["oil-refinery"].crafting_speed = 2
data.raw["assembling-machine"]["liquifier"].crafting_speed = 1
data.raw["assembling-machine"]["liquifier-2"].crafting_speed = 2
data.raw["assembling-machine"]["angels-chemical-plant"].crafting_speed = 1
data.raw["assembling-machine"]["angels-chemical-plant-2"].crafting_speed = 2
data.raw["assembling-machine"]["advanced-chemical-plant"].crafting_speed = 1
data.raw["assembling-machine"]["advanced-chemical-plant-2"].crafting_speed = 2
data.raw["assembling-machine"]["gas-refinery-small"].crafting_speed = 1
data.raw["assembling-machine"]["gas-refinery"].crafting_speed = 2
data.raw["assembling-machine"]["separator-2"].crafting_speed = 2

data.raw["assembling-machine"]["washing-plant"].crafting_speed = 2
data.raw["assembling-machine"]["angels-electric-boiler-2"].crafting_speed = 2

data.raw["assembling-machine"]["ore-floatation-cell"].crafting_speed = 1
data.raw["assembling-machine"]["ore-leaching-plant"].crafting_speed = 1
data.raw["assembling-machine"]["ore-refinery"].crafting_speed = 1
data.raw["assembling-machine"]["ore-crusher"].crafting_speed = 2
data.raw["assembling-machine"]["ore-powderizer"].crafting_speed = 2
data.raw["assembling-machine"]["crystallizer"].crafting_speed = 1
data.raw["assembling-machine"]["angels-electrolyser-2"].crafting_speed = 2
data.raw["assembling-machine"]["ore-sorting-facility"].crafting_speed = 1
data.raw["assembling-machine"]["ore-sorting-facility-2"].crafting_speed = 2

data.raw["assembling-machine"]["bio-refugium-fish"].crafting_speed = 1
data.raw["assembling-machine"]["bio-refugium-puffer"].crafting_speed = 1
data.raw["assembling-machine"]["algae-farm"].crafting_speed = 1
data.raw["assembling-machine"]["algae-farm-2"].crafting_speed = 2
data.raw["assembling-machine"]["seed-extractor"].crafting_speed = 1

data.raw["mining-drill"]["thermal-bore"].mining_speed = 1
