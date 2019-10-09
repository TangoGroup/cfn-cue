package GameLift

import "github.com/TangoGroup/fn"

Alias :: {
	Type: "AWS::GameLift::Alias"
	Properties: {
		Description?:    string | fn.Fn
		Name:            string | fn.Fn
		RoutingStrategy: __RoutingStrategy
	}
	__RoutingStrategy :: {
		FleetId?: string | fn.Fn
		Message?: string | fn.Fn
		Type:     string | fn.Fn
	}
}
Build :: {
	Type: "AWS::GameLift::Build"
	Properties: {
		Name?:            string | fn.Fn
		StorageLocation?: __S3Location
		Version?:         string | fn.Fn
	}
	__S3Location :: {
		Bucket:  string | fn.Fn
		Key:     string | fn.Fn
		RoleArn: string | fn.Fn
	}
}
Fleet :: {
	Type: "AWS::GameLift::Fleet"
	Properties: {
		BuildId:             string | fn.Fn
		Description?:        string | fn.Fn
		DesiredEC2Instances: int | fn.Fn
		EC2InboundPermissions?: [...__IpPermission]
		EC2InstanceType:         string | fn.Fn
		LogPaths?:               [...string] | fn.Fn
		MaxSize?:                int | fn.Fn
		MinSize?:                int | fn.Fn
		Name:                    string | fn.Fn
		ServerLaunchParameters?: string | fn.Fn
		ServerLaunchPath:        string | fn.Fn
	}
	__IpPermission :: {
		FromPort: int | fn.Fn
		IpRange:  string | fn.Fn
		Protocol: string | fn.Fn
		ToPort:   int | fn.Fn
	}
}
