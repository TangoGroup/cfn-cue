package uswest1

import (
	"github.com/TangoGroup/aws/fn"
	"time"
)

ApplicationAutoScaling :: {
	ScalableTarget :: {
		Type: "AWS::ApplicationAutoScaling::ScalableTarget"
		Properties: {
			MaxCapacity:       int | fn.Fn
			MinCapacity:       int | fn.Fn
			ResourceId:        string | fn.Fn
			RoleARN:           string | fn.Fn
			ScalableDimension: string | fn.Fn
			ScheduledActions?: [...{
				EndTime?: time.Time | fn.Fn
				ScalableTargetAction?: {
					MaxCapacity?: int | fn.Fn
					MinCapacity?: int | fn.Fn
				}
				Schedule:            string | fn.Fn
				ScheduledActionName: string | fn.Fn
				StartTime?:          time.Time | fn.Fn
			}]
			ServiceNamespace: string | fn.Fn
			SuspendedState?: {
				DynamicScalingInSuspended?:  bool | fn.Fn
				DynamicScalingOutSuspended?: bool | fn.Fn
				ScheduledScalingSuspended?:  bool | fn.Fn
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ScalingPolicy :: {
		Type: "AWS::ApplicationAutoScaling::ScalingPolicy"
		Properties: {
			PolicyName:         string | fn.Fn
			PolicyType:         ("StepScaling" | "TargetTrackingScaling") | fn.Fn
			ResourceId?:        string | fn.Fn
			ScalableDimension?: string | fn.Fn
			ScalingTargetId?:   string | fn.Fn
			ServiceNamespace?:  string | fn.Fn
			StepScalingPolicyConfiguration?: {
				AdjustmentType?:         string | fn.Fn
				Cooldown?:               int | fn.Fn
				MetricAggregationType?:  string | fn.Fn
				MinAdjustmentMagnitude?: int | fn.Fn
				StepAdjustments?: [...{
					MetricIntervalLowerBound?: number | fn.Fn
					MetricIntervalUpperBound?: number | fn.Fn
					ScalingAdjustment:         int | fn.Fn
				}]
			}
			TargetTrackingScalingPolicyConfiguration?: {
				CustomizedMetricSpecification?: {
					Dimensions?: [...{
						Name:  string | fn.Fn
						Value: string | fn.Fn
					}]
					MetricName: string | fn.Fn
					Namespace:  string | fn.Fn
					Statistic:  ("Average" | "Minimum" | "Maximum" | "SampleCount" | "Sum") | fn.Fn
					Unit?:      string | fn.Fn
				}
				DisableScaleIn?: bool | fn.Fn
				PredefinedMetricSpecification?: {
					PredefinedMetricType: ("ALBRequestCountPerTarget" | "DynamoDBReadCapacityUtilization" | "DynamoDBWriteCapacityUtilization" | "EC2SpotFleetRequestAverageCPUUtilization" | "EC2SpotFleetRequestAverageNetworkIn" | "EC2SpotFleetRequestAverageNetworkOut" | "ECSServiceAverageCPUUtilization" | "ECSServiceAverageMemoryUtilization" | "RDSReaderAverageCPUUtilization" | "RDSReaderAverageDatabaseConnections" | "SageMakerVariantInvocationsPerInstance" | "LambdaProvisionedConcurrencyUtilization") | fn.Fn
					ResourceLabel?:       string | fn.Fn
				}
				ScaleInCooldown?:  int | fn.Fn
				ScaleOutCooldown?: int | fn.Fn
				TargetValue:       number | fn.Fn
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
