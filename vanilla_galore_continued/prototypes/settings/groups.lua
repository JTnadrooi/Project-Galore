data:extend {
    vgal.setting.new_bool("vgal-rocket-parts", "aa"),
    vgal.setting.new_bool("vgal-science-packs", "ab"),
    vgal.setting.new_bool("vgal-wood-recipes", "ac"),
    vgal.setting.new_bool("vgal-belts", "ad"),
    vgal.setting.new_bool("vgal-equipment", "ae"),
    vgal.setting.new_bool("vgal-buildings", "af"),
    vgal.setting.new_bool("vgal-barrels", "ag"),
    vgal.setting.new_bool("vgal-military", "ah"),

    -- vgal.setting.new_bool("vgal-circuits", "ah"),
    vgal.setting.new_bool("vgal-oil-recipes", "ai"),
    vgal.setting.new_bool("vgal-modules", "aj"),
    -- vgal.setting.new_bool("vgal-intermediates", "ah"),

    vgal.setting.new_bool("vgal-convoluted-recipes", "za", false),
    vgal.setting.new_bool("vgal-unsure-recipes", "zb", false),
    vgal.setting.new_bool("vgal-removed-recipes", "zc", false),
}

if mods["James-Oil-Processing"] then
    data.raw["bool-setting"]["vgal-oil-recipes"].hidden = true
end
