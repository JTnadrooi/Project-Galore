data.raw["item"]["tungsten-plate"].icon = "__angelssmeltinggraphics__/graphics/icons/plate-titanium.png"
data.raw["item"]["tungsten-plate"].icon_size = 32

data.raw["item"]["holmium-plate"].icon = "__angels_space_age_galore__/graphics/icons/plate-holmium.png"
data.raw["item"]["holmium-plate"].icon_size = 32

data.raw["item"]["lithium-plate"].icon = "__angelssmeltinggraphics__/graphics/icons/plate-silver.png"
data.raw["item"]["lithium-plate"].icon_size = 32

data.raw.recipe["molten-iron-from-lava"].icons = vgal.icon.register({
    vgal.icon.get("angels-liquid-molten-iron"),
    vgal.icon.get_in("lava"),
})
data.raw.recipe["molten-copper-from-lava"].icons = vgal.icon.register({
    vgal.icon.get("angels-liquid-molten-copper"),
    vgal.icon.get_in("lava"),
})

data.raw.recipe["casting-low-density-structure"].icons = vgal.icon.register({
    vgal.icon.get("low-density-structure"),
    vgal.icon.get_in("angels-liquid-molten-copper"),
    vgal.icon.get_in("angels-liquid-molten-steel"),
})
data.raw.recipe["vgal-molten-iron-rail"].icons = vgal.icon.register({
    vgal.icon.get("rail"),
    vgal.icon.get_in("angels-liquid-molten-steel"),
})
data.raw.recipe["vgal-molten-copper-carbon-fiber-low-density-structure"].icons = vgal.icon.register({
    vgal.icon.get("low-density-structure"),
    vgal.icon.get_in("carbon-fiber"),
    vgal.icon.get_in2("angels-liquid-molten-copper"),
})
