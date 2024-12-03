local bit = require "bit"

local wires = {}

local cache = {}

local function eval(thing)
  if not cache[thing] then
    cache[thing] = tonumber(thing) or tonumber(wires[thing]) or wires[thing]()
  end
  return cache[thing]
end

local operations = {
  ["^%w+$"] = function(wire)
    return eval(wire)
  end,
  ["^%d+$"] = function(number)
    return tonumber(number)
  end,
  ["NOT (.+)"] = function(operand)
    return bit.band(bit.bnot(eval(operand)), 0xffff)
  end,
  ["(.+) AND (.+)"] = function(lhs, rhs)
    return bit.band(eval(lhs), eval(rhs))
  end,
  ["(.+) OR (.+)"] = function(lhs, rhs)
    return bit.bor(eval(lhs), eval(rhs))
  end,
  ["(.+) LSHIFT (.+)"] = function(lhs, rhs)
    return bit.band(bit.lshift(eval(lhs), eval(rhs)), 0xffff)
  end,
  ["(.+) RSHIFT (.+)"] = function(lhs, rhs)
    return bit.band(bit.rshift(eval(lhs), eval(rhs)), 0xffff)
  end,
}

for l in io.lines("input") do
  local input, output = l:match("(.-) %-> (.+)")
  for pattern, f in pairs(operations) do
    local a, b = input:match(pattern)
    if a then
      wires[output] = function()
        return f(a, b)
      end
    end
  end
end

wires["b"] = wires["a"]()

cache = {}

print(wires["a"]())
