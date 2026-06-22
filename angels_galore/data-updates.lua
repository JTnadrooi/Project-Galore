require("overrides.loot-overrides")

require("overrides.order-overrides")
require("overrides.overrides")
require("overrides.fuel-overrides")
require("overrides.recipe-overrides")

require("overrides.icon-overrides")
require("overrides.machine-overrides")
require("overrides.angels-purge")
require("overrides.tech-overrides")

require("overrides.tips-overrides")

require("overrides.locale-overrides")

require("mods.angelsaddons-bots")
require("mods.angelsaddons-cab")
require("mods.angelsaddons-mobility")
require("mods.angelsaddons-storage")
require("mods.angelsinfiniteores")

require("mods.bobmodules")
require("mods.boblogistics")

-- hmm i wonder what this is doing here
-- (it doesnt listen in any other stage)
for metal in vgal.table.iter_all(vgal.defines.metals, { vgal.defines.metal_steel }) do
    data.raw["recipe"][metal.angels_plate_recipe_name .. "-2"].allow_productivity = false -- works but galorelib prod desc runs before this so bla bla
end
