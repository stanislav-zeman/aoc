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

	print(inspect(tokens))
	for ignored_index = 0, #tokens do
		local increasing

		for processed_index = 2, #tokens do
			if ignored_index == processed_index then
				goto next_token
			end

			local left_index
			if ignored_index == processed_index - 1 then
				left_index = processed_index - 2
			else
				left_index = processed_index - 1
			end

			if left_index < 1 then
				goto next_token
			end

			local left = tonumber(tokens[left_index])
			local right = tonumber(tokens[processed_index])

			print(ignored_index, processed_index, left, right)
			if increasing == nil then
				if left < right then
					increasing = true
				end

				if left > right then
					increasing = false
				end

				if left == right then
					goto next_ignored
				end
			end

			if left == right then
				goto next_ignored
			end

			if math.abs(left - right) > 3 then
				goto next_ignored
			end

			if left > right and increasing then
				goto next_ignored
			end

			if left < right and not increasing then
				goto next_ignored
			end

			if processed_index == #tokens or (processed_index == ignored_index - 1 and ignored_index == #tokens) then
				safe = safe + 1
				print("SAFE")
				goto next_line
			end

			::next_token::
		end

		::next_ignored::
	end

	::next_line::
end

print(safe)
