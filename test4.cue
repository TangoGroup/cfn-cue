package test

import aws "github.com/TangoGroup/aws/uswest2"

template: aws.Template
template: {
	Parameters: InstanceSecurityGroup1: Type: "AWS::EC2::SecurityGroup::Id"
	// Parameters: myVPC: Type:                  "AWS::EC2::SecurityGroup::Id"
	Parameters: myVPC: Type: "AWS::EC2::VPC::Id"
	// Parameters: myVPC: Type:           "AWS::SSM::Parameter::Value<AWS::EC2::VPC::Id>"
	Parameters: KeyName: Type:               "AWS::EC2::KeyPair::KeyName"
	Parameters: LatestAmiId: Type:           "AWS::EC2::Image::Id"
	Parameters: InstanceType: Type:          "String"
	Parameters: S3AccessControl: Type:       "String"
	Parameters: SecurityGroupProperty: Type: "String"
	Resources: {
		S3Bucket1: {
			Type: "AWS::S3::Bucket"
			Properties: AccessControl: Ref: "S3AccessControl" //"AuthenticatedRead"
		}
		InstanceSecurityGroup: {
			Type: "AWS::EC2::SecurityGroup"
			Properties : {
				GroupDescription : "Allow http to client host"
				VpcId : Ref : "myVPC"
				SecurityGroupIngress : [{
					IpProtocol : "tcp"
					FromPort :   80
					ToPort :     80
					CidrIp :     "0.0.0.0/0"
				}]
				SecurityGroupEgress : [{
					IpProtocol : "tcp"
					FromPort :   80
					ToPort :     80
					CidrIp :     "0.0.0.0/0"
				}]
			}
		}
		InstanceSecurityGroup10: {
			Type: "AWS::EC2::SecurityGroup"
			Properties : {
				GroupDescription : "Allow http to client host"
				// VpcId : "Fn::GetAtt" : "InstanceSecurityGroup.VpcId"
				VpcId : "Fn::GetAtt" : ["InstanceSecurityGroup", "VpcId"]
				// VpcId : "Fn::GetAtt" : "InstanceSecurityGroup11.VpcId"
				// VpcId : "Fn::GetAtt" : "S3Bucket1.VpcId"
				// VpcId : "Fn::GetAtt" : ["S3Bucket1", "VpcId"]
			}
		}

		// EC2Instance: {
		// 	Type: "AWS::EC2::Instance"
		// 	Properties: {
		// 		InstanceType: Ref: "InstanceType"
		// 		// {
		// 		//  if SecurityGroups.Ref != _|_ {
		// 		//   RefName = SecurityGroups.Ref
		// 		//   if (Resources[RefName] == _|_) && (Parameters[RefName] == _|_ ) {
		// 		//    SecurityGroups: Ref: "`\(RefName)` is not a valid Resource or Parameter name"
		// 		//   }
		// 		//   if Resources[RefName] != _|_ {
		// 		//    if Resources[RefName].Type != "AWS::EC2::SecurityGroup" {
		// 		//     SecurityGroups: Ref: "`\(RefName)` is not a Resource of type AWS::EC2::SecurityGroup"
		// 		//    }
		// 		//   }
		// 		//   if Parameters[RefName] != _|_ {
		// 		//    if Parameters[RefName].Type != "AWS::EC2::SecurityGroup::Id" {
		// 		//     SecurityGroups: Ref: "`\(RefName)` is not a Parameter of type AWS::EC2::SecurityGroup::Id"
		// 		//    }
		// 		//   }
		// 		//  }
		// 		// }

		// 		// SecurityGroups: Ref: "S3Bucket1"
		// 		// SecurityGroups: "Fn::GetAtt": "InstanceSecurityGroup2.GroupId"
		// 		// SecurityGroups: "Fn::GetAtt": "InstanceSecurityGroup.GroupId"
		// 		// SecurityGroups: "Fn::GetAtt": ["InstanceSecurityGroup2", "GroupId"]
		// 		SecurityGroups: "Fn::GetAtt": ["InstanceSecurityGroup", "GroupId"]
		// 		// SecurityGroups: "Fn::GetAtt": "S3Bucket1.GroupId"
		// 		// SecurityGroups: "Fn::GetAtt": ["S3Bucket1", "GroupId"]
		// 		// SecurityGroups: "Fn::GetAtt": ["InstanceSecurityGroup", {Ref: "SecurityGroupProperty"}]
		// 		// SecurityGroups: Ref: "InstanceSecurityGroup2"
		// 		// SecurityGroups: Ref: "InstanceSecurityGroup1"
		// 		// SecurityGroups: Ref: "InstanceSecurityGroup"
		// 		// SecurityGroups: [{
		// 		//  Ref: "InstanceSecurityGroup"
		// 		// }]
		// 		KeyName: Ref: "KeyName"
		// 		ImageId: Ref: "LatestAmiId"
		// 	}
		// }
	}
}
// validations :: {
//  if ((template.Resources.EC2Instance.Properties.SecurityGroups & fn.Ref) != _|_) {
//   RefName = template.Resources.EC2Instance.Properties.SecurityGroups.Ref
//   name : RefName
//   if template.Resources[RefName] != _|_ {
//    TemplateType: "resource"
//    ResourceType: template.Resources[RefName].Type
//    ResourceType: "AWS::EC2::SecurityGroup"
//   }
//   if template.Parameters[RefName] != _|_ {
//    TemplateType: "parameter"
//    ResourceType: template.Parameters[RefName].Type
//    ResourceType: "AWS::EC2::SecurityGroup::Id"
//   }
//   if (template.Resources[RefName] == _|_) && (template.Parameters[RefName] == _|_ ) {
//    error: RefName & "is not a valid Resource or Parameter name"
//   }
//  }
// }
