data.extend({
    vgal.setting.new_bool("vgal-override-vanilla-crafting-speeds", "a", true),
    vgal.setting.new_bool("vgal-remove-steel-intermediate-crafting", "b", true),
    {
        type = "int-setting",
        name = "vgal-inventory-size-percentage",
        setting_type = "startup",
        default_value = 150,
        minimum_value = 50,
        maximum_value = 500,
        order = "c"
    },
})

if mods["angelsaddons-bots"] then
    data.extend({
        vgal.setting.new_bool("vgal-addonbots-buff-bots", "x", true),
    })
end
