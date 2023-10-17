hashset = require("hashset")

local two_sum = {}

function two_sum.two_sum(nums, target)
    -- returning multiple values from a function: 
    -- https://stackoverflow.com/questions/63044739/functions-that-return-multiple-values-lua

    seen = {}
    for _, num in ipairs(nums) do
        complement = target - num
        if hashset.setContains(seen, complement) then
            return complement, num
        else
            hashset.addToSet(seen, num)
        end
    end
end

return two_sum
