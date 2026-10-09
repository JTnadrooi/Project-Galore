if not mods["angelsaddons-storage"] then return end

-- fix techs
for _, post_network_tech_name in ipairs({ "angels-logistic-silos", "angels-logistic-warehouses" }) do
    vgal.tech.remove_ingredient(post_network_tech_name, "utility-science-pack")
    vgal.tech.remove_prerequisite(post_network_tech_name, "utility-science-pack")
end

for _, warehouse_name in ipairs({
    "angels-warehouse",
    "angels-warehouse-active-provider",
    "angels-warehouse-passive-provider",
    "angels-warehouse-storage",
    "angels-warehouse-buffer",
    "angels-warehouse-requester",
}) do
    vgal.item.set_rocket_capacity(warehouse_name, 5)
end

data.raw["storage-tank"]["angels-storage-tank-1"].heating_energy = "200kW"
data.raw["storage-tank"]["angels-storage-tank-2"].heating_energy = "100kW"
data.raw["storage-tank"]["angels-storage-tank-3"].heating_energy = "50kW"
data.raw["storage-tank"]["angels-pressure-tank-1"].heating_energy = "250kW"
