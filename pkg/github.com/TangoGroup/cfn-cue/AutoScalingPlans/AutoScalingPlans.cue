package AutoScalingPlans

import "github.com/TangoGroup/fn"

ScalingPlan :: {
	Type: "AWS::AutoScalingPlans::ScalingPlan"
	Properties: {
		ApplicationSource: propApplicationSource
		ScalingInstructions: [...propScalingInstruction]
	}
	propApplicationSource :: {
		CloudFormationStackARN?: string | fn.Fn
		TagFilters?: [...propTagFilter]
	}
	propCustomizedLoadMetricSpecification :: {
		Dimensions?: [...propMetricDimension]
		MetricName: string | fn.Fn
		Namespace:  string | fn.Fn
		Statistic:  string | fn.Fn
		Unit?:      string | fn.Fn
	}
	propCustomizedScalingMetricSpecification :: {
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
	propPredefinedLoadMetricSpecification :: {
		PredefinedLoadMetricType: string | fn.Fn
		ResourceLabel?:           string | fn.Fn
	}
	propPredefinedScalingMetricSpecification :: {
		PredefinedScalingMetricType: (string & ("ALBRequestCountPerTarget" | "ASGAverageCPUUtilization" | "ASGAverageNetworkIn" | "ASGAverageNetworkOut")) | fn.Fn
		ResourceLabel?:              string | fn.Fn
	}
	propScalingInstruction :: {
		CustomizedLoadMetricSpecification?:    propCustomizedLoadMetricSpecification
		DisableDynamicScaling?:                bool | fn.Fn
		MaxCapacity:                           int | fn.Fn
		MinCapacity:                           int | fn.Fn
		PredefinedLoadMetricSpecification?:    propPredefinedLoadMetricSpecification
		PredictiveScalingMaxCapacityBehavior?: (string & ("SetForecastCapacityToMaxCapacity" | "SetMaxCapacityToForecastCapacity" | "SetMaxCapacityAboveForecastCapacity")) | fn.Fn
		PredictiveScalingMaxCapacityBuffer?:   int | fn.Fn
		PredictiveScalingMode?:                (string & ("ForecastAndScale" | "ForecastOnly")) | fn.Fn
		ResourceId:                            string | fn.Fn
		ScalableDimension:                     (string & ("autoscaling:autoScalingGroup:DesiredCapacity" | "ecs:service:DesiredCount" | "ec2:spot-fleet-request:TargetCapacity" | "dynamodb:table:ReadCapacityUnits" | "dynamodb:table:WriteCapacityUnits" | "dynamodb:index:ReadCapacityUnits" | "dynamodb:index:WriteCapacityUnits" | "rds:cluster:ReadReplicaCount")) | fn.Fn
		ScalingPolicyUpdateBehavior?:          string | fn.Fn
		ScheduledActionBufferTime?:            int | fn.Fn
		ServiceNamespace:                      (string & ("autoscaling" | "dynamodb" | "ecs" | "ec2" | "rds")) | fn.Fn
		TargetTrackingConfigurations: [...propTargetTrackingConfiguration]
	}
	propTagFilter :: {
		Key:     string | fn.Fn
		Values?: [...string] | fn.Fn
	}
	propTargetTrackingConfiguration :: {
		CustomizedScalingMetricSpecification?: propCustomizedScalingMetricSpecification
		DisableScaleIn?:                       bool | fn.Fn
		EstimatedInstanceWarmup?:              int | fn.Fn
		PredefinedScalingMetricSpecification?: propPredefinedScalingMetricSpecification
		ScaleInCooldown?:                      int | fn.Fn
		ScaleOutCooldown?:                     int | fn.Fn
		TargetValue:                           float | fn.Fn
	}
}
