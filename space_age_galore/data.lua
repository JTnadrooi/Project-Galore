-- setup
vgal.tech.units["space-science-pack"].value = 4
vgal.table.extend_single(vgal.tech.units, {
    name = "metallurgic-science-pack",
    value = 5,
})
vgal.table.extend_single(vgal.tech.units, {
    name = "electromagnetic-science-pack",
    value = 5,
})
vgal.table.extend_single(vgal.tech.units, {
    name = "agricultural-science-pack",
    value = 5,
})
vgal.table.extend_single(vgal.tech.units, {
    name = "cryogenic-science-pack",
    value = 8,
})
vgal.table.extend_single(vgal.tech.units, {
    name = "promethium-science-pack",
    value = 10,
})

vgal.recipe.add_catalyst_group({
    "ice",
    "water",
})
vgal.recipe.add_catalyst_group({
    "fluoroketone-hot",
    "fluoroketone-cold",
})

-- req
require("overrides.vgal-overrides")
require("overrides.overrides")

require("prototypes.toggle-groups")
require("prototypes.subgroups")

require("prototypes.recipes.science-packs")
require("prototypes.recipes.modules")
require("prototypes.recipes.ice")
require("prototypes.recipes.military")
require("prototypes.recipes.rocket-parts")

require("prototypes.recipes.intermediates.intermediates")
require("prototypes.recipes.intermediates.nuclear")
require("prototypes.recipes.intermediates.chemical")
require("prototypes.recipes.intermediates.ammonia")
require("prototypes.recipes.intermediates.crushing")
require("prototypes.recipes.intermediates.smelting") -- after intermediates
require("prototypes.recipes.intermediates.circuits")
require("prototypes.recipes.intermediates.captive-spawner")
require("prototypes.recipes.intermediates.oil-processing")
require("prototypes.recipes.intermediates.space")
require("prototypes.recipes.intermediates.organic")

require("prototypes.recipes.removed")

require("prototypes.recipes.buildings.buildings")
require("prototypes.recipes.buildings.belts")
require("prototypes.recipes.buildings.tiles")

require("mods.maraxsis")
require("mods.james")
require("mods.wolf")
require("mods.cerys")
require("mods.demolisher-scales")
require("mods.quality")

require("overrides.sagal-post-overrides")
