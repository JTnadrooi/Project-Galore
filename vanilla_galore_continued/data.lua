vgal.throw.error_if_missing_galore({ "space_age_galore", "Space Age Galore" }, { "space-age", "the \"Space Age\" DLC" })
vgal.throw.error_if_missing_galore({ "angels_galore", "Angels Galore" }, { "angelsbioprocessing", "Angel's mods" })

require("overrides.overrides")

require("prototypes.toggle-groups")
require("prototypes.subgroups")
require("prototypes.rocket-parts")
require("prototypes.science-packs")
require("prototypes.military")
require("prototypes.equipment")
require("prototypes.removed")

require("prototypes.intermediates.intermediates")
require("prototypes.intermediates.centrifuging")
require("prototypes.intermediates.chemical")
require("prototypes.intermediates.circuits")
require("prototypes.intermediates.engines")
require("prototypes.intermediates.oil-processing")
require("prototypes.intermediates.nuclear")

require("prototypes.buildings.belts")
require("prototypes.buildings.buildings")
require("prototypes.buildings.inserters")

require("mods.james")
require("mods.quality")

require("overrides.vgal-post-overrides")
