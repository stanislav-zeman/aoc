from typing import List


def part1():
    with open("input.txt", 'r') as file:
        numbers_stack = [int(num) for num in file.readline().split(',')[::-1]]
        tables = extract_tables(file)

    numbers_drawn = []
    for i in range(5):
        numbers_drawn.append(numbers_stack.pop())

    bingo = False
    while not bingo:
        for table in tables:
            if check_rows(table, numbers_drawn) or \
                    check_columns(table, numbers_drawn):
                print(calculate_sum(table, numbers_drawn) *
                      numbers_drawn.pop())
                return calculate_sum(table, numbers_drawn) * \
                    numbers_drawn.pop()

        numbers_drawn.append(numbers_stack.pop())


def calculate_sum(table: List[List[int]], numbers_drawn: List[int]) -> int:
    num_sum = 0

    for row in table:
        for num in row:
            if num not in numbers_drawn:
                num_sum += num

    return num_sum


def check_rows(table: List[List[int]], numbers_drawn: List[int]) -> bool:
    rows = [[],
            [],
            [],
            [],
            []]

    for i, row in enumerate(table):
        for num in row:
            if num in numbers_drawn:
                rows[i].append(True)
            else:
                rows[i].append(False)

    for row in rows:
        if all(row):
            return True

    return False


def check_columns(table: List[List[int]], numbers_drawn: List[int]) -> bool:
    collumns = [[],
                [],
                [],
                [],
                []]

    for row in table:
        for i, num in enumerate(row):
            collumns[i].append(num)

    return check_rows(collumns, numbers_drawn)


def extract_tables(file):
    input_file = file.readlines()

    tables = []
    n = -1
    for i, line in enumerate(input_file):
        if line == '\n':
            n += 1
            tables.append([])
        else:
            tables[n].append([int(x) for x in line.split()])

    return tables


def part2():
    with open("input.txt", 'r') as file:
        numbers_stack = [int(num) for num in file.readline().split(',')[::-1]]
        tables = extract_tables(file)

    numbers_drawn = []
    for i in range(5):
        numbers_drawn.append(numbers_stack.pop())

    while len(tables) > 1:
        tables = [table for table in tables
                  if not check_rows(table, numbers_drawn) and
                  not check_columns(table, numbers_drawn)]

        numbers_drawn.append(numbers_stack.pop())

    while True:
        for table in tables:
            if check_rows(table, numbers_drawn) or \
                    check_columns(table, numbers_drawn):
                print(calculate_sum(table, numbers_drawn) *
                      numbers_drawn.pop())
                return calculate_sum(table, numbers_drawn) * \
                    numbers_drawn.pop()

        numbers_drawn.append(numbers_stack.pop())


if __name__ == '__main__':
    part1()
    part2()
