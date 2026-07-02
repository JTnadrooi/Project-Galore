-- high temp oil processing
local ht_oil_temp = settings.startup["vgal-high-temp-oil-processing-temp"].value --[[@as "Any"|"165C"|"500C"]]

if ht_oil_temp ~= "Any" then
    ---@diagnostic disable-next-line: cast-local-type, param-type-mismatch
    ht_oil_temp = tonumber(ht_oil_temp:match("%d+"))
    if ht_oil_temp then
        data.raw["recipe"]["vgal-steam-light-oil-petroleum-gas"].ingredients[1].minimum_temperature = ht_oil_temp
        data.raw["recipe"]["vgal-steam-heavy-oil-light-oil"].ingredients[1].minimum_temperature = ht_oil_temp
        data.raw["recipe"]["vgal-steam-sulfur"].ingredients[1].minimum_temperature = ht_oil_temp
        data.raw["recipe"]["vgal-steam-advanced-oil-processing"].ingredients[1].minimum_temperature = ht_oil_temp
    end
    if settings.startup["vgal-high-temp-oil-processing-temp-coal-liquefaction"].value then
        data.raw["recipe"]["coal-liquefaction"].ingredients[3].minimum_temperature = ht_oil_temp
    end
end

if mods["quality"] then
    -- quality upgrades
    local q_upgrades_mode = settings.startup["vgal-quality-upgrades-mode"].value --[[@as "Disabled"|"Replace"|"Add"]]
    local q_upgrades_result_probablity = settings.startup["vgal-quality-upgrades-result-probability"].value --[[@as number?]]

    if q_upgrades_result_probablity == 1 then
        q_upgrades_result_probablity = nil
    end

    if q_upgrades_mode ~= "Disabled" then
        ---@param recipe data.RecipePrototype
        ---@return data.RecipePrototype
        function get_q_recipe_from(recipe)
            local q_recipe = table.deepcopy(recipe)

            -- change name
            -- only change name if adding, else it will replace when extended
            if q_upgrades_mode == "Add" then
                q_recipe.name = "vgal-quality-upgrade" .. q_recipe.name:sub(5)
            end

            -- reduce output
            for _, result in ipairs(q_recipe.results) do
                if result.name == q_recipe.main_product then
                    result.independent_probability = q_upgrades_result_probablity -- will be nil if setting is 1
                    result.quality_change = 1

                    -- if result.amount * result.independent_probability == math.floor(result.amount * result.independent_probability) then
                    --     result.amount = result.amount * result.independent_probability
                    --     result.independent_probability = nil
                    -- end
                end
            end

            -- add quality-upgrade icon
            vgal.icon.ensure_icons(q_recipe --[[@as vgal.PrototypeWithIcons]])
            table.insert(q_recipe.icons, {
                icon = "__vanilla_galore_continued__/graphics/icons/quality-upgrade.png",
            })

            -- fix order so its placed after the normal recipes
            local q_recipe_order_data = vgal.subgroup.get_order_or_guess(q_recipe)
            q_recipe.order = q_recipe_order_data.order .. "-x[quality-upgrade]"

            -- prepend quality-upgrade locale
            q_recipe.localised_name = { "", { "vgal-internal.quality-upgrade" }, ": ", vgal.recipe.get_preferred_localised_name(q_recipe) }

            return q_recipe
        end

        local upgrade_recipes = {
            ["vgal-electric-engine-unit-electric-mining-drill"] = true,
            ["vgal-steel-plate-boiler"] = true,
            ["vgal-steel-plate-accumulator"] = true,
            ["vgal-electric-engine-assembling-machine-1"] = true,
            ["vgal-electric-engine-assembling-machine-2"] = true,
            ["vgal-explosives-grenade"] = true,
            ["vgal-coal-uranium-235-nuclear-fuel"] = true,
            ["vgal-plastic-bar-repair-pack"] = true,
        }

        if vgal.defines.flags["sagal"] then
            upgrade_recipes["vgal-pentapod-egg-construction-robot"] = true
            upgrade_recipes["vgal-pentapod-egg-logistic-robot"] = true
            upgrade_recipes["vgal-ammonia-artificial-jellynut-soil"] = true
            upgrade_recipes["vgal-ammonia-artificial-yumako-soil"] = true
            upgrade_recipes["vgal-ammonia-agricultural-science-pack"] = true
            upgrade_recipes["vgal-lithium-plate-low-density-structure"] = true
            upgrade_recipes["vgal-holmium-solution-copper-cable"] = true
            upgrade_recipes["vgal-holmium-plate-railgun-ammo"] = true

            upgrade_recipes["vgal-tungsten-plate-piercing-rounds-magazine"] = true
            upgrade_recipes["vgal-tungsten-plate-piercing-shotgun-shell"] = true
            upgrade_recipes["vgal-tungsten-plate-cannon-shell"] = true
            upgrade_recipes["vgal-tungsten-plate-explosive-cannon-shell"] = true
            upgrade_recipes["vgal-tungsten-carbide-burner-mining-drill"] = true
            upgrade_recipes["vgal-tungsten-carbide-electric-mining-drill"] = true

            upgrade_recipes["vgal-tungsten-carbide-speed-module"] = true
            upgrade_recipes["vgal-tungsten-carbide-speed-module-2"] = true
            upgrade_recipes["vgal-spoilage-efficiency-module"] = true
            upgrade_recipes["vgal-spoilage-efficiency-module-2"] = true
            upgrade_recipes["vgal-biter-egg-productivity-module"] = true
            upgrade_recipes["vgal-biter-egg-productivity-module-2"] = true

            if mods["quality"] then
                upgrade_recipes["vgal-superconductor-quality-module"] = true
                upgrade_recipes["vgal-superconductor-quality-module-2"] = true
            end

            upgrade_recipes["vgal-lithium-battery"] = true
upgrade_recipes["vgal-pentapod-egg-plastic-bar"] = true
        end

        local q_recipe_map = {}

        for _, recipe in vgal.data.domain_pairs("vgal", "recipe") do
            if vgal.string.starts_with(recipe.name, "vgal-low-density-structure") or
                vgal.string.starts_with(recipe.name, "vgal-advanced-circuit") or
                vgal.string.starts_with(recipe.name, "vgal-processing-unit") then
                upgrade_recipes[recipe.name] = true
                goto continue
            end
            if vgal.string.ends_with(recipe.main_product, "-science-pack") and
                (vgal.recipe.get_main_product_amount(recipe) > (vgal.recipe.get_main_product_amount(data.raw["recipe"][recipe.main_product], true) + 1))
            then
                upgrade_recipes[recipe.name] = true
                goto continue
            end
            ::continue::
        end

        for recipe_name, _ in pairs(upgrade_recipes) do
            local recipe = data.raw["recipe"][recipe_name] or error(recipe_name)
            local q_recipe = get_q_recipe_from(recipe)
            data:extend({ q_recipe })
            q_recipe_map[recipe_name] = q_recipe.name
        end

        if q_upgrades_mode == "Add" then
            for _, tech in pairs(data.raw["technology"]) do
                for _, effect in ipairs(tech.effects or {}) do
                    if effect.type == "unlock-recipe" and q_recipe_map[effect.recipe] then
                        table.insert(tech.effects, {
                            type = "unlock-recipe",
                            recipe = q_recipe_map[effect.recipe]
                        })
                    end
                end
            end
        end
    end
end
