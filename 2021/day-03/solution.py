def part1():
    gamma = ""
    epsilon = ""

    with open("input.txt", "r") as file:
        data = file.readlines()

        for i in range(len(data[0]) - 1):
            ones = 0
            zeros = 0

            for record in data:
                if record[i] == "1":
                    ones += 1
                else:
                    zeros += 1

            if ones > zeros:
                gamma += "1"
                epsilon += "0"
            else:
                gamma += "0"
                epsilon += "1"
                
    print(int(gamma, 2) * int(epsilon, 2))
    return int(gamma, 2) * int(epsilon, 2)


def part2_oxygen():
    with open("input.txt", "r") as file:
        data = file.readlines()

    i = 0
    while i < len(data[0]) - 1 and len(data) > 1:
        ones = 0
        zeros = 0

        for record in data:
            if record[i] == "1":
                ones += 1
            else:
                zeros += 1

        if ones == zeros:
            bigger = "1"
        elif ones > zeros:
            bigger = "1"
        else:
            bigger = "0"

        data = [num for num in data if num[i] == bigger]
        i += 1

    out = int(data.pop(), 2)
    return out


def part2_co2():
    with open("input.txt", "r") as file:
        data = file.readlines()

    i = 0
    while i < len(data[0]) - 1 and len(data) > 1:
        ones = 0
        zeros = 0

        for record in data:
            if record[i] == "1":
                ones += 1
            else:
                zeros += 1

        if ones == zeros:
            bigger = "1"
        elif ones > zeros:
            bigger = "1"
        else:
            bigger = "0"

        data = [num for num in data if num[i] != bigger]
        i += 1

    out = int(data.pop(), 2)
    return out


if __name__ == '__main__':
    part1()
    oxygen = part2_oxygen()
    co2 = part2_co2()
    print(oxygen * co2)

