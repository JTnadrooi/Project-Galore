require("lib.setting")

data:extend {
    vgal.setting.new_bool("vgal-log", "a"),
    vgal.setting.new_bool("vgal-show-prod-descs", "b", false),
    vgal.setting.new_bool("vgal-auto-research-tech-nodes", "c", false),
    {
        type = "string-setting",
        name = "vgal-on-error",
        setting_type = "startup",
        default_value = "continue",
        allowed_values = {
            "continue",
            "stop"
        },
        order = "d",
    }
}
