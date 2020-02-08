package apsoutheast2

import "github.com/TangoGroup/aws/fn"

Cloud9 :: {
	EnvironmentEC2 :: {
		Type: "AWS::Cloud9::EnvironmentEC2"
		Properties: {
			AutomaticStopTimeMinutes?: int | fn.Fn
			Description?:              string | fn.Fn
			InstanceType:              string | fn.Fn
			Name?:                     string | fn.Fn
			OwnerArn?:                 string | fn.Fn
			Repositories?: [...{
			}]
			SubnetId?: string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
