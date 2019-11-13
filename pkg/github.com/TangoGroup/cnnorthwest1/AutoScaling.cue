package cnnorthwest1

import "github.com/TangoGroup/fn"

AutoScaling :: {
	AutoScalingGroup :: {
		Type: "AWS::AutoScaling::AutoScalingGroup"
		Properties: {
			AutoScalingGroupName?: string | fn.Fn
			AvailabilityZones?: [...(string | fn.Fn)]
			Cooldown?:                string | fn.Fn
			DesiredCapacity?:         string | fn.Fn
			HealthCheckGracePeriod?:  int | fn.Fn
			HealthCheckType?:         (string & ("EC2" | "ELB")) | fn.Fn
			InstanceId?:              string | fn.Fn
			LaunchConfigurationName?: string | fn.Fn
			LaunchTemplate?: {
				LaunchTemplateId?:   string | fn.Fn
				LaunchTemplateName?: string | fn.Fn
				Version:             string | fn.Fn
			}
			LifecycleHookSpecificationList?: [...{
				DefaultResult?:         (string & ("ABANDON" | "CONTINUE")) | fn.Fn
				HeartbeatTimeout?:      int | fn.Fn
				LifecycleHookName:      string | fn.Fn
				LifecycleTransition:    (string & ("autoscaling:EC2_INSTANCE_LAUNCHING" | "autoscaling:EC2_INSTANCE_TERMINATING")) | fn.Fn
				NotificationMetadata?:  string | fn.Fn
				NotificationTargetARN?: string | fn.Fn
				RoleARN?:               string | fn.Fn
			}]
			LoadBalancerNames?: [...(string | fn.Fn)]
			MaxSize: string | fn.Fn
			MetricsCollection?: [...{
				Granularity: string | fn.Fn
				Metrics?: [...(string | fn.Fn)]
			}]
			MinSize: string | fn.Fn
			MixedInstancesPolicy?: {
				InstancesDistribution?: {
					OnDemandAllocationStrategy?:          string | fn.Fn
					OnDemandBaseCapacity?:                int | fn.Fn
					OnDemandPercentageAboveBaseCapacity?: int | fn.Fn
					SpotAllocationStrategy?:              string | fn.Fn
					SpotInstancePools?:                   int | fn.Fn
					SpotMaxPrice?:                        string | fn.Fn
				}
				LaunchTemplate: {
					LaunchTemplateSpecification: {
						LaunchTemplateId?:   string | fn.Fn
						LaunchTemplateName?: string | fn.Fn
						Version:             string | fn.Fn
					}
					Overrides?: [...{
						InstanceType?: string | fn.Fn
					}]
				}
			}
			NotificationConfigurations?: [...{
				NotificationTypes?: [...(string | fn.Fn)]
				TopicARN: string | fn.Fn
			}]
			PlacementGroup?:       string | fn.Fn
			ServiceLinkedRoleARN?: string | fn.Fn
			Tags?: [...{
				Key:               string | fn.Fn
				PropagateAtLaunch: bool | fn.Fn
				Value:             string | fn.Fn
			}]
			TargetGroupARNs?: [...(string | fn.Fn)]
			TerminationPolicies?: [...(string | fn.Fn)]
			VPCZoneIdentifier?: [...(string | fn.Fn)]
		}
		DependsOn?: string | [...string]
		CreationPolicy?: {
			AutoScalingCreationPolicy?: MinSuccessfulInstancesPercent?: int
			ResourceSignal?: {
				Count?:   int
				Timeout?: string
			}
		}
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	LaunchConfiguration :: {
		Type: "AWS::AutoScaling::LaunchConfiguration"
		Properties: {
			AssociatePublicIpAddress?: bool | fn.Fn
			BlockDeviceMappings?: [...{
				DeviceName: string | fn.Fn
				Ebs?: {
					DeleteOnTermination?: bool | fn.Fn
					Encrypted?:           bool | fn.Fn
					Iops?:                int | fn.Fn
					SnapshotId?:          string | fn.Fn
					VolumeSize?:          int | fn.Fn
					VolumeType?:          (string & ("gp2" | "io1" | "sc1" | "st1" | "standard")) | fn.Fn
				}
				NoDevice?:    bool | fn.Fn
				VirtualName?: string | fn.Fn
			}]
			ClassicLinkVPCId?: string | fn.Fn
			ClassicLinkVPCSecurityGroups?: [...(string | fn.Fn)]
			EbsOptimized?:            bool | fn.Fn
			IamInstanceProfile?:      string | fn.Fn
			ImageId:                  string | fn.Fn
			InstanceId?:              string | fn.Fn
			InstanceMonitoring?:      bool | fn.Fn
			InstanceType:             string | fn.Fn
			KernelId?:                string | fn.Fn
			KeyName?:                 string | fn.Fn
			LaunchConfigurationName?: string | fn.Fn
			PlacementTenancy?:        (string & ("dedicated" | "default")) | fn.Fn
			RamDiskId?:               string | fn.Fn
			SecurityGroups?: [...(string | fn.Fn)]
			SpotPrice?: string | fn.Fn
			UserData?:  string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	LifecycleHook :: {
		Type: "AWS::AutoScaling::LifecycleHook"
		Properties: {
			AutoScalingGroupName:   string | fn.Fn
			DefaultResult?:         (string & ("ABANDON" | "CONTINUE")) | fn.Fn
			HeartbeatTimeout?:      int | fn.Fn
			LifecycleHookName?:     string | fn.Fn
			LifecycleTransition:    (string & ("autoscaling:EC2_INSTANCE_LAUNCHING" | "autoscaling:EC2_INSTANCE_TERMINATING")) | fn.Fn
			NotificationMetadata?:  string | fn.Fn
			NotificationTargetARN?: string | fn.Fn
			RoleARN?:               string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	ScalingPolicy :: {
		Type: "AWS::AutoScaling::ScalingPolicy"
		Properties: {
			AdjustmentType?:          (string & ("ChangeInCapacity" | "ExactCapacity" | "PercentChangeInCapacity")) | fn.Fn
			AutoScalingGroupName:     string | fn.Fn
			Cooldown?:                string | fn.Fn
			EstimatedInstanceWarmup?: int | fn.Fn
			MetricAggregationType?:   (string & ("Average" | "Maximum" | "Minimum")) | fn.Fn
			MinAdjustmentMagnitude?:  int | fn.Fn
			PolicyType?:              (string & ("SimpleScaling" | "StepScaling" | "TargetTrackingScaling")) | fn.Fn
			ScalingAdjustment?:       int | fn.Fn
			StepAdjustments?: [...{
				MetricIntervalLowerBound?: float | fn.Fn
				MetricIntervalUpperBound?: float | fn.Fn
				ScalingAdjustment:         int | fn.Fn
			}]
			TargetTrackingConfiguration?: {
				CustomizedMetricSpecification?: {
					Dimensions?: [...{
						Name:  string | fn.Fn
						Value: string | fn.Fn
					}]
					MetricName: string | fn.Fn
					Namespace:  string | fn.Fn
					Statistic:  (string & ("Average" | "Minimum" | "Maximum" | "SampleCount" | "Sum")) | fn.Fn
					Unit?:      string | fn.Fn
				}
				DisableScaleIn?: bool | fn.Fn
				PredefinedMetricSpecification?: {
					PredefinedMetricType: (string & ("ALBRequestCountPerTarget" | "ASGAverageCPUUtilization" | "ASGAverageNetworkIn" | "ASGAverageNetworkOut")) | fn.Fn
					ResourceLabel?:       string | fn.Fn
				}
				TargetValue: float | fn.Fn
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	ScheduledAction :: {
		Type: "AWS::AutoScaling::ScheduledAction"
		Properties: {
			AutoScalingGroupName: string | fn.Fn
			DesiredCapacity?:     int | fn.Fn
			EndTime?:             string | fn.Fn
			MaxSize?:             int | fn.Fn
			MinSize?:             int | fn.Fn
			Recurrence?:          string | fn.Fn
			StartTime?:           string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}
