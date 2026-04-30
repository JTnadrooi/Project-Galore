local function update_disco_science()
    if remote.interfaces["DiscoScience"] and remote.interfaces["DiscoScience"]["setIngredientColor"] then
        remote.call("DiscoScience", "setIngredientColor", "vgal-biological-science-pack", { r = 230, g = 247, b = 112 })
    end
end

script.on_configuration_changed(function()
    update_disco_science()
end)

script.on_init(function()
    update_disco_science()
end)
