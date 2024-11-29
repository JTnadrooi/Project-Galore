vgal.data.extend(
    {
        -- region *sulfuric-copper-cable
        {
            type = "recipe",
            name = "vgal-sulfuric-copper-cable",
            enabled = false,
            icons = vgal.icon.register {
                vgal.icon.get("copper-cable"),
                vgal.icon.get_in("sulfuric-acid", "fluid"),
            },
            energy_required = 1,
            ingredients = {
                { type = "fluid", name = "sulfuric-acid", amount = 20 },
                { type = "item",  name = "copper-plate",  amount = 3 }
            },
            results = {
                { type = "item", name = "copper-cable", amount = 12 }, -- 3ec
                { type = "item", name = "copper-ore",   amount = 1 }
            },
            category = "crafting-with-fluid",
            main_product = "copper-cable",
        },
        -- endregion
        -- region *sulfuric-iron-stick
        {
            type = "recipe",
            name = "vgal-sulfuric-iron-stick",
            enabled = false,
            icons = vgal.icon.register {
                vgal.icon.get("iron-stick"),
                vgal.icon.get_in("sulfuric-acid", "fluid"),
            },
            energy_required = 1,
            ingredients = {
                { type = "fluid", name = "sulfuric-acid", amount = 20 },
                { type = "item",  name = "iron-plate",    amount = 3 }
            },
            results = {
                { type = "item", name = "iron-stick", amount = 12 }, -- ~3ec
                { type = "item", name = "iron-ore",   amount = 1 }
            },
            category = "crafting-with-fluid",
            main_product = "iron-stick",
        },
        -- endregion
        -- region *sulfuric-iron-gear-wheel
        {
            type = "recipe",
            name = "vgal-sulfuric-iron-gear-wheel",
            enabled = false,
            icons = vgal.icon.register {
                vgal.icon.get("iron-gear-wheel"),
                vgal.icon.get_in("sulfuric-acid", "fluid"),
            },
            energy_required = 1,
            ingredients = {
                { type = "fluid", name = "sulfuric-acid", amount = 20 },
                { type = "item",  name = "iron-plate",    amount = 5 }
            },
            results = {
                { type = "item", name = "iron-gear-wheel", amount = 6 }, -- ~3ec
                { type = "item", name = "iron-ore",        amount = 1 }
            },
            category = "crafting-with-fluid",
            main_product = "iron-gear-wheel",
        },
        -- endregion

        -- region *lubricated-iron-gear-wheel
        {
            type = "recipe",
            name = "vgal-lubricated-iron-gear-wheel",
            enabled = false,
            icons = vgal.icon.register {
                vgal.icon.get("iron-gear-wheel"),
                vgal.icon.get_in("lubricant", "fluid"),
            },
            energy_required = 3,
            ingredients = {
                { type = "item",  name = "iron-plate", amount = 6 },
                { type = "fluid", name = "lubricant",  amount = 20 }
            },
            results = {
                { type = "item", name = "iron-gear-wheel", amount = 6 } -- 2ec
            },
            category = "crafting-with-fluid"
        },
        -- endregion
        -- region *lubricated-iron-stick
        {
            type = "recipe",
            name = "vgal-lubricated-iron-stick",
            enabled = false,
            icons = vgal.icon.register {
                vgal.icon.get("iron-stick"),
                vgal.icon.get_in("lubricant", "fluid"),
            },
            energy_required = 3,
            ingredients = {
                { type = "item",  name = "iron-plate", amount = 3 },
                { type = "fluid", name = "lubricant",  amount = 20 }
            },
            results = {
                { type = "item", name = "iron-stick", amount = 12 } -- 2ec
            },
            category = "crafting-with-fluid"
        },
        -- endregion

        -- region *low-density-structure-from-plastic-bar
        {
            type = "recipe",
            name = "vgal-low-density-structure-from-plastic-bar",
            icons = vgal.icon.register {
                vgal.icon.get("low-density-structure"),
                vgal.icon.get_in("plastic-bar"),
            },
            category = "crafting",
            energy_required = 24,
            enabled = false,
            ingredients = {
                { "steel-plate", 6 },
                { "plastic-bar", 40 }
            },
            result = "low-density-structure",
            result_count = 2
        },
        -- endregion

        -- region *flying-robot-frame-from-sulfuric-acid
        {
            type = "recipe",
            name = "vgal-flying-robot-frame-from-sulfuric-acid",
            icons = vgal.icon.register {
                vgal.icon.get("flying-robot-frame"),
                vgal.icon.get_in("sulfuric-acid", "fluid"),
            },
            energy_required = 40,
            category = "crafting-with-fluid",
            ingredients = {
                { "electric-engine-unit", 2 },
                { "battery",              4 },
                { "iron-plate",           8 },
                { "electronic-circuit",   5 },
                { type = "fluid",         name = "sulfuric-acid", amount = 40 }
            },
            result = "flying-robot-frame",
            result_count = 2,
            enabled = false
        },
        -- endregion
        -- region *flying-robot-frame-from-advanced-circuit
        {
            type = "recipe",
            name = "vgal-flying-robot-frame-from-advanced-circuit",
            icons = vgal.icon.register {
                vgal.icon.get("flying-robot-frame"),
                vgal.icon.get_in("advanced-circuit"),
            },
            energy_required = 40,
            category = "crafting",
            ingredients = {
                { "battery",          1 },
                { "speed-module",     1 },
                { "advanced-circuit", 2 },
            },
            result = "flying-robot-frame",
            result_count = 2,
            enabled = false
        },
        -- endregion

        -- region *repair-pack-from-plastic-bar
        {
            type = "recipe",
            name = "vgal-repair-pack-from-plastic-bar",
            icons = vgal.icon.register {
                vgal.icon.get("repair-pack", "repair-tool"),
                vgal.icon.get_in("plastic-bar"),
            },
            enabled = false,
            energy_required = 2,
            ingredients = {
                { "electronic-circuit", 2 },
                { "plastic-bar",        4 }
            },
            result = "repair-pack",
            result_count = 2
        },
        -- endregion
    }
)
vgal.tech.add_recipe("vgal-sulfuric-intermediates", "vgal-sulfuric-copper-cable")
vgal.tech.add_recipe("vgal-sulfuric-intermediates", "vgal-sulfuric-iron-stick")
vgal.tech.add_recipe("vgal-sulfuric-intermediates", "vgal-sulfuric-iron-gear-wheel")

vgal.tech.add_recipe("plastics", "vgal-repair-pack-from-plastic-bar")

vgal.tech.add_recipe("low-density-structure", "vgal-low-density-structure-from-plastic-bar")

vgal.tech.add_recipe("vgal-lubricated-intermediates", "vgal-lubricated-iron-gear-wheel")
vgal.tech.add_recipe("vgal-lubricated-intermediates", "vgal-lubricated-iron-stick")

vgal.tech.add_recipe("vgal-alternative-robotics", "vgal-flying-robot-frame-from-sulfuric-acid")
vgal.tech.add_recipe("vgal-alternative-robotics", "vgal-flying-robot-frame-from-advanced-circuit")
