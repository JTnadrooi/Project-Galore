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
        name = "holmium",
        group = "angels-smelting",
        order = "b-db",
    },
}

vgal.subgroup.process_override_subgroups(subgroups)
