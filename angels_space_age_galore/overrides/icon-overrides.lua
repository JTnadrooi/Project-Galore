-- make plate icons more angel-like
if not mods["reskins-angels"] then
    vgal.icon.set_icons(data.raw["item"]["tungsten-plate"], vgal.icon.get("tungsten-plate"))

    vgal.icon.set_icons(data.raw["item"]["holmium-plate"], vgal.icon.get("holmium-plate"))

    data.raw["item"]["lithium-plate"].icon = "__angelssmeltinggraphics__/graphics/icons/plate-silver.png"
    data.raw["item"]["lithium-plate"].icon_size = 32
end

-- fix electrolyte icon (data in galorelib icons override section)
vgal.icon.set_icons(data.raw["fluid"]["electrolyte"], vgal.icon.get("electrolyte", "fluid"))
vgal.icon.set_icons(data.raw["fluid"]["holmium-solution"], vgal.icon.get("holmium-solution", "fluid"))
vgal.icon.set_icons(data.raw["fluid"]["angels-liquid-tungstic-acid"], vgal.icon.get("angels-liquid-tungstic-acid", "fluid"))

data.raw["fluid"]["angels-liquid-tungstic-acid"].base_color = { r = 80 / 255, g = 30 / 255, b = 105 / 255 }
data.raw["fluid"]["angels-liquid-tungstic-acid"].flow_color = { r = 80 / 255, g = 30 / 255, b = 105 / 255 }

-- vgal.icon.set_icons(data.raw["fluid"]["fluorine"], angelsmods.functions.create_gas_fluid_icon(
--     { "__angelspetrochemgraphics__/graphics/icons/molecules/hydrofluoric-acid.png", 64 },
--     "FFF"
-- ))

data.raw.recipe["molten-iron-from-lava"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-liquid-molten-iron"),
    vgal.icon.get_in("lava"),
})
data.raw.recipe["molten-copper-from-lava"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-liquid-molten-copper"),
    vgal.icon.get_in("lava"),
})

data.raw.recipe["casting-low-density-structure"].icons = vgal.icon.merge_composites({
    vgal.icon.get("low-density-structure"),
    vgal.icon.get_in("angels-liquid-molten-copper"),
    vgal.icon.get_in("angels-liquid-molten-steel"),
})
data.raw.recipe["vgal-molten-iron-rail"].icons = vgal.icon.merge_composites({
    vgal.icon.get("rail"),
    vgal.icon.get_in("angels-liquid-molten-steel"),
})
data.raw.recipe["vgal-molten-iron-molten-copper-space-platform-foundation"].icons = vgal.icon.merge_composites({
    vgal.icon.get("space-platform-foundation"),
    vgal.icon.get_in("angels-liquid-molten-steel"),
})
data.raw.recipe["vgal-molten-copper-carbon-fiber-low-density-structure"].icons = vgal.icon.merge_composites({
    vgal.icon.get("low-density-structure"),
    vgal.icon.get_in("carbon-fiber"),
    vgal.icon.get_in2("angels-liquid-molten-copper"),
})

data.raw.recipe["vgal-petroleum-gas-barrel-biter-egg"].icons = vgal.icon.merge_composites({
    vgal.icon.get("biter-egg"),
    vgal.icon.get_in("angels-gas-carbon-dioxide"),
})

data.raw.recipe["vgal-ammonia-agricultural-science-pack"].icons = vgal.icon.merge_composites({
    vgal.icon.get("agricultural-science-pack"),
    vgal.icon.get_in("angels-gas-urea"),
})

data.raw.recipe["vgal-spoilage-crude-oil"].icons = vgal.icon.create({
    style   = "angels-liquid",
    inputs  = { "spoilage" },
    outputs = { "angels-liquid-multi-phase-oil" },
    palette = { { 100, 100, 100 }, { 171, 161, 055 }, { 127, 163, 109 } },
})

vgal.icon.clear_icon_data(data.raw["technology"]["angels-bio-refugium-fish-1"])
data.raw["technology"]["angels-bio-refugium-fish-1"].icon = "__space-age__/graphics/technology/fish-breeding.png"
data.raw["technology"]["angels-bio-refugium-fish-1"].icon_size = 256
vgal.icon.clear_icon_data(data.raw["technology"]["angels-bio-refugium-fish-2"])
data.raw["technology"]["angels-bio-refugium-fish-2"].icon = "__space-age__/graphics/technology/fish-breeding.png"
data.raw["technology"]["angels-bio-refugium-fish-2"].icon_size = 256

-- make nutrients icons more galore like
-- also my icon library is not fit for the other way....
-- and I can't use the angels graphics to do asesprite stuff soo....
data.raw.recipe["nutrients-from-spoilage"].icons = vgal.icon.merge_composites({
    vgal.icon.get("nutrients"),
    vgal.icon.get_in("spoilage"),
})
data.raw.recipe["nutrients-from-yumako-mash"].icons = vgal.icon.merge_composites({
    vgal.icon.get("nutrients"),
    vgal.icon.get_in("yumako-mash"),
})
data.raw.recipe["nutrients-from-bioflux"].icons = vgal.icon.merge_composites({
    vgal.icon.get("nutrients"),
    vgal.icon.get_in("bioflux"),
})
data.raw.recipe["vgal-sulfur-ammonia-nutrients"].icons = vgal.icon.merge_composites({
    vgal.icon.get("nutrients"),
    vgal.icon.get_in("sulfur"),
})

-- vgal.recipe.set_icons("angels-solid-tungsten-oxide", vgal.icon.create({
--     -- inputs = { "tungsten-ore" },
--     outputs = { "angels-solid-tungsten-oxide" },
-- }))

vgal.recipe.set_icons("angels-solid-tungsten-oxide-2", vgal.icon.create({
    inputs = { "angels-solid-ammonium-paratungstate" },
    outputs = { "angels-solid-tungsten-oxide" },
}))

vgal.recipe.set_icons("angels-solid-ammonium-paratungstate-2", vgal.icon.create({
    inputs = { "angels-liquid-tungstic-acid" },
    outputs = { "angels-solid-ammonium-paratungstate" },
}))

-- vgal.recipe.set_icons("angels-solid-ammonium-paratungstate", vgal.icon.create({
--     -- inputs = { "angels-processed-tungsten" },
--     outputs = { "angels-solid-ammonium-paratungstate" },
-- }))
vgal.recipe.clear_icons("angels-solid-tungsten-oxide")
data.raw["recipe"]["angels-solid-tungsten-oxide"].main_product = "angels-solid-tungsten-oxide"
vgal.recipe.clear_icons("angels-solid-ammonium-paratungstate")
data.raw["recipe"]["angels-solid-ammonium-paratungstate"].main_product = "angels-solid-ammonium-paratungstate"

vgal.recipe.set_icons("angels-liquid-tungstic-acid", vgal.icon.create({
    style = "angels-liquid",
    outputs = { "angels-liquid-tungstic-acid" },
    palette = { { 075, 026, 102 }, { 170, 170, 180 }, { 170, 170, 180 } }
}))
