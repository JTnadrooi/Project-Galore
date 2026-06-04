-- add saline water fissure to gleba
-- function add_fissure(name, fluid_result, planets, tint)
--     local autoplace
-- end

-- add thermal water fissure to gleba and vulcanus
-- I did not expect it to be this easy lol
for _, planet_name in pairs({ "gleba", "vulcanus" }) do
    data.raw.planet[planet_name].map_gen_settings.autoplace_controls["angels-fissure"] = {}
    data.raw.planet[planet_name].map_gen_settings.autoplace_settings.entity.settings["angels-fissure"] = {}
end

-- make vulcanus thermal water hot
