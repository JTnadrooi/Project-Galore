local function auto_barrel(fluidName)
    data.raw["fluid"][fluidName].auto_barrel = true
end

auto_barrel("holmium-solution")
auto_barrel("electrolyte")
auto_barrel("ammoniacal-solution")
auto_barrel("ammonia")
auto_barrel("fluorine")
auto_barrel("lithium-brine")
auto_barrel("thruster-oxidizer")
auto_barrel("thruster-fuel")

vgal.recipe.override_iron("solid-fuel-from-ammonia", vgal.icon.register({
    vgal.icon.get("solid-fuel"),
    vgal.icon.get_in("ammonia", "fluid"),
}))
vgal.recipe.override_iron("ammonia-rocket-fuel", vgal.icon.register({
    vgal.icon.get("rocket-fuel"),
    vgal.icon.get_in("ammonia", "fluid"),
}))
vgal.recipe.override_iron("burnt-spoilage", vgal.icon.register({
    vgal.icon.get("carbon"),
    vgal.icon.get_in("spoilage"),
}))

if settings.startup["vgal-ammonia-temp-override"].value then
    data.raw["fluid"]["ammonia"].default_temperature = 15
    data.raw["fluid"]["ammonia"].max_temperature = 450
    data.raw["fluid"]["ammonia"].gas_temperature = -33
end
if settings.startup["vgal-ammoniacal-solution-temp-override"].value then
    data.raw["fluid"]["ammoniacal-solution"].default_temperature = 15
    data.raw["fluid"]["ammoniacal-solution"].max_temperature = 100
end
if settings.startup["vgal-ice-recipes"].value then
    data.raw["recipe"]["ice-melting"].allow_productivity = false
end
if settings.startup["vgal-press-engine-unit"].value then
    data.raw["recipe"]["engine-unit"].categories = { "advanced-crafting", "metallurgy" }
    data.raw["recipe"]["vgal-low-density-structure-engine-unit"].categories = { "advanced-crafting", "metallurgy" }
    data.raw["recipe"]["vgal-lubricant-engine-unit"].categories = { "crafting-with-fluid", "metallurgy" }
end
if settings.startup["vgal-press-barrel"].value then
    data.raw["recipe"]["barrel"].categories = { "crafting", "metallurgy" }
    data.raw["recipe"]["vgal-iron-plate-barrel"].categories = { "crafting", "metallurgy" }
    data.raw["recipe"]["vgal-iron-plate-copper-plate-barrel"].categories = { "crafting", "metallurgy" }
    data.raw["recipe"]["vgal-low-density-structure-barrel"].categories = { "crafting", "metallurgy" }
end
if settings.startup["vgal-crushing-recipes"].value then
    data.raw["assembling-machine"]["crusher"].surface_conditions = nil
end

if settings.startup["vgal-captive-spawner-recipes"].value == true then
    data.raw.item["biter-egg"].hidden = false
    data.raw.recipe["biter-egg"].hidden = false
    data.raw.recipe["biter-egg"].hide_from_player_crafting = false
    data.raw.recipe["biter-egg"].hidden_in_factoriopedia = false
    data.raw.recipe["biter-egg"].hide_from_stats = false
    data.raw["assembling-machine"]["captive-biter-spawner"].fixed_recipe = nil
    data.raw["assembling-machine"]["captive-biter-spawner"].show_recipe_icon = true
end

data.raw["recipe"]["coal-synthesis"].subgroup = "raw-resource"
data.raw["recipe"]["coal-synthesis"].order = "h"

data.raw["recipe"]["iron-ore-melting"].subgroup = "vgal-molten-metals"
data.raw["recipe"]["iron-ore-melting"].order = "bbaa"
data.raw["recipe"]["copper-ore-melting"].subgroup = "vgal-molten-metals"
data.raw["recipe"]["copper-ore-melting"].order = "bbba"

data.raw["recipe"]["simple-coal-liquefaction"].subgroup = "vgal-oil"
