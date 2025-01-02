local function vgal_electroplantify(recipeName)
    recipeName = "vgal-" .. recipeName
    if data.raw["recipe"][recipeName] then
        data.raw["recipe"][recipeName].category = "electronics-or-assembling"
    else
        error(recipeName)
    end
end
local function vgal_foundryfy(recipeName)
    recipeName = "vgal-" .. recipeName
    if data.raw["recipe"][recipeName] then
        data.raw["recipe"][recipeName].category = "metallurgy-or-assembling"
    else
        error(recipeName)
    end
end
local function vgal_cryogenify(recipeName)
    recipeName = "vgal-" .. recipeName
    if data.raw["recipe"][recipeName] then
        data.raw["recipe"][recipeName].category = "chemistry-or-cryogenics"
    else
        error(recipeName)
    end
end

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

vgal_electroplantify("plastic-bar-electronic-circuit")
vgal_electroplantify("plastic-bar-processing-unit")
vgal_electroplantify("sulfuric-acid-advanced-circuit")
vgal_electroplantify("low-density-structure-processing-unit")


vgal_electroplantify("processing-unit-substation")
vgal_electroplantify("processing-unit-beacon")
vgal_electroplantify("advanced-circuit-solar-panel")
vgal_electroplantify("steel-plate-accumulator")
vgal_cryogenify("copper-cable-plastic-bar")
vgal_cryogenify("copper-cable-battery")
