local inspect = require("inspect")

io.input("input.text")
local input = io.read("*a")

local multiple = 0
local enabled = true
local tokens = {}

local function process_token(pattern)
	---@type integer|nil
	local i = 1
	---@type integer|nil
	local j = 1
	while true do
		i, j = string.find(input, pattern, j)
		if i == nil or j == nil then
			break
		end

		tokens[i] = string.sub(input, i, j)
	end
end

local function process_mul_token(match)
	local total = 1
	for num in string.gmatch(match, "%d+") do
		total = total * num
	end
	return total
end

process_token("do%(%)")
process_token("don't%(%)")
process_token("mul%(%d+,%d+%)")

print(inspect(tokens), #tokens)

local keys = {}
for key in pairs(tokens) do
	table.insert(keys, key)
end

table.sort(keys)

print(inspect(keys), #keys)

for _, key in ipairs(keys) do
	local token = tokens[key]
	print(token)
	if token == "do()" then
		enabled = true
		goto next_token
	end

	if token == "don't()" then
		enabled = false
		goto next_token
	end

	if enabled then
		multiple = multiple + process_mul_token(token)
	end

	::next_token::
end

print(multiple)
