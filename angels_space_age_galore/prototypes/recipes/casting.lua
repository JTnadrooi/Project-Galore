vgal.extend({
    {
        name = "vgal-molten-lithium-low-density-structure",
        prefix = "vgal",
        -- icons = vgal.icon.create({
        --     inputs = {}
        -- })
        energy_required = 8,
        technology = "lithium-processing",
        ingredients = {
            { "vgal-molten-lithium", 15 },
            { "angels-solid-carbon", 1 },
            { "plastic-bar",         5 },
            { "angels-solid-sand",   5 },
        },
        results = {
            { "low-density-structure", 1 },
        },
        category = "metallurgy",

        localised_name = { "", { "item-name.low-density-structure" }, " ", { "vgal-internal.casting-postfix" } },
        -- allow_quality = true,
        order = "d[lds]-cb"
    },
}, {
    type = "recipe",
})
