package fn

// Fn::Base64
// Fn::Cidr
// Fn::FindInMap
// Fn::GetAZs
// Fn::GetAtt
// Fn::ImportValue
// Fn::Join
// Fn::Select
// Fn::Split
// Fn::Sub
// Fn::Transform
// Ref

Base64: {
	"Fn::Base64": string
}

Cidr: {
	"Fn::Cidr": [string, >=1 & <=256, >=0 & <=128]
}

FindInMap: {
	"Fn::FindInMap": [string, string, string]
}

GetAZs: {
	"Fn::GetAZs": string
}

GetAtt: {
	"Fn::GetAtt": [string, string] | string
}

ImportValue: {
	"Fn::ImportValue": string
}

Join: {
	"Fn::Join": [string, [...]]
}

Select: {
	"Fn::Select": [>=0, _]
}

Split: {
	"Fn::Split": [string, string]
}

Sub: {
	"Fn::Sub": string | [string, {}]
}

Transform: {
	"Fn::Transform": {
		Name: string
		Parameters: {}
	}
}

Ref: {
	Ref: string
}

// Condition Functions
// You can use the following functions in all other condition functions, such as Fn::Equals and Fn::Or:
// - Fn::FindInMap
// - Ref
// - Other condition functions

And: {
	"Fn::And": [...]
}

Equals: {
	"Fn::Equals": [string, string]
}

// You can use the following functions in the Fn::If condition:
// - Fn::Base64
// - Fn::FindInMap
// - Fn::GetAtt
// - Fn::GetAZs
// - Fn::If
// - Fn::Join
// - Fn::Select
// - Fn::Sub
// - Ref

If: {
	"Fn::If": [string, _, _]
}

Not: {
	"Fn::Not": [_]
}

Or: {
	"Fn::Or": [_]
}

Fnable: Base64 | Cidr | FindInMap | GetAZs | GetAtt | ImportValue | Join | Select | Split | Sub | Transform | Ref | And | Equals | If | Not | Or
