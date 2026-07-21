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

require("prototypes.recipes.voids")

require("prototypes.recipes.metal-both")
require("prototypes.recipes.casting")
require("prototypes.recipes.recipe-items")
require("prototypes.recipes.water-treatment")
require("prototypes.recipes.chemistry")
require("prototypes.recipes.sorting")
require("prototypes.recipes.resources")
require("prototypes.recipes.plastic")
require("prototypes.recipes.bio")
require("prototypes.recipes.petrochem")
