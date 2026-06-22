-- make plate icons more angel-like
if not mods["reskins-angels"] then
    data.raw["item"]["tungsten-plate"].icon = "__angelssmeltinggraphics__/graphics/icons/plate-titanium.png"
    data.raw["item"]["tungsten-plate"].icon_size = 32

    data.raw["item"]["holmium-plate"].icon = "__angels_space_age_galore__/graphics/icons/plate-holmium.png"
    data.raw["item"]["holmium-plate"].icon_size = 32

    data.raw["item"]["lithium-plate"].icon = "__angelssmeltinggraphics__/graphics/icons/plate-silver.png"
    data.raw["item"]["lithium-plate"].icon_size = 32
end

-- vgal.icon.set_icons(data.raw["fluid"]["fluorine"], angelsmods.functions.create_gas_fluid_icon(
--     { "__angelspetrochemgraphics__/graphics/icons/molecules/hydrofluoric-acid.png", 72 },
--     "FFF"
-- ))

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
data.raw.recipe["vgal-molten-iron-molten-copper-space-platform-foundation"].icons = vgal.icon.register({
    vgal.icon.get("space-platform-foundation"),
    vgal.icon.get_in("angels-liquid-molten-steel"),
})
data.raw.recipe["vgal-molten-copper-carbon-fiber-low-density-structure"].icons = vgal.icon.register({
    vgal.icon.get("low-density-structure"),
    vgal.icon.get_in("carbon-fiber"),
    vgal.icon.get_in2("angels-liquid-molten-copper"),
})

data.raw.recipe["vgal-petroleum-gas-barrel-biter-egg"].icons = vgal.icon.register({
    vgal.icon.get("biter-egg"),
    vgal.icon.get_in("carbon-dioxide", "molecule"),
})

data.raw.recipe["vgal-ammonia-agricultural-science-pack"].icons = vgal.icon.register({
    vgal.icon.get("agricultural-science-pack"),
    vgal.icon.get_in("urea", "molecule"),
})

data.raw.recipe["vgal-spoilage-crude-oil"].icons = angelsmods.functions.create_liquid_recipe_icon({
    "angels-liquid-multi-phase-oil",
}, { { 100, 100, 100 }, { 171, 161, 055 }, { 127, 163, 109 } }, { "spoilage" })

vgal.icon.clear_icon_data(data.raw["technology"]["angels-bio-refugium-fish-1"])
data.raw["technology"]["angels-bio-refugium-fish-1"].icon = "__space-age__/graphics/technology/fish-breeding.png"
data.raw["technology"]["angels-bio-refugium-fish-1"].icon_size = 256
vgal.icon.clear_icon_data(data.raw["technology"]["angels-bio-refugium-fish-2"])
data.raw["technology"]["angels-bio-refugium-fish-2"].icon = "__space-age__/graphics/technology/fish-breeding.png"
data.raw["technology"]["angels-bio-refugium-fish-2"].icon_size = 256

-- make nutrients icons more galore like
-- also my icon library is not fit for the other way....
-- and I can't use the angels graphics to do asesprite stuff soo....
data.raw.recipe["nutrients-from-spoilage"].icons = vgal.icon.register({
    vgal.icon.get("nutrients"),
    vgal.icon.get_in("spoilage"),
})
data.raw.recipe["nutrients-from-yumako-mash"].icons = vgal.icon.register({
    vgal.icon.get("nutrients"),
    vgal.icon.get_in("yumako-mash"),
})
data.raw.recipe["nutrients-from-bioflux"].icons = vgal.icon.register({
    vgal.icon.get("nutrients"),
    vgal.icon.get_in("bioflux"),
})
data.raw.recipe["vgal-sulfur-ammonia-nutrients"].icons = vgal.icon.register({
    vgal.icon.get("nutrients"),
    vgal.icon.get_in("sulfur"),
})
