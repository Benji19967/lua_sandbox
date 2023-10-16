hashset = require("hashset")
utils_files = require("utils_files")

-- tests the functions above
local file = 'two_sum_input.txt'
local lines = utils_files.lines_from(file)

function two_sum(nums_str, target)
    --[[ print(nums) ]]
    --[[ print(target) ]]
    seen = {}

    nums = {}
    for num in nums_str:gmatch("%S+") -- match all non-space characters
        do table.insert(nums, tonumber(num))
    end

    for _, num in ipairs(nums) do
        complement = target - num
        if hashset.setContains(seen, complement) then
            print(complement, num)
        else
            hashset.addToSet(seen, num)
        end
    end
end

two_sum(lines[1], lines[2])
