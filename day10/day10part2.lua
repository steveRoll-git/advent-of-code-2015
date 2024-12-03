local atoms = require "atoms"
local evolutions = require "evolutions"

local atomLengths = {}
for n, a in pairs(atoms) do
  atomLengths[a] = #n
end

local function atomize(str)
  local bestAtom, bestAtomContent, bestLength = nil, nil, 0
  -- find best atom for the input
  for number, atom in pairs(atoms) do
    if #number > bestLength and str:find(number) then
      bestAtom = atom
      bestAtomContent = number
      bestLength = #number
    end
  end
  if not bestAtom then
    return { str }
  end
  local result = { bestAtom }
  if #bestAtomContent < #str then
    for _, other in ipairs(atomize(str:sub(#bestAtomContent + 1))) do
      table.insert(result, other)
    end
  end
  return result
end

-- my input happened to be an atom, so I didn't need to use this function - however if the input has non-atoms, this may be needed
local function lookAndSayString(str)
  local result = ""
  local last = str:sub(1, 1)
  local count = 1
  for i = 2, #str do
    if str:sub(i, i) ~= last then
      result = result .. count .. last
      count = 0
    end
    last = str:sub(i, i)
    count = count + 1
  end
  result = result .. count .. last
  return result
end

local function lookAndSayAtoms(list)
  local result = {}
  for _, atom in ipairs(list) do
    local ev = evolutions[atom]
    for _, newAtom in ipairs(ev) do
      table.insert(result, newAtom)
    end
  end
  return result
end

local input = atomize(io.open("input"):read("*a"))

for _ = 1, 50 do
  input = lookAndSayAtoms(input)
end

local total = 0

for _, atom in ipairs(input) do
  total = total + atomLengths[atom]
end

print(total)
