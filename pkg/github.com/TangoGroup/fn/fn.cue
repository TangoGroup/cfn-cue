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
Base64 :: {
	"Fn::Base64": string | Base64 | FindInMap | GetAtt | ImportValue | Join | Select | Sub | Ref | If
}

// Cidr: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-cidr.html
Cidr :: {
	// CidrFn :: Select | Ref
	"Fn::Cidr": [string | Select | Ref, (>=1 & <=256) | Select | Ref, (>=0 & <=128) | Select | Ref]
}

// FindInMap: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-findinmap.html
FindInMap :: {
	// FindInMapFn :: FindInMap | Ref
	"Fn::FindInMap": [string | FindInMap | Ref, string | FindInMap | Ref, string | FindInMap | Ref]
}

// GetAZs: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-getavailabilityzones.html
GetAZs :: {
	"Fn::GetAZs": string | Ref
}

// GetAtt: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-getatt.html
GetAtt :: {
	// [Resource Name, Attribute Name]
	"Fn::GetAtt": [string, string | Ref] | string
}

// ImportValue: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-importvalue.html
// You can use the following functions in the Fn::ImportValue function. The value of these functions can't depend on a resource.

ImportValue :: {
	"Fn::ImportValue": string | Base64 | FindInMap | If | Join | Select | Split | Sub | Ref
}

// Join: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-join.html
Join :: {
	// JoinFn :: Base64 | FindInMap | GetAtt | GetAZs | If | ImportValue | Join | Split | Select | Sub | Ref
	"Fn::Join": [string, [...(bool | string | bytes | int | float | Base64 | FindInMap | GetAtt | GetAZs | If | ImportValue | Join | Split | Select | Sub | Ref)]]
}

// Select: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-select.html
Select :: {
	// SelectFn :: FindInMap | GetAtt | GetAZs | If | Split | Ref
	"Fn::Select": [>=0 | Ref | FindInMap, [...(bool | string | bytes | int | float | FindInMap | GetAtt | GetAZs | If | Split | Ref)] | FindInMap | GetAtt | GetAZs | If | Split | Ref]
}

// Split: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-split.html
Split :: {
	// SplitFn :: Base64 | FindInMap | GetAtt | GetAZs | If | ImportValue | Join | Select | Sub | Ref
	"Fn::Split": [string, string | Base64 | FindInMap | GetAtt | GetAZs | If | ImportValue | Join | Select | Sub | Ref]
}

// Sub: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-sub.html
Sub :: {
	// SubFn ::   Base64 | FindInMap | GetAtt | GetAZs | If | ImportValue | Join | Select | Ref
	"Fn::Sub": string | [string, {<_>: string | Base64 | FindInMap | GetAtt | GetAZs | If | ImportValue | Join | Select | Ref}]
	// "Fn::Sub": string | [string, {[string | SubFn]: string | SubFn}]
}

// Transform: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-transform.html
Transform :: {
	"Fn::Transform": {
		Name: string
		Parameters: {}
	}
}

// Ref: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-ref.html
Ref :: {
	"Ref": string
}

// Condition Functions
// You can use the following functions in all other condition functions, such as Fn::Equals and Fn::Or:
// - Fn::FindInMap
// - Ref
// - Other condition functions

And :: {
	"Fn::And": [...({"Condition": string} | And | Equals | Not | Or)]
}

Equals :: {
	"Fn::Equals": [string | Ref, string | Ref]
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

If :: {
	"Fn::If": [string, _ | Base64 | FindInMap | GetAtt | GetAZs | If | Join | Select | Sub | Ref, _ | Base64 | FindInMap | GetAtt | GetAZs | If | Join | Select | Sub | Ref]
}

Not :: {
	"Fn::Not": [{Condition: string} | Equals | Or | Not]
}

Or :: {
	"Fn::Or": [...({Condition: string} | Equals | Or | Not)]
}

ConditionFn :: And | Equals | If | Not | Or

Fn :: Base64 | Cidr | FindInMap | GetAZs | GetAtt | ImportValue | Join | Select | Split | Sub | Transform | Ref | And | Equals | If | Not | Or

// Ands: And & {
//  "Fn::And" : [{"Condition": "Hello"}, {"Condition": "Goodbye"}]
// }
// "MyAndCondition": And & {
//  "Fn::And": [
//   {"Fn::Equals": ["sg-mysggroup", {"Ref": "ASecurityGroup"}]},
//   {"Condition":                           "SomeOtherCondition"},
//  ]
// }

MyNotCondition : Not & {
	"Fn::Not" : [{
		"Fn::Equals" : [
			{"Ref" : "EnvironmentType"},
			"prod",
		]
	}]
}

Outputs2: {
	"SecurityGroupId" : {
		"Description" : "Group ID of the security group used."
		"Value" :       If & {
			"Fn::If" : [
				"CreateNewSecurityGroup",
				{"Ref" : "NewSecurityGroup"},
				{"Ref" : "ExistingSecurityGroup"},
			]
		}
	}
}

Select1: Select & {"Fn::Select" : [ 1, [ "apples", "grapes", "oranges", "mangoes"]]}
Select2: Select & {
	"Fn::Select" : [1,
		{"Fn::GetAZs": "us-west-2"},
	]
}

// MyOrCondition : Or & {
//  "Fn::Or": [
//   {"Fn::Equals": ["sg-mysggroup", {"Ref": "ASecurityGroup"}]},
//   {"Condition":                           "SomeOtherCondition"},
//  ]
// }

Subs: Sub & {
	"Fn::Sub" : ["${Shell}", {Shell: "zsh"}]
}

Splits: Split & {
	"Fn::Split": [",", {"Fn::Sub": "This,is,something,to,split,${Dude}"}]
}

Outputs: Sub & {
	"Fn::Sub": ["${Shell}", {
		Shell: {
			"Fn::ImportValue": {
				"Fn::Sub": [
					"String-from-somewhere-else-${MyRef}",
					{MyRef: {"Ref": "SomeItem"}},
				]
			}
		}
	}]
}

f1: string | "one" | "two" | "three" | Fnable
f1: {"Ref": "Stuff"}
