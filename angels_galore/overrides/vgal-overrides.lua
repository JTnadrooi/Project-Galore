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
    { "liquid-plastic", 35 },
})

vgal.subgroup.clean("solid-plastic")
-- data.raw["item"]["plastic-bar"].order = "j"
-- vgal.subgroup.restore("plastic-bar", true)
