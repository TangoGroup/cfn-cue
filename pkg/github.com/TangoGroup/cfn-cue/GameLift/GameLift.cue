package GameLift

import "github.com/TangoGroup/fn"

Alias :: {
	Type: "AWS::GameLift::Alias"
	Properties: {
		Description?:    string | fn.Fn
		Name:            string | fn.Fn
		RoutingStrategy: propRoutingStrategy
	}
	propRoutingStrategy :: {
		FleetId?: string | fn.Fn
		Message?: string | fn.Fn
		Type:     string | fn.Fn
	}
}
Build :: {
	Type: "AWS::GameLift::Build"
	Properties: {
		Name?:            string | fn.Fn
		StorageLocation?: propS3Location
		Version?:         string | fn.Fn
	}
	propS3Location :: {
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
		EC2InboundPermissions?: [...propIpPermission]
		EC2InstanceType:         string | fn.Fn
		LogPaths?:               [...string] | fn.Fn
		MaxSize?:                int | fn.Fn
		MinSize?:                int | fn.Fn
		Name:                    string | fn.Fn
		ServerLaunchParameters?: string | fn.Fn
		ServerLaunchPath:        string | fn.Fn
	}
	propIpPermission :: {
		FromPort: int | fn.Fn
		IpRange:  string | fn.Fn
		Protocol: string | fn.Fn
		ToPort:   int | fn.Fn
	}
}
