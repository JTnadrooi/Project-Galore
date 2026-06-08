local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

for _, plant in pairs(sagal.defines.gleba_plants) do
    local order = (plant.name == "yumako") and "a[seeds]-a[yumako-seed]-b" or "a[seeds]-b[jellynut-seed]-b"

    data:extend({
        {
            type = "item",
            name = "vgal-" .. plant.seed .. "-dormant",
            icon = "__angels_space_age_galore__/graphics/icons/" .. plant.seed .. "-dormant.png",
            -- pictures =
            -- {
            --     { size = 64, filename = "__space-age__/graphics/icons/yumako-seed-1.png", scale = 0.5, mipmap_count = 4 },
            --     { size = 64, filename = "__space-age__/graphics/icons/yumako-seed-2.png", scale = 0.5, mipmap_count = 4 },
            --     { size = 64, filename = "__space-age__/graphics/icons/yumako-seed-3.png", scale = 0.5, mipmap_count = 4 },
            --     { size = 64, filename = "__space-age__/graphics/icons/yumako-seed-4.png", scale = 0.5, mipmap_count = 4 },
            -- },
            subgroup = "agriculture-processes",
            order = order,
            inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
            pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
            drop_sound = space_age_item_sounds.agriculture_inventory_move,
            stack_size = 10,
            default_import_location = "gleba",
            weight = 10 * kg,
            fuel_category = "chemical",
            fuel_value = "4MJ"
        },
    })
end
