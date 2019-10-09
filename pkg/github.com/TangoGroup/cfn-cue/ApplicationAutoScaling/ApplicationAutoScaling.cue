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
		ScheduledActions?: [...__ScheduledAction]
		ServiceNamespace: string | fn.Fn
		SuspendedState?:  __SuspendedState
	}
	__ScalableTargetAction :: {
		MaxCapacity?: int | fn.Fn
		MinCapacity?: int | fn.Fn
	}
	__ScheduledAction :: {
		EndTime?:              time.Time | fn.Fn
		ScalableTargetAction?: __ScalableTargetAction
		Schedule:              string | fn.Fn
		ScheduledActionName:   string | fn.Fn
		StartTime?:            time.Time | fn.Fn
	}
	__SuspendedState :: {
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
		StepScalingPolicyConfiguration?:           __StepScalingPolicyConfiguration
		TargetTrackingScalingPolicyConfiguration?: __TargetTrackingScalingPolicyConfiguration
	}
	__CustomizedMetricSpecification :: {
		Dimensions?: [...__MetricDimension]
		MetricName: string | fn.Fn
		Namespace:  string | fn.Fn
		Statistic:  (string & ("Average" | "Minimum" | "Maximum" | "SampleCount" | "Sum")) | fn.Fn
		Unit?:      string | fn.Fn
	}
	__MetricDimension :: {
		Name:  string | fn.Fn
		Value: string | fn.Fn
	}
	__PredefinedMetricSpecification :: {
		PredefinedMetricType: (string & ("ALBRequestCountPerTarget" | "DynamoDBReadCapacityUtilization" | "DynamoDBWriteCapacityUtilization" | "EC2SpotFleetRequestAverageCPUUtilization" | "EC2SpotFleetRequestAverageNetworkIn" | "EC2SpotFleetRequestAverageNetworkOut" | "ECSServiceAverageCPUUtilization" | "ECSServiceAverageMemoryUtilization" | "RDSReaderAverageCPUUtilization" | "RDSReaderAverageDatabaseConnections" | "SageMakerVariantInvocationsPerInstance")) | fn.Fn
		ResourceLabel?:       string | fn.Fn
	}
	__StepAdjustment :: {
		MetricIntervalLowerBound?: float | fn.Fn
		MetricIntervalUpperBound?: float | fn.Fn
		ScalingAdjustment:         int | fn.Fn
	}
	__StepScalingPolicyConfiguration :: {
		AdjustmentType?:         string | fn.Fn
		Cooldown?:               int | fn.Fn
		MetricAggregationType?:  string | fn.Fn
		MinAdjustmentMagnitude?: int | fn.Fn
		StepAdjustments?: [...__StepAdjustment]
	}
	__TargetTrackingScalingPolicyConfiguration :: {
		CustomizedMetricSpecification?: __CustomizedMetricSpecification
		DisableScaleIn?:                bool | fn.Fn
		PredefinedMetricSpecification?: __PredefinedMetricSpecification
		ScaleInCooldown?:               int | fn.Fn
		ScaleOutCooldown?:              int | fn.Fn
		TargetValue:                    float | fn.Fn
	}
}
