package saeast1

import "github.com/TangoGroup/fn"

EKS :: {
	Cluster :: {
		Type: "AWS::EKS::Cluster"
		Properties: {
			Name?: string | fn.Fn
			ResourcesVpcConfig: {
			}
			RoleArn:  string | fn.Fn
			Version?: string | fn.Fn
		}
	}
}
