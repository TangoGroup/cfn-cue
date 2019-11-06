package ApplicationAutoScaling

import "github.com/TangoGroup/fn"

ScalableTarget :: {
	Type: "AWS::ApplicationAutoScaling::ScalableTarget"
	Properties: {
		MaxCapacity:       int | fn.Fn
		MinCapacity:       int | fn.Fn
		ResourceId:        string | fn.Fn
		RoleARN:           string | fn.Fn
		ScalableDimension: string | fn.Fn
		ScheduledActions?: [...propScheduledAction]
		ServiceNamespace: string | fn.Fn
		SuspendedState?:  propSuspendedState
	}
	propScalableTargetAction :: {
		MaxCapacity?: int | fn.Fn
		MinCapacity?: int | fn.Fn
	}
	propScheduledAction :: {
		EndTime?:              time.Time | fn.Fn
		ScalableTargetAction?: propScalableTargetAction
		Schedule:              string | fn.Fn
		ScheduledActionName:   string | fn.Fn
		StartTime?:            time.Time | fn.Fn
	}
	propSuspendedState :: {
		DynamicScalingInSuspended?:  bool | fn.Fn
		DynamicScalingOutSuspended?: bool | fn.Fn
		ScheduledScalingSuspended?:  bool | fn.Fn
	}
}
ScalingPolicy :: {
	Type: "AWS::ApplicationAutoScaling::ScalingPolicy"
	Properties: {
		PolicyName:                                string | fn.Fn
		PolicyType:                                (string & ("StepScaling" | "TargetTrackingScaling")) | fn.Fn
		ResourceId?:                               string | fn.Fn
		ScalableDimension?:                        string | fn.Fn
		ScalingTargetId?:                          string | fn.Fn
		ServiceNamespace?:                         string | fn.Fn
		StepScalingPolicyConfiguration?:           propStepScalingPolicyConfiguration
		TargetTrackingScalingPolicyConfiguration?: propTargetTrackingScalingPolicyConfiguration
	}
	propCustomizedMetricSpecification :: {
		Dimensions?: [...propMetricDimension]
		MetricName: string | fn.Fn
		Namespace:  string | fn.Fn
		Statistic:  (string & ("Average" | "Minimum" | "Maximum" | "SampleCount" | "Sum")) | fn.Fn
		Unit?:      string | fn.Fn
	}
	propMetricDimension :: {
		Name:  string | fn.Fn
		Value: string | fn.Fn
	}
	propPredefinedMetricSpecification :: {
		PredefinedMetricType: (string & ("ALBRequestCountPerTarget" | "DynamoDBReadCapacityUtilization" | "DynamoDBWriteCapacityUtilization" | "EC2SpotFleetRequestAverageCPUUtilization" | "EC2SpotFleetRequestAverageNetworkIn" | "EC2SpotFleetRequestAverageNetworkOut" | "ECSServiceAverageCPUUtilization" | "ECSServiceAverageMemoryUtilization" | "RDSReaderAverageCPUUtilization" | "RDSReaderAverageDatabaseConnections" | "SageMakerVariantInvocationsPerInstance")) | fn.Fn
		ResourceLabel?:       string | fn.Fn
	}
	propStepAdjustment :: {
		MetricIntervalLowerBound?: float | fn.Fn
		MetricIntervalUpperBound?: float | fn.Fn
		ScalingAdjustment:         int | fn.Fn
	}
	propStepScalingPolicyConfiguration :: {
		AdjustmentType?:         string | fn.Fn
		Cooldown?:               int | fn.Fn
		MetricAggregationType?:  string | fn.Fn
		MinAdjustmentMagnitude?: int | fn.Fn
		StepAdjustments?: [...propStepAdjustment]
	}
	propTargetTrackingScalingPolicyConfiguration :: {
		CustomizedMetricSpecification?: propCustomizedMetricSpecification
		DisableScaleIn?:                bool | fn.Fn
		PredefinedMetricSpecification?: propPredefinedMetricSpecification
		ScaleInCooldown?:               int | fn.Fn
		ScaleOutCooldown?:              int | fn.Fn
		TargetValue:                    float | fn.Fn
	}
}
