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

local ingredients_store = {
    ["t1"] = {
        { "electronic-circuit", 2 },
        { "iron-plate",         5 },
    },
    ["t2"] = {
        { "advanced-circuit", 5 },
        { "iron-gear-wheel",  15 },
        { "steel-plate",      10 },
    },
    ["t3"] = {
        { "processing-unit", 5 },
        { "iron-gear-wheel", 25 },
        { "steel-plate",     30 },
    },
}

-- fix recipes
local function process_expander_tiers(expander_list)
    for tier, expander_name in ipairs(expander_list) do
        local ingredients = table.deepcopy(ingredients_store["t" .. tier])
        if tier > 1 then
            table.insert(ingredients, { expander_list[tier - 1], 2 })
        end
        data.raw["recipe"][expander_name].ingredients = vgal.build.table(ingredients)
    end
end

process_expander_tiers(logistic_expanders)
process_expander_tiers(construction_expanders)
process_expander_tiers(relay_stations)

-- tweak port recipe
vgal.recipe.replace_ingredient("angels-cargo-hub", "stone-brick", "concrete")
vgal.tech.add_prerequisite("angels-construction-robots-3", "angels-stone-smelting-2")

-- buff charging speeds so they are better than roboports for purelly charging
for tier, relay_station_name in ipairs(relay_stations) do
    local relay_station = data.raw["roboport"][relay_station_name]

    local multiplier = 5 + ((tier - 1))

    relay_station.charging_energy = vgal.table.multiply_energy(relay_station.charging_energy, multiplier)

    if relay_station.energy_source and relay_station.energy_source.input_flow_limit then
        relay_station.energy_source.input_flow_limit = vgal.table.multiply_energy(
            relay_station.energy_source.input_flow_limit, multiplier)
    end
end

-- remove charging station as it has no purpose
vgal.data.trim("angels-charging-station")
vgal.data.deephide(data.raw["item"]["angels-charging-station"])
vgal.data.deephide(data.raw["roboport"]["angels-charging-station"])

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

if settings.startup["vgal-addonbots-buff-bots"].value then
    ---@param bot1 data.ConstructionRobotPrototype|data.LogisticRobotPrototype
    ---@param bot2 data.ConstructionRobotPrototype|data.LogisticRobotPrototype
    ---@param multiplier number
    local function process_bots(bot1, bot2, multiplier)
        bot1.speed = bot2.speed * multiplier
        -- bot1.energy_per_move = vgal.table.multiply_energy(bot2.energy_per_move, 1 / multiplier)
        -- bot1.energy_per_move = bot2.energy_per_move
        -- bot1.energy_per_tick = bot2.energy_per_tick
    end

    local c_multiplier = 13 / 8.6
    local l_multiplier = 10.8 / 4.3
    local t2l_multiplier = 2

    local v_c_bot = data.raw["construction-robot"]["construction-robot"]
    local v_l_bot = data.raw["logistic-robot"]["logistic-robot"]

    local a_c_bot = data.raw["construction-robot"]["angels-construction-robot"]
    local a_l_bot = data.raw["logistic-robot"]["angels-cargo-robot"]
    local a_t2l_bot = data.raw["logistic-robot"]["angels-cargo-robot-2"]

    process_bots(a_c_bot, v_c_bot, 1)
    process_bots(a_l_bot, v_l_bot, 1)

    process_bots(v_c_bot, v_c_bot, c_multiplier)
    process_bots(v_l_bot, v_l_bot, l_multiplier)

    process_bots(a_t2l_bot, a_t2l_bot, t2l_multiplier)
end
