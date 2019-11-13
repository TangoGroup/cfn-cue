package eucentral1

import "github.com/TangoGroup/aws/fn"

AutoScalingPlans :: {
	ScalingPlan :: {
		Type: "AWS::AutoScalingPlans::ScalingPlan"
		Properties: {
			ApplicationSource: {
				CloudFormationStackARN?: string | fn.Fn
				TagFilters?: [...{
					Key: string | fn.Fn
					Values?: [...(string | fn.Fn)]
				}]
			}
			ScalingInstructions: [...{
				CustomizedLoadMetricSpecification?: {
					Dimensions?: [...{
						Name:  string | fn.Fn
						Value: string | fn.Fn
					}]
					MetricName: string | fn.Fn
					Namespace:  string | fn.Fn
					Statistic:  string | fn.Fn
					Unit?:      string | fn.Fn
				}
				DisableDynamicScaling?: bool | fn.Fn
				MaxCapacity:            int | fn.Fn
				MinCapacity:            int | fn.Fn
				PredefinedLoadMetricSpecification?: {
					PredefinedLoadMetricType: string | fn.Fn
					ResourceLabel?:           string | fn.Fn
				}
				PredictiveScalingMaxCapacityBehavior?: (string & ("SetForecastCapacityToMaxCapacity" | "SetMaxCapacityToForecastCapacity" | "SetMaxCapacityAboveForecastCapacity")) | fn.Fn
				PredictiveScalingMaxCapacityBuffer?:   int | fn.Fn
				PredictiveScalingMode?:                (string & ("ForecastAndScale" | "ForecastOnly")) | fn.Fn
				ResourceId:                            string | fn.Fn
				ScalableDimension:                     (string & ("autoscaling:autoScalingGroup:DesiredCapacity" | "ecs:service:DesiredCount" | "ec2:spot-fleet-request:TargetCapacity" | "dynamodb:table:ReadCapacityUnits" | "dynamodb:table:WriteCapacityUnits" | "dynamodb:index:ReadCapacityUnits" | "dynamodb:index:WriteCapacityUnits" | "rds:cluster:ReadReplicaCount")) | fn.Fn
				ScalingPolicyUpdateBehavior?:          string | fn.Fn
				ScheduledActionBufferTime?:            int | fn.Fn
				ServiceNamespace:                      (string & ("autoscaling" | "dynamodb" | "ecs" | "ec2" | "rds")) | fn.Fn
				TargetTrackingConfigurations: [...{
					CustomizedScalingMetricSpecification?: {
						Dimensions?: [...{
							Name:  string | fn.Fn
							Value: string | fn.Fn
						}]
						MetricName: string | fn.Fn
						Namespace:  string | fn.Fn
						Statistic:  (string & ("Average" | "Minimum" | "Maximum" | "SampleCount" | "Sum")) | fn.Fn
						Unit?:      string | fn.Fn
					}
					DisableScaleIn?:          bool | fn.Fn
					EstimatedInstanceWarmup?: int | fn.Fn
					PredefinedScalingMetricSpecification?: {
						PredefinedScalingMetricType: (string & ("ALBRequestCountPerTarget" | "ASGAverageCPUUtilization" | "ASGAverageNetworkIn" | "ASGAverageNetworkOut")) | fn.Fn
						ResourceLabel?:              string | fn.Fn
					}
					ScaleInCooldown?:  int | fn.Fn
					ScaleOutCooldown?: int | fn.Fn
					TargetValue:       float | fn.Fn
				}]
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}
