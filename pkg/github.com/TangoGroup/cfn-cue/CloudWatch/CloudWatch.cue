package CloudWatch

Alarm :: {
	Type: "AWS::CloudWatch::Alarm"
	Properties: {
		ActionsEnabled?: bool
		AlarmActions?: [...string]
		AlarmDescription?:  string
		AlarmName?:         string
		ComparisonOperator: "GreaterThanOrEqualToThreshold" | "GreaterThanThreshold" | "LessThanOrEqualToThreshold" | "LessThanThreshold"
		ComparisonOperator: string
		DatapointsToAlarm?: int
		Dimensions?: [...__Dimension]
		EvaluateLowSampleCountPercentile?: string
		EvaluationPeriods:                 int
		ExtendedStatistic?:                string
		InsufficientDataActions?: [...string]
		MetricName?: string
		Metrics?: [...__MetricDataQuery]
		Namespace?: string
		OKActions?: [...string]
		Period?:            int
		Statistic?:         "Average" | "Maximum" | "Minimum" | "SampleCount" | "Sum"
		Statistic?:         string
		Threshold?:         float
		ThresholdMetricId?: string
		TreatMissingData?:  "breaching" | "ignore" | "missing" | "notBreaching"
		TreatMissingData?:  string
		Unit?:              "Bits" | "Bits/Second" | "Bytes" | "Bytes/Second" | "Count" | "Count/Second" | "Gigabits" | "Gigabits/Second" | "Gigabytes" | "Gigabytes/Second" | "Kilobits" | "Kilobits/Second" | "Kilobytes" | "Kilobytes/Second" | "Megabits" | "Megabits/Second" | "Megabytes" | "Megabytes/Second" | "Microseconds" | "Milliseconds" | "None" | "Percent" | "Seconds" | "Terabits" | "Terabits/Second" | "Terabytes" | "Terabytes/Second"
		Unit?:              string
	}
	__Dimension :: {
		Name:  string
		Value: string
	}
	__Metric :: {
		Dimensions?: [...__Dimension]
		MetricName?: string
		Namespace?:  string
	}
	__MetricDataQuery :: {
		Expression?: string
		Id:          string
		Label?:      string
		MetricStat?: __MetricStat
		ReturnData?: bool
	}
	__MetricStat :: {
		Metric: __Metric
		Period: int
		Stat:   string
		Unit?:  string
	}
}
AnomalyDetector :: {
	Type: "AWS::CloudWatch::AnomalyDetector"
	Properties: {
		Configuration?: __Configuration
		Dimensions?: [...__Dimension]
		MetricName: string
		Namespace:  string
		Stat:       string
	}
	__Configuration :: {
		ExcludedTimeRanges?: [...__Range]
		MetricTimeZone?: string
	}
	__Dimension :: {
		Name:  string
		Value: string
	}
	__Range :: {
		EndTime:   string
		StartTime: string
	}
}
Dashboard :: {
	Type: "AWS::CloudWatch::Dashboard"
	Properties: {
		DashboardBody:  string
		DashboardName?: string
	}
}
