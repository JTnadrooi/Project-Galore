vgal = {}
vgal.setting = {}

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
