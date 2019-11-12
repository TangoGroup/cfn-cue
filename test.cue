import "list"

import "strings"

string_arr: [...string]
string_arr: list.MaxItems(20)
string_arr: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22"]
// string_arr: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18"]
// string_arr: ["1", "2", "3", "4", "5"]
// string_arr_len: len(string_arr)

my_string: strings.MinRunes(15) & strings.MaxRunes(27)
my_string: string
my_string: "alksdjflakasdkjflkasdaskd"
// my_string_len: len(my_string)
ss :: {
	"Fn::SS": string & strings.MaxRunes(20)
}

PolicyName: (string & strings.MinRunes(1) & strings.MaxRunes(128) & =~#"^[a-zA-Z0-9+=,.@\-_]+$"# ) | ss
// PolicyName: (string & strings.MinRunes(1) & strings.MaxRunes(128) & =~#"^[a-zA-Z0-9+=,.@\-_]+$"# & ("apple" | "dog" | "cat")) | ss

PolicyName: ss & {
	"Fn::SS": "Big things happening"
}

// PolicyName: "cat@"
