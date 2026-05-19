data.extend({
    vgal.setting.new_bool("vgal-override-vanilla-crafting-speeds", "a", true),
    vgal.setting.new_bool("vgal-remove-steel-intermediate-crafting", "b", true),
})

if mods["angelsaddons-bots"] then
    data.extend({
        vgal.setting.new_bool("vgal-addonbots-buff-bots", "c", true),
    })
end
