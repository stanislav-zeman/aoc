local inspect = require("inspect")

io.input("input.text")

local function split(str)
	local tokens = {}
	for v in string.gmatch(str, "%d+") do
		table.insert(tokens, v)
	end

	return tokens
end

local safe = 0

for line in io.lines() do
	local tokens = split(line)
	local increasing

	print(inspect(tokens))
	for i = 2, #tokens do
		local left = tonumber(tokens[i - 1])
		local right = tonumber(tokens[i])

		if i == 2 then
			if left < right then
				increasing = true
			end

			if left > right then
				increasing = false
			end

			if left == right then
				break
			end
		end

		if left == right then
			break
		end

		if math.abs(left - right) > 3 then
			break
		end

		if left > right and increasing then
			break
		end

		if left < right and not increasing then
			break
		end

		if i == #tokens then
			safe = safe + 1
		end
	end
end

print(safe)
