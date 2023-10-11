hashset = require("hashset")

-- http://lua-users.org/wiki/FileInputOutput
-- see if the file exists
function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

-- get all lines from a file, returns an empty 
-- list/table if the file does not exist
function lines_from(file)
  if not file_exists(file) then return {} end
  local lines = {}
  for line in io.lines(file) do 
    lines[#lines + 1] = line
  end
  return lines
end

-- tests the functions above
local file = 'two_sum_input.txt'
local lines = lines_from(file)

-- print all line numbers and their contents
--[[ for k,v in pairs(lines) do ]]
--[[   print('line[' .. k .. ']', v) ]]
--[[ end ]]


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
