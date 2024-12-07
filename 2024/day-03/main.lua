io.input("input.text")

local function parse_match(match)
	local total = 1
	for num in string.gmatch(match, "%d+") do
		total = total * num
	end
	return total
end

local multiple = 0

for line in io.lines() do
	for match in string.gmatch(line, "mul%(%d+,%d+%)") do
		multiple = multiple + parse_match(match)
	end
end

print(multiple)
