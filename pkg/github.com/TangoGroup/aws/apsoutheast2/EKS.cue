package apsoutheast2

import "github.com/TangoGroup/aws/fn"

EKS :: {
	Cluster :: {
		Type: "AWS::EKS::Cluster"
		Properties: {
			Name?: string | fn.Fn
			ResourcesVpcConfig: {
				SecurityGroupIds?: [...(string | fn.Fn)]
				SubnetIds: [...(string | fn.Fn)]
			}
			RoleArn:  string | fn.Fn
			Version?: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}
