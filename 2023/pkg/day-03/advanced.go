package day03

import (
	"bufio"
	"fmt"
	"log"
	"os"
)

type group struct {
	rucksacks [3]rucksack
}

func (rucksack rucksack) getWhole() string {
	return rucksack.leftCompartment + rucksack.rightCompartment
}

func (group group) findCommonGroupToken() token {
	tokens := make(map[token]interface{})

	for _, elem := range findCommonRucksackToken(group.rucksacks[0], group.rucksacks[1]) {
		tokens[elem] = nil
	}

	for _, elem := range findCommonRucksackToken(group.rucksacks[0], group.rucksacks[2]) {
		if _, found := tokens[elem]; found {
			return elem
		}
	}

	panic("Rucksack group always shares token!")
}

func findCommonRucksackToken(rucksackA rucksack, rucksackB rucksack) (result []token) {
	tokens := make(map[rune]interface{})

	for _, elem := range rucksackA.getWhole() {
		tokens[elem] = nil
	}

	for _, elem := range rucksackB.getWhole() {
		_, found := tokens[elem]

		if found {
			result = append(result, token(elem))
		}
	}

	return
}

func RunAdvanced() {
	file, err := os.Open("resources/day-03/input")
	if err != nil {
		log.Fatal("Failed opening input file! " + err.Error())
	}

	scanner := bufio.NewScanner(file)
	scanner.Split(bufio.ScanLines)

	var groups []group
	for scanner.Scan() {
		groups = append(groups, parseGroup(scanner))
	}

	var tokens []token
	for _, group := range groups {
		tokens = append(tokens, group.findCommonGroupToken())
	}

	fmt.Println(foldPriorities(tokens))
}

func parseGroup(scanner *bufio.Scanner) (group group) {
	for i := 0; i < 3; i++ {
		group.rucksacks[i] = parseRucksack(scanner.Text())
		scanner.Scan()
	}
	return
}
