vgal.constants.METALS = { -- gets extended in the other galore entries.
    ["iron"] = {
        name = "iron"
    },
    ["copper"] = {
        name = "copper",
    },
}

for _, metal in pairs(vgal.constants.METALS) do
    metal.ore = metal.name .. "-ore"
    metal.plate = metal.name .. "-plate"
end

vgal.constants.RECIPE_ENTRY_CATEGORIES = { "item", "fluid", "tool", "ammo", "capsule", "module", "repair-tool", "armor",
    "item-with-entity-data",
    "rail-planner", "gun" }
