local function make_spoil(item_name, spoil_minutes, spoil_result)
    local item = vgal.get_recipeable(item_name)

    item.spoil_ticks = spoil_minutes * 3600
    item.spoil_result = spoil_result or "spoilage"
end

for _, environment in pairs(vgal.defines.environments) do
    for _, plant_name in ipairs(environment.plants) do
        make_spoil(plant_name, 5)
        -- make_spoil(plant_name, 60)
    end
end

make_spoil("angels-bio-raw-meat", 10)
make_spoil("angels-alien-bacteria", 8)

make_spoil("angels-solid-nuts", 120)
make_spoil("angels-solid-pips", 90)
make_spoil("angels-solid-corn", 90)
make_spoil("angels-solid-beans", 60)
make_spoil("angels-solid-fruit", 40)

make_spoil("angels-seeded-dish", 2, "angels-substrate-dish")
make_spoil("angels-bio-alien-processed-meat", 10, "angels-bio-raw-meat")

data.raw["capsule"]["raw-fish"].spoil_result = nil
data.raw["capsule"]["raw-fish"].spoil_level = nil
data.raw["capsule"]["raw-fish"].spoil_ticks = nil
data.raw["capsule"]["raw-fish"].spoil_to_trigger_result = nil
