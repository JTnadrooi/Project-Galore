vgal.data.extend
{
    -- region *plastic-bar-low-density-structure
    {
        name = "plastic-bar-low-density-structure",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("low-density-structure"),
            vgal.icon.get_in("plastic-bar"),
        },
        category = "crafting",
        energy_required = 24,
        technology = "low-density-structure",
        ingredients = {
            { "steel-plate", 6 },
            { "plastic-bar", 40 }
        },
        results = {
            { "low-density-structure", 2 },
        },
    },
    -- endregion
    -- region *advanced-circuit-flying-robot-frame
    {
        
        name = "advanced-circuit-flying-robot-frame", -- ISSUE #10
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("flying-robot-frame"),
            vgal.icon.get_in("advanced-circuit"),
        },
        energy_required = 40,
        technology = "robotics", 
        category = "crafting",
        ingredients = {
            { "battery",          1 },
            { "speed-module",     1 },
            { "advanced-circuit", 2 },
        },
        results = {
            { "flying-robot-frame", 2 },
        },
    },
    -- endregion
    -- region *plastic-bar-repair-pack
    {
        
        name = "plastic-bar-repair-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("repair-pack", "repair-tool"),
            vgal.icon.get_in("plastic-bar"),
        },
        technology = "plastics",
        energy_required = 2,
        ingredients = {
            { "electronic-circuit", 2 },
            { "plastic-bar",        4 }
        },
        results = {
            { "repair-pack", 2 },
        },
    },
    -- endregion
    -- region *copper-plate-copper-wire
    {
        name = "copper-plate-copper-wire",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("copper-wire"),
            vgal.icon.get_in("copper-plate"),
        },
        technology = "advanced-material-processing",
        energy_required = 2,
        ingredients = {
            { "copper-plate", 2 },
        },
        results = {
            { "copper-wire", 6 },
        },
        category = "smelting",
    },
    -- endregion
    -- region *steam-engine-engine-unit
    {
        name = "steam-engine-engine-unit",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("engine-unit"),
            vgal.icon.get_in("steam-engine"),
        },
        technology = "engine",
        energy_required = 40,
        ingredients = {
            { "steam-engine", 1 },
            { "steel-plate",  2 }
        },
        results = {
            { "engine-unit", 4 },
        },
    },
    -- endregion
    -- region *steel-plate-uranium-fuel-cell
    {
        name = "steel-plate-uranium-fuel-cell",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("uranium-fuel-cell"),
            vgal.icon.get_in("sulfuric-acid", "fluid"),
            vgal.icon.get_in2("steel-plate"),
        },
        technology = "nuclear-power",
        ingredients = {
            { "steel-plate",  2 },
            { "uranium-235",  1 },
            { "uranium-238",  25 },
        },
        fluid_ingredients = {
            {"sulfuric-acid", 20},
        },
        results = {
            { "uranium-fuel-cell", 15 },
        },
        energy_required = 12,
        category = "crafting-with-fluid",
    },
    -- endregion
}
