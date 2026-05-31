vgal.math = vgal.math or {}

---@param input_number number
---@return integer
function vgal.math.conserve_floor(input_number)
    local toret = math.floor(input_number)
    if toret == 0 then
        return 1
    end
    return toret
end

---@param result data.ProductPrototype
---@return number
function vgal.math.get_normalized_amount(result)
    local amount = 1

    if result.amount then
        amount = result.amount or 1
    elseif result.amount_min and result.amount_max then
        amount = (result.amount_min + result.amount_max) / 2
    end

    if result.probability then
        amount = amount * result.probability
    end
    return amount
end
