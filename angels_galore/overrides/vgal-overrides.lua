-- trim unsavable recipes
vgal.data.trim("vgal-petroleum-gas-rocket-fuel")
vgal.data.trim("vgal-plastic-bar-lubricant")
vgal.data.trim("vgal-coal-sulfur")
vgal.data.trim("vgal-steam-sulfur")
vgal.data.trim("vgal-steam-concrete")
vgal.data.trim("vgal-iron-stick-concrete")
vgal.data.trim("vgal-copper-cable-plastic-bar")
vgal.data.trim("vgal-crude-oil-coal")

-- trim out-of-place-ified recipes
vgal.data.trim("vgal-coal-uranium-235-nuclear-fuel")
vgal.data.trim("vgal-low-density-structure-uranium-fuel-cell")

-- wood circuits too OP
vgal.data.trim("vgal-wood-electronic-circuit")
vgal.data.trim("vgal-wood-heavy-oil-electronic-circuit")

if settings.startup["vgal-remove-steel-intermediate-crafting"].value then
    vgal.data.trim("vgal-steel-plate-iron-gear-wheel")
    vgal.data.trim("vgal-steel-plate-iron-stick")
end
