vgal.data.extend {
    -- region *light-oil-from-wood
    {
        type = "recipe",
        name = "vgal-light-oil-from-wood",
        category = "oil-processing",
        energy_required = 3,
        ingredients = {
            { type = "item",  name = "wood",  amount = 10 },
            { type = "fluid", name = "steam", amount = 20 },
        },
        results = {
            { type = "fluid", name = "light-oil", amount = 40 },
        },
        icons = vgal.icon.register {
            vgal.icon.get("light-oil", "fluid"),
            vgal.icon.get_in("wood"),
        },
        subgroup = data.raw.fluid["light-oil"].subgroup,
        order = data.raw.fluid["light-oil"].order,
        enabled = false
    },
    -- endregion
    -- region *heavy-oil-from-wood
    {
        type = "recipe",
        name = "vgal-heavy-oil-from-wood",
        icons = vgal.icon.register {
            vgal.icon.get("heavy-oil", "fluid"),
            vgal.icon.get_in("wood")
        },
        category = vgal.category.get_category_or_invalid_name("greenhouse"),
        subgroup = data.raw.fluid["heavy-oil"].subgroup,
        order = data.raw.fluid["heavy-oil"].order,
        enabled = false,
        energy_required = 10,
        ingredients = {
            { type = "item", name = "wood", amount = 10 },
        },
        results = {
            { type = "fluid", name = "heavy-oil", amount = 10 },
        },
        result = "wood",
        result_count = 100,
    },
    -- endregion

    -- region *petroleum-gas-from-wood-a-oil
    {
        type = "recipe",
        name = "vgal-petroleum-gas-from-wood-a-oil",
        category = "oil-processing",
        enabled = false,
        energy_required = 4,
        ingredients = {
            { type = "item",  name = "wood",      amount = 8 },
            { type = "fluid", name = "steam",     amount = 25 },
            { type = "fluid", name = "crude-oil", amount = 20 } -- todo: calculator time | update: calculator time finished, see notes
        },
        results = {
            { type = "fluid", name = "petroleum-gas", amount = 40 }
        },
        icons = vgal.icon.register {
            vgal.icon.get("petroleum-gas", "fluid"),
            vgal.icon.get_in("wood"),
        },
        subgroup = data.raw.fluid["petroleum-gas"].subgroup,
        order = data.raw.fluid["petroleum-gas"].order,
    },
    -- endregion
    -- region *petroleum-gas-from-wood-greenhouse
    {
        type = "recipe",
        name = "vgal-petroleum-gas-from-wood-greenhouse",
        category = vgal.category.get_category_or_invalid_name("greenhouse"),
        enabled = false,
        energy_required = 16,
        ingredients = {
            { type = "item", name = "wood",                                            amount = 4 },
            { type = "item", name = vgal.item.get_item_or_invalid_name("wood-pellet"), amount = 1 },
        },
        results = {
            { type = "fluid", name = "petroleum-gas", amount = 20 }
        },
        icons = vgal.icon.register {
            vgal.icon.get("petroleum-gas", "fluid"),
            vgal.icon.get_in(vgal.item.get_item_or_invalid_name("wood-pellet")),
            vgal.icon.get_in2("wood"),
        },
        subgroup = data.raw.fluid["petroleum-gas"].subgroup,
        order = data.raw.fluid["petroleum-gas"].order,
    },
    -- endregion

    -- region *heavy-oil-from-petroleum-gas
    {
        type = "recipe",
        name = "vgal-heavy-oil-from-petroleum-gas",
        category = "oil-processing",
        energy_required = 2,
        ingredients = {
            { type = "item",  name = "coal",          amount = 1 },
            { type = "fluid", name = "petroleum-gas", amount = 20 },
        },
        results = {
            { type = "fluid", name = "heavy-oil", amount = 30 },
        },
        icons = vgal.icon.register {
            vgal.icon.get("heavy-oil", "fluid"),
            vgal.icon.get_in("petroleum-gas", "fluid"),
        },
        subgroup = data.raw.fluid["heavy-oil"].subgroup,
        order = data.raw.fluid["heavy-oil"].order,
        enabled = false
    },
    -- endregion
}
vgal.tech.add_recipe("vgal-biological-oil-processing-2", "vgal-light-oil-from-wood")
vgal.tech.add_recipe("vgal-biological-oil-processing-2", "vgal-heavy-oil-from-wood")

vgal.tech.add_recipe("vgal-biological-oil-processing", "vgal-petroleum-gas-from-wood-a-oil")
vgal.tech.add_recipe("vgal-biological-oil-processing", "vgal-petroleum-gas-from-wood-greenhouse")

vgal.tech.add_recipe("vgal-lesser-coal-liquefaction", "vgal-heavy-oil-from-petroleum-gas")
