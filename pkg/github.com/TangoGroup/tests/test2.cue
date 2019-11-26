package test

aws :: {
	EC2 :: Instance :: {
		Type: "AWS::EC2::Instance"
		Properties: {
			AdditionalInfo?:     string | fn.Fn
			IamInstanceProfile?: (=~#"[a-zA-Z0-9+=,.@\-_]+"#) | fn.Fn
			InstanceType?:       "a1.2xlarge" | "a1.4xlarge" | fn.Fn
		}
	}
	AutoScaling :: LaunchConfiguration :: {
		Type: "AWS::AutoScaling::LaunchConfiguration"
		Properties: {
			IamInstanceProfile?: string | fn.Fn
			InstanceId?:         string | fn.Fn
			InstanceType:        "a1.2xlarge" | "a1.4xlarge" | fn.Fn
		}
	}
}

ResourceTypes :: aws.AutoScaling.LaunchConfiguration | aws.EC2.Instance

Template :: {
	AWSTemplateFormatVersion?: "2010-09-09"
	Description?:              string
	// Resources: [string]: ResourceTypes
	Resources: [string]: {
		Type: "AWS::EC2::Instance" | "AWS::AutoScaling::LaunchConfiguration"
		Properties: [string]: _
	}
	for resourceName, resource in Resources {
		if resource.Type == aws.EC2.Instance.Type {
			Resources: "\(resourceName)": aws.EC2.Instance
		}
		if resource.Type == aws.AutoScaling.LaunchConfiguration.Type {
			Resources: "\(resourceName)": aws.AutoScaling.LaunchConfiguration
		}
	}
}

template: Template
template: {
	Description: "This is a template"
	Resources: EC2Instance: {
		Type: "AWS::EC2::Instance"
		Properties: {
			// If I uncomment this, it works!
			// AdditionalInfo: "stuff"
			InstanceType: Ref: "InstanceType"
		}
	}
	Resources: LaunchConfig: {
		// Resources: LaunchConfig: aws.AutoScaling.LaunchConfiguration & {
		Type: "AWS::AutoScaling::LaunchConfiguration"
		Properties: {
			IamInstanceProfile: Ref: "InstanceProfile"
			InstanceType: Ref:       "InstanceType"
			// If I uncomment this, it works!
			// InstanceId: "1234"
		}
	}
}

// Base64: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-base64.html
// You can use any function that returns a string inside the Fn::Base64 function.
Base64 :: {
	"Fn::Base64": string | Base64 | FindInMap | GetAtt | ImportValue | Join | Select | Sub | Ref | If
}

// Cidr: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-cidr.html
Cidr :: {
	// CidrFn :: Select | Ref
	"Fn::Cidr": [string | Select | Ref, GetAtt, Sub, Select, (>=1 & <=256) | Select | Ref, (>=0 & <=128) | Select | Ref]
}

// FindInMap: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-findinmap.html
FindInMap :: {
	// FindInMapFn :: FindInMap | Ref
	"Fn::FindInMap": [string | FindInMap | Ref, string | FindInMap | Ref, string | FindInMap | Ref]
}

// GetAZs: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-getavailabilityzones.html
GetAZs :: {
	"Fn::GetAZs": "" | (Ref & {"Ref": "AWS::Region"})
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
	"Fn::Select": [>=0 | Ref | FindInMap, [...(bool | string | bytes | int | float | FindInMap | GetAtt | GetAZs | If | Split | Cidr | Ref)] | FindInMap | GetAtt | GetAZs | If | Split | Ref]
}

// Split: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-split.html
Split :: {
	// SplitFn :: Base64 | FindInMap | GetAtt | GetAZs | If | ImportValue | Join | Select | Sub | Ref
	"Fn::Split": [string, string | Base64 | FindInMap | GetAtt | GetAZs | If | ImportValue | Join | Select | Sub | Ref]
}

// Sub: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-sub.html
Sub :: {
	// SubFn ::   Base64 | FindInMap | GetAtt | GetAZs | If | ImportValue | Join | Select | Ref
	"Fn::Sub": string | [string, {[string]: string | Base64 | FindInMap | GetAtt | GetAZs | If | ImportValue | Join | Select | Sub | Ref}]
	// "Fn::Sub": string | [string, {[string]: string | Sub | Ref}]
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

// https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-conditions.html#intrinsic-function-reference-conditions-and
And :: {
	"Fn::And": [...({Condition: string} | LogicFn)]
	// "Fn::And": list.MinItems(2) & list.MaxItems(10)
}

// https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-conditions.html#intrinsic-function-reference-conditions-equals
Equals :: {
	"Fn::Equals": 2 * [string | Ref | FindInMap | ConditionFn]
}

// https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-conditions.html#intrinsic-function-reference-conditions-if
If :: {
	"Fn::If": [string, _ | Base64 | FindInMap | GetAtt | GetAZs | If | Join | Select | Sub | Ref, _ | Base64 | FindInMap | GetAtt | GetAZs | If | Join | Select | Sub | Ref]
}

// https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-conditions.html#intrinsic-function-reference-conditions-not
Not :: {
	"Fn::Not": [{Condition: string} | LogicFn]
}

// https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-conditions.html#intrinsic-function-reference-conditions-or
// Returns true if any one of the specified conditions evaluate to true, or returns false if all of the conditions evaluates to false. Fn::Or acts as an OR operator. The minimum number of conditions that you can include is 2, and the maximum is 10.

Or :: {
	"Fn::Or": [...({Condition: string} | LogicFn)]
}

LogicFn :: And | Equals | Not | Or

ConditionFn :: LogicFn | If

fn :: Fn :: Base64 | Cidr | FindInMap | GetAZs | GetAtt | ImportValue | Join | Select | Split | Sub | Transform | Ref | And | Equals | If | Not | Or
