require("overrides.vgal-overrides")
require("overrides.angels-overrides-updates")
require("overrides.angels-icon-overrides")
require("overrides.angels-machine-overrides") -- does not work in normal data stage.. :(

vgal.subgroup.set_item_or_fluid("oil-refinery", "vgal-angels-petrochem-machines")
data.raw["item"]["oil-refinery"].order = "a"
vgal.subgroup.set_item_or_fluid("angels-liquifier", "vgal-angels-chemistry-machines")
data.raw["item"]["angels-liquifier"].order = "b"
vgal.subgroup.set_item_or_fluid("angels-liquifier-2", "vgal-angels-chemistry-machines")
data.raw["item"]["angels-liquifier-2"].order = "c"
vgal.subgroup.set_item_or_fluid("stone-brick", "vgal-angels-cement-concrete")
data.raw["item"]["stone-brick"].order = "c"
data.raw["recipe"]["stone-brick"].order = nil
