-- need water for steam for carbon
vgal.tech.move_recipe("space-platform-thruster", "space-platform", "ice-melting")

-- PLANET LOCKING
-- vulcanus
vgal.tech.add_prerequisite("angels-ore-processing-2", "metallurgic-science-pack")

-- fix tungsten techs
data.raw["technology"]["angels-tungsten-smelting-1"].prerequisites = { "planet-discovery-vulcanus" }
data.raw["technology"]["angels-tungsten-smelting-2"].prerequisites = { "angels-tungsten-smelting-1", "metallurgic-science-pack" }
data.raw["technology"]["angels-tungsten-smelting-3"].prerequisites = { "angels-tungsten-smelting-2", "production-science-pack" }
data.raw["technology"]["tungsten-carbide"].prerequisites = { "angels-tungsten-smelting-1" }
vgal.tech.add_prerequisite("tungsten-steel", "angels-tungsten-smelting-1")

data.raw["technology"]["angels-tungsten-smelting-1"].unit = nil
data.raw["technology"]["angels-tungsten-smelting-1"].research_trigger = table.deepcopy(data.raw["technology"]["tungsten-carbide"].research_trigger)

data.raw["technology"]["tungsten-carbide"].research_trigger = {
    type = "craft-item",
    item = "angels-powder-tungsten",
}

vgal.tech.remove_ingredient("angels-tungsten-smelting-2", "production-science-pack")
vgal.tech.remove_ingredient("angels-tungsten-smelting-2", "utility-science-pack")
vgal.tech.remove_ingredient("angels-tungsten-smelting-3", "utility-science-pack")
-- vgal.tech.add_ingredient("angels-tungsten-smelting-2", "metallurgic-science-pack")


-- gleba
vgal.tech.add_prerequisite("angels-bio-refugium-hatchery", "planet-discovery-gleba")
vgal.tech.add_prerequisite("angels-bio-refugium-fish-1", "agriculture")
vgal.tech.add_prerequisite("angels-bio-processing-alien-1", "agricultural-science-pack")
vgal.tech.add_prerequisite("angels-bio-processing-crystal-splinter-1", "agricultural-science-pack")
vgal.tech.add_prerequisite("angels-bio-refugium-puffer-1", "agriculture")
vgal.tech.add_prerequisite("angels-bio-refugium-puffer-3", "agricultural-science-pack")
vgal.tech.add_prerequisite("angels-bio-refugium-biter-1", "biter-egg-handling")

-- for _, environment in pairs(vgal.defines.environments) do
--     vgal.tech.add_prerequisite("angels-bio-" .. environment.name .. "-farm", "carbon-fiber")
-- end

vgal.tech.add_prerequisite("planet-discovery-gleba", "angels-bio-nutrient-paste")
vgal.tech.add_unit("planet-discovery-gleba", "vgal-biological-science-pack")

vgal.tech.hide("tree-seeding")
vgal.tech.hide("fish-breeding")

-- fulgora
vgal.tech.add_prerequisite("angels-advanced-gas-processing", "electromagnetic-science-pack")

-- remove puffer atm from puffer 1 as it gets unlocked later
-- puffer from gleba atm early tho
vgal.tech.remove_recipe("angels-bio-refugium-puffer-1", "angels-gas-puffer-atmosphere")

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

    if vgal.tech.has_unit_ingredient(tech.name, "agricultural-science-pack") then
        vgal.tech.ensure_unit_ingredient(tech.name, "vgal-biological-science-pack")
    end
end
