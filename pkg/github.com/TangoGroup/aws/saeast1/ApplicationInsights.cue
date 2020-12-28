package saeast1

import "github.com/TangoGroup/aws/fn"

ApplicationInsights :: {
	Application :: {
		Type:       "AWS::ApplicationInsights::Application"
		Properties: close({
			AutoConfigurationEnabled?:    bool | fn.Fn
			CWEMonitorEnabled?:           bool | fn.Fn
			ComponentMonitoringSettings?: [...close({
				ComponentARN?:                 string | fn.Fn
				ComponentConfigurationMode?:   string | fn.Fn
				ComponentName?:                string | fn.Fn
				CustomComponentConfiguration?: close({
					ConfigurationDetails?: close({
						AlarmMetrics?: [...close({
							AlarmMetricName: string | fn.Fn
						})] | fn.If
						Alarms?: [...close({
							AlarmName: string | fn.Fn
							Severity?: string | fn.Fn
						})] | fn.If
						JMXPrometheusExporter?: close({
							HostPort?:       string | fn.Fn
							JMXURL?:         string | fn.Fn
							PrometheusPort?: string | fn.Fn
						}) | fn.If
						Logs?: [...close({
							Encoding?:     string | fn.Fn
							LogGroupName?: string | fn.Fn
							LogPath?:      string | fn.Fn
							LogType:       string | fn.Fn
							PatternSet?:   string | fn.Fn
						})] | fn.If
						WindowsEvents?: [...close({
							EventLevels:  [...(string | fn.Fn)] | (string | fn.Fn)
							EventName:    string | fn.Fn
							LogGroupName: string | fn.Fn
							PatternSet?:  string | fn.Fn
						})] | fn.If
					}) | fn.If
					SubComponentTypeConfigurations?: [...close({
						SubComponentConfigurationDetails: close({
							AlarmMetrics?: [...close({
								AlarmMetricName: string | fn.Fn
							})] | fn.If
							Logs?: [...close({
								Encoding?:     string | fn.Fn
								LogGroupName?: string | fn.Fn
								LogPath?:      string | fn.Fn
								LogType:       string | fn.Fn
								PatternSet?:   string | fn.Fn
							})] | fn.If
							WindowsEvents?: [...close({
								EventLevels:  [...(string | fn.Fn)] | (string | fn.Fn)
								EventName:    string | fn.Fn
								LogGroupName: string | fn.Fn
								PatternSet?:  string | fn.Fn
							})] | fn.If
						}) | fn.If
						SubComponentType: string | fn.Fn
					})] | fn.If
				}) | fn.If
				DefaultOverwriteComponentConfiguration?: close({
					ConfigurationDetails?: close({
						AlarmMetrics?: [...close({
							AlarmMetricName: string | fn.Fn
						})] | fn.If
						Alarms?: [...close({
							AlarmName: string | fn.Fn
							Severity?: string | fn.Fn
						})] | fn.If
						JMXPrometheusExporter?: close({
							HostPort?:       string | fn.Fn
							JMXURL?:         string | fn.Fn
							PrometheusPort?: string | fn.Fn
						}) | fn.If
						Logs?: [...close({
							Encoding?:     string | fn.Fn
							LogGroupName?: string | fn.Fn
							LogPath?:      string | fn.Fn
							LogType:       string | fn.Fn
							PatternSet?:   string | fn.Fn
						})] | fn.If
						WindowsEvents?: [...close({
							EventLevels:  [...(string | fn.Fn)] | (string | fn.Fn)
							EventName:    string | fn.Fn
							LogGroupName: string | fn.Fn
							PatternSet?:  string | fn.Fn
						})] | fn.If
					}) | fn.If
					SubComponentTypeConfigurations?: [...close({
						SubComponentConfigurationDetails: close({
							AlarmMetrics?: [...close({
								AlarmMetricName: string | fn.Fn
							})] | fn.If
							Logs?: [...close({
								Encoding?:     string | fn.Fn
								LogGroupName?: string | fn.Fn
								LogPath?:      string | fn.Fn
								LogType:       string | fn.Fn
								PatternSet?:   string | fn.Fn
							})] | fn.If
							WindowsEvents?: [...close({
								EventLevels:  [...(string | fn.Fn)] | (string | fn.Fn)
								EventName:    string | fn.Fn
								LogGroupName: string | fn.Fn
								PatternSet?:  string | fn.Fn
							})] | fn.If
						}) | fn.If
						SubComponentType: string | fn.Fn
					})] | fn.If
				}) | fn.If
				Tier?: string | fn.Fn
			})] | fn.If
			CustomComponents?: [...close({
				ComponentName: string | fn.Fn
				ResourceList:  [...(string | fn.Fn)] | (string | fn.Fn)
			})] | fn.If
			LogPatternSets?: [...close({
				LogPatterns: [...close({
					Pattern:     string | fn.Fn
					PatternName: string | fn.Fn
					Rank:        int | fn.Fn
				})] | fn.If
				PatternSetName: string | fn.Fn
			})] | fn.If
			OpsCenterEnabled?:   bool | fn.Fn
			OpsItemSNSTopicArn?: string | fn.Fn
			ResourceGroupName:   string | fn.Fn
			Tags?:               [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
