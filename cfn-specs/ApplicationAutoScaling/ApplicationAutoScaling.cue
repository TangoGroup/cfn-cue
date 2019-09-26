package ApplicationAutoScaling

ScalableTarget :: {
	Type: "AWS::ApplicationAutoScaling::ScalableTarget"
	Properties: {
		MaxCapacity:       int
		MinCapacity:       int
		ResourceId:        string
		RoleARN:           string
		ScalableDimension: string
		ScheduledActions?: [...__ScheduledAction]
		ServiceNamespace: string
		SuspendedState?:  __SuspendedState
	}
	__ScalableTargetAction :: {
		MaxCapacity?: int
		MinCapacity?: int
	}
	__ScheduledAction :: {
		EndTime?:              time.Time
		ScalableTargetAction?: __ScalableTargetAction
		Schedule:              string
		ScheduledActionName:   string
		StartTime?:            time.Time
	}
	__SuspendedState :: {
		DynamicScalingInSuspended?:  bool
		DynamicScalingOutSuspended?: bool
		ScheduledScalingSuspended?:  bool
	}
}
ScalingPolicy :: {
	Type: "AWS::ApplicationAutoScaling::ScalingPolicy"
	Properties: {
		PolicyName:                                string
		PolicyType:                                "StepScaling" | "TargetTrackingScaling"
		PolicyType:                                string
		ResourceId?:                               string
		ScalableDimension?:                        string
		ScalingTargetId?:                          string
		ServiceNamespace?:                         string
		StepScalingPolicyConfiguration?:           __StepScalingPolicyConfiguration
		TargetTrackingScalingPolicyConfiguration?: __TargetTrackingScalingPolicyConfiguration
	}
	__CustomizedMetricSpecification :: {
		Dimensions?: [...__MetricDimension]
		MetricName: string
		Namespace:  string
		Statistic:  "Average" | "Minimum" | "Maximum" | "SampleCount" | "Sum"
		Statistic:  string
		Unit?:      string
	}
	__MetricDimension :: {
		Name:  string
		Value: string
	}
	__PredefinedMetricSpecification :: {
		PredefinedMetricType: "ALBRequestCountPerTarget" | "DynamoDBReadCapacityUtilization" | "DynamoDBWriteCapacityUtilization" | "EC2SpotFleetRequestAverageCPUUtilization" | "EC2SpotFleetRequestAverageNetworkIn" | "EC2SpotFleetRequestAverageNetworkOut" | "ECSServiceAverageCPUUtilization" | "ECSServiceAverageMemoryUtilization" | "RDSReaderAverageCPUUtilization" | "RDSReaderAverageDatabaseConnections" | "SageMakerVariantInvocationsPerInstance"
		PredefinedMetricType: string
		ResourceLabel?:       string
	}
	__StepAdjustment :: {
		MetricIntervalLowerBound?: float
		MetricIntervalUpperBound?: float
		ScalingAdjustment:         int
	}
	__StepScalingPolicyConfiguration :: {
		AdjustmentType?:         string
		Cooldown?:               int
		MetricAggregationType?:  string
		MinAdjustmentMagnitude?: int
		StepAdjustments?: [...__StepAdjustment]
	}
	__TargetTrackingScalingPolicyConfiguration :: {
		CustomizedMetricSpecification?: __CustomizedMetricSpecification
		DisableScaleIn?:                bool
		PredefinedMetricSpecification?: __PredefinedMetricSpecification
		ScaleInCooldown?:               int
		ScaleOutCooldown?:              int
		TargetValue:                    float
	}
}
