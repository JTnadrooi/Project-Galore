if not mods["wolfprod"] then return end
local handlers = {
    ["thruster-fuel"] = "thruster",
    ["thruster-oxidizer"] = "thruster",
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
    ["overgrowth-yumako"] = "overgrowth-soil",
    ["overgrowth-jellynut"] = "overgrowth-soil",
    ["artifical-yumako"] = "artifical-soil",
    ["artifical-jellynut"] = "artifical-soil",
}
for _, recipe in pairs(vgal.recipes) do
    local techPreName = handlers[recipe.main_product]
    if techPreName then
        vgal.tech.add_productivity_change(techPreName .. "-productivity-wolf", recipe.name)
    end
end
