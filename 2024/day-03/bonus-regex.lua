local regex = require("regex")
local inspect = require("inspect")

io.input("input.text")
local input = io.read("*a")

local function parse_match(match)
	local total = 1
	for num in string.gmatch(match, "%d+") do
		total = total * num
	end
	return total
end

local multiple = 0
local enabled = true
local regx = regex.new("(mul(%d+,%d+)|don't()|do())", "g")
local matches = regx:matches(input)

print(inspect(matches), #matches)

-- for match in string.gmatch(line, "mul%(%d+,%d+%)|don't%(%)|do%(%)") do
-- for match in string.gmatch(line, "(don't%(%)|do%(%))") do

for i = 1, #matches do
	local match = matches[i]
	print(match)
	if match == "do()" then
		enabled = true
		goto next_token
	end

	if match == "don't()" then
		enabled = false
		goto next_token
	end

	if enabled then
		multiple = multiple + parse_match(match)
	end

	::next_token::
end

print(multiple)
