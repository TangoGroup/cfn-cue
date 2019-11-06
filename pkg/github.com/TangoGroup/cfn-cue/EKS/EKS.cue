package EKS

import "github.com/TangoGroup/fn"

Cluster :: {
	Type: "AWS::EKS::Cluster"
	Properties: {
		Name?:              string | fn.Fn
		ResourcesVpcConfig: propResourcesVpcConfig
		RoleArn:            string | fn.Fn
		Version?:           string | fn.Fn
	}
	propResourcesVpcConfig :: {
		SecurityGroupIds?: [...string] | fn.Fn
		SubnetIds:         [...string] | fn.Fn
	}
}
