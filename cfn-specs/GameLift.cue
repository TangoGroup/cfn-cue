package GameLift

Alias :: {
	Type: "AWS::GameLift::Alias"
	Properties: {
		Description?:    string
		Name:            string
		RoutingStrategy: __RoutingStrategy
	}
	__RoutingStrategy = {
		FleetId?: string
		Message?: string
		Type:     string
	}
}
Build :: {
	Type: "AWS::GameLift::Build"
	Properties: {
		Name?:            string
		StorageLocation?: __S3Location
		Version?:         string
	}
	__S3Location = {
		Bucket:  string
		Key:     string
		RoleArn: string
	}
}
Fleet :: {
	Type: "AWS::GameLift::Fleet"
	Properties: {
		BuildId:             string
		Description?:        string
		DesiredEC2Instances: int
		EC2InboundPermissions?: [...__IpPermission]
		EC2InstanceType: string
		LogPaths?: [...string]
		MaxSize?:                int
		MinSize?:                int
		Name:                    string
		ServerLaunchParameters?: string
		ServerLaunchPath:        string
	}
	__IpPermission = {
		FromPort: int
		IpRange:  string
		Protocol: string
		ToPort:   int
	}
}
