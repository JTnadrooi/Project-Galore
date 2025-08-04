if not mods["bobassembly"] then return end

if settings.startup["bobmods-assembly-electronicmachines"].value then
    data.raw.recipe["vgal-holmium-solution-copper-cable"].category = "electronics"
end
