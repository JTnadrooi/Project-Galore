vgal.data.extend
{
    {
        type = "recipe",
        name = "crude-oil-coal",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("crude-oil"),
            vgal.icon.get_overlay("reprocessing"),
        },
        category = "centrifuging",
        energy_required = 6,
        technology = "uranium-processing",
        fluid_ingredients = {
            { "crude-oil", 100 }, -- 50
        },
        results = {
            { "coal", nil, { amount_min = 2, amount_max = 4 } } -- 30
        },
        show_amount_in_title = false,
        -- crafting_machine_tint = {
            
        -- }
    },
}
