if not settings.startup["vgal-disable-ice-productivity"].value == true then return end

vgal.data.extend
{
    {
        type = "recipe",
        name = "water-fluoroketone-cold-ice", -- 1 rocket is 5000 fluid, 1r = 500,000 ice, 1r = 10,000,000 water
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("ice"),
            vgal.icon.get_in("water", "fluid"),
            vgal.icon.get_in2("fluoroketone-cold", "fluid"),
        },
        category = "cryogenics",
        energy_required = 20,
        technology = "cryogenic-plant",
        fluid_ingredients = {
            { "fluoroketone-cold", 15 },
            { "water",             2000 },
        },
        fluid_results = {
            {
                "fluoroketone-hot",
                14,
                -- {
                --     temperature = 180,
                -- },
            },
        },
        results = {
            { "ice", 100 },
        },
        groups = { "vgal-unsure" },
        show_amount_in_title = false,
        allow_productivity = false,
    },
    {
        type = "recipe",
        name = "water-ice",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("ice"),
            vgal.icon.get_in("water", "fluid"),
        },
        category = "chemistry-or-cryogenics",
        energy_required = 20,
        technology = "space-platform",
        fluid_ingredients = {
            { "water", 150 },
        },
        results = {
            { "ice", 5 },
        },
        show_amount_in_title = false,
        allow_productivity = false,
    },
}
