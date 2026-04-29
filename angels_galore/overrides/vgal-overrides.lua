-- trim unsavable recipes.
vgal.data.trim("vgal-petroleum-gas-rocket-fuel")
vgal.data.trim("vgal-plastic-bar-lubricant")
vgal.data.trim("vgal-coal-sulfur")
vgal.data.trim("vgal-steam-sulfur")
vgal.data.trim("vgal-steam-concrete")
vgal.data.trim("vgal-iron-stick-concrete")
vgal.data.trim("vgal-copper-cable-plastic-bar")
vgal.data.trim("vgal-crude-oil-coal")

-- update savable recipes
data.raw["recipe"]["vgal-coal-uranium-235-nuclear-fuel"].order = "j"
data.raw.recipe["vgal-coal-uranium-235-nuclear-fuel"].ingredients = vgal.build.table({
    { "angels-rocket-fuel-capsule", 1 },
    { "uranium-235",                1 },
    { "angels-solid-carbon",        5 },
})

data.raw.recipe["vgal-coal-uranium-235-nuclear-fuel"].icons = vgal.icon.register {
    vgal.icon.get("nuclear-fuel"),
    vgal.icon.get_in("angels-solid-carbon"),
}

data.raw["recipe"]["vgal-steel-plate-iron-stick"].icons = vgal.icon.register {
    vgal.icon.get("iron-stick"),
    vgal.icon.get_in("steel-plate"),
}
