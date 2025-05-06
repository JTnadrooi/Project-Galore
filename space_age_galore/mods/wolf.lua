if not mods["wolfprod"] then return end
local handlers = {
    -- ["thruster-fuel"] = "thruster",
    -- ["thruster-oxidizer"] = "thruster",
    ["iron-gear-wheel"] = "iron-gear-and-stick",
    ["iron-stick"] = "iron-gear-and-stick",
    ["iron-bacteria"] = "iron-copper-bacteria",
    ["copper-bacteria"] = "iron-copper-bacteria",
    ["crude-oil"] = "oil",
    ["light-oil"] = "oil",
    ["petroleum-gas"] = "oil",
    ["heavy-oil"] = "oil",
    ["wood"] = "wood-fish",
    ["fish"] = "wood-fish",
    ["biter-egg"] = "egg",
    ["pentapod-egg"] = "egg",
    ["overgrowth-yumako-soil"] = "overgrowth-soil",
    ["overgrowth-jellynut-soil"] = "overgrowth-soil",
    ["artificial-yumako-soil"] = "artificial-soil",
    ["artificial-jellynut-soil"] = "artificial-soil",
    ["yumako-mash"] = "yumako-jellynut",
    ["jelly"] = "yumako-jellynut",
    ["lithium-plate"] = "lithium",
    ["uranium-ore"] = "uranium-processing",

    ["nuclear-fuel"] = "kovarex-enrichment-process",
    ["refined-concrete"] = "concrete",
    ["engine-unit"] = "flying-robot-frame",
    ["electric-engine-unit"] = "flying-robot-frame",
    ["superconductor"] = "supercapacitor",
}
for _, recipe in vgal.data.domain_pairs("vgal", "recipe") do
    local tech_pre_name = handlers[recipe.main_product]
    if tech_pre_name then
        vgal.tech.add_productivity_change(tech_pre_name .. "-productivity-wolf", recipe.name)
    end
end
vgal.tech.add_productivity_change("kovarex-enrichment-process-productivity-wolf",
    "vgal-fluorine-kovarex-enrichment-process")

vgal.tech.add_productivity_change("thruster-productivity-wolf",
    "vgal-carbon-stone-thruster-fuel")
vgal.tech.add_productivity_change("thruster-productivity-wolf",
    "vgal-iron-ore-stone-thruster-oxidizer")

vgal.tech.add_productivity_change("advanced-thruster-productivity-wolf",
    "vgal-ammonia-thruster-oxidizer")
vgal.tech.add_productivity_change("advanced-thruster-productivity-wolf",
    "vgal-crude-oil-thruster-fuel")
