def part1():
    with open("input.txt", 'r') as file:
        depth = 0
        horizontal = 0

        for line in file:
            instructions = line.split()

            if instructions[0] == "forward":
                horizontal += int(instructions[1])

            if instructions[0] == "down":
                depth += int(instructions[1])

            if instructions[0] == "up":
                depth -= int(instructions[1])

    print(depth * horizontal)
    return depth * horizontal


def part2():
    with open("input.txt", 'r') as file:
        aim = 0
        depth = 0
        horizontal = 0

        for line in file:
            instructions = line.split()

            if instructions[0] == "forward":
                horizontal += int(instructions[1])
                depth += aim * int(instructions[1])

            if instructions[0] == "down":
                aim += int(instructions[1])

            if instructions[0] == "up":
                aim -= int(instructions[1])

    print(depth * horizontal)
    return depth * horizontal


part1()
part2()
