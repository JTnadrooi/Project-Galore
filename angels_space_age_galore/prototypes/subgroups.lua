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
        name = "biter-egg",
        group = "angels-bio-processing-alien",
        order = "c",
        recipe_entries = {
            "biter-egg",
            "vgal-nutrients-biter-egg",
            "vgal-petroleum-gas-barrel-biter-egg",
        },
        should_reorder_entries = true,
    },
}

vgal.subgroup.process_override_subgroups(subgroups)
