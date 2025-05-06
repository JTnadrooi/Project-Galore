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
vgal.data.trim("vgal-water-copper-ore")
vgal.data.trim("vgal-water-electric-engine-unit-copper-ore")
vgal.data.trim("vgal-water-iron-ore")
vgal.data.trim("vgal-water-electric-engine-unit-iron-ore")
vgal.data.trim("vgal-crude-oil-coal")
vgal.data.trim("vgal-sulfuric-acid-processing-unit")

data.raw["recipe"]["vgal-plastic-bar-electronic-circuit"].category = "electronics"
data.raw["recipe"]["vgal-plastic-bar-processing-unit"].category = "electronics"
data.raw["recipe"]["vgal-sulfuric-acid-processing-unit"].category = "electronics"
data.raw["recipe"]["vgal-sulfuric-acid-advanced-circuit"].category = "electronics"
data.raw["recipe"]["vgal-low-density-structure-processing-unit"].category = "electronics"

data.raw["recipe"]["vgal-processing-unit-substation"].category = "electronics"
data.raw["recipe"]["vgal-processing-unit-beacon"].category = "electronics"
data.raw["recipe"]["vgal-advanced-circuit-solar-panel"].category = "electronics"
data.raw["recipe"]["vgal-steel-plate-accumulator"].category = "electronics"

data.raw["recipe"]["vgal-copper-cable-plastic-bar"].category = "chemistry-or-cryogenics"
data.raw["recipe"]["vgal-copper-cable-battery"].category = "chemistry-or-cryogenics"
data.raw["recipe"]["vgal-coal-sulfur"].category = "chemistry-or-cryogenics"
data.raw["recipe"]["vgal-steam-sulfur"].category = "chemistry-or-cryogenics"

data.raw["recipe"]["vgal-petroleum-gas-rocket-fuel"].category = "organic-or-assembling"

data.raw["recipe"]["vgal-petroleum-gas-coal-heavy-oil"].category = "organic-or-chemistry"
data.raw["recipe"]["vgal-steam-heavy-oil-light-oil"].category = "organic-or-chemistry"
data.raw["recipe"]["vgal-steam-light-oil-petroleum-gas"].category = "organic-or-chemistry"

data.raw["recipe"]["vgal-low-density-structure-engine-unit"].category = "pressing"
data.raw["recipe"]["vgal-low-density-structure-barrel"].category = "pressing"

local valid_suffixes = {
    "transport-belt",
    "splitter",
    "underground-belt"
}

for _, recipe in vgal.data.domain_pairs("vgal", "recipe") do
    for _, suffix in ipairs(valid_suffixes) do
        ---@diagnostic disable-next-line: param-type-mismatch
        if recipe.name:sub(- #suffix) == suffix then
            recipe.category = "pressing"
            break
        end
    end
end
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
