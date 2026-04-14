local subgroups = {
    { -- not in use
        name = "module-angels-bio-yield",
        tab = "production",
        order = "yd",
        entries = { "angels-bio-yield-module", "angels-bio-yield-module-2", "angels-bio-yield-module-3" },
        when_settings = { "vgal-modules" },
    },
    {
        name = "smelting-machines",
        tab = "production",
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
        name = "ore-machines",
        tab = "production",
        order = "y-zf",
        entries = {
            "angels-burner-ore-crusher", "angels-ore-crusher", "angels-ore-sorting-facility",
            "angels-ore-sorting-facility-2",
            "angels-ore-floatation-cell", "angels-ore-leaching-plant", "angels-ore-refinery",
            "angels-filtration-unit",
            "angels-crystallizer",
        },
        reorder_entries = true,
    },
    {
        name = "white-water-machines",
        tab = "production",
        order = "y-za",
        entries = {
            "angels-hydro-plant", "angels-salination-plant", "angels-cooling-tower", "angels-clarifier",
            "angels-flare-stack",
        },
        reorder_entries = true,
    },
    {
        name = "water-machines",
        tab = "production",
        order = "y-zb",
        entries = {
            "offshore-pump", "angels-ground-water-pump",
            "angels-seafloor-pump", "angels-sea-pump", "angels-thermal-bore", "angels-thermal-extractor",
            "angels-washing-plant",
            "angels-electrolyser", "angels-electrolyser-2", "angels-electric-boiler", "angels-electric-boiler-2",
        }, -- vanilla items dont listen, fixed in final fixes.
        reorder_entries = true,
    },
    {
        name = "chemistry-machines",
        tab = "production",
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
        name = "petrochem-machines",
        tab = "production",
        order = "y-zd",
        entries = {
            "oil-refinery", "angels-gas-refinery-small", "angels-gas-refinery",
            "angels-separator", "angels-separator-2", "angels-steam-cracker",
        },
        reorder_entries = true,
    }, -- the oil refinery doesn't listen here, is fixed in final fixes phase.
    {
        name = "farming-machines",
        tab = "production",
        order = "y-zg",
        entries = {
            "angels-algae-farm", "angels-algae-farm-2",
            "angels-crop-farm",
            "angels-temperate-farm",
            "angels-swamp-farm",
            "angels-desert-farm",
            "angels-bio-refugium-fish",
            "angels-bio-refugium-puffer",
            "angels-bio-refugium-biter",
        },
        reorder_entries = true,
    },
    {
        name = "bio-machines",
        tab = "production",
        order = "y-zh",
        entries = {
            "angels-bio-generator-temperate-1", "angels-bio-arboretum-1",
            "angels-seed-extractor",
            "angels-composter",
            "angels-bio-processor",
            "angels-bio-press",
            "angels-nutrient-extractor",
            "angels-bio-hatchery",
            "angels-bio-butchery",
        },
        reorder_entries = true,
    },
    -- {
    --     name = "angels-copper-casting-2",
    --     tab = "angels-resource-refining",
    --     order = "y-ec",
    --     entries = { "copper-plate", "copper-cable", },
    -- }, -- commentedbc: both don't listen so i just repurpose the "angels-casting" subgroup.
    {
        name = "cement-concrete",
        tab = "angels-smelting",
        order = "y-na",
        entries = {
            "angels-liquid-concrete", "angels-solid-cement", "stone-brick", "angels-concrete-brick", -- reinforced and clay removed
            "angels-bio-tile",
        },
        reorder_entries = true,
    }, -- stone-brick doesn't listen here, is fixed in update phase.
    {
        name = "solid-concrete",
        tab = "angels-smelting",
        order = "y-nc",
        entries = {
            "landfill", "concrete", "hazard-concrete",
            "refined-concrete", "refined-concrete", "angels-solid-limestone", "angels-solid-lime",
        },
        reorder_entries = true,
    }, -- all of these.. they don't.. they don't listen.

    -- SCIENCE
    {
        name = "agricultural-science-pack",
        tab = "intermediate-products",
        order = "ybb",
        entries = { "vgal-agricultural-science-pack" },
        when_settings = { "vgal-science-packs" },
    },

    -- NUCLEAR
    {
        name = "nuclear-processing",
        tab = "angels-resource-refining",
        order = --[[america]] "y-ya",
        recipes = {
            "uranium-processing",
            "angels-thorium-processing",
        },
        reorder_entries = true,
    },
    {
        name = "nuclear-reprocessing",
        tab = "angels-resource-refining",
        order = "y-yb",
        recipes = {
            "nuclear-fuel-reprocessing",
            "angels-advanced-uranium-reprocessing",
            "angels-mixed-oxide-reprocessing",
            "angels-advanced-mixed-oxide-reprocessing",
            "angels-thorium-fuel-cell-reprocessing",
            "angels-advanced-thorium-fuel-cell-reprocessing",
            "angels-deuterium-fuel-cell-reprocessing",
        },
        reorder_entries = true,
    },
    {
        name = "nuclear-rocks",
        tab = "angels-resource-refining",
        order = "y-yc",
        entries = {
            "uranium-238",
            "uranium-235",
            "angels-uranium-234",
            "angels-curium-245",
            "angels-thorium-232",
            "angels-neptunium-240",
            "angels-plutonium-239",
            "angels-americium-241",
            "angels-muon-fusion-catalyst",
        },
        recipes_that_need_cleaning = {
            "angels-plutonium-synthesis",
            "angels-americium-regeneration",
            "angels-plutonium-breeding",
        },
        reorder_entries = true,
    },
    {
        name = "nuclear-cells",
        tab = "angels-resource-refining",
        order = "y-yd",
        entries = {
            "uranium-fuel-cell",
            "angels-uranium-fuel-cell",
            "angels-mixed-oxide-cell",
            "angels-deuterium-fuel-cell",
            "angels-thorium-fuel-cell",
        },
        reorder_entries = true,
    },
    {
        name = "nuclear-depleted-cells",
        tab = "angels-resource-refining",
        order = "y-ye",
        entries = {
            "depleted-uranium-fuel-cell",
            "angels-depleted-mixed-oxide-cell",
            "angels-depleted-deuterium-fuel-cell",
            "angels-depleted-thorium-fuel-cell",
        },
        reorder_entries = true,
    },

    -- MISC
    {
        name = "stone",
        tab = "angels-smelting",
        order = "y-yd",
        entries = {
            "stone",
            "angels-stone-crushed",
            "angels-solid-sand",
        },
        reorder_entries = true,
    },
    {
        name = "recipe-items",
        tab = "intermediate-products",
        order = "ca",
        entries = {
            "angels-solid-saw",
            "angels-solid-crystal-tipped-saw",
            "angels-solid-crystal-full-saw",
            "angels-milling-drum",
            "angels-milling-drum-lubricated",
            "angels-electrode",
            "angels-electrode-used",
            "angels-catalyst-metal-carrier",
            "angels-catalyst-metal-blue",
            "angels-catalyst-metal-yellow",
        },
        reorder_entries = true,
    },
    {
        name = "recipe-items-filters",
        tab = "intermediate-products",
        order = "cab",
        entries = {
            "angels-filter-frame",
            "angels-filter-coal",
            "angels-filter-ceramic",
            "angels-filter-lime",
        },
        recipes_that_need_cleaning = {
            "angels-filter-ceramic-refurbish",
        },
        reorder_entries = true,
    },
}

for metal in vgal.table.iter_all(vgal.defines.metals, { agal.defines.metal_steel }) do
    local base_order = ({
        ["copper"] = "a",
        ["iron"] = "b",
        ["steel"] = "c",
    })[metal.name] or error(serpent.block(metal))
    local processing_entries = ({
        ["copper"] = { metal.processed, metal.pellet, "angels-anode-copper", metal.ingot, },
        ["iron"] = { metal.processed, metal.pellet, metal.ingot, },
        ["steel"] = { metal.ingot },
    })[metal.name] or error(serpent.block(metal))

    if metal.name ~= "steel" then
        table.insert(subgroups, {
            name = metal.name .. "-sorting-results",
            tab = "angels-smelting",
            order = "b-" .. base_order .. "a",
            entries = { metal.ore, metal.pebbles, metal.nugget, metal.slag },
            reorder_entries = true,
        })
    end


    table.insert(subgroups, {
        name = metal.name .. "-processing",
        tab = "angels-smelting",
        order = "b-" .. base_order .. "b",
        entries = processing_entries,
        reorder_entries = true,
    })

    table.insert(subgroups, {
        name = metal.name .. "-casting",
        tab = "angels-smelting",
        order = "b-" .. base_order .. "c",
        entries = { metal.molten, metal.roll, metal.plate },
        reorder_entries = true,
    })
end

for _, metal in pairs(vgal.defines.metals) do
    data.raw["item"][metal.base_ore].order = "a"

    local ore_entries = {}
    for ore_state_index, ore_state in ipairs(metal.ore_states) do
        table.insert(ore_entries, metal[ore_state])

        data.raw["item"][metal[ore_state]].order = "a-" ..
            vgal.subgroup.order_from_number(ore_state_index)

        vgal.subgroup.clean_recipe(metal[ore_state])
        data.raw["recipe"][metal[ore_state] .. "-processing"].subgroup = "vgal-angels-ore" .. metal.ore_index
        data.raw["recipe"][metal[ore_state] .. "-processing"].order = "b-" ..
            vgal.subgroup.order_from_number(ore_state_index)
    end

    table.insert(subgroups,
        {
            name = metal.base_ore,
            tab = "angels-resource-refining",
            order = "b[processing]-" .. ((metal.name == "copper") and "a" or "b"),
            entries = vgal.table.merge_array({ metal.base_ore }, ore_entries),
        }
    )
end

vgal.log_block(subgroups)

for _, subgroup in ipairs(subgroups) do
    if subgroup.when == nil then
        subgroup.when = true
    end

    for _, whenItem in ipairs(subgroup.when_settings or {}) do
        if not settings.startup[whenItem].value then
            subgroup.entries = {}
        end
    end

    if not subgroup.when then
        subgroup.entries = {}
    end

    if subgroup.reorder_entries then
        for i, entry_name in ipairs(subgroup.entries or {}) do
            vgal.get_recipeable(entry_name).order = vgal.subgroup.order_from_number(i)
        end
    end

    vgal.subgroup.new("vgal-" .. subgroup.name, subgroup.entries or {}, subgroup.tab, subgroup.order)

    for i, recipe_name in ipairs(subgroup.recipes or {}) do
        local recipe = vgal.throw.if_recipe_not_found(recipe_name)
        recipe.subgroup = "vgal-" .. subgroup.name

        if subgroup.reorder_entries then
            recipe.order = vgal.subgroup.order_from_number(i)
        end
    end

    for _, recipe_name in ipairs(subgroup.recipes_that_need_cleaning or {}) do
        vgal.subgroup.clean_recipe(recipe_name)
    end
end
