local subgroups = {
    { -- not in use
        name = "module-angels-bio-yield",
        tab = "production",
        order = "yd",
        entries = { "angels-bio-yield-module", "angels-bio-yield-module-2", "angels-bio-yield-module-3" },
        when_settings = { "vgal-modules" },
    },
    {
        name = "angels-smelting-machines",
        tab = "angels-resource-refining",
        order = "y-ze",
        entries = {
            "angels-blast-furnace", "angels-chemical-furnace", "angels-induction-furnace", "angels-casting-machine",
            "angels-strand-casting-machine",
            "angels-ore-processing-machine",
            "angels-pellet-press", "angels-powder-mixer", "angels-powderizer",
        },
        reorder_entries = true,
    },
    {
        name = "angels-ore-machines",
        tab = "angels-resource-refining",
        order = "y-zf",
        entries = {
            "angels-burner-ore-crusher", "angels-ore-crusher", "angels-ore-sorting-facility",
            "angels-ore-sorting-facility-2",
            "angels-ore-floatation-cell", "angels-ore-leaching-plant", "angels-ore-refinery",
        },
        reorder_entries = true,
    },
    {
        name = "angels-white-water-machines",
        tab = "angels-petrochem-refining",
        order = "y-za",
        entries = {
            "angels-hydro-plant", "angels-salination-plant", "angels-cooling-tower", "angels-clarifier",
            "angels-flare-stack",
        },
        reorder_entries = true,
    },
    {
        name = "angels-water-machines",
        tab = "angels-petrochem-refining",
        order = "y-zb",
        entries = {
            "offshore-pump", "angels-ground-water-pump", "angels-seafloor-pump", "angels-sea-pump",
            "angels-washing-plant",
            "angels-electrolyser", "angels-electrolyser-2", "angels-electric-boiler", "angels-electric-boiler-2",
        },
        reorder_entries = true,
    },
    {
        name = "angels-chemistry-machines",
        tab = "angels-petrochem-refining",
        order = "y-zc",
        entries = {
            "angels-air-filter",
            "angels-liquifier", "angels-liquifier-2",
            "chemical-plant", "angels-chemical-plant-2",
            "angels-advanced-chemical-plant", "angels-advanced-chemical-plant-2",
        },
        reorder_entries = true,
    }, -- the liquifiers don't listen here, is fixed in update phase.
    {
        name = "angels-petrochem-machines",
        tab = "angels-petrochem-refining",
        order = "y-zd",
        entries = {
            "oil-refinery", "angels-gas-refinery-small", "angels-gas-refinery",
            "angels-separator", "angels-separator-2", "angels-steam-cracker",
        },
        reorder_entries = true,
    }, -- the oil refinery doesn't listen here, is fixed in update phase.
    -- {
    --     name = "angels-copper-casting-2",
    --     tab = "angels-resource-refining",
    --     order = "y-ec",
    --     entries = { "copper-plate", "copper-cable", },
    -- }, -- both don't listen so i just repurpose the "angels-casting" subgroup.
    {
        name = "angels-cement-concrete",
        tab = "angels-resource-refining",
        order = "y-na",
        entries = {
            "angels-solid-lime", "angels-solid-cement", "stone-brick", "angels-concrete-brick", -- reinforced and clay removed
            "angels-bio-tile",
        },
        reorder_entries = true,
    }, -- stone-brick doesn't listen here, is fixed in update phase.
    {
        name = "angels-solid-concrete",
        tab = "angels-resource-refining",
        order = "y-nc",
        entries = {
            "concrete", "hazard-concrete",
            "refined-concrete", "refined-concrete",
        },
        reorder_entries = true,
    }, -- all of these.. they don't.. they don't listen.
}

for metal in vgal.table.iter_all(vgal.constants.METALS, { agal.constants.METAL_STEEL }) do
    local mid_order = (metal.name == "copper") and "e" or "f"
    if metal.name == "steel" then
        mid_order = "g"
    end

    local processing_entries = {
        metal.processed,
        metal.pellet,
    }
    if metal.name == "copper" then table.insert(processing_entries, "angels-anode-" .. metal.name) end
    table.insert(processing_entries, metal.ingot)

    if metal.name == "steel" then
        processing_entries = {
            "angels-ingot-steel",
        }
    end

    table.insert(subgroups, {
        name = "angels-" .. metal.name .. "-processing",
        tab = "angels-resource-refining",
        order = "y-" .. mid_order .. "a",
        entries = processing_entries,
        reorder_entries = true,
    })
    local casting_entries = {
        metal.molten,
        metal.roll,
    }
    if metal.name == "copper" then table.insert(casting_entries, "angels-wire-coil-" .. metal.name) end
    table.insert(subgroups, {
        name = "angels-" .. metal.name .. "-casting",
        tab = "angels-resource-refining",
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

        vgal.subgroup.clean("angels-ore" .. ore_index .. "-" .. ore_state)
        data.raw["recipe"]["angels-ore" .. ore_index .. "-" .. ore_state .. "-processing"].subgroup = "vgal-angels-ore" ..
            ore_index
        data.raw["recipe"]["angels-ore" .. ore_index .. "-" .. ore_state .. "-processing"].order = "b-" ..
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
            tab = "angels-resource-refining",
            order = "b[processing]-" .. order_post,
            entries = vgal.table.merge({ "angels-ore" .. ore_index }, ore_entries),
        }
    )
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
