data.raw.recipe["vgal-flying-robot-frame-rocket-part"].ingredients = vgal.build.table({
    { "flying-robot-frame", 1 }, -- 405
    { "processing-unit",    1 }, -- 710
    { "battery",            4 }, -- 200
})
data.raw.recipe["vgal-engine-unit-rocket-part"].ingredients = vgal.build.table({
    { "engine-unit",     4 }, -- 360
    { "rocket-fuel",     2 }, -- 220
    { "processing-unit", 1 }, -- 710
})
data.raw.recipe["vgal-heavy-oil-rocket-fuel"].energy_required = 30
vgal.data.trim("vgal-solar-panel-rocket-part")
vgal.data.trim("vgal-uranium-fuel-cell-rocket-part")
vgal.data.trim("vgal-processing-unit-artillery-turret")
