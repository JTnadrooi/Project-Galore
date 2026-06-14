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
require("prototypes.science-packs")
require("prototypes.modules")
require("prototypes.ice")
require("prototypes.military")
require("prototypes.rocket-parts")

require("prototypes.intermediates.intermediates")
require("prototypes.intermediates.nuclear")
require("prototypes.intermediates.chemical")
require("prototypes.intermediates.ammonia")
require("prototypes.intermediates.crushing")
require("prototypes.intermediates.smelting") -- after intermediates
require("prototypes.intermediates.circuits")
require("prototypes.intermediates.captive-spawner")
require("prototypes.intermediates.oil-processing")
require("prototypes.intermediates.space")
require("prototypes.intermediates.organic")

require("prototypes.removed")

require("prototypes.buildings.buildings")
require("prototypes.buildings.belts")
require("prototypes.buildings.tiles")

require("mods.maraxsis")
require("mods.james")
require("mods.bobs")
require("mods.wolf")
require("mods.cerys")
require("mods.demolisher-scales")

require("overrides.sagal-post-overrides")
