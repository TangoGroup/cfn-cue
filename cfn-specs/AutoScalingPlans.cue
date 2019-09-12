package AutoScalingPlans

ScalingPlan :: {
	Type: "AWS::AutoScalingPlans::ScalingPlan"
	Properties: {
		ApplicationSource: __ApplicationSource
		ScalingInstructions: [...__ScalingInstruction]
	}
	__ApplicationSource = {
		CloudFormationStackARN?: string
		TagFilters?: [...__TagFilter]
	}
	__CustomizedLoadMetricSpecification = {
		Dimensions?: [...__MetricDimension]
		MetricName: string
		Namespace:  string
		Statistic:  string
		Unit?:      string
	}
	__CustomizedScalingMetricSpecification = {
		Dimensions?: [...__MetricDimension]
		MetricName: string
		Namespace:  string
		Statistic:  "Average" | "Minimum" | "Maximum" | "SampleCount" | "Sum"
		Statistic:  string
		Unit?:      string
	}
	__MetricDimension = {
		Name:  string
		Value: string
	}
	__PredefinedLoadMetricSpecification = {
		PredefinedLoadMetricType: string
		ResourceLabel?:           string
	}
	__PredefinedScalingMetricSpecification = {
		PredefinedScalingMetricType: "ALBRequestCountPerTarget" | "ASGAverageCPUUtilization" | "ASGAverageNetworkIn" | "ASGAverageNetworkOut"
		PredefinedScalingMetricType: string
		ResourceLabel?:              string
	}
	__ScalingInstruction = {
		CustomizedLoadMetricSpecification?:    __CustomizedLoadMetricSpecification
		DisableDynamicScaling?:                bool
		MaxCapacity:                           int
		MinCapacity:                           int
		PredefinedLoadMetricSpecification?:    __PredefinedLoadMetricSpecification
		PredictiveScalingMaxCapacityBehavior?: "SetForecastCapacityToMaxCapacity" | "SetMaxCapacityToForecastCapacity" | "SetMaxCapacityAboveForecastCapacity"
		PredictiveScalingMaxCapacityBehavior?: string
		PredictiveScalingMaxCapacityBuffer?:   int
		PredictiveScalingMode?:                "ForecastAndScale" | "ForecastOnly"
		PredictiveScalingMode?:                string
		ResourceId:                            string
		ScalableDimension:                     "autoscaling:autoScalingGroup:DesiredCapacity" | "ecs:service:DesiredCount" | "ec2:spot-fleet-request:TargetCapacity" | "dynamodb:table:ReadCapacityUnits" | "dynamodb:table:WriteCapacityUnits" | "dynamodb:index:ReadCapacityUnits" | "dynamodb:index:WriteCapacityUnits" | "rds:cluster:ReadReplicaCount"
		ScalableDimension:                     string
		ScalingPolicyUpdateBehavior?:          string
		ScheduledActionBufferTime?:            int
		ServiceNamespace:                      "autoscaling" | "dynamodb" | "ecs" | "ec2" | "rds"
		ServiceNamespace:                      string
		TargetTrackingConfigurations: [...__TargetTrackingConfiguration]
	}
	__TagFilter = {
		Key: string
		Values?: [...string]
	}
	__TargetTrackingConfiguration = {
		CustomizedScalingMetricSpecification?: __CustomizedScalingMetricSpecification
		DisableScaleIn?:                       bool
		EstimatedInstanceWarmup?:              int
		PredefinedScalingMetricSpecification?: __PredefinedScalingMetricSpecification
		ScaleInCooldown?:                      int
		ScaleOutCooldown?:                     int
		TargetValue:                           float
	}
}
