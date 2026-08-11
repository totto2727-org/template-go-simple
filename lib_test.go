package project

import "testing"

func TestAddReturnsSum(t *testing.T) {
	// Given
	left := 2
	right := 3

	// When
	got := Add(left, right)

	// Then
	want := 5
	if got != want {
		t.Fatalf("Add(%d, %d) = %d; want %d", left, right, got, want)
	}
}
