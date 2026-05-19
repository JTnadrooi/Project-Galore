if not mods["angelsaddons-bots"] then return end

-- only reorder if boblogistics isnt enabled as boblogistics reorders the bots/roboports too
-- having bob logistic and bots addon both enabled is kinda silly tho
if not mods["boblogistics"] then
    data.raw["item"]["roboport"].order = "--b"
    data.raw["item"]["roboport"].subgroup = "angels-cargo-ports"
    data.raw["item"]["construction-robot"].order = "--c"
    data.raw["item"]["construction-robot"].subgroup = "angels-cargo-bots"
    data.raw["item"]["logistic-robot"].order = "--b"
    data.raw["item"]["logistic-robot"].subgroup = "angels-cargo-bots"
end

-- set data
-- missing the no extender charger as it has no zone (recipe needs fixing tho)
local port_expanders = {
    "angels-cargo-box",
    "angels-cargo-roboport",
    "angels-cargo-hub",
}
local logistic_expanders = {
    "angels-zone-expander",
    "angels-zone-expander-2",
    "angels-zone-expander-3",
}
local construction_expanders = {
    "angels-construction-zone-expander",
    "angels-construction-zone-expander-2",
    "angels-construction-zone-expander-3",
}
local relay_stations = {
    "angels-relay-station",
    "angels-relay-station-2",
    "angels-relay-station-3",
}

-- fix recipes so its not 4 items needed for the next tier
for tier, expander_name in ipairs(logistic_expanders) do
    if tier > 1 then
        vgal.recipe.set_ingredient_amount(expander_name, 1, logistic_expanders[tier - 1])
    end
end
for tier, expander_name in ipairs(construction_expanders) do
    if tier > 1 then
        vgal.recipe.set_ingredient_amount(expander_name, 1, construction_expanders[tier - 1])
    end
end
for tier, relay_station_name in ipairs(relay_stations) do
    if tier > 1 then
        vgal.recipe.set_ingredient_amount(relay_station_name, 1, relay_stations[tier - 1])
    end
end

-- fix half tile roboport ranges
-- / 2 because thats how it works
data.raw["roboport"]["angels-zone-expander-3"].logistics_radius = 35 / 2
data.raw["roboport"]["angels-relay-station-3"].logistics_radius = 35 / 2

for expander_name in vgal.table.iter_all(logistic_expanders, construction_expanders, relay_stations, port_expanders) do
    local expander = data.raw["roboport"][expander_name]

    expander.construction_radius = math.max(expander.construction_radius, expander.logistics_radius)
    expander.logistics_connection_distance = math.max(expander.construction_radius, expander.logistics_radius)
end

-- if angelsaddons-storage, add 2x2 logi chests to early robot techs
if mods["angelsaddons-storage"] then
    vgal.tech.move_recipe("logistic-system", "angels-cargo-robots-2", "angels-logistic-chest-buffer")
    vgal.tech.move_recipe("logistic-system", "angels-cargo-robots-2", "angels-logistic-chest-active-provider")
    vgal.tech.move_recipe("logistic-system", "angels-cargo-robots-2", "angels-logistic-chest-requester")

    table.insert(data.raw["technology"]["angels-cargo-robots-2"].effects, {
        type = "vehicle-logistics",
        modifier = true
    })
end

-- tech fixes that are not valid with boblogistics
if not mods["boblogistics"] then
    vgal.tech.add_prerequisite("logistic-system", "angels-cargo-robots-2")
    vgal.tech.add_prerequisite("construction-robotics", "angels-construction-robots")
    vgal.tech.add_prerequisite("logistic-robotics", "angels-cargo-robots")

    vgal.tech.remove_effect_with_type("logistic-robotics", "character-logistic-requests")
end

-- prevent huge trash slot count (+30 * 2)
for _, tech_name in ipairs({ "angels-cargo-robots", "logistic-robotics" }) do
    local tech = vgal.throw.if_tech_not_found(tech_name)

    for _, effect in ipairs(tech.effects or {}) do
        if effect.type == "character-logistic-trash-slots" then
            effect.modifier = 15
        end
    end
end
