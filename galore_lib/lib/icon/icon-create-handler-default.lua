vgal.icon.create_handlers["default"] = function(blueprint)
    ---@type data.IconData[][]
    local composites = {}

    if #blueprint.outputs > 1 then
        error("Default style does not support more than 1 output.")
    end
    if #blueprint.inputs > 3 then
        error("Default style does not support more than 3 inputs.")
    end

    if #blueprint.outputs < 1 then
        error("Outputs missing.")
    end
    if #blueprint.inputs < 1 then
        error("Inputs missing.")
    end

    table.insert(composites, vgal.icon.get(blueprint.outputs[1]))

    for i, input in ipairs(blueprint.inputs) do
        table.insert(composites, vgal.icon.get_subicon(input, nil, i))
    end

    return vgal.icon.merge_composites(composites)
end
