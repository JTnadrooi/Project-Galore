vgal.string = vgal.string or {}

---@param str string
---@param prefix string
---@return boolean
function vgal.string.starts_with(str, prefix)
    return string.sub(str, 1, #prefix) == prefix
end
