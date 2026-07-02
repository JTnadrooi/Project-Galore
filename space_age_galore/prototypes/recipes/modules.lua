for _, module in pairs(vgal.defines.modules) do
    for tier, tiered_module_name in ipairs(module.tiers) do
        if tier ~= 3 then
            local ingredients = (tier == 2) and {
                { "advanced-circuit",       4 },
                { "processing-unit",        4 },
                { module.unique_ingredient, module.unique_ingredient_amount },
                { module.tiers[1],          4 },
            } or {
                { "advanced-circuit",       3 },
                { "electronic-circuit",     3 },
                { module.unique_ingredient, module.unique_ingredient_amount },
            }

            local energy_required = (tier == 2) and 30 or 15

            vgal.data.extend({
                {
                    name = module.unique_ingredient .. "-" .. tiered_module_name,
                    prefix = "vgal",
                    icons = vgal.icon.register {
                        vgal.icon.get(tiered_module_name),
                        vgal.icon.get_overlay("planet"),
                    },
                    energy_required = energy_required,
                    technology = module.tiers[3],
                    ingredients = ingredients,
                    results = {
                        { tiered_module_name, 1 },
                    },
                    categories = { "crafting", "electromagnetics" },
                },
            }, {
                type = "recipe",
                groups = { "vgal-modules" }
            })

            -- error(module.unique_ingredient .. "-" .. tiered_module_name)
        end
    end
end
