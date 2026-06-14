vgal.throw.error_if_missing_galore({ "space_age_galore", "Space Age Galore" }, { "space-age", "the \"Space Age\" DLC" })
vgal.throw.error_if_missing_galore({ "angels_galore", "Angel's Galore" }, { "angelsbioprocessing", "Angel's mods" })

require("overrides.overrides")

require("prototypes.toggle-groups")
require("prototypes.subgroups")

require("prototypes.recipes.rocket-parts")
require("prototypes.recipes.science-packs")
require("prototypes.recipes.military")
require("prototypes.recipes.equipment")
require("prototypes.recipes.removed")

require("prototypes.recipes.intermediates.intermediates")
require("prototypes.recipes.intermediates.centrifuging")
require("prototypes.recipes.intermediates.chemical")
require("prototypes.recipes.intermediates.circuits")
require("prototypes.recipes.intermediates.engines")
require("prototypes.recipes.intermediates.oil-processing")
require("prototypes.recipes.intermediates.nuclear")

require("prototypes.recipes.buildings.belts")
require("prototypes.recipes.buildings.buildings")
require("prototypes.recipes.buildings.inserters")

require("mods.james")
require("mods.quality")

require("overrides.vgal-post-overrides")
