local function do_mineral_recipes(ore_name)
    local worth = 20 -- for 2
    if ore_name == "uranium-ore" then worth = 60 end
    local torecipe = {
        -- to
        type = "recipe",
        name = "vgal-to-" .. ore_name,
        enabled = false,
        icons = vgal.icon.register {
            vgal.icon.get(ore_name),
            vgal.icon.get_in("vgal-mineral-water", "fluid"),
        },
        energy_required = 2,
        ingredients = {
            { type = "fluid", name = "vgal-mineral-water", amount = worth }
        },
        results = {
            { type = "item", name = ore_name, amount = 2 }
        },
        category = "crafting-with-fluid"
    }
    local fromrecipe =
    {
        type = "recipe",
        name = "vgal-from-" .. ore_name,
        enabled = false,
        icons = vgal.icon.register {
            vgal.icon.get("vgal-mineral-water", "fluid"),
            vgal.icon.get_in(ore_name),
        },
        energy_required = 2,
        category = "crafting-with-fluid",
        ingredients = {
            { type = "item",  name = ore_name, amount = 2 },
            { type = "fluid", name = "water",  amount = worth }
        },
        results = {
            { type = "fluid", name = "vgal-mineral-water", amount = worth }
        }
    }
    local fromadvrecipe =
    {
        type = "recipe",
        name = "vgal-advanced-from-" .. ore_name,
        enabled = false,
        icons = vgal.icon.register {
            vgal.icon.get("vgal-mineral-water", "fluid"),
            vgal.icon.get_in(ore_name),
            vgal.icon.get_in2("sulfuric-acid", "fluid"),
        },
        energy_required = 1 * 4,
        category = "chemistry",
        ingredients = {
            { type = "item",  name = ore_name,        amount = 8 * 4 },
            { type = "fluid", name = "water",         amount = worth * 4 * 4 },
            { type = "fluid", name = "sulfuric-acid", amount = 32 * 4 },
        },
        results = {
            { type = "fluid", name = "vgal-mineral-water", amount = worth * 4 * 4 }
        }
    }
    local toadvrecipe = {
        -- to
        type = "recipe",
        name = "vgal-advanced-to-" .. ore_name,
        enabled = false,
        icons = vgal.icon.register {
            vgal.icon.get(ore_name),
            vgal.icon.get_in("vgal-mineral-water", "fluid"),
            vgal.icon.get_in2("water", "fluid"),
        },
        energy_required = 8,
        category = "chemistry",
        ingredients = {
            { type = "fluid", name = "vgal-mineral-water",                              amount = worth * 16 },
            { type = "fluid", name = "water",                                           amount = worth * 8 },
            { type = "item",  name = vgal.item.get_item_or_invalid_name("wood-pellet"), amount = 1 },
        },
        results = {
            { type = "item", name = ore_name, amount = 32 }
        },
    }

    vgal.data.extend({ torecipe })
    vgal.data.extend({ fromrecipe })
    vgal.data.extend({ toadvrecipe })
    vgal.data.extend({ fromadvrecipe })

    if ore_name == "uranium-ore" then
        vgal.tech.add_recipe("vgal-uranium-mineral-water", torecipe.name)
        vgal.tech.add_recipe("vgal-uranium-mineral-water", fromrecipe.name)
        vgal.tech.add_recipe("vgal-uranium-mineral-water", toadvrecipe.name)
        vgal.tech.add_recipe("vgal-uranium-mineral-water", fromadvrecipe.name)
    else
        vgal.tech.add_recipe("vgal-mineral-water", torecipe.name)
        vgal.tech.add_recipe("vgal-mineral-water", fromrecipe.name)
        vgal.tech.add_recipe("vgal-mineral-water-2", toadvrecipe.name)
        vgal.tech.add_recipe("vgal-mineral-water-2", fromadvrecipe.name)
    end
end

local myTable = { "iron-ore", "copper-ore", "stone", "coal", "uranium-ore" }
for index, value in ipairs(myTable) do
    do_mineral_recipes(value)
end
