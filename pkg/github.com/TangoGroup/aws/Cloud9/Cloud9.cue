package Cloud9

import "github.com/TangoGroup/fn"

EnvironmentEC2 :: {
	Type: "AWS::Cloud9::EnvironmentEC2"
	Properties: {
		AutomaticStopTimeMinutes?: (int & (>=0 & <=20160)) | fn.Fn
		Description?:              string | fn.Fn
		InstanceType:              string | fn.Fn
		Name?:                     string | fn.Fn
		OwnerArn?:                 string | fn.Fn
		Repositories?: [...propRepository]
		SubnetId?: string | fn.Fn
	}
	propRepository :: {
		PathComponent: string | fn.Fn
		RepositoryUrl: string | fn.Fn
	}
}
