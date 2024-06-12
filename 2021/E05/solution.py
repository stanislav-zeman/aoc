from typing import List, Tuple, Dict


def part1():
    with open("input.txt", 'r') as file:
        records = extract_input(file.readlines())

    field: Dict[int, List[int]] = {}

    for record in records:
        x1 = record[0][0]
        x2 = record[1][0]
        y1 = record[0][1]
        y2 = record[1][1]

        if x1 == x2:
            for num in range(min([y1, y2]),
                             max([y1, y2]) + 1):
                if field.get(x1) is None:
                    field[x1] = [num]
                else:
                    field[x1].append(num)

        elif y1 == y2:
            for num in range(min([x1, x2]),
                             max([x1, x2]) + 1):
                if field.get(num) is None:
                    field[num] = [y1]
                else:
                    field[num].append(y1)

    duplicates = 0
    for key, value in field.items():
        duplicates += count_duplicates(value)

    print(duplicates)
    return duplicates


def count_duplicates(value: List[int]) -> int:
    set_ = set(value)
    duplicates = 0

    for val in set_:
        compressed = [x for x in value if x == val]

        if len(compressed) >= 2:
            duplicates += 1

    return duplicates


def part2():
    with open("input.txt", 'r') as file:
        records = extract_input(file.readlines())

    field: Dict[int, List[int]] = {}

    for record in records:
        x1 = record[0][0]
        x2 = record[1][0]
        y1 = record[0][1]
        y2 = record[1][1]

        if x1 == x2:
            for num in range(min([y1, y2]),
                             max([y1, y2]) + 1):
                if field.get(x1) is None:
                    field[x1] = [num]
                else:
                    field[x1].append(num)

        elif y1 == y2:
            for num in range(min([x1, x2]),
                             max([x1, x2]) + 1):
                if field.get(num) is None:
                    field[num] = [y1]
                else:
                    field[num].append(y1)
        else:
            if x1 > x2:
                while x1 >= x2:
                    if field.get(x1) is None:
                        field[x1] = []

                    if y1 > y2:
                        field[x1].append(y1)
                        y1 -= 1
                    else:
                        field[x1].append(y1)
                        y1 += 1

                    x1 -= 1

            else:
                while x1 <= x2:
                    if field.get(x1) is None:
                        field[x1] = []

                    if y1 > y2:
                        field[x1].append(y1)
                        y1 -= 1
                    else:
                        field[x1].append(y1)
                        y1 += 1

                    x1 += 1

    duplicates = 0
    for key, value in field.items():
        duplicates += count_duplicates(value)

    print(duplicates)
    return duplicates


def count_overlapping_line(minimun: int, field: List[List[str]]) -> int:
    count = 0

    for line in field:
        for record in line:
            if int(record) >= minimun:
                count += 1

    return count


def extract_input(file_input: List[str]) -> List[Tuple[Tuple[int, int],
                                                        Tuple[int, int]]]:
    records = []

    for line in file_input:
        line = line.split("->")
        records.append(((int(line[0].split(",")[0]),
                         int(line[0].split(",")[1])),
                        (int(line[1].split(",")[0]),
                         int(line[1].split(",")[1]))))

    return records


if __name__ == '__main__':
    part1()
    part2()
