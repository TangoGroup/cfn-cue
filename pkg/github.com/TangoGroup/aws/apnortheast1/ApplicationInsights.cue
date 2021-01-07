package apnortheast1

import "github.com/TangoGroup/aws/fn"

#ApplicationInsights: {
	#Application: {
		Type: "AWS::ApplicationInsights::Application"
		Properties: {
			AutoConfigurationEnabled?:    bool | fn.#Fn
			CWEMonitorEnabled?:           bool | fn.#Fn
			ComponentMonitoringSettings?: [...{
				ComponentARN?:                 string | fn.#Fn
				ComponentConfigurationMode?:   string | fn.#Fn
				ComponentName?:                string | fn.#Fn
				CustomComponentConfiguration?: {
					ConfigurationDetails?: {
						AlarmMetrics?: [...{
							AlarmMetricName: string | fn.#Fn
						}] | fn.#If
						Alarms?: [...{
							AlarmName: string | fn.#Fn
							Severity?: string | fn.#Fn
						}] | fn.#If
						JMXPrometheusExporter?: {
							HostPort?:       string | fn.#Fn
							JMXURL?:         string | fn.#Fn
							PrometheusPort?: string | fn.#Fn
						} | fn.#If
						Logs?: [...{
							Encoding?:     string | fn.#Fn
							LogGroupName?: string | fn.#Fn
							LogPath?:      string | fn.#Fn
							LogType:       string | fn.#Fn
							PatternSet?:   string | fn.#Fn
						}] | fn.#If
						WindowsEvents?: [...{
							EventLevels:  [...(string | fn.#Fn)] | (string | fn.#Fn)
							EventName:    string | fn.#Fn
							LogGroupName: string | fn.#Fn
							PatternSet?:  string | fn.#Fn
						}] | fn.#If
					} | fn.#If
					SubComponentTypeConfigurations?: [...{
						SubComponentConfigurationDetails: {
							AlarmMetrics?: [...{
								AlarmMetricName: string | fn.#Fn
							}] | fn.#If
							Logs?: [...{
								Encoding?:     string | fn.#Fn
								LogGroupName?: string | fn.#Fn
								LogPath?:      string | fn.#Fn
								LogType:       string | fn.#Fn
								PatternSet?:   string | fn.#Fn
							}] | fn.#If
							WindowsEvents?: [...{
								EventLevels:  [...(string | fn.#Fn)] | (string | fn.#Fn)
								EventName:    string | fn.#Fn
								LogGroupName: string | fn.#Fn
								PatternSet?:  string | fn.#Fn
							}] | fn.#If
						} | fn.#If
						SubComponentType: string | fn.#Fn
					}] | fn.#If
				} | fn.#If
				DefaultOverwriteComponentConfiguration?: {
					ConfigurationDetails?: {
						AlarmMetrics?: [...{
							AlarmMetricName: string | fn.#Fn
						}] | fn.#If
						Alarms?: [...{
							AlarmName: string | fn.#Fn
							Severity?: string | fn.#Fn
						}] | fn.#If
						JMXPrometheusExporter?: {
							HostPort?:       string | fn.#Fn
							JMXURL?:         string | fn.#Fn
							PrometheusPort?: string | fn.#Fn
						} | fn.#If
						Logs?: [...{
							Encoding?:     string | fn.#Fn
							LogGroupName?: string | fn.#Fn
							LogPath?:      string | fn.#Fn
							LogType:       string | fn.#Fn
							PatternSet?:   string | fn.#Fn
						}] | fn.#If
						WindowsEvents?: [...{
							EventLevels:  [...(string | fn.#Fn)] | (string | fn.#Fn)
							EventName:    string | fn.#Fn
							LogGroupName: string | fn.#Fn
							PatternSet?:  string | fn.#Fn
						}] | fn.#If
					} | fn.#If
					SubComponentTypeConfigurations?: [...{
						SubComponentConfigurationDetails: {
							AlarmMetrics?: [...{
								AlarmMetricName: string | fn.#Fn
							}] | fn.#If
							Logs?: [...{
								Encoding?:     string | fn.#Fn
								LogGroupName?: string | fn.#Fn
								LogPath?:      string | fn.#Fn
								LogType:       string | fn.#Fn
								PatternSet?:   string | fn.#Fn
							}] | fn.#If
							WindowsEvents?: [...{
								EventLevels:  [...(string | fn.#Fn)] | (string | fn.#Fn)
								EventName:    string | fn.#Fn
								LogGroupName: string | fn.#Fn
								PatternSet?:  string | fn.#Fn
							}] | fn.#If
						} | fn.#If
						SubComponentType: string | fn.#Fn
					}] | fn.#If
				} | fn.#If
				Tier?: string | fn.#Fn
			}] | fn.#If
			CustomComponents?: [...{
				ComponentName: string | fn.#Fn
				ResourceList:  [...(string | fn.#Fn)] | (string | fn.#Fn)
			}] | fn.#If
			LogPatternSets?: [...{
				LogPatterns: [...{
					Pattern:     string | fn.#Fn
					PatternName: string | fn.#Fn
					Rank:        int | fn.#Fn
				}] | fn.#If
				PatternSetName: string | fn.#Fn
			}] | fn.#If
			OpsCenterEnabled?:   bool | fn.#Fn
			OpsItemSNSTopicArn?: string | fn.#Fn
			ResourceGroupName:   string | fn.#Fn
			Tags?:               [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
