asagal = asagal or {}


for _, plant in pairs(sagal.defines.gleba_plants) do
    plant.dormant_seed = "vgal-" .. plant.seed .. "-dormant"
end
