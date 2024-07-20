package closed_src

import _ "unsafe"

//go:linkname Add github.com/otaxhu/closed_src/interfaces.Add
func Add(a, b int) int {
	return a + b
}
