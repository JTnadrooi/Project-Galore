function vgal.fluid.unhide(fluidName)
    data.raw["fluid"][fluidName].hidden = false
end
function vgal.fluid.hide(fluidName)
    data.raw["fluid"][fluidName].hidden = true
end