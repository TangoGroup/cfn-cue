package fn

#CUETypes: bool | string | bytes | int | float

#Regions: "us-east-1" | "us-east-2" | "us-west-1" | "us-west-2" | "ca-central-1" |
	"eu-central-1" | "eu-west-1" | "eu-west-2" | "eu-west-3" | "eu-north-1" |
	"ap-east-1" | "ap-northeast-1" | "ap-northeast-2" | "ap-northeast-3" |
	"ap-southeast-1" | "ap-southeast-2" | "ap-south-1" | "me-south-1" | "sa-east-1"

// Base64: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-base64.html
#Base64: {
	"Fn::Base64": string | #GetAtt | #Sub | #Ref 
}

#CidrIpBlock: string | #Select | #Ref
#CidrCount:   (>=1 & <=256) | #Select | #Ref
#CidrBits:    (>=1 & <=128) | #Select | #Ref

// Cidr: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-cidr.html
#Cidr: {
	"Fn::Cidr": [#CidrIpBlock, #CidrCount, #CidrBits]
}

// #FindInMapT: string | #FindInMap | #Ref

// FindInMap: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-findinmap.html
// #FindInMap: {
// 	"Fn::FindInMap": 3 * [#FindInMapT]
// }

// GetAZs: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-getavailabilityzones.html
#GetAZs: {
	"Fn::GetAZs": #Regions | "" | (#Ref & {"Ref": "AWS::Region"})
}

// https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-getatt.html
#GetAtt: {
	"Fn::GetAtt": [string, string ] | string
}

// https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-importvalue.html
#ImportValue: {
	"Fn::ImportValue": string | #Join | #Select | #Split | #Sub | #Ref
}

// https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-join.html
#Join: {
	"Fn::Join": [string, [...(#CUETypes | #GetAtt | #GetAZs | #ImportValue | #Join | #Split | #Select | #Sub | #Ref)]]
}

// https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-select.html
#Select: {
	"Fn::Select": [
		>=0 | #Ref,
		[...(#CUETypes  | #GetAtt | #GetAZs | #Split | #Cidr | #Ref)] | #GetAtt | #GetAZs | #Split | #Ref,
	]
}

// https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-split.html
#Split: {
	"Fn::Split": [
		string,
		string | #GetAtt | #GetAZs | #ImportValue | #Join | #Select | #Sub | #Ref,
	]
}

#SubFun: {
	[string]: string | #GetAtt | #GetAZs | #ImportValue | #Join | #Select | #Sub | #Ref
}

// https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-sub.html
#Sub: {
	"Fn::Sub": string | [string, #SubFun]
}

// https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-ref.html
#Ref: {
	"Ref": string
}

// #LogicCondition: Condition: string

// https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-conditions.html#intrinsic-function-reference-conditions-and
// #And: {
// 	"Fn::And": [...(#LogicCondition | #And | #Equals | #Not | #Or)]
// }

// #EqualsT: string | number | bool | #Ref | #FindInMap | #And | #Equals | #Not | #Or | #If

// // https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-conditions.html#intrinsic-function-reference-conditions-equals
// #Equals: {
// 	"Fn::Equals": 2 * [#EqualsT]
// }

// #IfT: #Base64 | #FindInMap | #GetAtt | #GetAZs | #If | #Join | #Select | #Sub | #Ref | #CUETypes //| {...}

// // https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-conditions.html#intrinsic-function-reference-conditions-if
// #If: {
// 	"Fn::If": [string] + 2*[#IfT]
// }

// If: #If

// #LogicT: #LogicCondition | #And | #Equals | #Not | #Or

// #Not: {
// 	"Fn::Not": [#LogicT]
// }

// #Or: {
// 	"Fn::Or": [...(#LogicT)]
// }

// LogicFn: #And | #Equals | #Not | #Or

// ConditionFn: LogicFn | #If

// Fn: #Base64 | #Cidr | #GetAZs | #GetAtt | #ImportValue | #Join | #Select | #Split | #Sub | #Ref
Fn: #GetAtt | 
    #Base64 | 
    #ImportValue | 
    #Join | 
    #Sub | 
    #Select | 
    #Split | 
    #Sub |
    #Ref 
#Fn: Fn