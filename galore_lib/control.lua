local function reload_recipes(event)
    for _, force in pairs(game.forces) do
        for _, tech in pairs(force.technologies) do
            if tech.researched then
                for _, effect in pairs(tech.prototype.effects) do
                    if effect.type == "unlock-recipe" then
                        force.recipes[effect.recipe].enabled = true
                    end
                end
            end
        end
    end
end

local function research_tech_nodes(event)
    local forces = {}

    if event.research and event.research.force then
        table.insert(forces, event.research.force)
    else
        for _, force in pairs(game.forces) do
            table.insert(forces, force)
        end
    end

    for _, force in ipairs(forces) do
        for _, tech in pairs(force.technologies) do
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
    end
end

script.on_init(reload_recipes)
script.on_configuration_changed(reload_recipes)

commands.add_command(
    "recipes-reload",
    "Reload all recipes. (This happens automatically.)",
    reload_recipes
)

if settings.startup["vgal-auto-research-tech-nodes"].value then
    script.on_init(research_tech_nodes)
    script.on_configuration_changed(research_tech_nodes)
    script.on_event(defines.events.on_research_finished, research_tech_nodes)
end
