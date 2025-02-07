data:extend {
    {
        type = "bool-setting",
        name = "vgal-log",
        setting_type = "startup",
        default_value = true,
        order = "z"
    },
    {
        type = "bool-setting",
        name = "vgal-always-show-products",
        setting_type = "startup",
        default_value = true,
        order = "aa"
    },
    {
        type = "bool-setting",
        name = "vgal-always-show-made-in",
        setting_type = "startup",
        default_value = true,
        order = "aab"
    },
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
    {
        type = "bool-setting",
        name = "vgal-high-temp-oil-processing-temp-coal-liquefaction",
        setting_type = "startup",
        default_value = true,
        order = "aad"
    },
}
