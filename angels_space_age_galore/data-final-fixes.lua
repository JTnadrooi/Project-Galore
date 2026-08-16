-- deduplicate fluids
---@type table<string, string>
local dedupe_map = {
    ["ammonia"] = "angels-gas-ammonia",
    ["fluorine"] = "angels-gas-hydrogen-fluoride",
    ["carbon"] = "angels-solid-carbon",
    ["molten-iron"] = "angels-liquid-molten-iron",
    ["molten-copper"] = "angels-liquid-molten-copper",
    ["angels-gas-compressed-air"] = "vgal-atm-nauvis",
}

for _, recipe in pairs(data.raw["recipe"]) do
    for _, ingredient in ipairs(recipe.ingredients or {}) do
        if dedupe_map[ingredient.name] then
            ingredient.name = dedupe_map[ingredient.name]
        end
    end

    for _, result in ipairs(recipe.results or {}) do
        if dedupe_map[result.name] then
            result.name = dedupe_map[result.name]
        end
    end

    if recipe.main_product and dedupe_map[recipe.main_product] then
        recipe.main_product = dedupe_map[recipe.main_product]
    end
end

for og_name, _ in pairs(dedupe_map) do
    vgal.data.hide(vgal.get_recipeable(og_name))
end

-- fix prereq of removed vanilla techs
for _, tech in pairs(data.raw["technology"]) do
    if tech.prerequisites then
        for i, prerequisite in ipairs(tech.prerequisites) do
            if prerequisite == "fish-breeding" then
                tech.prerequisites[i] = "angels-bio-refugium-fish-1"
                break
            end

            if prerequisite == "tree-seeding" then
                tech.prerequisites[i] = "angels-bio-arboretum-1"
                break
            end
        end
    end
end

-- create space vent voids
do
    ---@type table<string, boolean>
    local voidables = {}

    for _, recipe in pairs(data.raw["recipe"]) do
        if vgal.recipe.has_any_category(recipe, { "angels-chemical-void", "angels-water-void" }) then
            voidables[recipe.ingredients[1].name] = true
        end
    end

    for voidable_fluid_name, _ in pairs(voidables) do
        local voidable_fluid = data.raw["fluid"][voidable_fluid_name]

        vgal.data.extend({
            {
                name = "vgal-space-void-" .. voidable_fluid_name,
                domain = "vgal",
                icons = vgal.icon.register({
                    vgal.icon.get("vgal-space-vent"),
                    vgal.icon.get_in(voidable_fluid_name)
                }),
                energy_required = 1,
                enabled = true,
                fluid_ingredients = {
                    { voidable_fluid_name, 100 }
                },
                results = {
                    { "fish", 1 } -- gets removed later (below)
                },
                category = "vgal-space-venting",
                hide_from_signal_gui = true,
                hide_from_player_crafting = angelsmods.trigger.enable_hide_void,
                hidden = voidable_fluid.hidden,
                localised_name = { "", { "vgal-internal.vent" }, " ", vgal.locale.guess_locale(voidable_fluid_name) }
            },
        }, {
            type = "recipe",
        })

        data.raw["recipe"]["vgal-space-void-" .. voidable_fluid_name].results = {}
        data.raw["recipe"]["vgal-space-void-" .. voidable_fluid_name].main_product = nil
    end
end
