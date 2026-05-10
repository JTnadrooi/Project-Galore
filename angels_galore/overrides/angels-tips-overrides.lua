-- fix removed ore in tips
for _, tnt_name in ipairs({ "low-power", "entity-transfers" }) do
    local tnt = data.raw["tips-and-tricks-item"][tnt_name]
    if tnt then
        if tnt.simulation and tnt.simulation.init then
            tnt.simulation.init, _ = string.gsub(tnt.simulation.init, "angels%-ore1", "angels-ore3")
        end
    end
end

-- the actual removing of tips and tricks items is done in final fixes, it mostly doesn't listen here
