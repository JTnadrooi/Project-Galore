function reload_recipes(event)
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

script.on_init(reload_recipes)
script.on_configuration_changed(reload_recipes)

commands.add_command(
    "recipes-reload",
    "Reload all recipes. (This happens automatically.)",
    reload_recipes
)
