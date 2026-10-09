local original_metal_name = "iron"
local final_metal_name = "lithium"
local basic_metal = vgal.defines.metals[original_metal_name]

for i, iron_basic_recipeable_name in ipairs({
    -- basic_metal.processed,
    -- basic_metal.pellet,
    basic_metal.ingot,
    basic_metal.molten,
    basic_metal.roll,
}) do
    local iron_basic_recipeable = vgal.get_recipeable(iron_basic_recipeable_name)
    local output_item_icon_path = iron_basic_recipeable.icon or error()
    output_item_icon_path = vgal.string.replace(output_item_icon_path, original_metal_name, "silver")

    local output_item = table.deepcopy(iron_basic_recipeable)
    local output_item_name = output_item.name
    output_item_name = vgal.string.replace(output_item_name, "angels-liquid", "vgal")
    output_item_name = vgal.string.replace(output_item_name, "angels-solid", "vgal")
    output_item_name = vgal.string.replace(output_item_name, "angels", "vgal")
    output_item_name = vgal.string.replace(output_item_name, original_metal_name, final_metal_name)

    output_item.name = output_item_name

    output_item.icon = output_item_icon_path

    output_item.order = vgal.subgroup.order_from_number(1 + i)
    output_item.subgroup = (i > 1) and ("vgal-" .. final_metal_name .. "-smelting") or ("vgal-" .. final_metal_name .. "-processing")

    ---@diagnostic disable-next-line: assign-type-mismatch
    data:extend({ output_item })
end

data.raw["fluid"]["vgal-molten-" .. final_metal_name].base_color = { 213, 150, 175 }
data.raw["fluid"]["vgal-molten-" .. final_metal_name].flow_color = { 213, 150, 175 }

data.raw["item"]["vgal-ingot-lithium"].order = "g"

data:extend({
    {
        type = "item",
        name = "vgal-lithium-chloride",
        icon = "__angelssmeltinggraphics__/graphics/icons/solid-silver-oxide.png",
        icon_size = 32,
        subgroup = "vgal-lithium-processing",
        order = "e",
        stack_size = 200,
        weight = vgal.item.get_weight_from_rocket_capacity(200)
    },
    {
        type = "item",
        name = "vgal-lithium-carbonate",
        icon = "__angelssmeltinggraphics__/graphics/icons/solid-sodium-silver-cyanide.png",
        icon_size = 32,
        subgroup = "vgal-lithium-processing",
        order = "c",
        stack_size = 200,
        weight = vgal.item.get_weight_from_rocket_capacity(250)
    },
    {
        type = "fluid",
        name = "vgal-concentrated-lithium-brine",
        -- icons = angelsmods.functions.create_viscous_liquid_fluid_icon(nil, { { 235, 240, 250 }, nil, { 245, 248, 255 } }),
        icons = angelsmods.functions.create_viscous_liquid_fluid_icon(nil, { { 235, 240, 250 }, { 168, 173, 173 }, { 245, 248, 255 }, { 185, 185, 185, 0.8 } }),
        subgroup = "vgal-lithium-processing",
        order = "b",
        max_temperature = 0,
        default_temperature = 0,
        base_color = angelsmods.functions.fluid_color("Ws4NaCl"), --{r = 0.9, g = 0.9, b = 1},
        flow_color = angelsmods.functions.flow_color("Ws4NaCl"),  --{r = 0.9, g = 0.9, b = 1},
        stack_size = 200,
    },
    -- {
    --     type = "item",
    --     name = "vgal-holmium-fluoride",
    --     icon = "__angelssmeltinggraphics__/graphics/icons/holmium-fluoride.png",
    --     icon_size = 32,
    --     subgroup = "vgal-holmium-processing",
    --     order = "cc",
    --     stack_size = 200,
    -- },
})
