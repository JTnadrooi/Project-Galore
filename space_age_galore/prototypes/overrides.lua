-- doesnt override any base recipes dont worry
data.raw["recipe"]["copper-bacteria"].surface_conditions = nil
data.raw["recipe"]["copper-bacteria-cultivation"].surface_conditions = nil
data.raw["recipe"]["iron-bacteria"].surface_conditions = nil
data.raw["recipe"]["iron-bacteria-cultivation"].surface_conditions = nil

local function auto_barrel(fluidName)
    data.raw["fluid"][fluidName].auto_barrel = true
end

auto_barrel("holmium-solution")
auto_barrel("electrolyte")
auto_barrel("ammoniacal-solution")
auto_barrel("ammonia")
auto_barrel("fluorine")
auto_barrel("lithium-brine")
auto_barrel("thruster-oxidizer")
auto_barrel("thruster-fuel")

data.raw["assembling-machine"]["crusher"].surface_conditions = nil
