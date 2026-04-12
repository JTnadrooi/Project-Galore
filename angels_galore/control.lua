script.on_init(function()
    script.on_event(defines.events.on_tick, function(event) -- just on_init doesn't work.
        fix_crash_site()
        script.on_event(defines.events.on_tick, nil)
    end)
end)

commands.add_command("vgal-fix-crash-site", "Replaces crash site entities with the vgal versions.", function()
    fix_crash_site()
end)

function fix_crash_site()
    for _, surface in pairs(game.surfaces) do -- just in case I forget to fix it when I eventually add space age support and someone starts on another surface.. just in case...
        function process_entity(entity_name)
            local new_name = "vgal-" .. entity_name
            local entities = surface.find_entities_filtered { position = { 0, 0 }, radius = 200, name = entity_name }
            for _, ent in pairs(entities) do
                local position = ent.position
                ent.destroy()
                surface.create_entity {
                    name = new_name,
                    position = position
                }
            end
        end

        for _, size in pairs({ "small", "medium", "big" }) do
            for i = 1, 6 do
                local original_name = "crash-site-spaceship-wreck-" .. size .. "-" .. i

                if prototypes.entity[original_name] then
                    process_entity(original_name)
                end
            end
        end

        process_entity("crash-site-spaceship")
    end
    game.print("All crash site wrecks replaced with vgal versions.")
end
