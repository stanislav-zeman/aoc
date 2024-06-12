package day02

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"strconv"
	"strings"
)

var intent = map[string]int{
	"X": loss,
	"Y": draw,
	"Z": win,
}

var pickForLoss = map[token]token{
	rock:     scissors,
	paper:    rock,
	scissors: paper,
}

var pickForWin = map[token]token{
	rock:     paper,
	paper:    scissors,
	scissors: rock,
}

func RunAdvanced() {
	file, err := os.Open("resources/day-02/input")
	if err != nil {
		log.Fatal("Failed opening the file! " + err.Error())
	}

	scanner := bufio.NewScanner(file)
	scanner.Split(bufio.ScanLines)

	var rounds []round
	for scanner.Scan() {
		rounds = append(rounds, parseIntent(scanner.Text()))
	}

	fmt.Println("Score: " + strconv.Itoa(calculateScore(rounds)))
}

func parseIntent(input string) round {
	tokens := strings.Split(input, " ")

	if len(tokens) != 2 {
		log.Fatal("Row has invalid length! Input: " + input)
	}

	opponentToken := tokens[0]
	intentToken := tokens[1]

	if len(opponentToken) != 1 || len(intentToken) != 1 {
		log.Fatal("Invalid token/s! Input: " + input)
	}

	opponentsPick := opponentTokens[opponentToken]
	goal := intent[intentToken]
	return round{
		opponent: opponentsPick,
		player:   pickToken(goal, opponentsPick),
	}
}

func pickToken(goal int, opponentToken token) token {
	switch goal {
	case draw:
		return opponentToken
	case win:
		return pickForWin[opponentToken]
	case loss:
		return pickForLoss[opponentToken]
	}
	panic("Unreachable code!")
}
