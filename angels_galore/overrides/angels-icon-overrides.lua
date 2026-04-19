data.raw.recipe["angels-garden-cultivating"].icons = vgal.icon.register({
    vgal.icon.get("angels-paste-cellulose"),
    vgal.icon.get_out("angels-temperate-garden"),
    vgal.icon.get_out2("angels-desert-garden"),
    vgal.icon.get_out3("angels-swamp-garden"),
})

data.raw.recipe["angels-solid-soil"].icons = vgal.icon.register({
    vgal.icon.get("angels-solid-soil"),
    -- vgal.icon.get_in("angels-solid-mud"),
})

data.raw.recipe["angels-solid-soil-alternative"].icons = vgal.icon.register({
    vgal.icon.get("angels-solid-soil"),
    vgal.icon.get_in("angels-solid-sand"),
})

for _, metal in pairs(vgal.defines.metals) do
    data.raw["recipe"][metal.angels_plate_recipe_name].icons = vgal.icon.register({
        vgal.icon.get(metal.plate),
    })
    data.raw["recipe"][metal.plate].icons = vgal.icon.register({
        vgal.icon.get(metal.plate),
        vgal.icon.get_in(metal.base_ore),
    })
    data.raw.recipe[metal.processed].icons = vgal.icon.register({
        vgal.icon.get(metal.processed),
    })
end

data.raw["recipe"]["copper-cable"].icons = vgal.icon.register({
    vgal.icon.get("copper-cable"),
    vgal.icon.get_in("copper-plate"),
})

data.raw["recipe"]["angels-plate-steel"].icons = vgal.icon.register({
    vgal.icon.get("steel-plate"),
    vgal.icon.get_in("angels-liquid-molten-steel"),
})

data.raw["recipe"]["angels-stone-crushed"].icons = vgal.icon.register({
    vgal.icon.get("angels-stone-crushed"),
})
