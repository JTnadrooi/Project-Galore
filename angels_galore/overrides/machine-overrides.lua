-- PURGE EXTRA MACHINE TIERS
local partial_angels_category_buffer = {}

for building_name, max_tier in pairs(agal.defines.machine_max_tiers) do
    local max_categories = nil
    local buildings = {}
    local is_partial_angels = agal.defines.machine_max_tiers["angels-" .. building_name] or
        agal.defines.machine_max_tiers[building_name:gsub("^angels%-", "")]

    -- for every tier except tier 1 trim if above max and edit module slots.
    for i = 2, 5 do
        local building = data.raw["assembling-machine"][building_name .. "-" .. i]
        if building then
            max_categories = building.crafting_categories
            building.module_slots = 1 + i
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
        building_min.module_slots = 2
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
data.raw["assembling-machine"]["angels-strand-casting-machine"].module_slots = 3
data.raw["assembling-machine"]["angels-gas-refinery"].module_slots = 4
data.raw["assembling-machine"]["angels-ore-refinery"].module_slots = 3
data.raw["assembling-machine"]["angels-advanced-chemical-plant"].module_slots = 3
data.raw["assembling-machine"]["angels-salination-plant"].module_slots = 3
data.raw["assembling-machine"]["angels-powderizer"].module_slots = 3
data.raw["assembling-machine"]["angels-electric-boiler"].module_slots = 0
data.raw["assembling-machine"]["angels-air-filter"].module_slots = 3

data.raw["assembling-machine"]["angels-crop-farm"].module_slots = 1
for _, environment in pairs(agal.defines.environments) do
    data.raw["assembling-machine"][environment.farm].module_slots = 3
end

-- CRAFTING SPEED NORMALIZATION.
data.raw["assembling-machine"]["oil-refinery"].crafting_speed = 1
data.raw["assembling-machine"]["angels-liquifier"].crafting_speed = 1
data.raw["assembling-machine"]["chemical-plant"].crafting_speed = 1
data.raw["assembling-machine"]["angels-advanced-chemical-plant"].crafting_speed = 1
data.raw["assembling-machine"]["angels-gas-refinery-small"].crafting_speed = 1
data.raw["assembling-machine"]["angels-gas-refinery"].crafting_speed = 2 -- to make it "faster" than the small one (not that it shares recipes or anything)

data.raw["assembling-machine"]["angels-washing-plant"].crafting_speed = 1
-- data.raw["assembling-machine"]["angels-electric-boiler-2"].crafting_speed = 2

data.raw["assembling-machine"]["angels-ore-floatation-cell"].crafting_speed = 1
data.raw["assembling-machine"]["angels-ore-leaching-plant"].crafting_speed = 1
data.raw["assembling-machine"]["angels-ore-refinery"].crafting_speed = 1
data.raw["assembling-machine"]["angels-ore-crusher"].crafting_speed = 2 -- burner ver is speed 1
data.raw["assembling-machine"]["angels-powderizer"].crafting_speed = 1
data.raw["assembling-machine"]["angels-crystallizer"].crafting_speed = 1
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
data.raw["mining-drill"]["angels-thermal-bore"].module_slots = 5

-- commentedbc: its awkward. speed is kinda limited by belt anyways in most designs. its not like farm recipes are expensive. BUT WAIT. More prod = less seed usage, bypasses belt speed
-- hmmmm
-- -- add builtin prod, both to mimic space age as to make the farming a bit easier.
-- for _, environment in ipairs(agal.defines.environments) do
--     data.raw["assembling-machine"][environment .. "-farm"].effect_receiver = { base_effect = { productivity = 0.5 } }
-- end

-- remove environment seed generators
vgal.data.deephide(data.raw["assembling-machine"]["angels-bio-generator-swamp-1"])
vgal.data.deephide(data.raw["item"]["angels-bio-generator-swamp-1"])
vgal.data.trim("angels-bio-generator-swamp-1")

vgal.data.deephide(data.raw["assembling-machine"]["angels-bio-generator-desert-1"])
vgal.data.deephide(data.raw["item"]["angels-bio-generator-desert-1"])
vgal.data.trim("angels-bio-generator-desert-1")

-- remove t2 offshore pump: sea pump (not viscous mud pump)
vgal.data.deephide(data.raw["mining-drill"]["angels-sea-pump"])
vgal.data.deephide(data.raw["offshore-pump"]["angels-sea-pump-placeable"])
vgal.data.deephide(data.raw["item"]["angels-sea-pump"])
vgal.data.trim("angels-sea-pump")

-- remove t2 thermal water extractor (and copy locale)
-- t1 has 4 module slots now anyways
vgal.data.deephide(data.raw["mining-drill"]["angels-thermal-extractor"])
vgal.data.deephide(data.raw["item"]["angels-thermal-extractor"])
vgal.data.trim("angels-thermal-extractor")
data.raw["mining-drill"]["angels-thermal-bore"].localised_description      = {
    "entity-description.angels-thermal-extractor",
}
data.raw["item"]["angels-thermal-bore"].localised_description              = {
    "entity-description.angels-thermal-extractor",
}

-- increase thermal water extrator (t1) electricity usage
-- og: 90kw, but still, this is only like 4 radars
data.raw["mining-drill"]["angels-thermal-bore"].energy_usage               = "1206kW"

-- increase ore-upgrading machines electricity usage
-- you need less of them with how ore upgrading speeds have been increased
data.raw["assembling-machine"]["angels-ore-refinery"].energy_usage         = "2452kW" -- og: 310kw
data.raw["assembling-machine"]["angels-ore-leaching-plant"].energy_usage   = "543kW"  -- og: 207kw

data.raw["assembling-machine"]["angels-bio-refugium-puffer"].working_sound = {
    sound = { filename = "__angelspetrochemgraphics__/sound/separator.ogg", volume = 0.65 },
    idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
}

-- return of the sintering oven
do
    local s_oven = data.raw["assembling-machine"]["angels-sintering-oven"]

    vgal.data.deepunhide(s_oven)
    vgal.data.deepunhide(data.raw["recipe"][s_oven.name])
    vgal.data.deepunhide(data.raw["item"][s_oven.name])

    s_oven.crafting_speed = 1
    s_oven.module_slots   = 2
    s_oven.energy_usage   = "204kW" -- og: 100kw

    -- oven gets added to metallurgy tech in tech overrides lua file
end

-- fix machine mining speeds
do
    local baseline = { 0.2, 3 } -- from assembling machine 1

    local function fix_machine(machine)
        if machine.minable then
            local raw_value = baseline[1] * (vgal.entity.get_size(machine) / baseline[2])

            -- round to nearest multiple of 0.05
            machine.minable.mining_time = math.floor(raw_value * 20 + 0.5) / 20
        end
    end

    for _, machine in pairs(data.raw["assembling-machine"]) do
        if vgal.string.starts_with(machine.name, "angels") then
            fix_machine(machine)
        end
    end

    for _, machine in pairs(data.raw["furnace"]) do
        if vgal.string.starts_with(machine.name, "angels") then
            fix_machine(machine)
        end
    end
end
