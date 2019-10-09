package CloudWatch

import "github.com/TangoGroup/fn"

Alarm :: {
	Type: "AWS::CloudWatch::Alarm"
	Properties: {
		ActionsEnabled?:    bool | fn.Fn
		AlarmActions?:      [...string] | fn.Fn
		AlarmDescription?:  string | fn.Fn
		AlarmName?:         string | fn.Fn
		ComparisonOperator: (string & ("GreaterThanOrEqualToThreshold" | "GreaterThanThreshold" | "LessThanThreshold" | "LessThanOrEqualToThreshold" | "LessThanLowerOrGreaterThanUpperThreshold" | "LessThanLowerThreshold" | "GreaterThanUpperThreshold")) | fn.Fn
		DatapointsToAlarm?: int | fn.Fn
		Dimensions?: [...__Dimension]
		EvaluateLowSampleCountPercentile?: string | fn.Fn
		EvaluationPeriods:                 int | fn.Fn
		ExtendedStatistic?:                string | fn.Fn
		InsufficientDataActions?:          [...string] | fn.Fn
		MetricName?:                       string | fn.Fn
		Metrics?: [...__MetricDataQuery]
		Namespace?:         string | fn.Fn
		OKActions?:         [...string] | fn.Fn
		Period?:            int | fn.Fn
		Statistic?:         (string & ("Average" | "Maximum" | "Minimum" | "SampleCount" | "Sum")) | fn.Fn
		Threshold?:         float | fn.Fn
		ThresholdMetricId?: string | fn.Fn
		TreatMissingData?:  (string & ("breaching" | "ignore" | "missing" | "notBreaching")) | fn.Fn
		Unit?:              (string & ("Bits" | "Bits/Second" | "Bytes" | "Bytes/Second" | "Count" | "Count/Second" | "Gigabits" | "Gigabits/Second" | "Gigabytes" | "Gigabytes/Second" | "Kilobits" | "Kilobits/Second" | "Kilobytes" | "Kilobytes/Second" | "Megabits" | "Megabits/Second" | "Megabytes" | "Megabytes/Second" | "Microseconds" | "Milliseconds" | "None" | "Percent" | "Seconds" | "Terabits" | "Terabits/Second" | "Terabytes" | "Terabytes/Second")) | fn.Fn
	}
	__Dimension :: {
		Name:  string | fn.Fn
		Value: string | fn.Fn
	}
	__Metric :: {
		Dimensions?: [...__Dimension]
		MetricName?: string | fn.Fn
		Namespace?:  string | fn.Fn
	}
	__MetricDataQuery :: {
		Expression?: string | fn.Fn
		Id:          string | fn.Fn
		Label?:      string | fn.Fn
		MetricStat?: __MetricStat
		ReturnData?: bool | fn.Fn
	}
	__MetricStat :: {
		Metric: __Metric
		Period: int | fn.Fn
		Stat:   string | fn.Fn
		Unit?:  string | fn.Fn
	}
}
AnomalyDetector :: {
	Type: "AWS::CloudWatch::AnomalyDetector"
	Properties: {
		Configuration?: __Configuration
		Dimensions?: [...__Dimension]
		MetricName: string | fn.Fn
		Namespace:  string | fn.Fn
		Stat:       string | fn.Fn
	}
	__Configuration :: {
		ExcludedTimeRanges?: [...__Range]
		MetricTimeZone?: string | fn.Fn
	}
	__Dimension :: {
		Name:  string | fn.Fn
		Value: string | fn.Fn
	}
	__Range :: {
		EndTime:   string | fn.Fn
		StartTime: string | fn.Fn
	}
}
Dashboard :: {
	Type: "AWS::CloudWatch::Dashboard"
	Properties: {
		DashboardBody:  string | fn.Fn
		DashboardName?: string | fn.Fn
	}
}
