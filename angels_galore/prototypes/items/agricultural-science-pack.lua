local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")

data:extend({
    {
        type = "tool",
        name = "vgal-agricultural-science-pack",
        localised_description = { "item-description.science-pack" },
        icon = "__angels_galore__/graphics/icons/agricultural-science-pack.png",
        subgroup = "science-pack", -- may get changed in subgroups
        order = "cb",
        inventory_move_sound = item_sounds.science_inventory_move,
        pick_sound = item_sounds.science_inventory_pickup,
        drop_sound = item_sounds.science_inventory_move,
        stack_size = 200,
        weight = 1 * kg,
        durability = 1,
        durability_description_key = "description.science-pack-remaining-amount-key",

        ---@diagnostic disable-next-line: assign-type-mismatch
        factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
        durability_description_value = "description.science-pack-remaining-amount-value",
        random_tint_color = item_tints.bluish_science
    },
    {
        type = "technology",
        name = "vgal-agricultural-science-pack",
        localised_name = { "technology-name.vgal-agricultural-science-pack" },
        localised_description = { "technology-description.vgal-agricultural-science-pack" },
        icon = "__angels_galore__/graphics/technology/agricultural-science-pack.png",
        icon_size = 256,
        effects = {},  -- recipe gets added on vgal.data.extend.
        prerequisites = { "angels-composting" },
        unit =
        {
            count = 60,
            ingredients = { { "automation-science-pack", 1 } },
            time = 10
        }
    },
})

vgal.data.extend({
    {
        name = "agricultural-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("vgal-agricultural-science-pack"),
        },
        energy_required = 5,
        technology = "vgal-agricultural-science-pack",
        ingredients = {
            { "angels-cellulose-fiber", 3 },
            { "angels-solid-soil",      1 },
        },
        results = {
            { "vgal-agricultural-science-pack", 1 },
        },
        category = "crafting",
    },
}, {
    type = "recipe",
})
