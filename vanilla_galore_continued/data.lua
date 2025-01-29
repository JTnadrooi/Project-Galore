vgal = require("prototypes.lib.vgal")
vgal.log("the *core-of-galore* has loaded.")

if mods["space-age"] and not mods["space_age_galore"] then
    error(
        "\n\n\n\n\n[PLEASE READ]\nInstall or enable \"Space Age Galore\" for compatibility with the \"Space Age\" DLC.\n\n\n\n"
    )
end

require("prototypes.subgroups")
require("prototypes.rocket-parts")
require("prototypes.science-packs")
require("prototypes.military")
require("prototypes.removed")

require("prototypes.intermediates.intermediates")
require("prototypes.intermediates.chemical")
require("prototypes.intermediates.circuits")
require("prototypes.intermediates.engines")
require("prototypes.intermediates.oil-processing")

require("prototypes.buildings.belts")
require("prototypes.buildings.inserters")
require("prototypes.buildings.buildings")
