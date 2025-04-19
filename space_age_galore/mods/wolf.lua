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
    ["artifical-yumako-soil"] = "artifical-soil",
    ["artifical-jellynut-soil"] = "artifical-soil",
    ["yumako-mash"] = "yumako-jellynut",
    ["jelly"] = "yumako-jellynut",
    ["lithium"] = "yumako-jellynut",
    ["lithium-plate"] = "lithium",
}
for _, recipe in pairs(vgal.recipes) do
    local techPreName = handlers[recipe.main_product]
    if techPreName then
        vgal.tech.add_productivity_change(techPreName .. "-productivity-wolf", recipe.name)
    end
end
vgal.tech.add_productivity_change("kovarex-enrichment-process-productivity-wolf",
    "vgal-fluorine-kovarex-enrichment-process")
vgal.tech.add_productivity_change("uranium-processing-productivity-wolf",
    "vgal-carbon-uranium-ore")

vgal.tech.add_productivity_change("thruster-productivity-wolf",
    "vgal-carbon-stone-thruster-fuel")
vgal.tech.add_productivity_change("thruster-productivity-wolf",
    "vgal-iron-ore-stone-thruster-oxidizer")

vgal.tech.add_productivity_change("advanced-thruster-productivity-wolf",
    "vgal-ammonia-thruster-oxidizer")
vgal.tech.add_productivity_change("advanced-thruster-productivity-wolf",
    "vgal-crude-oil-thruster-fuel")
