-- setup; runs in data phase

for _, environment in pairs(vgal.defines.environments) do
    for _, plant_name in ipairs(environment.plants) do
        vgal.item.set_spoil_minutes(plant_name, 5)
        -- make_spoil(plant_name, 60)
    end
end

vgal.item.set_spoil_minutes("angels-bio-raw-meat", 10)
vgal.item.set_spoil_minutes("angels-alien-bacteria", 8)

vgal.item.set_spoil_minutes("angels-solid-nuts", 120)
vgal.item.set_spoil_minutes("angels-solid-pips", 90)
vgal.item.set_spoil_minutes("angels-solid-corn", 90)
vgal.item.set_spoil_minutes("angels-solid-beans", 60)
vgal.item.set_spoil_minutes("angels-solid-fruit", 40)

vgal.item.set_spoil_minutes("angels-seeded-dish", 2, "angels-substrate-dish")
vgal.item.set_spoil_minutes("angels-bio-alien-processed-meat", 10, "angels-bio-raw-meat")

vgal.item.set_spoil_minutes("angels-algae-green", 5)
vgal.item.set_spoil_minutes("angels-algae-brown", 10)
vgal.item.set_spoil_minutes("angels-algae-red", 15)
vgal.item.set_spoil_minutes("angels-algae-blue", 15)

for _, fish in pairs(vgal.defines.fish) do
    -- vgal.item.make_spoil_in(fish.name, 7550 / 60)
    vgal.item.set_spoil_minutes(fish.name, 60)
end

for _, puffer in pairs(vgal.defines.puffers) do
    vgal.item.set_spoil_minutes(puffer.name, 15)
    vgal.item.set_spoil_minutes(puffer.egg, 90)
end
