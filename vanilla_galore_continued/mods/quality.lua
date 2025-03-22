if not mods["quality"] then return end

vgal.data.extend({
    {
        name = "quality-module-chemical-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("chemical-science-pack"),
            vgal.icon.get_in("quality-module"),
        },
        category = "crafting",
        energy_required = 36,
        technology = { "chemical-science-pack", "quality-module", "battery" },
        ingredients = {
            { "quality-module", 1 },
            { "battery",        2 }
        },
        results = {
            { "chemical-science-pack", 3 },
        },
    },
}, {
    type = "recipe",
    groups = { "vgal-science-packs" },
})
