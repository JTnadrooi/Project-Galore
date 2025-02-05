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

    {
        type = "bool-setting",
        name = "vgal-rocket-parts",
        setting_type = "startup",
        default_value = true,
        order = "ab"
    },
    {
        type = "bool-setting",
        name = "vgal-alternate-science",
        setting_type = "startup",
        default_value = true,
        order = "ad"
    },
    {
        type = "bool-setting",
        name = "vgal-wood-recipes",
        setting_type = "startup",
        default_value = true,
        order = "ae"
    },
    {
        type = "bool-setting",
        name = "vgal-convoluted-recipes",
        setting_type = "startup",
        default_value = false,
        order = "af"
    },
    {
        type = "bool-setting",
        name = "vgal-unsure-recipes",
        setting_type = "startup",
        default_value = false,
        order = "aza"
    },
    {
        type = "bool-setting",
        name = "vgal-removed-recipes",
        setting_type = "startup",
        default_value = false,
        order = "azb"
    },
}
