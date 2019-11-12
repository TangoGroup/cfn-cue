package apnortheast1

import "github.com/TangoGroup/fn"

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
		}
	}
}
