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
    local allow_blank = false

    if default_value == nil then
        default_value = ""
    end

    if default_value == "" then
        allow_blank = true
    end

    return {
        type = "string-setting",
        name = name,
        setting_type = "startup",
        default_value = default_value,
        order = order,
        allow_blank = allow_blank,
    }
end

function vgal.setting.hide_and_force(setting_name, forced_value)
    local setting = data.raw["bool-setting"][setting_name]
    
    if not setting then
        error("Bool setting '" .. setting_name .. "' not found")
    end

    setting.hidden = true
    setting.forced_value = forced_value
end
