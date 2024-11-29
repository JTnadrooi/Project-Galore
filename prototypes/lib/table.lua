function vgal.table.slow_contains(table, value)
    for _, value2 in ipairs(table) do
        if value2 == value then
            return true
        end
    end
    return false
end