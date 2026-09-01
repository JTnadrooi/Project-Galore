for _, environment in pairs(vgal.defines.environments) do
    local coal_filter_seeds_ingredients = { { type = "item", name = "angels-filter-coal", amount = 1 } }

    local coal_filter_seeds_results = {}
    for _, seed in ipairs(environment.seeds) do
        local seed = vgal.defines.seeds[seed]
        table.insert(coal_filter_seeds_results,
            { type = "item", name = (seed.dormant or seed.name), amount = 1, independent_probability = (0.2 - seed.tier * 0.05) } --[[@as data.ItemProductPrototype]]
        )
    end
    table.insert(coal_filter_seeds_results,
        { type = "item", name = "angels-filter-frame", amount = 1, ignored_by_productivity = 1 } --[[@as data.ItemProductPrototype]]
    )

    local alt_seeds_icons = angelsmods.functions.create_gas_recipe_icon(
        {
            environment.seeds[1],
            environment.seeds[2],
            environment.seeds[3],
        },
        { { 180, 180, 225 }, { 150, 150, 187 }, { 120, 120, 150 } },
        {
            environment.seeds[4],
            environment.seeds[5],
        }
    )

    vgal.data.extend({
        {
            name = environment.name .. "-seeds",
            prefix = "vgal",
            icons = alt_seeds_icons,
            energy_required = 300,
            technology = "angels-gardens",
            raw_ingredients = coal_filter_seeds_ingredients,
            raw_results = coal_filter_seeds_results,
            show_amount_in_title = false,
            order = "a[from-coal-filter]-" .. environment.order,
            allow_productivity = false,
            subgroup = "angels-farming-gardens",
            category = "angels-petrochem-air-filtering",
        }
    }, {
        type = "recipe",
    })

    -- local ceramic_filter_seed_recipe = table.deepcopy(data.raw["recipe"]["vgal-".. environment])
end
