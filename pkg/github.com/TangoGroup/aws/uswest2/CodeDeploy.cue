package uswest2

import "github.com/TangoGroup/aws/fn"

CodeDeploy :: {
	Application :: {
		Type: "AWS::CodeDeploy::Application"
		Properties: {
			ApplicationName?: string | fn.Fn
			ComputePlatform?: ("ECS" | "Lambda" | "Server") | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	DeploymentConfig :: {
		Type: "AWS::CodeDeploy::DeploymentConfig"
		Properties: {
			DeploymentConfigName?: string | fn.Fn
			MinimumHealthyHosts?:  close({
				Type:  ("FLEET_PERCENT" | "HOST_COUNT") | fn.Fn
				Value: int | fn.Fn
			}) | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	DeploymentGroup :: {
		Type: "AWS::CodeDeploy::DeploymentGroup"
		Properties: {
			AlarmConfiguration?: close({
				Alarms?: [...close({
					Name?: string | fn.Fn
				})] | fn.If
				Enabled?:                bool | fn.Fn
				IgnorePollAlarmFailure?: bool | fn.Fn
			}) | fn.If
			ApplicationName:            string | fn.Fn
			AutoRollbackConfiguration?: close({
				Enabled?: bool | fn.Fn
				Events?:  [...(("DEPLOYMENT_FAILURE" | "DEPLOYMENT_STOP_ON_ALARM" | "DEPLOYMENT_STOP_ON_REQUEST") | fn.Fn)] | (("DEPLOYMENT_FAILURE" | "DEPLOYMENT_STOP_ON_ALARM" | "DEPLOYMENT_STOP_ON_REQUEST") | fn.Fn)
			}) | fn.If
			AutoScalingGroups?: [...(string | fn.Fn)] | (string | fn.Fn)
			Deployment?:        close({
				Description?:                   string | fn.Fn
				IgnoreApplicationStopFailures?: bool | fn.Fn
				Revision:                       close({
					GitHubLocation?: close({
						CommitId:   string | fn.Fn
						Repository: string | fn.Fn
					}) | fn.If
					RevisionType?: string | fn.Fn
					S3Location?:   close({
						Bucket:      string | fn.Fn
						BundleType?: string | fn.Fn
						ETag?:       string | fn.Fn
						Key:         string | fn.Fn
						Version?:    string | fn.Fn
					}) | fn.If
				}) | fn.If
			}) | fn.If
			DeploymentConfigName?: string | fn.Fn
			DeploymentGroupName?:  string | fn.Fn
			DeploymentStyle?:      close({
				DeploymentOption?: ("WITH_TRAFFIC_CONTROL" | "WITHOUT_TRAFFIC_CONTROL") | fn.Fn
				DeploymentType?:   ("BLUE_GREEN" | "IN_PLACE") | fn.Fn
			}) | fn.If
			Ec2TagFilters?: [...close({
				Key?:   string | fn.Fn
				Type?:  string | fn.Fn
				Value?: string | fn.Fn
			})] | fn.If
			Ec2TagSet?: close({
				Ec2TagSetList?: [...close({
					Ec2TagGroup?: [...close({
						Key?:   string | fn.Fn
						Type?:  string | fn.Fn
						Value?: string | fn.Fn
					})] | fn.If
				})] | fn.If
			}) | fn.If
			LoadBalancerInfo?: close({
				ElbInfoList?: [...close({
					Name?: string | fn.Fn
				})] | fn.If
				TargetGroupInfoList?: [...close({
					Name?: string | fn.Fn
				})] | fn.If
			}) | fn.If
			OnPremisesInstanceTagFilters?: [...close({
				Key?:   string | fn.Fn
				Type?:  string | fn.Fn
				Value?: string | fn.Fn
			})] | fn.If
			OnPremisesTagSet?: close({
				OnPremisesTagSetList?: [...close({
					OnPremisesTagGroup?: [...close({
						Key?:   string | fn.Fn
						Type?:  string | fn.Fn
						Value?: string | fn.Fn
					})] | fn.If
				})] | fn.If
			}) | fn.If
			ServiceRoleArn:         string | fn.Fn
			TriggerConfigurations?: [...close({
				TriggerEvents?:    [...(("DeploymentFailure" | "DeploymentReady" | "DeploymentRollback" | "DeploymentStart" | "DeploymentStop" | "DeploymentSuccess" | "InstanceFailure" | "InstanceReady" | "InstanceStart" | "InstanceSuccess") | fn.Fn)] | (("DeploymentFailure" | "DeploymentReady" | "DeploymentRollback" | "DeploymentStart" | "DeploymentStop" | "DeploymentSuccess" | "InstanceFailure" | "InstanceReady" | "InstanceStart" | "InstanceSuccess") | fn.Fn)
				TriggerName?:      string | fn.Fn
				TriggerTargetArn?: string | fn.Fn
			})] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
