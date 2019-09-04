package main

// ValueType describes allowed values
type ValueType struct {
	AllowedValues       []string
	AllowedPattern      string
	AllowedPatternRegex string
	GetAtt              map[string]string
	JSONMax             int `json:"JsonMax"`
	ListMax             int
	ListMin             int
	NumberMax           float32
	NumberMin           float32
	Ref                 map[string][]string
	StringMax           int
	StringMin           int
}
