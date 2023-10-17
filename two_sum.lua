hashset = require("hashset")
utils_files = require("utils_files")

local lu = require('luaunit')

local file = 'two_sum_input.txt'
local lines = utils_files.lines_from(file)

function nums_from_str(nums_str)
    nums = {}
    for num in nums_str:gmatch("%S+") -- match all non-space characters
        do table.insert(nums, tonumber(num))
    end
    return nums
end

function two_sum(nums, target)
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

nums_str = lines[1]
target = lines[2]
nums = nums_from_str(nums_str)
print("Nums: " .. nums_str)
print("Target: " .. target)
val_1, val_2 = two_sum(nums, target)
print("Matching pair: " .. val_1 .. " " .. val_2)

-- Luaunit docs: https://luaunit.readthedocs.io/en/latest/
function test_basic()
    assert(two_sum({1,2,3}, 5) == 2, 3)
    assert(two_sum({1,2,3}, 5) == 2)
    _, second_val = two_sum({1,2,3}, 5)
    assert(second_val == 3)
end

function test_no_solution()
    assert(two_sum({1,2,3}, 6) == nil)
    assert(two_sum({1,2,3}, 6) == nil, nil)
end

local runner = lu.LuaUnit.new()
runner:setOutputType("text")
os.exit( runner:runSuite() )
