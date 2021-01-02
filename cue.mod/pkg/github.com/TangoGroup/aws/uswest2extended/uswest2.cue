package uswest2extended

#ResourceSpecificationVersion: "22.0.0"
#Template: {
	Description?: string
	Resources: [=~"[a-zA-Z0-9]"]: {
		Description?: string
		Type:         "AWS::AutoScaling::LaunchConfiguration" | "AWS::CloudFormation::CustomResource" | "AWS::EC2::Instance" | "AWS::EC2::SecurityGroup" | "AWS::EMR::Cluster" | "AWS::S3::Bucket" | =~#"^Custom::[a-zA-Z0-9_@-]{1,60}$"#
		Properties: [string]: _
		DependsOn?: string | [...string]
	}
}
