if settings.startup["vgal-auto-research-tech-nodes"].value then
    script.on_event(defines.events.on_research_finished, function(event)
        for _, tech in pairs(event.research.force.technologies) do
            if tech.researched then
                goto not_this_tech
            end
            for _, prerequisite in pairs(tech.prerequisites) do
                if not prerequisite.researched then
                    goto not_this_tech
                end
            end
            if not string.match(tech.name, "^vgal-.*node[0-9]$") then
                goto not_this_tech
            end

            tech.researched = true

            ::not_this_tech::
        end
    end)
end
