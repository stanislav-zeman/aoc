def part1():
    with open("input.txt", 'r') as file:
        prev = int(file.readline())
        cnt = 0

        for measurement in file:
            if prev < int(measurement):
                cnt += 1
            prev = int(measurement)

    print(cnt)


def part2():
    with open("input.txt", 'r') as file:
        values = file.readlines()[::-1]
        cnt = 0
        a = int(values.pop())
        b = int(values.pop())
        c = int(values.pop())
        prev = a + b + c

        while len(values) != 0:
            new = int(values.pop())
            window_new = b + c + new

            if window_new > prev:
                cnt += 1

            b = c
            c = new
            prev = window_new

    print(cnt)


part2()
