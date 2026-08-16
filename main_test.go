package main

import (
	"os/exec"
	"testing"
)

func TestCLIPrintsGreeting(t *testing.T) {
	// Given
	command := exec.Command("go", "run", ".")

	// When
	output, err := command.Output()

	// Then
	if err != nil {
		t.Fatalf("go run . failed: %v", err)
	}

	const want = "Hello, world!\n"
	if got := string(output); got != want {
		t.Fatalf("go run . output = %q; want %q", got, want)
	}
}
