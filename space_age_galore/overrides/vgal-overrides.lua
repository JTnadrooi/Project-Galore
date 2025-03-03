local function vgal_electroplantify(recipeName)
    recipeName = "vgal-" .. recipeName
    if data.raw["recipe"][recipeName] then
        data.raw["recipe"][recipeName].category = "electronics"
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
local function vgal_organicify(recipeName)
    recipeName = "vgal-" .. recipeName
    if data.raw["recipe"][recipeName] then
        data.raw["recipe"][recipeName].category = "organic-or-assembling"
    else
        error(recipeName)
    end
end
local function vgal_organicify_chem(recipeName)
    recipeName = "vgal-" .. recipeName
    if data.raw["recipe"][recipeName] then
        data.raw["recipe"][recipeName].category = "organic-or-chemistry"
    else
        error(recipeName)
    end
end
data.raw.recipe["vgal-flying-robot-frame-rocket-part"].ingredients = vgal.build.table({
    { "flying-robot-frame", 1 }, -- 405
    { "processing-unit",    1 }, -- 710
    { "battery",            2 }, -- 100
})
data.raw.recipe["vgal-engine-unit-rocket-part"].ingredients = vgal.build.table({
    { "engine-unit",     4 }, -- 360
    { "rocket-fuel",     2 }, -- 220
    { "processing-unit", 1 }, -- 710
})
data.raw.recipe["vgal-uranium-fuel-cell-rocket-part"].ingredients = vgal.build.table({
    { "low-density-structure", 1 }, --
    { "uranium-fuel-cell",     1 }, --
    { "processing-unit",       1 }, --
})
data.raw.recipe["vgal-coal-uranium-235-nuclear-fuel"].ingredients = vgal.build.table({
    { "rocket-fuel", 1 },
    { "uranium-235", 1 },
    { "carbon",      5 },
})
data.raw.recipe["vgal-coal-uranium-235-nuclear-fuel"].icons = vgal.icon.register {
    vgal.icon.get("nuclear-fuel"),
    vgal.icon.get_in("carbon"),
}
data.raw.recipe["vgal-heavy-oil-rocket-fuel"].energy_required = 30

vgal.data.trim("vgal-processing-unit-artillery-turret")
vgal.data.trim("vgal-steam-concrete")
-- vgal.recipe.deep_hide("vgal-processing-unit-artillery-turret")
-- vgal.recipe.deep_hide("vgal-steam-concrete")

vgal.data.trim("vgal-water-copper-ore")
vgal.data.trim("vgal-water-electric-engine-unit-copper-ore")
vgal.data.trim("vgal-water-iron-ore")
vgal.data.trim("vgal-water-electric-engine-unit-iron-ore")

vgal_electroplantify("plastic-bar-electronic-circuit")
vgal_electroplantify("plastic-bar-processing-unit")
vgal_electroplantify("sulfuric-acid-processing-unit")
vgal_electroplantify("sulfuric-acid-advanced-circuit")
vgal_electroplantify("low-density-structure-processing-unit")

vgal_electroplantify("processing-unit-substation")
vgal_electroplantify("processing-unit-beacon")
vgal_electroplantify("advanced-circuit-solar-panel")
vgal_electroplantify("steel-plate-accumulator")

vgal_cryogenify("copper-cable-plastic-bar")
vgal_cryogenify("copper-cable-battery")
vgal_cryogenify("coal-sulfur")
vgal_cryogenify("steam-sulfur")

vgal_organicify("petroleum-gas-rocket-fuel")

vgal_organicify_chem("petroleum-gas-coal-heavy-oil")
vgal_organicify_chem("steam-heavy-oil-light-oil")
vgal_organicify_chem("steam-light-oil-petroleum-gas")

data.raw["recipe"]["vgal-low-density-structure-engine-unit"].category = "pressing"
data.raw["recipe"]["vgal-low-density-structure-barrel"].category = "pressing"

local valid_suffixes = {
    "transport-belt",
    "splitter",
    "underground-belt"
}

for _, recipe in pairs(data.raw["recipe"]) do
    if recipe.name and recipe.name:sub(1, #("vgal-")) == "vgal-" then
        for _, suffix in ipairs(valid_suffixes) do
            if recipe.name:sub(- #suffix) == suffix then
                recipe.category = "pressing"
                break
            end
        end
    end
end

-- data.raw["recipe"]["steam-advanced-oil-processing"].surface_conditions =
-- {
--     {
--         property = "pressure",
--         min = 0,
--         max = 2000
--     }
-- }
-- data.raw["recipe"]["steam-heavy-oil-light-oil"].surface_conditions =
-- {
--     {
--         property = "pressure",
--         min = 0,
--         max = 2000
--     }
-- }
-- data.raw["recipe"]["steam-light-oil-petroleum-gas"].surface_conditions =
-- {
--     {
--         property = "pressure",
--         min = 0,
--         max = 2000
--     }
-- }
if settings.startup["vgal-high-temp-oil-processing-surface-conditions"].value then
    local steam_oil_surface_conditions = {
        {
            property = "gravity",
            min = 8,
            max = 20
        }
    }
    data.raw["recipe"]["vgal-steam-advanced-oil-processing"].surface_conditions = steam_oil_surface_conditions
    data.raw["recipe"]["vgal-steam-heavy-oil-light-oil"].surface_conditions = steam_oil_surface_conditions
    data.raw["recipe"]["vgal-steam-light-oil-petroleum-gas"].surface_conditions = steam_oil_surface_conditions
    data.raw["recipe"]["vgal-steam-sulfur"].surface_conditions = steam_oil_surface_conditions
    data.raw["recipe"]["vgal-coal-sulfur"].surface_conditions = steam_oil_surface_conditions
end
