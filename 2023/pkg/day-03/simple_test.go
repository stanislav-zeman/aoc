package day03

import (
	"testing"
)

var priorities = []struct {
	token    token
	priority int
}{
	{'a', 1},
	{'z', 26},
	{'A', 27},
	{'Z', 52},
}

func TestPriorities(t *testing.T) {
	for _, test := range priorities {
		actual := test.token.getPriority()
		expected := test.priority
		if actual != expected {
			t.Errorf("Tokens '%c' actual priority %d : expected %d", test.token, actual, expected)
		}
	}
}
