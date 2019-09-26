package EKS

Cluster :: {
	Type: "AWS::EKS::Cluster"
	Properties: {
		Name?:              string
		ResourcesVpcConfig: __ResourcesVpcConfig
		RoleArn:            string
		Version?:           string
	}
	__ResourcesVpcConfig :: {
		SecurityGroupIds?: [...string]
		SubnetIds: [...string]
	}
}
