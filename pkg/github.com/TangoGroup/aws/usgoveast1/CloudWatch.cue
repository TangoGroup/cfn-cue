package usgoveast1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

CloudWatch :: {
	Alarm :: {
		Type:       "AWS::CloudWatch::Alarm"
		Properties: close({
			ActionsEnabled?:    bool | fn.Fn
			AlarmActions?:      [...((strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.Fn)
			AlarmDescription?:  string | fn.Fn
			AlarmName?:         string | fn.Fn
			ComparisonOperator: ("GreaterThanOrEqualToThreshold" | "GreaterThanThreshold" | "LessThanThreshold" | "LessThanOrEqualToThreshold" | "LessThanLowerOrGreaterThanUpperThreshold" | "LessThanLowerThreshold" | "GreaterThanUpperThreshold") | fn.Fn
			DatapointsToAlarm?: int | fn.Fn
			Dimensions?:        [...close({
				Name:  string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			EvaluateLowSampleCountPercentile?: string | fn.Fn
			EvaluationPeriods:                 int | fn.Fn
			ExtendedStatistic?:                string | fn.Fn
			InsufficientDataActions?:          [...(string | fn.Fn)] | (string | fn.Fn)
			MetricName?:                       string | fn.Fn
			Metrics?:                          [...close({
				Expression?: string | fn.Fn
				Id:          string | fn.Fn
				Label?:      string | fn.Fn
				MetricStat?: close({
					Metric: close({
						Dimensions?: [...close({
							Name:  string | fn.Fn
							Value: string | fn.Fn
						})] | fn.If
						MetricName?: string | fn.Fn
						Namespace?:  string | fn.Fn
					}) | fn.If
					Period: int | fn.Fn
					Stat:   string | fn.Fn
					Unit?:  string | fn.Fn
				}) | fn.If
				ReturnData?: bool | fn.Fn
			})] | fn.If
			Namespace?:         string | fn.Fn
			OKActions?:         [...(string | fn.Fn)] | (string | fn.Fn)
			Period?:            int | fn.Fn
			Statistic?:         ("Average" | "Maximum" | "Minimum" | "SampleCount" | "Sum") | fn.Fn
			Threshold?:         number | fn.Fn
			ThresholdMetricId?: string | fn.Fn
			TreatMissingData?:  ("breaching" | "ignore" | "missing" | "notBreaching") | fn.Fn
			Unit?:              ("Bits" | "Bits/Second" | "Bytes" | "Bytes/Second" | "Count" | "Count/Second" | "Gigabits" | "Gigabits/Second" | "Gigabytes" | "Gigabytes/Second" | "Kilobits" | "Kilobits/Second" | "Kilobytes" | "Kilobytes/Second" | "Megabits" | "Megabits/Second" | "Megabytes" | "Megabytes/Second" | "Microseconds" | "Milliseconds" | "None" | "Percent" | "Seconds" | "Terabits" | "Terabits/Second" | "Terabytes" | "Terabytes/Second") | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	AnomalyDetector :: {
		Type:       "AWS::CloudWatch::AnomalyDetector"
		Properties: close({
			Configuration?: close({
				ExcludedTimeRanges?: [...close({
					EndTime:   string | fn.Fn
					StartTime: string | fn.Fn
				})] | fn.If
				MetricTimeZone?: string | fn.Fn
			}) | fn.If
			Dimensions?: [...close({
				Name:  string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			MetricName: string | fn.Fn
			Namespace:  string | fn.Fn
			Stat:       string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Dashboard :: {
		Type:       "AWS::CloudWatch::Dashboard"
		Properties: close({
			DashboardBody:  string | fn.Fn
			DashboardName?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	InsightRule :: {
		Type:       "AWS::CloudWatch::InsightRule"
		Properties: close({
			RuleBody:  string | fn.Fn
			RuleName:  string | fn.Fn
			RuleState: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
