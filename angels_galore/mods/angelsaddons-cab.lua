if not mods["angelsaddons-cab"] then return end

data.raw["item-subgroup"]["vgal-rolling-stock"].order = "z[angel-train]--b"
data.raw["item-subgroup"]["transport"].order = "z[angel-train]-x"
data.raw["item-subgroup"]["angels-vehicle-equipment"].order = "gb"
data.raw["item-subgroup"]["angels-vehicle-equipment"].group = "combat"

data.raw["item"]["angels-cab-energy-interface-mk1"].order = "x"
data.raw["item"]["angels-cab-energy-interface-mk1"].subgroup = "angels-vehicle-equipment"
