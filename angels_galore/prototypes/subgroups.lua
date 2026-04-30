---@type vgal.SubgroupOverrideCollection[]
local subgroups = {
    { -- not in use, module has been removed
        name = "module-angels-bio-yield",
        group = "production",
        order = "yd",
        entries = { "angels-bio-yield-module", "angels-bio-yield-module-2", "angels-bio-yield-module-3" },
        when_settings = { "vgal-modules" },
    },
    {
        name = "smelting-machines",
        group = "production",
        order = "y-ze",
        entries = {
            "angels-blast-furnace", "angels-chemical-furnace", "angels-induction-furnace", "angels-casting-machine",
            "angels-strand-casting-machine",
            "angels-ore-processing-machine",
            "angels-pellet-press", "angels-powder-mixer", "angels-powderizer",
        },
        should_reorder_entries = true,
    },
    {
        name = "ore-machines",
        group = "production",
        order = "y-zf",
        entries = {
            "angels-burner-ore-crusher", "angels-ore-crusher", "angels-ore-sorting-facility",
            "angels-ore-sorting-facility-2",
            "angels-ore-floatation-cell", "angels-ore-leaching-plant", "angels-ore-refinery",
            "angels-filtration-unit",
            "angels-crystallizer",
        },
        should_reorder_entries = true,
    },
    {
        name = "white-water-machines",
        group = "production",
        order = "y-za",
        entries = {
            "angels-hydro-plant", "angels-salination-plant", "angels-cooling-tower", "angels-clarifier",
            "angels-flare-stack",
        },
        should_reorder_entries = true,
    },
    {
        name = "water-machines",
        group = "production",
        order = "y-zb",
        entries = {
            "offshore-pump", "angels-ground-water-pump",
            "angels-seafloor-pump", "angels-sea-pump", "angels-thermal-bore", "angels-thermal-extractor",
            "angels-washing-plant",
            "angels-electrolyser", "angels-electrolyser-2", "angels-electric-boiler", "angels-electric-boiler-2",
        }, -- vanilla items dont listen, fixed in final fixes.
        should_reorder_entries = true,
    },
    {
        name = "chemistry-machines",
        group = "production",
        order = "y-zc",
        entries = {
            "angels-air-filter",
            "angels-liquifier", "angels-liquifier-2",
            "chemical-plant", "angels-chemical-plant-2",
            "angels-advanced-chemical-plant", "angels-advanced-chemical-plant-2",
        },
        should_reorder_entries = true,
    }, -- the liquifiers don't listen here, is fixed in update phase.
    {
        name = "petrochem-machines",
        group = "production",
        order = "y-zd",
        entries = {
            "oil-refinery", "angels-gas-refinery-small", "angels-gas-refinery",
            "angels-separator", "angels-separator-2", "angels-steam-cracker",
        },
        should_reorder_entries = true,
    }, -- the oil refinery doesn't listen here, is fixed in final fixes phase.
    {
        name = "farming-machines",
        group = "production",
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
        should_reorder_entries = true,
    },
    {
        name = "bio-machines",
        group = "production",
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
        should_reorder_entries = true,
    },
    {
        name = "cement-concrete",
        group = "angels-smelting",
        order = "y-na",
        entries = {
            "angels-liquid-concrete", "angels-solid-lime", "angels-solid-cement", "stone-brick", "angels-concrete-brick", -- reinforced and clay removed
            "angels-bio-tile",
        },
        should_reorder_entries = true,
    }, -- stone-brick doesn't listen here, is fixed in update phase.
    {
        name = "solid-concrete",
        group = "angels-smelting",
        order = "y-nc",
        entries = {
            "landfill", "concrete", "hazard-concrete",
            "refined-concrete", "refined-concrete", "angels-solid-limestone",
        },
        cleaning_entries = {
            "angels-concrete",
            "angels-solid-mud-landfill",
        },
        should_reorder_entries = true,
    }, -- all of these.. they don't.. they don't listen.

    -- SCIENCE
    {
        name = "agricultural-science-pack",
        group = "intermediate-products",
        order = "ybb",
        entries = { "vgal-biological-science-pack" },
        when_settings = { "vgal-science-packs" },
    },

    -- NUCLEAR
    {
        name = "nuclear-processing",
        group = "angels-resource-refining",
        order = --[[america]] "y-ya",
        recipe_entries = {
            "uranium-processing",
            "angels-thorium-processing",
        },
        should_reorder_entries = true,
    },
    {
        name = "nuclear-reprocessing",
        group = "angels-resource-refining",
        order = "y-yb",
        recipe_entries = {
            "nuclear-fuel-reprocessing",
            "angels-advanced-uranium-reprocessing",
            "angels-mixed-oxide-reprocessing",
            "angels-advanced-mixed-oxide-reprocessing",
            "angels-thorium-fuel-cell-reprocessing",
            "angels-advanced-thorium-fuel-cell-reprocessing",
            "angels-deuterium-fuel-cell-reprocessing",
        },
        should_reorder_entries = true,
    },
    {
        name = "nuclear-rocks",
        group = "angels-resource-refining",
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
        cleaning_entries = {
            "angels-plutonium-synthesis",
            { "angels-americium-regeneration", "angels-plutonium-239" },
            { "angels-plutonium-breeding",     "angels-plutonium-239" },
        },
        should_reorder_entries = true,
    },
    {
        name = "nuclear-cells",
        group = "angels-resource-refining",
        order = "y-yd",
        entries = {
            "uranium-fuel-cell",
            "angels-uranium-fuel-cell",
            "angels-mixed-oxide-cell",
            "angels-deuterium-fuel-cell",
            "angels-thorium-fuel-cell",
        },
        should_reorder_entries = true,
    },
    {
        name = "nuclear-depleted-cells",
        group = "angels-resource-refining",
        order = "y-ye",
        entries = {
            "depleted-uranium-fuel-cell",
            "angels-depleted-mixed-oxide-cell",
            "angels-depleted-deuterium-fuel-cell",
            "angels-depleted-thorium-fuel-cell",
        },
        should_reorder_entries = true,
    },

    -- CHEM (angels-petrochem-refining)
    {
        name = "carbon",
        group = "angels-petrochem-refining",
        order = "aab",
        entries = {
            "angels-solid-carbon",
            "angels-gas-carbon-monoxide",
            "angels-gas-carbon-dioxide",
        },
        cleaning_entries = {
            { "angels-water-gas-shift-1", "angels-gas-carbon-dioxide" },
            { "angels-water-gas-shift-2", "angels-gas-carbon-monoxide" },
            "angels-carbon-from-charcoal",
            "angels-gas-carbon-dioxide-from-wood",
            { "angels-coke-purification-2", "angels-solid-carbon" },
        },
        should_reorder_entries = true,
    },
    {
        name = "fuel-t2",
        group = "angels-petrochem-refining",
        order = "abb",
        entries = {
            "rocket-fuel",
            "nuclear-fuel",
            "angels-nuclear-fuel",
            "angels-nuclear-fuel-2",
        },
        cleaning_entries = {
            "vgal-coal-uranium-235-nuclear-fuel",
        },
        should_reorder_entries = true,
    },
    {
        name = "NHH",
        group = "angels-petrochem-refining",
        order = "cab",
        entries = {
            "angels-gas-ammonia",
            "angels-gas-hydrazine",
            "angels-gas-monochloramine", -- misfit
            "angels-liquid-nitric-acid", -- misfit
        },
        cleaning_entries = {
            { "angels-steam-cracking-butane", "angels-gas-benzene" },
            "angels-gas-ammonia-from-blue-fiber",
            "angels-sodium-nitrate-acid-processing",
        },
        should_reorder_entries = true,
    },
    {
        name = "CH-gas",
        group = "angels-petrochem-refining",
        order = "fa",
        entries = {
            "angels-gas-ethylene",
            "angels-gas-methane",
            "angels-gas-ethane",
            "angels-gas-butane",
            "angels-gas-propene",
            "angels-gas-benzene",
        },
        cleaning_entries = {
            "angels-ethanol-to-ethylene-synthesis",
            { "angels-catalyst-steam-cracking-naphtha", "angels-gas-propene" },
            { "angels-steam-cracking-butane",           "angels-gas-benzene" },
        },
        should_reorder_entries = true,
    },
    {
        name = "CH-liquid",
        group = "angels-petrochem-refining",
        order = "fab",
        entries = {
            "angels-liquid-polyethylene",
        },
        cleaning_entries = {
        },
        should_reorder_entries = true,
    },
    {
        name = "COH-gas",
        group = "angels-petrochem-refining",
        order = "fb",
        entries = {
            "angels-gas-methanol",
            "angels-gas-acetone",
            "angels-gas-ethanol",
        },
        cleaning_entries = {
            "angels-gas-methanol-from-wood",
            { "angels-steam-cracking-methane", "angels-gas-methanol" },
            { "angels-cumene-process",         "angels-gas-acetone" },
        },
        should_reorder_entries = true,
    },
    {
        name = "COH-liquid",
        group = "angels-petrochem-refining",
        order = "fbb",
        entries = {
            "angels-liquid-phenol",
            "angels-liquid-glycerol",
            "angels-liquid-acetic-acid",
            "angels-liquid-acetic-anhydride",
            "angels-liquid-propionic-acid",
        },
        cleaning_entries = {
            "angels-liquid-acetic-acid-catalyst",
        },
        should_reorder_entries = true,
    },
    {
        name = "petrochem-square-solids",
        group = "angels-petrochem-refining",
        order = "i-aa",
        entries = {
            "angels-solid-calcium-chloride",
            "angels-solid-calcium-carbonate",
            "angels-solid-sodium-hypochlorite",
            "angels-solid-sodium-perchlorate",
            "angels-solid-ammonium-nitrate", -- keeplast
        },
        should_reorder_entries = true,
    },
    {
        name = "petrochem-round-solids",
        group = "angels-petrochem-refining",
        order = "i-ab",
        entries = {
            "angels-solid-salt",
            "angels-solid-sodium-carbonate",
            "angels-solid-sodium-hydroxide",
            "angels-solid-sodium-sulfate",
            "angels-solid-sodium-chlorate",
            "angels-solid-ammonium-perchlorate", -- keeplast
        },
        cleaning_entries = {
            "angels-liquid-aqueous-sodium-hydroxide-reverse",
            "angels-algae-brown-burning-wash",
        },
        should_reorder_entries = true,
    },
    {
        name = "petrochem-other-solids",
        group = "angels-petrochem-refining",
        order = "i-ac",
        entries = {
            "sulfur",
            "angels-fluorite-ore",
            "angels-solid-sodium",
            "angels-paste-cellulose",
        },
        cleaning_entries = {
            "angels-solid-sodium-sulfate-separation",
            { "angels-solid-salt-separation", "angels-solid-sodium" },
            "angels-solid-sulfur",
        },
        should_reorder_entries = true,
    },
    {
        name = "fluoride",
        group = "angels-petrochem-refining",
        order = "db",
        entries = {
            "angels-gas-hydrogen-fluoride",
            "angels-liquid-hydrofluoric-acid",
        },
        cleaning_entries = {
            "angels-hydrogen-fluoride-dissolving",
        },
        should_reorder_entries = true,
    },
    {
        name = "explosives",
        group = "angels-petrochem-refining",
        order = "x",
        entries = {
            "explosives",
            "cliff-explosives",
        },
        cleaning_entries = {
            "angels-solid-nitroglycerin",
            "angels-solid-trinitrotoluene",
        },
        should_reorder_entries = true,
    },

    -- BIO
    {
        name = "bio-fuel",
        group = "angels-bio-processing-nauvis",
        order = "eb",
        entries = {
            "angels-cellulose-fiber",
            "angels-wood-pellets",
            "angels-wood-bricks",
            "angels-wood-charcoal",
        },
        cleaning_entries = {
            "angels-cellulose-fiber",
            "angels-cellulose-fiber-raw-wood",
        },
        should_reorder_entries = true,
    },
    {
        name = "bio-chemistry",
        group = "angels-bio-processing-vegetables",
        order = "f",
        entries = {
            "angels-liquid-fermentation-raw",
            "angels-liquid-cellulose-acetate-mixture",
        },
        cleaning_entries = {
            "angels-fermentation-corn",
            "angels-fermentation-fruit",
        },
        should_reorder_entries = true,
    },

    -- MISC
    {
        name = "stone",
        group = "angels-smelting",
        order = "y-yd",
        entries = {
            "stone",
            "angels-slag",
            "angels-stone-crushed",
        },
        should_reorder_entries = true,
    },
    {
        name = "sediments",
        group = "angels-smelting",
        order = "y-ye",
        entries = {
            "angels-solid-mud",
            "angels-solid-clay",
            "angels-solid-limestone",
            "angels-solid-sand",
        },
        should_reorder_entries = true,
    },
    {
        name = "recipe-items",
        group = "intermediate-products",
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
        should_reorder_entries = true,
    },
    {
        name = "recipe-items-filters",
        group = "intermediate-products",
        order = "cab",
        entries = {
            "angels-filter-frame",
            "angels-filter-coal",
            "angels-filter-ceramic",
            "angels-filter-lime",
        },
        cleaning_entries = {
            "angels-filter-ceramic-refurbish",
        },
        should_reorder_entries = true,
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
            group = "angels-smelting",
            order = "b-" .. base_order .. "a",
            entries = { metal.ore, metal.pebbles, metal.nugget, metal.slag },
            should_reorder_entries = true,
        })
    end


    table.insert(subgroups, {
        name = metal.name .. "-processing",
        group = "angels-smelting",
        order = "b-" .. base_order .. "b",
        entries = processing_entries,
        should_reorder_entries = true,
    })

    table.insert(subgroups, {
        name = metal.name .. "-casting",
        group = "angels-smelting",
        order = "b-" .. base_order .. "c",
        entries = { metal.molten, metal.roll, metal.plate },
        should_reorder_entries = true,
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
            group = "angels-resource-refining",
            order = "b[processing]-" .. ((metal.name == "copper") and "a" or "b"),
            entries = vgal.table.merge_array({ metal.base_ore }, ore_entries),
        }
    )
end

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

    if subgroup.should_reorder_entries then
        for i, entry_name in ipairs(subgroup.entries or {}) do
            vgal.get_recipeable(entry_name).order = vgal.subgroup.order_from_number(i)
        end
    end

    vgal.subgroup.new("vgal-" .. subgroup.name, subgroup.entries or {}, subgroup.group, subgroup.order)

    for i, recipe_name in ipairs(subgroup.recipe_entries or {}) do
        local recipe = vgal.throw.if_recipe_not_found(recipe_name)
        recipe.subgroup = "vgal-" .. subgroup.name

        if subgroup.should_reorder_entries then
            recipe.order = vgal.subgroup.order_from_number(i)
        end
    end

    for _, cleaning_entry in ipairs(subgroup.cleaning_entries or {}) do
        if cleaning_entry[1] then
            ---@cast cleaning_entry {[1]: string, [2]: string}

            vgal.subgroup.clean_recipe(cleaning_entry[1])
            data.raw["recipe"][cleaning_entry[1]].main_product = cleaning_entry[2]
        else
            ---@cast cleaning_entry string

            vgal.subgroup.clean_recipe(cleaning_entry --[[@as string]])
        end
    end
end
