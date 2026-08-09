---@param recipeable_name string
---@param fuel_value_megajoules number
local function make_burnable(recipeable_name, fuel_value_megajoules)
    local recipeable = vgal.get_recipeable(recipeable_name)

    recipeable.fuel_value = fuel_value_megajoules .. "MJ"
    recipeable.fuel_category = "chemical"
end

data.raw["item"]["angels-coal-crushed"].fuel_value = "2.5MJ"
data.raw["item"]["angels-solid-coke"].fuel_value = "3.5MJ"
data.raw["item"]["angels-pellet-coke"].fuel_value = "18MJ"
data.raw["item"]["solid-fuel"].fuel_value = "12MJ"
data.raw["item"]["angels-cellulose-fiber"].fuel_value = "0.5MJ"
data.raw["item"]["angels-wood-pellets"].fuel_value = "2.4MJ" -- +20%
data.raw["item"]["angels-wood-bricks"].fuel_value = "8MJ"    -- +60%
data.raw["item"]["angels-wood-charcoal"].fuel_value = "3MJ"

data.raw["item"]["coal"].fuel_emissions_multiplier = 1.5
data.raw["item"]["angels-coal-crushed"].fuel_emissions_multiplier = 1.2
data.raw["item"]["angels-solid-carbon"].fuel_emissions_multiplier = 0.75
data.raw["item"]["solid-fuel"].fuel_emissions_multiplier = 0.8
data.raw["item"]["nuclear-fuel"].fuel_emissions_multiplier = 0.1
data.raw["item"]["angels-nuclear-fuel"].fuel_emissions_multiplier = 0.05
data.raw["item"]["angels-nuclear-fuel-2"].fuel_emissions_multiplier = 0.01

-- petrochem
make_burnable("angels-solid-oil-residual", 3)

-- bio
make_burnable("angels-algae-green", 0.05)
make_burnable("angels-algae-brown", 0.08)
make_burnable("angels-algae-red", 0.05)
make_burnable("angels-algae-blue", 0.25)
make_burnable("angels-red-cellulose-fiber", 0.1)
make_burnable("angels-blue-cellulose-fiber", 0.75) -- 10 algae from ~1 coal, so this is a good deal

make_burnable("angels-tree-seed", 0.2)
make_burnable("angels-solid-leafs", 0.25)

make_burnable("angels-biter-small-egg", 4)
make_burnable("angels-biter-medium-egg", 5)
make_burnable("angels-biter-big-egg", 6)

for i = 1, 5 do
    make_burnable("angels-bio-puffer-egg-" .. i, math.min(i, 4))
end

for _, environment in pairs(vgal.defines.environments) do
    for _, plant_name in ipairs(environment.plants) do
        make_burnable(plant_name, 0.15)
    end
    for _, plant_name in ipairs(environment.seeds) do
        make_burnable(plant_name, 0.2)
    end
    make_burnable(environment.garden, 4)
end
