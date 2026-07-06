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
            default_value = "disable",
            allowed_values = {
                "disable", "replace", "add"
            },
            order = "ca"
        },
        {
            type = "int-setting",
            name = "vgal-quality-upgrades-result-probability",
            setting_type = "startup",
            default_value = 25,
            minimum_value = 1,
            maximum_value = 100,
            order = "cb"
        },
    }
end
