local original_metal_name = "iron"
local final_metal_name = "holmium"
local basic_metal = vgal.defines.metals[original_metal_name]

for i, iron_basic_recipeable_name in ipairs({
    basic_metal.processed,
    basic_metal.pellet,
    basic_metal.ingot,
    "angels-powder-" .. basic_metal.name,
    basic_metal.molten,
    basic_metal.roll,
}) do
    local iron_basic_recipeable = vgal.get_recipeable(iron_basic_recipeable_name)
    local output_item_icon_path = iron_basic_recipeable.icon or error()
    output_item_icon_path = vgal.string.replace(output_item_icon_path, original_metal_name, final_metal_name)

    local output_item = table.deepcopy(iron_basic_recipeable)
    local output_item_name = output_item.name
    output_item_name = vgal.string.replace(output_item_name, "angels-liquid", "vgal")
    output_item_name = vgal.string.replace(output_item_name, "angels-solid", "vgal")
    output_item_name = vgal.string.replace(output_item_name, "angels", "vgal")
    output_item_name = vgal.string.replace(output_item_name, original_metal_name, final_metal_name)

    output_item.name = output_item_name

    output_item.icon = output_item_icon_path

    output_item.order = vgal.subgroup.order_from_number(1 + i)
    output_item.subgroup = (i > 4) and ("vgal-" .. final_metal_name .. "-smelting") or ("vgal-" .. final_metal_name .. "-processing")



    ---@diagnostic disable-next-line: assign-type-mismatch
    data:extend({ output_item })
end

data.raw["fluid"]["vgal-molten-" .. final_metal_name].base_color = { 213, 150, 175 }
data.raw["fluid"]["vgal-molten-" .. final_metal_name].flow_color = { 213, 150, 175 }

data:extend({
    {
        type = "item",
        name = "vgal-holmium-oxide",
        icon = "__angelssmeltinggraphics__/graphics/icons/solid-holmium-oxide.png",
        icon_size = 32,
        subgroup = "vgal-holmium-processing",
        order = "ca",
        stack_size = 200,
    },
    {
        type = "item",
        name = "vgal-holmium-chloride",
        icon = "__angelssmeltinggraphics__/graphics/icons/solid-holmium-chloride.png",
        icon_size = 32,
        subgroup = "vgal-holmium-processing",
        order = "cb",
        stack_size = 200,
    },
    {
        type = "item",
        name = "vgal-holmium-fluoride",
        icon = "__angelssmeltinggraphics__/graphics/icons/solid-holmium-fluoride.png",
        icon_size = 32,
        subgroup = "vgal-holmium-processing",
        order = "cc",
        stack_size = 200,
    },
})
