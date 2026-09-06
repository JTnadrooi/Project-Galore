vgal.icon.create_handlers["default"] = function(blueprint)
    ---@type data.IconData[][]
    local composites = {}

    if #blueprint.outputs > 1 then
        error("Default style does not support multiple outputs.")
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

    for i, output in ipairs(blueprint.outputs) do
        table.insert(composites, vgal.icon["get" .. (i == 1 and "" or ("_out" .. tostring(i)))](output))
    end

    for i, input in ipairs(blueprint.inputs) do
        table.insert(composites, vgal.icon["get_in" .. (i == 1 and "" or tostring(i))](input))
    end

    return vgal.icon.merge_composites(composites)
end
