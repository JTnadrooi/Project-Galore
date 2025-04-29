data.raw.recipe["iron-ore-processing"].icons = vgal.icon.register({
    vgal.icon.get("processed-iron"),
    vgal.icon.get_in("iron-ore"),
})
data.raw.recipe["copper-ore-processing"].icons = vgal.icon.register({
    vgal.icon.get("processed-copper"),
    vgal.icon.get_in("copper-ore"),
})

data.raw.recipe["garden-cultivating"].icons = vgal.icon.register({
    vgal.icon.get("paste-cellulose"),
    vgal.icon.get_out("temperate-garden"),
    vgal.icon.get_out2("desert-garden"),
    vgal.icon.get_out3("swamp-garden"),
})
