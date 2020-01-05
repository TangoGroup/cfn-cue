package foo

import "tool/exec"

city: "Amsterdam"

// Say hello!
command: hello: {
	// whom to say hello to
	var: who: *"World" | string

	task: print: exec.Run & {
		cmd: "echo Hello \(var.who)! Welcome to \(city)."
	}
}
