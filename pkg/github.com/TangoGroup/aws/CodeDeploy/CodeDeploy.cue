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
		MinimumHealthyHosts?:  propMinimumHealthyHosts
	}
	propMinimumHealthyHosts :: {
		Type:  (string & ("FLEET_PERCENT" | "HOST_COUNT")) | fn.Fn
		Value: int | fn.Fn
	}
}
DeploymentGroup :: {
	Type: "AWS::CodeDeploy::DeploymentGroup"
	Properties: {
		AlarmConfiguration?:        propAlarmConfiguration
		ApplicationName:            string | fn.Fn
		AutoRollbackConfiguration?: propAutoRollbackConfiguration
		AutoScalingGroups?: [...(string | fn.Fn)]
		Deployment?:           propDeployment
		DeploymentConfigName?: string | fn.Fn
		DeploymentGroupName?:  string | fn.Fn
		DeploymentStyle?:      propDeploymentStyle
		Ec2TagFilters?: [...propEC2TagFilter]
		Ec2TagSet?:        propEC2TagSet
		LoadBalancerInfo?: propLoadBalancerInfo
		OnPremisesInstanceTagFilters?: [...propTagFilter]
		OnPremisesTagSet?: propOnPremisesTagSet
		ServiceRoleArn:    string | fn.Fn
		TriggerConfigurations?: [...propTriggerConfig]
	}
	propAlarm :: {
		Name?: string | fn.Fn
	}
	propAlarmConfiguration :: {
		Alarms?: [...propAlarm]
		Enabled?:                bool | fn.Fn
		IgnorePollAlarmFailure?: bool | fn.Fn
	}
	propAutoRollbackConfiguration :: {
		Enabled?: bool | fn.Fn
		Events?: [...((string & ("DEPLOYMENT_FAILURE" | "DEPLOYMENT_STOP_ON_ALARM" | "DEPLOYMENT_STOP_ON_REQUEST")) | fn.Fn)]
	}
	propDeployment :: {
		Description?:                   string | fn.Fn
		IgnoreApplicationStopFailures?: bool | fn.Fn
		Revision:                       propRevisionLocation
	}
	propDeploymentStyle :: {
		DeploymentOption?: (string & ("WITH_TRAFFIC_CONTROL" | "WITHOUT_TRAFFIC_CONTROL")) | fn.Fn
		DeploymentType?:   (string & ("BLUE_GREEN" | "IN_PLACE")) | fn.Fn
	}
	propEC2TagFilter :: {
		Key?:   string | fn.Fn
		Type?:  string | fn.Fn
		Value?: string | fn.Fn
	}
	propEC2TagSet :: {
		Ec2TagSetList?: [...propEC2TagSetListObject]
	}
	propEC2TagSetListObject :: {
		Ec2TagGroup?: [...propEC2TagFilter]
	}
	propELBInfo :: {
		Name?: string | fn.Fn
	}
	propGitHubLocation :: {
		CommitId:   string | fn.Fn
		Repository: string | fn.Fn
	}
	propLoadBalancerInfo :: {
		ElbInfoList?: [...propELBInfo]
		TargetGroupInfoList?: [...propTargetGroupInfo]
	}
	propOnPremisesTagSet :: {
		OnPremisesTagSetList?: [...propOnPremisesTagSetListObject]
	}
	propOnPremisesTagSetListObject :: {
		OnPremisesTagGroup?: [...propTagFilter]
	}
	propRevisionLocation :: {
		GitHubLocation?: propGitHubLocation
		RevisionType?:   string | fn.Fn
		S3Location?:     propS3Location
	}
	propS3Location :: {
		Bucket:      string | fn.Fn
		BundleType?: string | fn.Fn
		ETag?:       string | fn.Fn
		Key:         string | fn.Fn
		Version?:    string | fn.Fn
	}
	propTagFilter :: {
		Key?:   string | fn.Fn
		Type?:  string | fn.Fn
		Value?: string | fn.Fn
	}
	propTargetGroupInfo :: {
		Name?: string | fn.Fn
	}
	propTriggerConfig :: {
		TriggerEvents?: [...((string & ("DeploymentFailure" | "DeploymentReady" | "DeploymentRollback" | "DeploymentStart" | "DeploymentStop" | "DeploymentSuccess" | "InstanceFailure" | "InstanceReady" | "InstanceStart" | "InstanceSuccess")) | fn.Fn)]
		TriggerName?:      string | fn.Fn
		TriggerTargetArn?: string | fn.Fn
	}
}
