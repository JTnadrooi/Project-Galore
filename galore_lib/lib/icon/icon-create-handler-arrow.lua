vgal.icon.create_handlers["arrow"] = function(blueprint)
    ---@type data.IconData[][]
    local composites = {}

    -- if #blueprint.outputs > 1 then
    --     error("Arrow style does not support multiple outputs.")
    -- end
    -- if #blueprint.inputs > 1 then
    --     error("Arrow style does not support multiple inputs.")
    -- end

    -- if #blueprint.outputs < 1 then
    --     error("Outputs missing.")
    -- end
    -- if #blueprint.inputs < 1 then
    --     error("Inputs missing.")
    -- end

    table.insert(composites, vgal.icon.shift(vgal.icon.get(blueprint.inputs[1]), 0.38, { -6.5, -6.5 }))
    table.insert(composites, vgal.icon.shift(vgal.icon.get(blueprint.outputs[1]), 0.35, { 5.5, 6.5 }))
    table.insert(composites, vgal.icon.get_overlay("to"))

    if blueprint.outputs[2] then
        vgal.icon.get_in2(blueprint.outputs[2])
    end

    return vgal.icon.merge_composites(composites)
end
