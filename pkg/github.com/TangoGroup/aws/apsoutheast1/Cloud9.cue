package apsoutheast1

import "github.com/TangoGroup/aws/fn"

Cloud9 :: {
	EnvironmentEC2 :: {
		Type: "AWS::Cloud9::EnvironmentEC2"
		Properties: {
			AutomaticStopTimeMinutes?: (int & (>=0 & <=20160)) | fn.Fn
			Description?:              string | fn.Fn
			InstanceType:              string | fn.Fn
			Name?:                     string | fn.Fn
			OwnerArn?:                 string | fn.Fn
			Repositories?: [...{
				PathComponent: string | fn.Fn
				RepositoryUrl: string | fn.Fn
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
	}
}
