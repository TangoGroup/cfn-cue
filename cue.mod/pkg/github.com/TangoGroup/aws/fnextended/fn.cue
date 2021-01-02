package fnextended

#CUETypes: bool | string | bytes | int | float

#Regions: "us-east-1" | "us-east-2" | "us-west-1" | "us-west-2" | "ca-central-1" |
	"eu-central-1" | "eu-west-1" | "eu-west-2" | "eu-west-3" | "eu-north-1" |
	"ap-east-1" | "ap-northeast-1" | "ap-northeast-2" | "ap-northeast-3" |
	"ap-southeast-1" | "ap-southeast-2" | "ap-south-1" | "me-south-1" | "sa-east-1"

// Base64: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-base64.html
#Base64: {
	"Fn::Base64": string |
		#Base64 |
		#FindInMap |
		#GetAtt |
		#ImportValue |
		#Join |
		#Select |
		#Sub |
		#If |
		#Ref
}

#CidrIpBlock: string | #Select | #Ref
#CidrCount:   (>=1 & <=256) | #Select | #Ref
#CidrBits:    (>=1 & <=128) | #Select | #Ref

// Cidr: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-cidr.html
#Cidr: {
	"Fn::Cidr": [#CidrIpBlock, #CidrCount, #CidrBits]
}

#FindInMapT: string | #FindInMap | #Ref

// FindInMap: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-findinmap.html
#FindInMap: {
	// "Fn::FindInMap": 3 * [#FindInMapT]
	"Fn::FindInMap": [#FindInMapT, #FindInMapT, #FindInMapT]
}

// GetAZs: https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-getavailabilityzones.html
#GetAZs: {
	"Fn::GetAZs": #Regions | "" | (#Ref & {
		Ref: "AWS::Region"
	})
}

// https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-getatt.html
#GetAtt: {
	"Fn::GetAtt": [
			string,
			string | #Ref,
	] | string
}

// https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-importvalue.html
#ImportValue: {
	"Fn::ImportValue": string |
		#Base64 |
		#FindInMap |
		#If |
		#Join |
		#Select |
		#Split |
		#Sub |
		#Ref
}

// https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-join.html
#Join: {
	"Fn::Join": [string, [...(
		#CUETypes |
		#Base64 |
		#FindInMap |
		#GetAtt |
		#GetAZs |
		#If |
		#ImportValue |
		#Join |
		#Split |
		#Select |
		#Sub |
		#Ref)],
	]
}

// https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-select.html
#Select: {
	"Fn::Select": [
		>=0 |
		#FindInMap |
		#Ref,
		[...(
			#CUETypes |
			#FindInMap |
			#GetAtt |
			#GetAZs |
			#If |
			#Split |
			#Cidr |
			#Ref),
		] |
		#FindInMap |
		#GetAtt |
		#GetAZs |
		#If |
		#Split |
		#Ref,
	]
}

// https://docs.aws.amazon.com/en_pv/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-split.html
#Split: {
	"Fn::Split": [
		string,
		string |
		#Base64 |
		#FindInMap |
		#GetAtt |
		#GetAZs |
		#If |
		#ImportValue |
		#Join |
		#Select |
		#Sub |
		#Ref,
	]
}

#SubFun: [string]: string |
	#Base64 |
	#FindInMap |
	#GetAtt |
	#GetAZs |
	#If |
	#ImportValue |
	#Join |
	#Select |
	#Sub |
	#Ref

// https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-sub.html
#Sub: {
	"Fn::Sub": string | [string, #SubFun]
}

// https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-ref.html
#Ref: {
	Ref: string
}

#LogicCondition: Condition: string

// https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-conditions.html#intrinsic-function-reference-conditions-and
#And: {
	"Fn::And": [...(
		#LogicCondition |
		#And |
		#Equals |
		#Not |
		#Or)]
}

#EqualsT: string |
	number |
	bool |
	#FindInMap |
	#And |
	#Equals |
	#Not |
	#Or |
	#If |
	#Ref

// https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-conditions.html#intrinsic-function-reference-conditions-equals
#Equals: {
	"Fn::Equals": [#EqualsT, #EqualsT]
}

#IfT: #Base64 |
	#FindInMap |
	#GetAtt |
	#GetAZs |
	#If |
	#Join |
	#Select |
	#Sub |
	#Ref |
	#CUETypes //| {...}

// https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-conditions.html#intrinsic-function-reference-conditions-if
#If: {
	"Fn::If": [string] + [#IfT, #IfT]
}

#LogicT: #LogicCondition | #And | #Equals | #Not | #Or

#Not: "Fn::Not": [#LogicT]

#Or: "Fn::Or": [...#LogicT]

#Fn: #Base64 |
	#Cidr |
	#FindInMap |
	#GetAZs |
	#GetAtt |
	#ImportValue |
	#Join |
	#Select |
	#Split |
	#Sub |
	#And |
	#Equals |
	#If |
	#Not |
	#Or |
	#Ref
