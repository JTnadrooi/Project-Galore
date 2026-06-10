-- error
vgal.throw.error_if_missing_galore({ "angels_space_age_galore", "Angel's+Space Age Galore" },
    { "space_age_galore", "Space Age Galore" }, true)

-- setup
vgal.table.extend_single(vgal.tech.units, {
    name = "vgal-biological-science-pack",
    value = 2,
})

-- req
require("overrides.prod-overrides")
require("prototypes.items.biological-science-pack")

require("prototypes.subgroups")
require("prototypes.voids")

require("prototypes.metal-both")
require("prototypes.casting")
require("prototypes.recipe-items")
require("prototypes.water-treatment")
require("prototypes.chemistry")
require("prototypes.sorting")
require("prototypes.resources")
require("prototypes.plastic")
require("prototypes.bio")
require("prototypes.petrochem-solids")
