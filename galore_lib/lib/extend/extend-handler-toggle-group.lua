---@param toggle_group vgal.VgalToggleGroupPrototype
vgal.extend_handlers["toggle-group"] = function(toggle_group)
    if toggle_group.enabled == nil then
        if toggle_group.enabled_setting then
            ---@diagnostic disable-next-line: assign-type-mismatch
            toggle_group.enabled = settings.startup[toggle_group.enabled_setting].value
        else
            ---@diagnostic disable-next-line: assign-type-mismatch
            toggle_group.enabled = settings.startup[toggle_group.name].value
        end
    end

    vgal.groups[toggle_group.name] = toggle_group
end
