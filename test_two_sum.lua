local lu = require('luaunit')
local two_sum = require('two_sum')
local two_sum = two_sum.two_sum

-- Luaunit docs: https://luaunit.readthedocs.io/en/latest/
function test_basic()
    assert(two_sum({1,2,3}, 5) == 2, 3)
    assert(two_sum({1,2,3}, 5) == 2)
    _, second_val = two_sum({1,2,3}, 5)
    assert(second_val == 3)
end

function test_no_solution()
    assert(two_sum({1,2,3}, 99) == nil)
    assert(two_sum({1,2,3}, 99) == nil, nil)
end

local runner = lu.LuaUnit.new()
runner:setOutputType("text")
os.exit( runner:runSuite() )
