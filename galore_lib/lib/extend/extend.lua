---@type table<string, fun(input: any): {entry_type: string, domain_name: string, entry_name: string}?>
vgal.extend_handlers = {}

require("extend-handler-recipe")
require("extend-handler-toggle-group")

---@param entries vgal.VgalRecipePrototype[]|vgal.VgalToggleGroupPrototype[]
---@param fill_in_with? vgal.VgalRecipePrototype|vgal.VgalToggleGroupPrototype
function vgal.extend(entries, fill_in_with)
    fill_in_with = fill_in_with or {}

    for _, entry in ipairs(entries) do
        entry.vgal = entry.vgal or {}
        entry = vgal.table.deep_merge_with_priority(entry, fill_in_with)
        local extend_handler = vgal.extend_handlers[entry.type]
        if extend_handler then
            local domain_info = extend_handler(entry)

            if domain_info then
                if not vgal.domain_exists(domain_info.domain_name) then
                    vgal.create_domain(domain_info.domain_name)
                end
                vgal.domains[domain_info.domain_name].entries[domain_info.entry_name] = {
                    type = domain_info.entry_type,
                    name = domain_info.entry_name,
                }
            end
        else
            error("No prototype extend handler found for type '" .. entry.type .. "'. Source: '" .. entry.name .. "'")
        end
    end
end
