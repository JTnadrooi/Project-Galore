vgal.data.trim("vgal-petroleum-gas-rocket-fuel")
vgal.data.trim("vgal-plastic-bar-lubricant")

data.raw["recipe"]["vgal-coal-uranium-235-nuclear-fuel"].order = "j"
data.raw.recipe["vgal-coal-uranium-235-nuclear-fuel"].ingredients = vgal.build.table({
    { "rocket-fuel",  1 },
    { "uranium-235",  1 },
    { "solid-carbon", 5 },
})
data.raw.recipe["vgal-coal-uranium-235-nuclear-fuel"].icons = vgal.icon.register {
    vgal.icon.get("nuclear-fuel"),
    vgal.icon.get_in("solid-carbon"),
}
data.raw.recipe["vgal-copper-cable-plastic-bar"].ingredients = vgal.build.table({
    { "copper-cable", 5 },
}, {
    { "liquid-plastic", 30 },
})
data.raw.recipe["vgal-copper-cable-plastic-bar"].results = vgal.build.table({
    { "plastic-bar", 5 },
})
data.raw.recipe["vgal-copper-cable-plastic-bar"].energy_required = 5
data.raw.recipe["vgal-copper-cable-plastic-bar"].category = "crafting-with-fluid"
data.raw.recipe["vgal-copper-cable-plastic-bar"].allow_productivity = false

data.raw["recipe"]["vgal-steel-plate-iron-stick"].icons = vgal.icon.register {
    vgal.icon.get("iron-stick"),
    vgal.icon.get_in("steel-plate"),
}
-- data.raw["recipe"]["vgal-heavy-oil-rail"].icons = vgal.icon.register {
--     vgal.icon.get("rail"),
--     vgal.icon.get_in("liquid-naphtha"),
-- }

-- vgal.data.trim()

-- data.raw["item"]["plastic-bar"].order = "j"
-- vgal.subgroup.restore("plastic-bar", true)
