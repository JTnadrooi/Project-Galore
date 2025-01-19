function vgal.math.conserve_floor(inputNum)
    local toret = math.floor(inputNum)
    if toret == 0 then
        return 1
    else
        return toret
    end
end

function vgal.math.gcd(a, b)
    while b ~= 0 do
        a, b = b, a % b
    end
    return a
end

function vgal.math.lcm(a, b)
    return (a * b) / vgal.math.gcd(a, b)
end
