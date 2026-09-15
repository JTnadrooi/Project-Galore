-- high temp oil processing
local ht_oil_temp = settings.startup["vgal-high-temp-oil-processing-temp"].value --[[@as "any"|"165"|"500"]]

if ht_oil_temp ~= "any" then
    ---@diagnostic disable-next-line: cast-local-type, param-type-mismatch
    ht_oil_temp = tonumber(ht_oil_temp) --[[@as 165|500]]
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
