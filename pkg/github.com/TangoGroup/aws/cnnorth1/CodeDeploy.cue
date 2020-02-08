package cnnorth1

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
			MinimumHealthyHosts?: {
				Type:  ("FLEET_PERCENT" | "HOST_COUNT") | fn.Fn
				Value: int | fn.Fn
			}
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
			AlarmConfiguration?: {
				Alarms?: [...{
					Name?: string | fn.Fn
				}]
				Enabled?:                bool | fn.Fn
				IgnorePollAlarmFailure?: bool | fn.Fn
			}
			ApplicationName: string | fn.Fn
			AutoRollbackConfiguration?: {
				Enabled?: bool | fn.Fn
				Events?:  [...(("DEPLOYMENT_FAILURE" | "DEPLOYMENT_STOP_ON_ALARM" | "DEPLOYMENT_STOP_ON_REQUEST") | fn.Fn)] | (("DEPLOYMENT_FAILURE" | "DEPLOYMENT_STOP_ON_ALARM" | "DEPLOYMENT_STOP_ON_REQUEST") | fn.Fn)
			}
			AutoScalingGroups?: [...(string | fn.Fn)] | (string | fn.Fn)
			Deployment?: {
				Description?:                   string | fn.Fn
				IgnoreApplicationStopFailures?: bool | fn.Fn
				Revision: {
					GitHubLocation?: {
						CommitId:   string | fn.Fn
						Repository: string | fn.Fn
					}
					RevisionType?: string | fn.Fn
					S3Location?: {
						Bucket:      string | fn.Fn
						BundleType?: string | fn.Fn
						ETag?:       string | fn.Fn
						Key:         string | fn.Fn
						Version?:    string | fn.Fn
					}
				}
			}
			DeploymentConfigName?: string | fn.Fn
			DeploymentGroupName?:  string | fn.Fn
			DeploymentStyle?: {
				DeploymentOption?: ("WITH_TRAFFIC_CONTROL" | "WITHOUT_TRAFFIC_CONTROL") | fn.Fn
				DeploymentType?:   ("BLUE_GREEN" | "IN_PLACE") | fn.Fn
			}
			Ec2TagFilters?: [...{
				Key?:   string | fn.Fn
				Type?:  string | fn.Fn
				Value?: string | fn.Fn
			}]
			Ec2TagSet?: Ec2TagSetList?: [...{
				Ec2TagGroup?: [...{
					Key?:   string | fn.Fn
					Type?:  string | fn.Fn
					Value?: string | fn.Fn
				}]
			}]
			LoadBalancerInfo?: {
				ElbInfoList?: [...{
					Name?: string | fn.Fn
				}]
				TargetGroupInfoList?: [...{
					Name?: string | fn.Fn
				}]
			}
			OnPremisesInstanceTagFilters?: [...{
				Key?:   string | fn.Fn
				Type?:  string | fn.Fn
				Value?: string | fn.Fn
			}]
			OnPremisesTagSet?: OnPremisesTagSetList?: [...{
				OnPremisesTagGroup?: [...{
					Key?:   string | fn.Fn
					Type?:  string | fn.Fn
					Value?: string | fn.Fn
				}]
			}]
			ServiceRoleArn: string | fn.Fn
			TriggerConfigurations?: [...{
				TriggerEvents?:    [...(("DeploymentFailure" | "DeploymentReady" | "DeploymentRollback" | "DeploymentStart" | "DeploymentStop" | "DeploymentSuccess" | "InstanceFailure" | "InstanceReady" | "InstanceStart" | "InstanceSuccess") | fn.Fn)] | (("DeploymentFailure" | "DeploymentReady" | "DeploymentRollback" | "DeploymentStart" | "DeploymentStop" | "DeploymentSuccess" | "InstanceFailure" | "InstanceReady" | "InstanceStart" | "InstanceSuccess") | fn.Fn)
				TriggerName?:      string | fn.Fn
				TriggerTargetArn?: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
