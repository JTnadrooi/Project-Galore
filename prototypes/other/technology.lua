-- behold.

vgal.tech.set_icon_directory("__vanilla_galore__/graphics/tech/")

vgal.data.extend {
    vgal.tech.create_empty("wood-processing", 1, { 1 }, 30, 30, { "automation" }),                                           -- just automatic wood + coal from wood
    vgal.tech.create_empty("wood-processing", 2, { 1, 2 }, 150, 30, {}),                                                     -- faster wood from mineral water
    vgal.tech.create_empty("wood-processing", 3, { 1, 2, 3, 4 }, 250, 60, { "advanced-oil-processing", "vgal-landfill-2" }), -- faster wood from landfill and petrogas from greenhouse
    vgal.tech.create_empty("wood-processing", 4, { 1, 2, 3, 4, 5 }, 1500, 60, { "kovarex-enrichment-process" }),             -- uranium wood

    vgal.tech.create_empty("biological-oil-processing", 1, { 1, 2 }, 125, 30, { "oil-processing", "vgal-wood-processing-2" }),
    vgal.tech.create_empty("biological-oil-processing", 2, { 1, 2, 3 }, 150, 30, { "advanced-oil-processing" }),

    vgal.tech.create_empty("biological-material-processing", 1, { 1 }, 25, 30, { "vgal-wood-processing-1", "electronics" }),
    vgal.tech.create_empty("biological-material-processing", 2, { 1, 2 }, 160, 30, { "advanced-electronics" }),

    vgal.tech.create_empty("biological-explosives", 1, { 1, 2 }, 150, 30, { "vgal-wood-processing-2", "explosives" }),

    vgal.tech.create_empty("biological-propellants", 1, { 1, 2, 3, 4 }, 380, 60, { "vgal-wood-processing-3", "rocket-fuel" }),

    vgal.tech.create_empty("sulfuric-intermediates", 1, { 1, 2 }, 200, 30, { "sulfur-processing" }),
    vgal.tech.create_empty("sulfuric-intermediates", 2, { 1, 2, 3 }, 280, 45, { "advanced-oil-processing" }),

    vgal.tech.create_empty("lesser-coal-liquefaction", 1, { 1, 2, 3 }, 90, 30, { "advanced-oil-processing" }),

    vgal.tech.create_empty("lubricated-intermediates", 1, { 1, 2, 3 }, 100, 30, { "lubricant" }),

    vgal.tech.create_empty("sulfuric-ammo", 1, { 1, 2, "military-science-pack" }, 200, 45, { "sulfur-processing" }),

    vgal.tech.create_empty("steel-processing", 2, { 1, 2 }, 50, 30, { "steel-processing" }),
    vgal.tech.create_empty("steel-processing", 3, { 1, 2, 3, 4 }, 250, 60, { "production-science-pack" }),

    vgal.tech.create_empty("alternative-logistics", 1, { 1 }, 50, 30, { "logistics", "steel-processing" }),
    vgal.tech.create_empty("alternative-logistics", 2, { 1, 2 }, 80, 30, { "logistics-2", "vgal-steel-processing-2", "plastics" }),
    vgal.tech.create_empty("alternative-logistics", 3, { 1, 2, 3, 4 }, 180, 60, { "logistics-3", "vgal-steel-processing-2" }),

    vgal.tech.create_empty("sulfuric-alternative-logistics", 1, { 1, 2, 3 }, 50, 30, { "vgal-alternative-logistics", "sulfur-processing" }),
    vgal.tech.create_empty("sulfuric-alternative-logistics", 2, { 1, 2, 3 }, 60, 30, { "vgal-alternative-logistics-2", "vgal-sulfuric-intermediates-2" }),
    vgal.tech.create_empty("sulfuric-alternative-logistics", 3, { 1, 2, 3, 4 }, 260, 60, { "vgal-alternative-logistics-3", "vgal-sulfuric-intermediates-2" }),

    vgal.tech.create_empty("analog-electronics", 1, { 1 }, 40, 15, { "electronics", "steel-processing" }),
    vgal.tech.create_empty("analog-electronics", 2, { 1, 2 }, 140, 30, { "advanced-electronics" }),
    vgal.tech.create_empty("analog-electronics", 3, { 1, 2, 3 }, 350, 30, { "advanced-electronics-2" }),

    vgal.tech.create_empty("alternative-robotics", 1, { 1, 2, 3 }, 150, 30, { "logistic-robotics", "construction-robotics", "vgal-sulfuric-intermediates-2" }),

    vgal.tech.create_empty("advanced-material-processing", 3, { 1, 2, 3, 4, 5 }, 550, 60, { "vgal-steel-processing-3", "vgal-sulfuric-intermediates-2", "advanced-material-processing-2" }),

    vgal.tech.create_empty("steel-military", 1, { 1 }, 40, nil, { "military", "steel-processing" }),
    vgal.tech.create_empty("alloy-smelting", 1, { 1, 2 }, 35, nil, { "advanced-material-processing" }),

    vgal.tech.create_empty("landfill", 2, { 1, 2 }, 60, nil, { "landfill" }),

    vgal.tech.create_empty("alternative-uranium", 1, { 1, 2, 3, 4 }, 400, nil, { "vgal-steel-processing-3", "uranium-processing" }),

    vgal.tech.create_empty("module-processing", 1, { 1, 2 }, 100, nil, { "speed-module", "effectivity-module", "productivity-module", "plastics" }),
    vgal.tech.create_empty("module-processing", 2, { 1, 2, 3 }, 200, nil, { "speed-module-2", "effectivity-module-2", "productivity-module-2", "electric-engine" }),
    vgal.tech.create_empty("module-processing", 3, { 1, 2, 3, 4 }, 400, nil, { "speed-module-3", "effectivity-module-3", "productivity-module-3", "vgal-steel-processing-3", "logistics-3" }),

    vgal.tech.create_empty("rocket-part-swarm", nil, { 1, 2, 3, 4, 5 }, 500, nil, { "vgal-alternative-robotics", "rocket-silo" }),
    vgal.tech.create_empty("rocket-part-nuclear", nil, { 1, 2, 3, 4, 5 }, 500, nil, { "vgal-alternative-uranium", "rocket-silo" }),
    vgal.tech.create_empty("rocket-part-electric", nil, { 1, 2, 3, 4, 5 }, 500, nil, { "battery-equipment", "rocket-silo" }),
}

vgal.tech.add_prerequisite("advanced-electronics-2", "vgal-module-processing-1")
vgal.tech.add_prerequisite("advanced-electronics-2", "vgal-sulfuric-intermediates-2")

vgal.tech.add_prerequisite("low-density-structure", "vgal-sulfuric-intermediates-2")

vgal.tech.add_prerequisite("space-science-pack", "vgal-advanced-material-processing-3")

vgal.tech.add_prerequisite("coal-liquefaction", "vgal-lesser-coal-liquefaction")


vgal.tech.add_prerequisite("coal-liquefaction", "vgal-lesser-coal-liquefaction")
vgal.tech.add_prerequisite("logistics-3", "rocket-fuel")
vgal.tech.add_prerequisite("effectivity-module", "vgal-wood-processing-2")
vgal.tech.add_prerequisite("landfill", "gate")
vgal.tech.add_prerequisite("gate", "railway")
vgal.tech.add_prerequisite("chemical-science-pack", "logistics-2")
vgal.tech.add_prerequisite("production-science-pack", "low-density-structure")
vgal.tech.add_prerequisite("utility-science-pack", "uranium-processing")
