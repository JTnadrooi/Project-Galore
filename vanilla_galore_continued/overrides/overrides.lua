---@diagnostic disable-next-line: undefined-global
local pictures = assembler3pipepictures()
pictures.north = util.empty_sprite()
pictures.east.filename = "__vanilla_galore_continued__/graphics/fluid-boxes/centrifuge-E.png"
pictures.south.filename = "__vanilla_galore_continued__/graphics/fluid-boxes/centrifuge-S.png"
pictures.west.filename = "__vanilla_galore_continued__/graphics/fluid-boxes/centrifuge-W.png"

local fluid_boxes = {
    {
        production_type = "input",
        pipe_picture = pictures,
        ---@diagnostic disable-next-line: undefined-global
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = "input", direction = defines.direction.north, position = { 0, -1 } } },
    },
    {
        production_type = "output",
        pipe_picture = pictures,
        ---@diagnostic disable-next-line: undefined-global
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = "output", direction = defines.direction.south, position = { 0, 1 } } },
    },
}

for _, am in pairs(data.raw["assembling-machine"]) do
    if am.crafting_categories and not am.fluid_boxes then
        for _, category in pairs(am.crafting_categories) do
            if category == "centrifuging" then
                am.fluid_boxes = util.table.deepcopy(fluid_boxes)
                am.fluid_boxes_off_when_no_fluid_recipe = true
                break
            end
        end
    end
end
