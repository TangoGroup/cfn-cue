package AutoScalingPlans

import "github.com/TangoGroup/fn"

ScalingPlan :: {
	Type: "AWS::AutoScalingPlans::ScalingPlan"
	Properties: {
		ApplicationSource: __ApplicationSource
		ScalingInstructions: [...__ScalingInstruction]
	}
	__ApplicationSource :: {
		CloudFormationStackARN?: string | fn.Fn
		TagFilters?: [...__TagFilter]
	}
	__CustomizedLoadMetricSpecification :: {
		Dimensions?: [...__MetricDimension]
		MetricName: string | fn.Fn
		Namespace:  string | fn.Fn
		Statistic:  string | fn.Fn
		Unit?:      string | fn.Fn
	}
	__CustomizedScalingMetricSpecification :: {
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
	__PredefinedLoadMetricSpecification :: {
		PredefinedLoadMetricType: string | fn.Fn
		ResourceLabel?:           string | fn.Fn
	}
	__PredefinedScalingMetricSpecification :: {
		PredefinedScalingMetricType: (string & ("ALBRequestCountPerTarget" | "ASGAverageCPUUtilization" | "ASGAverageNetworkIn" | "ASGAverageNetworkOut")) | fn.Fn
		ResourceLabel?:              string | fn.Fn
	}
	__ScalingInstruction :: {
		CustomizedLoadMetricSpecification?:    __CustomizedLoadMetricSpecification
		DisableDynamicScaling?:                bool | fn.Fn
		MaxCapacity:                           int | fn.Fn
		MinCapacity:                           int | fn.Fn
		PredefinedLoadMetricSpecification?:    __PredefinedLoadMetricSpecification
		PredictiveScalingMaxCapacityBehavior?: (string & ("SetForecastCapacityToMaxCapacity" | "SetMaxCapacityToForecastCapacity" | "SetMaxCapacityAboveForecastCapacity")) | fn.Fn
		PredictiveScalingMaxCapacityBuffer?:   int | fn.Fn
		PredictiveScalingMode?:                (string & ("ForecastAndScale" | "ForecastOnly")) | fn.Fn
		ResourceId:                            string | fn.Fn
		ScalableDimension:                     (string & ("autoscaling:autoScalingGroup:DesiredCapacity" | "ecs:service:DesiredCount" | "ec2:spot-fleet-request:TargetCapacity" | "dynamodb:table:ReadCapacityUnits" | "dynamodb:table:WriteCapacityUnits" | "dynamodb:index:ReadCapacityUnits" | "dynamodb:index:WriteCapacityUnits" | "rds:cluster:ReadReplicaCount")) | fn.Fn
		ScalingPolicyUpdateBehavior?:          string | fn.Fn
		ScheduledActionBufferTime?:            int | fn.Fn
		ServiceNamespace:                      (string & ("autoscaling" | "dynamodb" | "ecs" | "ec2" | "rds")) | fn.Fn
		TargetTrackingConfigurations: [...__TargetTrackingConfiguration]
	}
	__TagFilter :: {
		Key:     string | fn.Fn
		Values?: [...string] | fn.Fn
	}
	__TargetTrackingConfiguration :: {
		CustomizedScalingMetricSpecification?: __CustomizedScalingMetricSpecification
		DisableScaleIn?:                       bool | fn.Fn
		EstimatedInstanceWarmup?:              int | fn.Fn
		PredefinedScalingMetricSpecification?: __PredefinedScalingMetricSpecification
		ScaleInCooldown?:                      int | fn.Fn
		ScaleOutCooldown?:                     int | fn.Fn
		TargetValue:                           float | fn.Fn
	}
}
