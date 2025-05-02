local subgroups = {
    { -- not in use
        name = "module-angels-bio-yield",
        tab = "production",
        order = "yd",
        entries = { "angels-bio-yield-module", "angels-bio-yield-module-2", "angels-bio-yield-module-3" },
        when_settings = { "vgal-modules" },
    },
    {
        name = "angels-smelthing-machines",
        tab = "resource-refining",
        order = "y-ze",
        entries = {
            "blast-furnace", "induction-furnace", "casting-machine", "strand-casting-machine", "ore-processing-machine",
            "pellet-press", "powder-mixer", "ore-powderizer",
        },
        reorder_entries = true,
    },
    {
        name = "angels-ore-machines",
        tab = "resource-refining",
        order = "y-zf",
        entries = {
            "burner-ore-crusher", "ore-crusher", "ore-sorting-facility", "ore-sorting-facility-2",
            "ore-floatation-cell", "ore-leaching-plant", "ore-refinery",
        },
        reorder_entries = true,
    },
    {
        name = "angels-white-water-machines",
        tab = "petrochem-refining",
        order = "y-za",
        entries = {
            "hydro-plant", "salination-plant", "cooling-tower", "clarifier", "angels-flare-stack",
        },
        reorder_entries = true,
    },
    {
        name = "angels-water-machines",
        tab = "petrochem-refining",
        order = "y-zb",
        entries = {
            "offshore-pump", "ground-water-pump", "seafloor-pump", "sea-pump", "washing-plant",
            "angels-electrolyser", "angels-electrolyser-2", "angels-electric-boiler", "angels-electric-boiler-2",
        },
        reorder_entries = true,
    },
    {
        name = "angels-chemistry-machines",
        tab = "petrochem-refining",
        order = "y-zc",
        entries = {
            "angels-air-filter",
            "liquifier", "liquifier-2",
            "angels-chemical-plant", "angels-chemical-plant-2",
            "advanced-chemical-plant", "advanced-chemical-plant-2",
        },
        reorder_entries = true,
    }, -- the liquifiers don't listen here, is fixed in update phase.
    {
        name = "angels-petrochem-machines",
        tab = "petrochem-refining",
        order = "y-zd",
        entries = {
            "oil-refinery", "gas-refinery-small", "gas-refinery",
            "separator", "separator-2", "steam-cracker",
        },
        reorder_entries = true,
    }, -- the oil refinery doesn't listen here, is fixed in update phase.
    -- {
    --     name = "angels-copper-casting-2",
    --     tab = "resource-refining",
    --     order = "y-ec",
    --     entries = { "copper-plate", "copper-cable", },
    -- }, -- both don't listen so i just repurpose the "angels-casting" subgroup.
    {
        name = "angels-cement-concrete",
        tab = "resource-refining",
        order = "x-nb",
        entries = {
            "solid-lime", "solid-cement", "stone-brick", "concrete-brick",  -- reinforced and clay removed
            "bio-tile",
        },
        reorder_entries = true,
    }, -- stone-brick doesn't listen here, is fixed in update phase.
    {
        name = "angels-solid-concrete",
        tab = "resource-refining",
        order = "y-nb",
        entries = {
            "concrete", "hazard-concrete",
            "refined-concrete", "refined-concrete",
        },
        reorder_entries = true,
    }, -- all of these.. they don't.. they don't listen.
}

for _, metal in ipairs(vgal.constants.METALS) do
    local mid_order = (metal == "copper") and "e" or "f"
    local processing_entries = {
        "processed-" .. metal,
        "pellet-" .. metal,
    }
    if metal == "copper" then table.insert(processing_entries, "anode-" .. metal) end
    table.insert(processing_entries, "ingot-" .. metal)
    table.insert(subgroups, {
        name = "angels-" .. metal .. "-processing",
        tab = "resource-refining",
        order = "y-" .. mid_order .. "a",
        entries = processing_entries,
        reorder_entries = true,
    })
    local casting_entries = {
        "liquid-molten-" .. metal,
        "angels-roll-" .. metal,
    }
    if metal == "copper" then table.insert(casting_entries, "angels-wire-coil-" .. metal) end
    table.insert(subgroups, {
        name = "angels-" .. metal .. "-casting",
        tab = "resource-refining",
        order = "y-" .. mid_order .. "b",
        entries = casting_entries,
    })
end

for _, ore_index in ipairs(agal.constants.ORE_INDEXES) do
    local ore_entries = {}
    data.raw["item"]["angels-ore" .. ore_index].order = "a"
    for ore_state_index, ore_state in ipairs(agal.constants.ORE_STATES) do
        local ore = "angels-ore" .. ore_index .. "-" .. ore_state
        table.insert(ore_entries, ore)

        data.raw["item"][ore].order = "a-" ..
            vgal.subgroup.order_from_number(ore_state_index)

        vgal.subgroup.clean("angelsore" .. ore_index .. "-" .. ore_state)
        data.raw["recipe"]["angelsore" .. ore_index .. "-" .. ore_state .. "-processing"].subgroup = "vgal-angels-ore" ..
            ore_index
        data.raw["recipe"]["angelsore" .. ore_index .. "-" .. ore_state .. "-processing"].order = "b-" ..
            vgal.subgroup.order_from_number(ore_state_index)
    end
    local order_post
    if ore_index == 3 then
        order_post = "b"
    else
        order_post = "a"
    end
    table.insert(subgroups,
        {
            name = "angels-ore" .. ore_index,
            tab = "resource-refining",
            order = "b[processing]-" .. order_post,
            entries = vgal.table.merge({ "angels-ore1" }, ore_entries),
        }
    )
end


local to_clean = {
}
for _, value in ipairs(to_clean) do
    data.raw["recipe"][value].order = nil
    data.raw["recipe"][value].subgroup = nil
end

for _, value in ipairs(subgroups) do
    if value.when == nil then
        value.when = true
    end
    for _, whenItem in ipairs(value.when_settings or {}) do
        if not settings.startup[whenItem].value then
            value.entries = {}
        end
    end
    if not value.when then
        value.entries = {}
    end
    if value.reorder_entries then
        for entry_index, entry_name in ipairs(value.entries) do
            vgal.any(entry_name).order = string.sub("abcdefghijklmnopqrstuvwxyz", entry_index, entry_index)
        end
    end
    vgal.subgroup.new("vgal-" .. value.name, value.entries, value.tab, value.order)
end

data.raw["item"]["ingot-steel"].subgroup = "angels-steel-casting"
data.raw["item"]["ingot-steel"].order = "ib"

data.raw["recipe"]["copper-ore-smelting"].order = "da"
data.raw["recipe"]["processed-copper-smelting"].order = "db"
data.raw["recipe"]["anode-copper-smelting"].order = "dc"
data.raw["recipe"]["iron-ore-smelting"].order = "ca"
data.raw["recipe"]["processed-iron-smelting"].order = "cb"
data.raw["recipe"]["pellet-iron-smelting"].order = "cc"
