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

// Base64: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-base64.html
// You can use any function that returns a string inside the Fn::Base64 function.
Base64: {
	"Fn::Base64": string | Base64 | FindInMap | GetAtt | ImportValue | Join | Select | Sub | Ref | If
}

// Cidr: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-cidr.html
Cidr: {
	CidrFn :: Select | Ref
	"Fn::Cidr": [string | CidrFn, (>=1 & <=256) | CidrFn, (>=0 & <=128) | CidrFn]
}

// FindInMap: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-findinmap.html
FindInMap: {
	FindInMapFn :: FindInMap | Ref
	"Fn::FindInMap": [string | FindInMapFn, string | FindInMapFn, string | FindInMapFn]
}

// GetAZs: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-getavailabilityzones.html
GetAZs: {
	"Fn::GetAZs": string | Ref
}

// GetAtt: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-getatt.html
GetAtt: {
	// [Resource Name, Attribute Name]
	"Fn::GetAtt": [string, string | Ref] | string
}

// ImportValue: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-importvalue.html
// You can use the following functions in the Fn::ImportValue function. The value of these functions can't depend on a resource.

ImportValue: {
	"Fn::ImportValue": string | Base64 | FindInMap | If | Join | Select | Split | Sub | Ref
}

// Join: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-join.html
Join: {
	JoinFn :: Base64 | FindInMap | GetAtt | GetAZs | If | ImportValue | Join | Split | Select | Sub | Ref
	"Fn::Join": [string, [...(bool | string | bytes | int | float | JoinFn)]]
}

// Select: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-select.html
Select: {
	SelectFn :: FindInMap | GetAtt | GetAZs | If | Split | Ref
	"Fn::Select": [>=0 | Ref | FindInMap, [...(bool | string | bytes | int | float | SelectFn)] | SelectFn]
}

// Split: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-split.html
Split: {
	SplitFn :: Base64 | FindInMap | GetAtt | GetAZs | If | ImportValue | Join | Select | Sub | Ref
	"Fn::Split": [string, string | SplitFn]
}

// Sub: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-sub.html
Sub: {
	SubFn ::   Base64 | FindInMap | GetAtt | GetAZs | If | ImportValue | Join | Select | Ref
	"Fn::Sub": string | [string, {}]
}

Transform: {
	"Fn::Transform": {
		Name: string
		Parameters: {}
	}
}

Ref: {
	"Ref": string
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
