vgal.data.extend({
    {
        name = "sulfuric-acid-angels-solid-carbon",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-solid-carbon"),
            vgal.icon.get_in("sulfuric-acid"),
        },
        energy_required = 1,
        technology = "sulfur-processing",
        fluid_ingredients = {
            { "sulfuric-acid", 5 },
        },
        ingredients = {
            { "angels-solid-coke", 2 },
        },
        fluid_results = {
            { "angels-water-yellow-waste", 5 },
        },
        results = {
            { "angels-solid-carbon", 3 },
        },
        category = "angels-liquifying",
    },
    {
        name = "angels-solid-coke-angels-solid-sodium-hydroxide-angels-solid-carbon",
        prefix = "vgal",
        icons = vgal.icon.register({
            vgal.icon.get("angels-solid-carbon"),
            vgal.icon.get_in("angels-solid-sodium-hydroxide"),
        }),
        energy_required = 2,
        technology = "angels-sodium-processing-1",
        ingredients = {
            { "angels-solid-coke",             3 },
            { "angels-solid-sodium-hydroxide", 1 },
        },
        fluid_ingredients = {
            { "angels-gas-nitrogen", 50 },
        },
        results = {
            { "angels-solid-carbon",           6 },
            { "angels-solid-sodium-carbonate", 1, { allow_productivity = false } },
        },
        fluid_results = {
            { "water", 10, { allow_productivity = false } },
        },
        category = "angels-liquifying",

        order = "ab",
        crafting_machine_tint = angelsmods.functions.get_recipe_tints({
            { r = 1, g = 1, b = 1 },
            "angels-gas-nitrogen",
            "water",
            angelsmods.functions.fluid_color("NaCO3"),
        }),

        show_amount_in_title = false,
    },
}, {
    type = "recipe",
})
