data:extend {
    {
        type = "string-setting",
        name = "vgal-high-temp-oil-processing-temp",
        setting_type = "startup",
        default_value = "Any",
        allowed_values = {
            "Any", "165C", "500C"
        },
        order = "aac"
    },
    vgal.setting.new_bool("vgal-high-temp-oil-processing-temp-coal-liquefaction", "aad"),
    vgal.setting.new_string("vgal-custom-disabled-recipes", "aba"), -- only overrides groups.
    vgal.setting.new_string("vgal-custom-enabled-recipes", "abb"),  -- only overrides groups.
}
