vgal.string = vgal.string or {}

---@param str string
---@param prefix string
---@return boolean
function vgal.string.starts_with(str, prefix)
    return string.sub(str, 1, #prefix) == prefix
end

---@param str string
---@param target string
---@param replacement string
---@return string
function vgal.string.replace(str, target, replacement)
    local result = str:gsub(target:gsub("(%W)", "%%%1"), replacement)
    return (result) -- gets rid of the second return value maybe
end

---@param str string
---@param suffix string
---@return boolean
function vgal.string.ends_with(str, suffix)
    return suffix == "" or string.sub(str, - #suffix) == suffix
end
