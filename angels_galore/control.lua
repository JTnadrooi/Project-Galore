script.on_event(defines.events.on_tick, function(event) -- on_init doesn't work.
    fix_crash_site()
    script.on_event(defines.events.on_tick, nil)
end)

commands.add_command("vgal-fix-crash-site", "Replaces crash site entities with the vgal versions.", function()
    fix_crash_site()
end)

function fix_crash_site()
    for _, surface in pairs(game.surfaces) do -- just in case I forget to fix it when I eventually add space age support and someone starts on another surface.. just in case...
        for _, size in pairs({ "small", "medium", "big" }) do
            for i = 1, 6 do
                local original_name = "crash-site-spaceship-wreck-" .. size .. "-" .. i
                local new_name = "vgal-" .. original_name

                if prototypes.entity[original_name] then
                    local entities = surface.find_entities_filtered { position = { 0, 0 }, radius = 200, name = original_name }
                    for _, ent in pairs(entities) do
                        local position = ent.position
                        ent.destroy()
                        surface.create_entity {
                            name = new_name,
                            position = position
                        }
                    end
                end
            end
        end
    end
    game.print("All crash site wrecks replaced with vgal versions.")
end
