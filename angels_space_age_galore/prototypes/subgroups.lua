---@type vgal.SubgroupOverrideCollection[]
local subgroups = {
    {
        name = "lava-processes",
        group = "angels-smelting",
        order = "y-cy", -- icey lol
        recipe_entries = {
            "molten-iron-from-lava",
            "molten-copper-from-lava",
        },
        should_reorder_entries = true,
    },
    {
        name = "tungsten-processing",
        group = "angels-smelting",
        order = "b-dba",
        entries = { "tungsten-ore", "angels-processed-tungsten", "angels-pellet-tungsten", "angels-solid-tungsten-oxide", "angels-solid-ammonium-paratungstate", "angels-liquid-tungstic-acid", "angels-powder-tungsten", },
        should_reorder_entries = true,
        cleaning_entries = { "angels-solid-tungsten-oxide-2", "angels-solid-ammonium-paratungstate-2" }
    },
    {
        name = "tungsten-smelting",
        group = "angels-smelting",
        order = "b-dbb",
        entries = { "vgal-tungsten-steel-powder", "tungsten-plate", "tungsten-carbide" },
        should_reorder_entries = true,
    },
    {
        name = "holmium-processing",
        group = "angels-smelting",
        order = "b-dca",
        entries = {
            { "holmium-ore", "a" }
        },
        should_reorder_entries = true,
    },
    {
        name = "holmium-smelting",
        group = "angels-smelting",
        order = "b-dcb",
        entries = {
            { "holmium-plate", "fb" }
        },
        should_reorder_entries = true,
    },
    {
        name = "lithium-processing",
        group = "angels-smelting",
        order = "b-dda",
    },
    {
        name = "lithium-smelting",
        group = "angels-smelting",
        order = "b-ddb",
    },
}
vgal.subgroup.process_override_subgroups(subgroups)
