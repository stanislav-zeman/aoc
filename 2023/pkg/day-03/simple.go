package day03

import (
	"bufio"
	"fmt"
	"log"
	"os"
)

type rucksack struct {
	leftCompartment  string
	rightCompartment string
}

type token rune

func (token token) getPriority() int {
	switch {
	case token >= 'a' && token <= 'z':
		return int(token) - 96
	case token >= 'A' && token <= 'Z':
		return int(token) - 38
	default:
		panic(fmt.Sprint("Invalid token found! token: ", token))
	}
}

func RunSimple() {
	file, err := os.Open("resources/day-03/input")

	if err != nil {
		log.Fatal("Failed loading source file! " + err.Error())
	}

	scanner := bufio.NewScanner(file)
	scanner.Split(bufio.ScanLines)

	var rucksacks []rucksack
	for scanner.Scan() {
		rucksacks = append(rucksacks, parseRucksack(scanner.Text()))
	}

	var tokens []token
	for _, rucksack := range rucksacks {
		tokens = append(tokens, findSharedToken(rucksack))
	}

	fmt.Println(foldPriorities(tokens))
}

func parseRucksack(line string) rucksack {
	middle := len(line) / 2
	return rucksack{
		leftCompartment:  line[:middle],
		rightCompartment: line[middle:],
	}
}

func findSharedToken(rucksack rucksack) token {
	tokens := make(map[rune]interface{})

	for _, elem := range rucksack.leftCompartment {
		tokens[elem] = nil
	}

	for _, elem := range rucksack.rightCompartment {
		_, found := tokens[elem]

		if found {
			return token(elem)
		}
	}

	panic("Compartments always share token!")
}

func foldPriorities(tokens []token) (total int) {
	for _, token := range tokens {
		total += token.getPriority()
	}
	return
}
