for machine_name, max_tier in pairs(vgal.defines.machine_max_tiers) do
    for i = 1, 5 do
        local actual_name = (i == 1) and machine_name or (machine_name .. "-" .. i)

        ---@type data.CraftingMachinePrototype
        local machine = data.raw["assembling-machine"][actual_name] or data.raw["furnace"][actual_name]

        if machine then
            local machine_size = vgal.entity.get_size(machine)

            local heating_energy_kw = 100
            if machine_size > 4 then
                heating_energy_kw = 150
            elseif machine_size > 3 then
                heating_energy_kw = 120
            elseif machine_size < 3 then
                heating_energy_kw = 50
            end

            machine.heating_energy = heating_energy_kw .. "kW"
        end
    end
end

data.raw["mining-drill"]["angels-thermal-bore"].heating_energy = "500kW"
data.raw["assembling-machine"]["angels-crop-farm"].heating_energy = "100kW"
data.raw["assembling-machine"]["angels-bio-refugium-fish"].heating_energy = "250kW"
data.raw["assembling-machine"]["angels-bio-refugium-puffer"].heating_energy = "100kW"
data.raw["assembling-machine"]["angels-bio-refugium-biter"].heating_energy = "150kW"
data.raw["assembling-machine"]["angels-seed-extractor"].heating_energy = "100kW"
data.raw["assembling-machine"]["angels-bio-arboretum-1"].heating_energy = "100kW"
data.raw["assembling-machine"]["angels-bio-generator-temperate-1"].heating_energy = "100kW"
data.raw["assembling-machine"]["angels-bio-generator-swamp-1"].heating_energy = "100kW"
data.raw["assembling-machine"]["angels-bio-generator-desert-1"].heating_energy = "100kW"
data.raw["assembling-machine"]["angels-bio-processor"].heating_energy = "100kW"
data.raw["assembling-machine"]["angels-cooling-tower"].heating_energy = "100kW"
data.raw["furnace"]["angels-flare-stack"].heating_energy = "100kW"
data.raw["furnace"]["angels-clarifier"].heating_energy = "100kW"
data.raw["furnace"]["angels-bio-butchery"].heating_energy = "100kW"
data.raw["furnace"]["angels-bio-hatchery"].heating_energy = "100kW"
data.raw["assembling-machine"]["angels-nutrient-extractor"].heating_energy = "100kW"
data.raw["assembling-machine"]["angels-bio-press"].heating_energy = "100kW"
data.raw["furnace"]["angels-composter"].heating_energy = "100kW"

for _, environment in pairs(vgal.defines.environments) do
    data.raw["assembling-machine"][environment.farm].heating_energy = "200kW"
end

data.raw["assembling-machine"]["angels-ore-refinery"].heating_energy = "300kW"

if not mods["reskins-angels"] then
    data.raw["assembling-machine"]["chemical-plant"].graphics_set.frozen_patch = nil -- it doesnt line up with the angel's texture
end
