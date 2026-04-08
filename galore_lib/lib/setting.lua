vgal = vgal or {}
vgal.setting = vgal.setting or {}

function vgal.setting.new_bool(name, order, default_value)
    if default_value == nil then
        default_value = true
    end
    return {
        type = "bool-setting",
        name = name,
        setting_type = "startup",
        default_value = default_value,
        order = order
    }
end

function vgal.setting.new_string(name, order, default_value)
    if default_value == nil then
        default_value = ""
    end
    return {
        type = "string-setting",
        name = name,
        setting_type = "startup",
        default_value = default_value,
        order = order
    }
end

function vgal.setting.hide_and_force(name, forced_value)
    data.raw["bool-setting"][name].hidden = true
    data.raw["bool-setting"][name].forced_value = forced_value
end
