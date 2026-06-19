-- PLANET LOCKING
-- vulcanus
vgal.tech.add_prerequisite("angels-ore-processing-2", "metallurgic-science-pack")

-- gleba
vgal.tech.add_prerequisite("angels-bio-refugium-hatchery", "agricultural-science-pack")
vgal.tech.add_prerequisite("angels-bio-refugium-fish-1", "agricultural-science-pack")

vgal.data.deephide(data.raw["technology"]["tree-seeding"])
vgal.data.deephide(data.raw["technology"]["fish-breeding"])

-- fulgora
vgal.tech.add_prerequisite("angels-advanced-gas-processing", "electromagnetic-science-pack")

local cache_space_sp = {}
local cache_agri_sp = {}
local cache_metal_sp = {}
local cache_elec_sp = {}

for _, tech in pairs(data.raw["technology"]) do
    if vgal.is_angels(tech) then
        if tech.unit and tech.unit.ingredients then
            if vgal.tech.has_prerequisite_recursive(cache_space_sp, tech.name, "space-science-pack") then
                vgal.tech.ensure_unit_ingredient(tech.name, "space-science-pack")
                vgal.tech.ensure_unit_ingredient(tech.name, "chemical-science-pack")
            end
            if vgal.tech.has_prerequisite_recursive(cache_agri_sp, tech.name, "agricultural-science-pack") then
                table.insert(tech.unit.ingredients, { "agricultural-science-pack", 1 })
            end
            if vgal.tech.has_prerequisite_recursive(cache_metal_sp, tech.name, "metallurgic-science-pack") then
                table.insert(tech.unit.ingredients, { "metallurgic-science-pack", 1 })
            end
            if vgal.tech.has_prerequisite_recursive(cache_elec_sp, tech.name, "electromagnetic-science-pack") then
                table.insert(tech.unit.ingredients, { "electromagnetic-science-pack", 1 })
            end
        end
    end
end
