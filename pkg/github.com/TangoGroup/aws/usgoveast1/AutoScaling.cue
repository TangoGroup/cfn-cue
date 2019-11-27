package usgoveast1

import "github.com/TangoGroup/aws/fn"

AutoScaling :: {
	AutoScalingGroup :: {
		Type: "AWS::AutoScaling::AutoScalingGroup"
		Properties: {
			AutoScalingGroupName?:    string | fn.Fn
			AvailabilityZones?:       [...(string | fn.Fn)] | fn.Fn
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
			LoadBalancerNames?: [...(string | fn.Fn)] | fn.Fn
			MaxSize:            string | fn.Fn
			MetricsCollection?: [...{
				Granularity: string | fn.Fn
				Metrics?:    [...(string | fn.Fn)] | fn.Fn
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
				NotificationTypes?: [...(string | fn.Fn)] | fn.Fn
				TopicARN:           string | fn.Fn
			}]
			PlacementGroup?:       string | fn.Fn
			ServiceLinkedRoleARN?: string | fn.Fn
			Tags?: [...{
				Key:               string | fn.Fn
				PropagateAtLaunch: bool | fn.Fn
				Value:             string | fn.Fn
			}]
			TargetGroupARNs?:     [...(string | fn.Fn)] | fn.Fn
			TerminationPolicies?: [...(string | fn.Fn)] | fn.Fn
			VPCZoneIdentifier?:   [...(string | fn.Fn)] | fn.Fn
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
			ClassicLinkVPCId?:             string | fn.Fn
			ClassicLinkVPCSecurityGroups?: [...(string | fn.Fn)] | fn.Fn
			EbsOptimized?:                 bool | fn.Fn
			IamInstanceProfile?:           string | fn.Fn
			ImageId:                       string | fn.Fn
			InstanceId?:                   string | fn.Fn
			InstanceMonitoring?:           bool | fn.Fn
			InstanceType:                  (string & ("c5.18xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.xlarge" | "c5d.18xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.xlarge" | "c5n.18xlarge" | "c5n.2xlarge" | "c5n.4xlarge" | "c5n.9xlarge" | "c5n.large" | "c5n.metal" | "c5n.xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.metal" | "i3.xlarge" | "i3en.12xlarge" | "i3en.24xlarge" | "i3en.2xlarge" | "i3en.3xlarge" | "i3en.6xlarge" | "i3en.large" | "i3en.metal" | "i3en.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5a.12xlarge" | "m5a.16xlarge" | "m5a.24xlarge" | "m5a.2xlarge" | "m5a.4xlarge" | "m5a.8xlarge" | "m5a.large" | "m5a.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "p3dn.24xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5a.12xlarge" | "r5a.16xlarge" | "r5a.24xlarge" | "r5a.2xlarge" | "r5a.4xlarge" | "r5a.8xlarge" | "r5a.large" | "r5a.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "t3a.2xlarge" | "t3a.large" | "t3a.medium" | "t3a.micro" | "t3a.nano" | "t3a.small" | "t3a.xlarge" | "x1.16xlarge" | "x1.32xlarge" | "x1e.16xlarge" | "x1e.2xlarge" | "x1e.32xlarge" | "x1e.4xlarge" | "x1e.8xlarge" | "x1e.xlarge")) | fn.Fn
			KernelId?:                     string | fn.Fn
			KeyName?:                      string | fn.Fn
			LaunchConfigurationName?:      string | fn.Fn
			PlacementTenancy?:             (string & ("dedicated" | "default")) | fn.Fn
			RamDiskId?:                    string | fn.Fn
			SecurityGroups?:               [...(string | fn.Fn)] | fn.Fn
			SpotPrice?:                    string | fn.Fn
			UserData?:                     string | fn.Fn
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
