package euwest3

import (
	"github.com/TangoGroup/aws/fn"
	"time"
)

#ApplicationAutoScaling: {
	#ScalableTarget: {
		Type:       "AWS::ApplicationAutoScaling::ScalableTarget"
		Properties: close({
			MaxCapacity:       int | fn.#Fn
			MinCapacity:       int | fn.#Fn
			ResourceId:        string | fn.#Fn
			RoleARN:           string | fn.#Fn
			ScalableDimension: string | fn.#Fn
			ScheduledActions?: [...close({
				EndTime?:              time.Time | fn.#Fn
				ScalableTargetAction?: close({
					MaxCapacity?: int | fn.#Fn
					MinCapacity?: int | fn.#Fn
				}) | fn.If
				Schedule:            string | fn.#Fn
				ScheduledActionName: string | fn.#Fn
				StartTime?:          time.Time | fn.#Fn
			})] | fn.If
			ServiceNamespace: string | fn.#Fn
			SuspendedState?:  close({
				DynamicScalingInSuspended?:  bool | fn.#Fn
				DynamicScalingOutSuspended?: bool | fn.#Fn
				ScheduledScalingSuspended?:  bool | fn.#Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ScalingPolicy: {
		Type:       "AWS::ApplicationAutoScaling::ScalingPolicy"
		Properties: close({
			PolicyName:                      string | fn.#Fn
			PolicyType:                      ("StepScaling" | "TargetTrackingScaling") | fn.#Fn
			ResourceId?:                     string | fn.#Fn
			ScalableDimension?:              string | fn.#Fn
			ScalingTargetId?:                string | fn.#Fn
			ServiceNamespace?:               string | fn.#Fn
			StepScalingPolicyConfiguration?: close({
				AdjustmentType?:         string | fn.#Fn
				Cooldown?:               int | fn.#Fn
				MetricAggregationType?:  string | fn.#Fn
				MinAdjustmentMagnitude?: int | fn.#Fn
				StepAdjustments?:        [...close({
					MetricIntervalLowerBound?: number | fn.#Fn
					MetricIntervalUpperBound?: number | fn.#Fn
					ScalingAdjustment:         int | fn.#Fn
				})] | fn.If
			}) | fn.If
			TargetTrackingScalingPolicyConfiguration?: close({
				CustomizedMetricSpecification?: close({
					Dimensions?: [...close({
						Name:  string | fn.#Fn
						Value: string | fn.#Fn
					})] | fn.If
					MetricName: string | fn.#Fn
					Namespace:  string | fn.#Fn
					Statistic:  ("Average" | "Minimum" | "Maximum" | "SampleCount" | "Sum") | fn.#Fn
					Unit?:      string | fn.#Fn
				}) | fn.If
				DisableScaleIn?:                bool | fn.#Fn
				PredefinedMetricSpecification?: close({
					PredefinedMetricType: ("ALBRequestCountPerTarget" | "ASGAverageCPUUtilization" | "ASGAverageNetworkIn" | "ASGAverageNetworkOut" | "DynamoDBReadCapacityUtilization" | "DynamoDBWriteCapacityUtilization" | "EC2SpotFleetRequestAverageCPUUtilization" | "EC2SpotFleetRequestAverageNetworkIn" | "EC2SpotFleetRequestAverageNetworkOut" | "ECSServiceAverageCPUUtilization" | "ECSServiceAverageMemoryUtilization" | "RDSReaderAverageCPUUtilization" | "RDSReaderAverageDatabaseConnections" | "SageMakerVariantInvocationsPerInstance" | "LambdaProvisionedConcurrencyUtilization") | fn.#Fn
					ResourceLabel?:       string | fn.#Fn
				}) | fn.If
				ScaleInCooldown?:  int | fn.#Fn
				ScaleOutCooldown?: int | fn.#Fn
				TargetValue:       number | fn.#Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
