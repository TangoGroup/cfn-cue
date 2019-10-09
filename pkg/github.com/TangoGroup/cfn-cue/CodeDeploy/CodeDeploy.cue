package CodeDeploy

import "github.com/TangoGroup/fn"

Application :: {
	Type: "AWS::CodeDeploy::Application"
	Properties: {
		ApplicationName?: string | fn.Fn
		ComputePlatform?: (string & ("ECS" | "Lambda" | "Server")) | fn.Fn
	}
}
DeploymentConfig :: {
	Type: "AWS::CodeDeploy::DeploymentConfig"
	Properties: {
		DeploymentConfigName?: string | fn.Fn
		MinimumHealthyHosts?:  __MinimumHealthyHosts
	}
	__MinimumHealthyHosts :: {
		Type:  (string & ("FLEET_PERCENT" | "HOST_COUNT")) | fn.Fn
		Value: int | fn.Fn
	}
}
DeploymentGroup :: {
	Type: "AWS::CodeDeploy::DeploymentGroup"
	Properties: {
		AlarmConfiguration?:        __AlarmConfiguration
		ApplicationName:            string | fn.Fn
		AutoRollbackConfiguration?: __AutoRollbackConfiguration
		AutoScalingGroups?:         [...string] | fn.Fn
		Deployment?:                __Deployment
		DeploymentConfigName?:      string | fn.Fn
		DeploymentGroupName?:       string | fn.Fn
		DeploymentStyle?:           __DeploymentStyle
		Ec2TagFilters?: [...__EC2TagFilter]
		Ec2TagSet?:        __EC2TagSet
		LoadBalancerInfo?: __LoadBalancerInfo
		OnPremisesInstanceTagFilters?: [...__TagFilter]
		OnPremisesTagSet?: __OnPremisesTagSet
		ServiceRoleArn:    string | fn.Fn
		TriggerConfigurations?: [...__TriggerConfig]
	}
	__Alarm :: {
		Name?: string | fn.Fn
	}
	__AlarmConfiguration :: {
		Alarms?: [...__Alarm]
		Enabled?:                bool | fn.Fn
		IgnorePollAlarmFailure?: bool | fn.Fn
	}
	__AutoRollbackConfiguration :: {
		Enabled?: bool | fn.Fn
		Events?:  ([...string] & ("DEPLOYMENT_FAILURE" | "DEPLOYMENT_STOP_ON_ALARM" | "DEPLOYMENT_STOP_ON_REQUEST")) | fn.Fn
	}
	__Deployment :: {
		Description?:                   string | fn.Fn
		IgnoreApplicationStopFailures?: bool | fn.Fn
		Revision:                       __RevisionLocation
	}
	__DeploymentStyle :: {
		DeploymentOption?: (string & ("WITH_TRAFFIC_CONTROL" | "WITHOUT_TRAFFIC_CONTROL")) | fn.Fn
		DeploymentType?:   (string & ("BLUE_GREEN" | "IN_PLACE")) | fn.Fn
	}
	__EC2TagFilter :: {
		Key?:   string | fn.Fn
		Type?:  string | fn.Fn
		Value?: string | fn.Fn
	}
	__EC2TagSet :: {
		Ec2TagSetList?: [...__EC2TagSetListObject]
	}
	__EC2TagSetListObject :: {
		Ec2TagGroup?: [...__EC2TagFilter]
	}
	__ELBInfo :: {
		Name?: string | fn.Fn
	}
	__GitHubLocation :: {
		CommitId:   string | fn.Fn
		Repository: string | fn.Fn
	}
	__LoadBalancerInfo :: {
		ElbInfoList?: [...__ELBInfo]
		TargetGroupInfoList?: [...__TargetGroupInfo]
	}
	__OnPremisesTagSet :: {
		OnPremisesTagSetList?: [...__OnPremisesTagSetListObject]
	}
	__OnPremisesTagSetListObject :: {
		OnPremisesTagGroup?: [...__TagFilter]
	}
	__RevisionLocation :: {
		GitHubLocation?: __GitHubLocation
		RevisionType?:   string | fn.Fn
		S3Location?:     __S3Location
	}
	__S3Location :: {
		Bucket:      string | fn.Fn
		BundleType?: string | fn.Fn
		ETag?:       string | fn.Fn
		Key:         string | fn.Fn
		Version?:    string | fn.Fn
	}
	__TagFilter :: {
		Key?:   string | fn.Fn
		Type?:  string | fn.Fn
		Value?: string | fn.Fn
	}
	__TargetGroupInfo :: {
		Name?: string | fn.Fn
	}
	__TriggerConfig :: {
		TriggerEvents?:    ([...string] & ("DeploymentFailure" | "DeploymentReady" | "DeploymentRollback" | "DeploymentStart" | "DeploymentStop" | "DeploymentSuccess" | "InstanceFailure" | "InstanceReady" | "InstanceStart" | "InstanceSuccess")) | fn.Fn
		TriggerName?:      string | fn.Fn
		TriggerTargetArn?: string | fn.Fn
	}
}
