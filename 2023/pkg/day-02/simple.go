package day02

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"strconv"
	"strings"
)

const (
	loss = 0
	draw = 3
	win  = 6
)

type token int

const (
	rock token = iota
	paper
	scissors
)

type round struct {
	opponent token
	player   token
}

func (round round) isDraw() bool {
	return round.player == round.opponent
}

func (round round) playerWins() bool {
	return round.opponent == rock && round.player == paper ||
		round.opponent == paper && round.player == scissors ||
		round.opponent == scissors && round.player == rock
}

var opponentTokens = map[string]token{
	"A": rock,
	"B": paper,
	"C": scissors,
}

var playerTokens = map[string]token{
	"X": rock,
	"Y": paper,
	"Z": scissors,
}

func RunSimple() {
	file, err := os.Open("resources/day-02/input")
	if err != nil {
		log.Fatal("Failed opening the file! " + err.Error())
	}

	scanner := bufio.NewScanner(file)
	scanner.Split(bufio.ScanLines)

	var rounds []round
	for scanner.Scan() {
		rounds = append(rounds, parseRound(scanner.Text()))
	}

	fmt.Println("Score: " + strconv.Itoa(calculateScore(rounds)))
}

func parseRound(input string) round {
	tokens := strings.Split(input, " ")

	if len(tokens) != 2 {
		log.Fatal("Row has invalid length! Input: " + input)
	}

	opponentToken := tokens[0]
	playerToken := tokens[1]

	if len(opponentToken) != 1 || len(playerToken) != 1 {
		log.Fatal("Invalid token/s! Input: " + input)
	}

	return round{
		opponent: opponentTokens[opponentToken],
		player:   playerTokens[playerToken],
	}
}

func calculateScore(rounds []round) (score int) {
	for _, round := range rounds {
		score += calculateRound(round)
	}
	return score
}

func calculateRound(round round) (score int) {
	if round.isDraw() {
		score += draw
	} else if round.playerWins() {
		score += win
	} else {
		score += loss
	}

	return score + int(round.player) + 1
}
