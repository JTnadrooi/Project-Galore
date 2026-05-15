if not mods["bobmodules"] then return end

for _, module in pairs(vgal.defines.modules) do
    for _, tiered_module_name in ipairs(module.tiers) do
        data.raw["module"][tiered_module_name].subgroup = module.name
    end
end

data.raw["item"]["beacon"].subgroup = "module-beacon"
