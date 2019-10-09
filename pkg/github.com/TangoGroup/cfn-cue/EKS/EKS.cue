package EKS

import "github.com/TangoGroup/fn"

Cluster :: {
	Type: "AWS::EKS::Cluster"
	Properties: {
		Name?:              string | fn.Fn
		ResourcesVpcConfig: __ResourcesVpcConfig
		RoleArn:            string | fn.Fn
		Version?:           string | fn.Fn
	}
	__ResourcesVpcConfig :: {
		SecurityGroupIds?: [...string] | fn.Fn
		SubnetIds:         [...string] | fn.Fn
	}
}
