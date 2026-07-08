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

vgal.recipe.hide_and_queue_for_tech_removal("vgal-processing-unit-artillery-turret")
vgal.recipe.hide_and_queue_for_tech_removal("vgal-steam-concrete")
vgal.recipe.hide_and_queue_for_tech_removal("vgal-sulfuric-acid-processing-unit")

vgal.recipe.add_category("vgal-plastic-bar-electronic-circuit", "electromagnetics")
vgal.recipe.add_category("vgal-plastic-bar-processing-unit", "electromagnetics")
vgal.recipe.add_category("vgal-sulfuric-acid-processing-unit", "electromagnetics")
vgal.recipe.add_category("vgal-sulfuric-acid-advanced-circuit", "electromagnetics")
vgal.recipe.add_category("vgal-low-density-structure-processing-unit", "electromagnetics")

vgal.recipe.add_category("vgal-processing-unit-substation", "electromagnetics")
vgal.recipe.add_category("vgal-processing-unit-beacon", "electromagnetics")
vgal.recipe.add_category("vgal-advanced-circuit-solar-panel", "electromagnetics")
vgal.recipe.add_category("vgal-steel-plate-accumulator", "electromagnetics")

vgal.recipe.add_category("vgal-copper-cable-plastic-bar", "cryogenics")
vgal.recipe.add_category("vgal-copper-cable-battery", "cryogenics")
vgal.recipe.add_category("vgal-coal-sulfur", "cryogenics")
vgal.recipe.add_category("vgal-steam-sulfur", "cryogenics")

vgal.recipe.add_category("vgal-petroleum-gas-rocket-fuel", "organic")

vgal.recipe.add_category("vgal-petroleum-gas-coal-heavy-oil", "cryogenics")
vgal.recipe.add_category("vgal-steam-heavy-oil-light-oil", "cryogenics")
vgal.recipe.add_category("vgal-steam-light-oil-petroleum-gas", "cryogenics")

vgal.recipe.add_category("vgal-low-density-structure-engine-unit", "metallurgy")
vgal.recipe.add_category("vgal-low-density-structure-barrel", "metallurgy")

local valid_suffixes = {
    "transport-belt",
    "splitter",
    "underground-belt"
}

for _, recipe in vgal.data.domain_pairs("vgal", "recipe") do
    for _, suffix in ipairs(valid_suffixes) do
        if recipe.name:sub(- #suffix) == suffix then
            vgal.recipe.add_category(recipe, "metallurgy")
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
