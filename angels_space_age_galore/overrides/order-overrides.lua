-- data.raw["recipe"]["vgal-solid-fuel-sulfuric-acid-carbon"]

data.raw["item"]["carbon"].order = "ag"
data.raw["item"]["carbon"].subgroup = "vgal-carbon"

vgal.subgroup.clean_recipe("vgal-coal-crushing")

data.raw["item-subgroup"]["agriculture-processes"].group = "angels-bio-processing-vegetables"
data.raw["item-subgroup"]["agriculture-processes"].order = "d[desert]-xa"
data.raw["item-subgroup"]["vgal-nutrients"].group = "angels-bio-processing-vegetables"
data.raw["item-subgroup"]["vgal-nutrients"].order = "d[desert]-xb"

data.raw["item-subgroup"]["vgal-bacteria"].group = "angels-bio-processing-nauvis"

data.raw["recipe"]["yumako-processing"].order = "b-a"
data.raw["recipe"]["jellynut-processing"].order = "b-b"

data.raw["item-subgroup"]["raw-resource"].group = "angels-resource-refining"
data.raw["item-subgroup"]["raw-resource"].order = "h"

data.raw["item-subgroup"]["vgal-smelting"].group = "angels-smelting"
data.raw["item-subgroup"]["vgal-smelting"].order = "e"

vgal.subgroup.clean_recipe("casting-low-density-structure")
vgal.subgroup.clean_recipe("vgal-molten-copper-carbon-fiber-low-density-structure")
vgal.subgroup.clean_recipe("vgal-molten-iron-rail")
vgal.subgroup.clean_recipe("vgal-solid-fuel-sulfuric-acid-carbon")

data.raw["item"]["biter-egg"].order = "-a"
data.raw["item"]["biter-egg"].subgroup = "angels-bio-biter-egg"
data.raw["recipe"]["biter-egg"].order = "-a"

data.raw.recipe["vgal-spoilage-crude-oil"].order = "-"
data.raw.recipe["vgal-spoilage-crude-oil"].subgroup = "angels-petrochem-carbon-oil-feed"

data.raw["item"]["pentapod-egg"].order = "--a"
data.raw["item"]["pentapod-egg"].subgroup = "angels-bio-biter-egg"
vgal.subgroup.clean_recipe("pentapod-egg")

data.raw["item-subgroup"]["agriculture-products"].order = "fb"
data.raw["item-subgroup"]["agriculture-products"].group = "angels-bio-processing-nauvis"

data.raw["recipe"]["ice-melting"].order = "a[water]-b[from-not-water]"

data.raw["item"]["lithium"].order = "f"
data.raw["item"]["lithium"].subgroup = "vgal-petrochem-other-solids"
vgal.subgroup.clean_recipe("lithium")
