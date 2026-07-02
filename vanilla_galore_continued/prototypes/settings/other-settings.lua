data:extend {
    {
        type = "string-setting",
        name = "vgal-high-temp-oil-processing-temp",
        setting_type = "startup",
        default_value = "any",
        allowed_values = {
            "any", "165", "500"
        },
        order = "aac"
    },
    vgal.setting.new_bool("vgal-high-temp-oil-processing-temp-coal-liquefaction", "aad"),
    vgal.setting.new_string("vgal-custom-disabled-recipes", "aba"), -- only overrides groups.
    vgal.setting.new_string("vgal-custom-enabled-recipes", "abb"),  -- only overrides groups.
}

if mods["quality"] then
    data:extend {
        {
            type = "string-setting",
            name = "vgal-quality-upgrades-mode",
            setting_type = "startup",
            default_value = "disabled",
            allowed_values = {
                "disabled", "replace", "add"
            },
            order = "ca"
        },
        {
            type = "double-setting",
            name = "vgal-quality-upgrades-result-probability",
            setting_type = "startup",
            default_value = 1 / 4,
            minimum_value = 0.01,
            maximum_value = 1,
            order = "cb"
        },
    }
end
