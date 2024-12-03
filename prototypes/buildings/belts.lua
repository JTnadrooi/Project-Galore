data:extend {
    {
        type = "recipe",
        name = "vgal-steel-express-transport-belt",
        enabled = false,
        icons = vgal.icon.register {
            vgal.icon.get("express-transport-belt"),
            vgal.icon.get_in("steel-plate"),
        },
        energy_required = 0.5,
        ingredients = {
            {type = "item", name = "steel-plate", amount = 3},
            {type = "fluid", name = "lubricant", amount = 20},
            {type = "item", name = "fast-transport-belt", amount = 1}
        },
        results = {
            {type = "item", name = "express-transport-belt", amount = 1}
        },
        category = "crafting-with-fluid",
        subgroup = data.raw.item["express-transport-belt"].subgroup,
        order = data.raw.item["express-transport-belt"].order
    },
    {
        type = "recipe",
        name = "vgal-steel-express-splitter",
        enabled = false,
        icons = vgal.icon.register {
            vgal.icon.get("express-splitter"),
            vgal.icon.get_in("steel-plate"),
        },
        energy_required = 2,
        ingredients = {
            {type = "item", name = "steel-plate", amount = 2},
            {type = "item", name = "express-transport-belt", amount = 4},
            {type = "fluid", name = "lubricant", amount = 20},
            {type = "item", name = "advanced-circuit", amount = 10}
        },
        results = {
            {type = "item", name = "express-splitter", amount = 1}
        },
        category = "crafting-with-fluid",
        subgroup = data.raw.item["express-splitter"].subgroup,
        order = data.raw.item["express-splitter"].order
    },
    {
        type = "recipe",
        name = "vgal-steel-express-underground-belt",
        enabled = false,
        icons = vgal.icon.register {
            vgal.icon.get("express-underground-belt"),
            vgal.icon.get_in("steel-plate"),
        },
        energy_required = 2,
        ingredients = {
            {type = "item", name = "steel-plate", amount = 10},
            {type = "item", name = "express-transport-belt", amount = 10},
            {type = "fluid", name = "lubricant", amount = 40}
        },
        results = {
            {type = "item", name = "express-underground-belt", amount = 2}
        },
        category = "crafting-with-fluid",
        subgroup = data.raw.item["express-underground-belt"].subgroup,
        order = data.raw.item["express-underground-belt"].order
    },
    {
        type = "recipe",
        name = "vgal-sulfuric-transport-belt",
        enabled = false,
        icons = vgal.icon.register {
            vgal.icon.get("transport-belt"),
            vgal.icon.get_in("sulfuric-acid", "fluid"),
        },
        energy_required = 8,
        ingredients = {
            {type = "fluid", name = "sulfuric-acid", amount = 40},
            {type = "item", name = "steel-plate", amount = 1},
            {type = "item", name = "iron-gear-wheel", amount = 5}
        },
        results = {
            {type = "item", name = "transport-belt", amount = 12},
            {type = "item", name = "iron-ore", amount = 1}
        },
        category = "crafting-with-fluid",
        subgroup = data.raw.item["transport-belt"].subgroup,
        order = data.raw.item["transport-belt"].order
    },
    {
        type = "recipe",
        name = "vgal-sulfuric-fast-transport-belt",
        enabled = false,
        icons = vgal.icon.register {
            vgal.icon.get("fast-transport-belt"),
            vgal.icon.get_in("sulfuric-acid", "fluid"),
        },
        energy_required = 4,
        ingredients = {
            {type = "fluid", name = "sulfuric-acid", amount = 40},
            {type = "item", name = "steel-plate", amount = 2},
            {type = "item", name = "transport-belt", amount = 4},
            {type = "item", name = "iron-gear-wheel", amount = 10}
        },
        results = {
            {type = "item", name = "fast-transport-belt", amount = 4},
            {type = "item", name = "iron-ore", amount = 1}
        },
        category = "crafting-with-fluid",
        subgroup = data.raw.item["fast-transport-belt"].subgroup,
        order = data.raw.item["fast-transport-belt"].order
    },
    {
        type = "recipe",
        name = "vgal-steel-transport-belt",
        enabled = false,
        icons = vgal.icon.register {
                vgal.icon.get("transport-belt"),
                vgal.icon.get_in("steel-plate")
        },
        energy_required = 6,
        ingredients = {
            {type = "item", name = "steel-plate", amount = 1},
            {type = "item", name = "iron-gear-wheel", amount = 6}
        },
        results = {
            {type = "item", name = "transport-belt", amount = 12}
        },
        category = "crafting"
    },
    {
        type = "recipe",
        name = "vgal-steel-underground-belt",
        enabled = false,
        icons = vgal.icon.register {
                vgal.icon.get("underground-belt"),
                vgal.icon.get_in("steel-plate")
        },
        energy_required = 3,
        ingredients = {
            {type = "item", name = "steel-plate", amount = 2},
            {type = "item", name = "transport-belt", amount = 3},
        },
        results = {
            {type = "item", name = "underground-belt", amount = 2}
        },
        category = "crafting"
    },
    {
        type = "recipe",
        name = "vgal-steel-splitter",
        enabled = false,
        icons = vgal.icon.register {
            vgal.icon.get("splitter"),
            vgal.icon.get_in("steel-plate"),
        },
        energy_required = 1,
        ingredients = {
            {type = "item", name = "steel-plate", amount = 1},
            {type = "item", name = "electronic-circuit", amount = 5},
            {type = "item", name = "transport-belt", amount = 2},
        },
        results = {
            {type = "item", name = "splitter", amount = 1}
        },
        category = "crafting",
        subgroup = data.raw.item["splitter"].subgroup,
        order = data.raw.item["splitter"].order
    },
    {
        type = "recipe",
        name = "vgal-steel-fast-splitter",
        enabled = false,
        icons = vgal.icon.register {
            vgal.icon.get("fast-splitter"),
            vgal.icon.get_in("steel-plate"),
        },
        energy_required = 2,
        ingredients = {
            {type = "item", name = "steel-plate", amount = 2},
            {type = "item", name = "electronic-circuit", amount = 6},
            {type = "item", name = "fast-transport-belt", amount = 4}
        },
        results = {
            {type = "item", name = "fast-splitter", amount = 1}
        },
        category = "crafting",
        subgroup = data.raw.item["fast-splitter"].subgroup,
        order = data.raw.item["fast-splitter"].order
    },
    {
        type = "recipe",
        name = "vgal-steel-fast-transport-belt",
        enabled = false,
        icons = vgal.icon.register {
            vgal.icon.get("fast-transport-belt"),
            vgal.icon.get_in("steel-plate"),
        },
        energy_required = 2,
        ingredients = {
            {type = "item", name = "steel-plate", amount = 8},
            {type = "item", name = "transport-belt", amount = 5},
        },
        results = {
            {type = "item", name = "fast-transport-belt", amount = 5}
        },
        category = "crafting",
        subgroup = data.raw.item["fast-transport-belt"].subgroup,
        order = data.raw.item["fast-transport-belt"].order
    },
    {
        type = "recipe",
        name = "vgal-steel-fast-underground-belt",
        enabled = false,
        icons = vgal.icon.register {
            vgal.icon.get("fast-underground-belt"),
            vgal.icon.get_in("steel-plate"),
        },
        energy_required = 2,
        ingredients = {
            {type = "item", name = "steel-plate", amount = 10},
            {type = "item", name = "fast-transport-belt", amount = 5}
        },
        results = {
            {type = "item", name = "fast-underground-belt", amount = 2}
        },
        category = "crafting",
        subgroup = data.raw.item["fast-underground-belt"].subgroup,
        order = data.raw.item["fast-underground-belt"].order
    },
    {
        type = "recipe",
        name = "vgal-plastic-transport-belt",
        enabled = false,
        icons = vgal.icon.register {
            vgal.icon.get("transport-belt"),
            vgal.icon.get_in("plastic-bar"),
        },
        ingredients = {
            {"plastic-bar", 2},
            {"iron-gear-wheel", 1}
        },
        result = "transport-belt",
        result_count = 4
    },
    {
        type = "recipe",
        name = "vgal-plastic-fast-transport-belt",
        enabled = false,
        icons = vgal.icon.register {
            vgal.icon.get("fast-transport-belt"),
            vgal.icon.get_in("plastic-bar"),
        },
        energy_required = 1,
        ingredients = {
            {"iron-gear-wheel", 5},
            {"transport-belt", 2},
            {"plastic-bar", 8}
        },
        result = "fast-transport-belt",
        result_count = 2
    },
    {
        type = "recipe",
        name = "vgal-plastic-express-transport-belt",
        icons = vgal.icon.register {
            vgal.icon.get("express-transport-belt"),
            vgal.icon.get_in("plastic-bar"),
        },
        category = "crafting-with-fluid",
        enabled = false,
        energy_required = 2,
        ingredients = {
            {"iron-gear-wheel", 10},
            {"fast-transport-belt", 2},
            {type = "fluid", name = "lubricant", amount = 30},
            {"plastic-bar", 10}
        },
        result = "express-transport-belt",
        result_count = 2
    },
}
vgal.tech.add_recipe("plastics", "vgal-plastic-transport-belt")
vgal.tech.add_recipe("vgal-alternative-logistics-2", "vgal-plastic-fast-transport-belt")
vgal.tech.add_recipe("vgal-alternative-logistics-3", "vgal-plastic-express-transport-belt")
vgal.tech.add_recipe("vgal-sulfuric-alternative-logistics", "vgal-sulfuric-transport-belt")
vgal.tech.add_recipe("vgal-sulfuric-alternative-logistics-2", "vgal-sulfuric-fast-transport-belt")
vgal.tech.add_recipe("vgal-alternative-logistics-2", "vgal-steel-fast-splitter")
vgal.tech.add_recipe("vgal-alternative-logistics-2", "vgal-steel-fast-transport-belt")
vgal.tech.add_recipe("vgal-alternative-logistics-2", "vgal-steel-fast-underground-belt")
vgal.tech.add_recipe("vgal-alternative-logistics-3", "vgal-steel-express-splitter")
vgal.tech.add_recipe("vgal-alternative-logistics-3", "vgal-steel-express-transport-belt")
vgal.tech.add_recipe("vgal-alternative-logistics-3", "vgal-steel-express-underground-belt")
vgal.tech.add_recipe("vgal-alternative-logistics", "vgal-steel-splitter")
vgal.tech.add_recipe("vgal-alternative-logistics", "vgal-steel-transport-belt")
vgal.tech.add_recipe("vgal-alternative-logistics", "vgal-steel-underground-belt")
