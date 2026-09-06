vgal.icon.create_handlers["fluid"] = function(blueprint)
    ---@type data.IconData[][]
    local composites = {}

    table.insert(composites, vgal.icon.get(blueprint.outputs[1]))
    table.insert(composites, vgal.icon.shift(vgal.icon.get(blueprint.inputs[1]), 0.35, { 0, -6.5 }))

    if blueprint.inputs[2] then
        table.insert(composites, vgal.icon.shift(vgal.icon.get(blueprint.inputs[2]), 0.25, { 0, -5 }))
    end

    return vgal.icon.merge_composites(composites)
end
