utils_files = require("utils_files")
two_sum_module = require("two_sum")

local file = 'two_sum_input.txt'
local lines = utils_files.lines_from(file)

function nums_from_str(nums_str)
    nums = {}
    for num in nums_str:gmatch("%S+") -- match all non-space characters
        do table.insert(nums, tonumber(num))
    end
    return nums
end

nums_str = lines[1]
target = lines[2]
nums = nums_from_str(nums_str)
print("Nums: " .. nums_str)
print("Target: " .. target)
val_1, val_2 = two_sum_module.two_sum(nums, target)
print("Matching pair: " .. val_1 .. " " .. val_2)
