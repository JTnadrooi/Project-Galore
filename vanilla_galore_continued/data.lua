vgal = require("lib.vgal")
vgal.log("the *core-of-galore* has loaded.")

local function throw_compat_error(neededGalore, with)
    if mods[with[1]] and not mods[neededGalore[1]] then
        error("\n\n\n\n\n[PLEASE READ]\nInstall or enable \"" ..
            neededGalore[2] .. "\" for compatibility with " .. with[2] .. ".\n\n\n\n")
    end
end

throw_compat_error({ "space_age_galore", "Space Age Galore" }, { "space-age", "the \"Space Age\" DLC" })
throw_compat_error({ "angels_galore", "Angels Galore" }, { "angelsrefining", "Angel's mods" })

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
