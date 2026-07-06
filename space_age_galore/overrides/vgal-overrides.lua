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
vgal.data.trim("vgal-sulfuric-acid-processing-unit")

vgal.recipe.set_conformed_categories("vgal-plastic-bar-electronic-circuit", { "crafting", "electromagnetics" })
vgal.recipe.set_conformed_categories("vgal-plastic-bar-processing-unit", { "crafting", "electromagnetics" })
vgal.recipe.set_conformed_categories("vgal-sulfuric-acid-processing-unit", { "crafting", "electromagnetics" })
vgal.recipe.set_conformed_categories("vgal-sulfuric-acid-advanced-circuit", { "crafting", "electromagnetics" })
vgal.recipe.set_conformed_categories("vgal-low-density-structure-processing-unit", { "crafting", "electromagnetics" })

vgal.recipe.set_conformed_categories("vgal-processing-unit-substation", { "crafting", "electromagnetics" })
vgal.recipe.set_conformed_categories("vgal-processing-unit-beacon", { "crafting", "electromagnetics" })
vgal.recipe.set_conformed_categories("vgal-advanced-circuit-solar-panel", { "crafting", "electromagnetics" })
vgal.recipe.set_conformed_categories("vgal-steel-plate-accumulator", { "crafting", "electromagnetics" })

vgal.recipe.set_conformed_categories("vgal-copper-cable-plastic-bar", { "chemistry", "cryogenics" })
vgal.recipe.set_conformed_categories("vgal-copper-cable-battery", { "chemistry", "cryogenics" })
vgal.recipe.set_conformed_categories("vgal-coal-sulfur", { "chemistry", "cryogenics" })
vgal.recipe.set_conformed_categories("vgal-steam-sulfur", { "chemistry", "cryogenics" })

vgal.recipe.set_conformed_categories("vgal-petroleum-gas-rocket-fuel", { "crafting", "organic" })

vgal.recipe.set_conformed_categories("vgal-petroleum-gas-coal-heavy-oil", { "chemistry", "cryogenics" })
vgal.recipe.set_conformed_categories("vgal-steam-heavy-oil-light-oil", { "chemistry", "cryogenics" })
vgal.recipe.set_conformed_categories("vgal-steam-light-oil-petroleum-gas", { "chemistry", "cryogenics" })

vgal.recipe.set_conformed_categories("vgal-low-density-structure-engine-unit", { "crafting", "metallurgy" })
vgal.recipe.set_conformed_categories("vgal-low-density-structure-barrel", { "crafting", "metallurgy" })

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
