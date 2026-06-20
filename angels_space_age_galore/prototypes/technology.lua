data:extend({
    -- vgal.tech.create_simple("vgal-puffer-atmosphere", { "agricultural-science-pack" }, vgal.icon.register({
    --     vgal.icon.get_placeholder(),
    -- }), { "angels-gas-puffer-atmosphere" }),
    {
        type = "technology",
        name = "vgal-puffer-atmosphere",
        icons = vgal.icon.register({
            vgal.icon.get_placeholder(),
        }),
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "angels-gas-puffer-atmosphere"
            }
        },
        prerequisites = { "agricultural-science-pack", "angels-bio-refugium-puffer-2" },
        unit =
        {
            count = 500,
            ingredients =
            {
                { "automation-science-pack",   1 },
                { "logistic-science-pack",     1 },
                { "chemical-science-pack",     1 },
                { "space-science-pack",        1 },
                { "agricultural-science-pack", 1 },
            },
            time = 60
        },
        upgrade = true
    },
})
