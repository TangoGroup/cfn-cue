package mesouth1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

CloudWatch :: {
	Alarm :: {
		Type: "AWS::CloudWatch::Alarm"
		Properties: {
			ActionsEnabled?:    bool | fn.Fn
			AlarmActions?:      [...((string & (strings.MinRunes(1) & strings.MaxRunes(1024))) | fn.Fn)] | fn.Fn
			AlarmDescription?:  string | fn.Fn
			AlarmName?:         string | fn.Fn
			ComparisonOperator: (string & ("GreaterThanOrEqualToThreshold" | "GreaterThanThreshold" | "LessThanThreshold" | "LessThanOrEqualToThreshold" | "LessThanLowerOrGreaterThanUpperThreshold" | "LessThanLowerThreshold" | "GreaterThanUpperThreshold")) | fn.Fn
			DatapointsToAlarm?: int | fn.Fn
			Dimensions?: [...{
				Name:  string | fn.Fn
				Value: string | fn.Fn
			}]
			EvaluateLowSampleCountPercentile?: string | fn.Fn
			EvaluationPeriods:                 int | fn.Fn
			ExtendedStatistic?:                string | fn.Fn
			InsufficientDataActions?:          [...(string | fn.Fn)] | fn.Fn
			MetricName?:                       string | fn.Fn
			Metrics?: [...{
				Expression?: string | fn.Fn
				Id:          string | fn.Fn
				Label?:      string | fn.Fn
				MetricStat?: {
					Metric: {
						Dimensions?: [...{
							Name:  string | fn.Fn
							Value: string | fn.Fn
						}]
						MetricName?: string | fn.Fn
						Namespace?:  string | fn.Fn
					}
					Period: int | fn.Fn
					Stat:   string | fn.Fn
					Unit?:  string | fn.Fn
				}
				ReturnData?: bool | fn.Fn
			}]
			Namespace?:         string | fn.Fn
			OKActions?:         [...(string | fn.Fn)] | fn.Fn
			Period?:            int | fn.Fn
			Statistic?:         (string & ("Average" | "Maximum" | "Minimum" | "SampleCount" | "Sum")) | fn.Fn
			Threshold?:         float | fn.Fn
			ThresholdMetricId?: string | fn.Fn
			TreatMissingData?:  (string & ("breaching" | "ignore" | "missing" | "notBreaching")) | fn.Fn
			Unit?:              (string & ("Bits" | "Bits/Second" | "Bytes" | "Bytes/Second" | "Count" | "Count/Second" | "Gigabits" | "Gigabits/Second" | "Gigabytes" | "Gigabytes/Second" | "Kilobits" | "Kilobits/Second" | "Kilobytes" | "Kilobytes/Second" | "Megabits" | "Megabits/Second" | "Megabytes" | "Megabytes/Second" | "Microseconds" | "Milliseconds" | "None" | "Percent" | "Seconds" | "Terabits" | "Terabits/Second" | "Terabytes" | "Terabytes/Second")) | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	AnomalyDetector :: {
		Type: "AWS::CloudWatch::AnomalyDetector"
		Properties: {
			Configuration?: {
				ExcludedTimeRanges?: [...{
					EndTime:   string | fn.Fn
					StartTime: string | fn.Fn
				}]
				MetricTimeZone?: string | fn.Fn
			}
			Dimensions?: [...{
				Name:  string | fn.Fn
				Value: string | fn.Fn
			}]
			MetricName: string | fn.Fn
			Namespace:  string | fn.Fn
			Stat:       string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Dashboard :: {
		Type: "AWS::CloudWatch::Dashboard"
		Properties: {
			DashboardBody:  string | fn.Fn
			DashboardName?: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	InsightRule :: {
		Type: "AWS::CloudWatch::InsightRule"
		Properties: {
			RuleBody:  string | fn.Fn
			RuleName:  string | fn.Fn
			RuleState: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}
