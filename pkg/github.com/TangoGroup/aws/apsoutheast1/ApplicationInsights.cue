package apsoutheast1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

ApplicationInsights :: {
	Application :: {
		Type:       "AWS::ApplicationInsights::Application"
		Properties: close({
			AutoConfigurationEnabled?:    bool | fn.Fn
			CWEMonitorEnabled?:           bool | fn.Fn
			ComponentMonitoringSettings?: [...close({
				ComponentARN?:                 (strings.MinRunes(20) & strings.MaxRunes(300) & (=~#"^arn:aws(-[\w]+)*:[\w\d-]+:([\w\d-]*)?:[\w\d_-]*([:/].+)*$"#)) | fn.Fn
				ComponentConfigurationMode?:   ("DEFAULT" | "DEFAULT_WITH_OVERWRITE" | "CUSTOM") | fn.Fn
				ComponentName?:                (strings.MinRunes(1) & strings.MaxRunes(128)) | fn.Fn
				CustomComponentConfiguration?: close({
					ConfigurationDetails?: close({
						AlarmMetrics?: [...close({
							AlarmMetricName: string | fn.Fn
						})] | fn.If
						Alarms?: [...close({
							AlarmName: (strings.MinRunes(1) & strings.MaxRunes(255)) | fn.Fn
							Severity?: ("HIGH" | "MEDIUM" | "LOW") | fn.Fn
						})] | fn.If
						JMXPrometheusExporter?: close({
							HostPort?:       string | fn.Fn
							JMXURL?:         string | fn.Fn
							PrometheusPort?: string | fn.Fn
						}) | fn.If
						Logs?: [...close({
							Encoding?:     ("utf-8" | "utf-16" | "ascii") | fn.Fn
							LogGroupName?: (strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"[\.\-_/#A-Za-z0-9]+"#)) | fn.Fn
							LogPath?:      (strings.MinRunes(1) & strings.MaxRunes(260) & (=~#"^([a-zA-Z]:\\[\\\S|*\S]?.*|/[^"']*)$"#)) | fn.Fn
							LogType:       ("SQL_SERVER" | "MYSQL" | "MYSQL_SLOW_QUERY" | "POSTGRESQL" | "ORACLE_ALERT" | "ORACLE_LISTENER" | "IIS" | "APPLICATION" | "WINDOWS_EVENTS" | "WINDOWS_EVENTS_GENERIC_ERRORS" | "SQL_SERVER_ALWAYSON_AVAILABILITY_GROUP" | "DEFAULT" | "CUSTOM" | "STEP_FUNCTION" | "API_GATEWAY_ACCESS" | "API_GATEWAY_EXECUTION") | fn.Fn
							PatternSet?:   (strings.MinRunes(1) & strings.MaxRunes(30) & (=~#"[a-zA-Z0-9.-_]*"#)) | fn.Fn
						})] | fn.If
						WindowsEvents?: [...close({
							EventLevels:  [...(("INFORMATION" | "WARNING" | "ERROR" | "CRITICAL" | "VERBOSE") | fn.Fn)] | (("INFORMATION" | "WARNING" | "ERROR" | "CRITICAL" | "VERBOSE") | fn.Fn)
							EventName:    (strings.MinRunes(1) & strings.MaxRunes(260) & (=~#"^[a-zA-Z0-9_ \\/-]$"#)) | fn.Fn
							LogGroupName: (strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"[\.\-_/#A-Za-z0-9]+"#)) | fn.Fn
							PatternSet?:  (strings.MinRunes(1) & strings.MaxRunes(30) & (=~#"[a-zA-Z0-9.-_]*"#)) | fn.Fn
						})] | fn.If
					}) | fn.If
					SubComponentTypeConfigurations?: [...close({
						SubComponentConfigurationDetails: close({
							AlarmMetrics?: [...close({
								AlarmMetricName: string | fn.Fn
							})] | fn.If
							Logs?: [...close({
								Encoding?:     ("utf-8" | "utf-16" | "ascii") | fn.Fn
								LogGroupName?: (strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"[\.\-_/#A-Za-z0-9]+"#)) | fn.Fn
								LogPath?:      (strings.MinRunes(1) & strings.MaxRunes(260) & (=~#"^([a-zA-Z]:\\[\\\S|*\S]?.*|/[^"']*)$"#)) | fn.Fn
								LogType:       ("SQL_SERVER" | "MYSQL" | "MYSQL_SLOW_QUERY" | "POSTGRESQL" | "ORACLE_ALERT" | "ORACLE_LISTENER" | "IIS" | "APPLICATION" | "WINDOWS_EVENTS" | "WINDOWS_EVENTS_GENERIC_ERRORS" | "SQL_SERVER_ALWAYSON_AVAILABILITY_GROUP" | "DEFAULT" | "CUSTOM" | "STEP_FUNCTION" | "API_GATEWAY_ACCESS" | "API_GATEWAY_EXECUTION") | fn.Fn
								PatternSet?:   (strings.MinRunes(1) & strings.MaxRunes(30) & (=~#"[a-zA-Z0-9.-_]*"#)) | fn.Fn
							})] | fn.If
							WindowsEvents?: [...close({
								EventLevels:  [...(("INFORMATION" | "WARNING" | "ERROR" | "CRITICAL" | "VERBOSE") | fn.Fn)] | (("INFORMATION" | "WARNING" | "ERROR" | "CRITICAL" | "VERBOSE") | fn.Fn)
								EventName:    (strings.MinRunes(1) & strings.MaxRunes(260) & (=~#"^[a-zA-Z0-9_ \\/-]$"#)) | fn.Fn
								LogGroupName: (strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"[\.\-_/#A-Za-z0-9]+"#)) | fn.Fn
								PatternSet?:  (strings.MinRunes(1) & strings.MaxRunes(30) & (=~#"[a-zA-Z0-9.-_]*"#)) | fn.Fn
							})] | fn.If
						}) | fn.If
						SubComponentType: ("AWS::EC2::Instance" | "AWS::EC2::Volume") | fn.Fn
					})] | fn.If
				}) | fn.If
				DefaultOverwriteComponentConfiguration?: close({
					ConfigurationDetails?: close({
						AlarmMetrics?: [...close({
							AlarmMetricName: string | fn.Fn
						})] | fn.If
						Alarms?: [...close({
							AlarmName: (strings.MinRunes(1) & strings.MaxRunes(255)) | fn.Fn
							Severity?: ("HIGH" | "MEDIUM" | "LOW") | fn.Fn
						})] | fn.If
						JMXPrometheusExporter?: close({
							HostPort?:       string | fn.Fn
							JMXURL?:         string | fn.Fn
							PrometheusPort?: string | fn.Fn
						}) | fn.If
						Logs?: [...close({
							Encoding?:     ("utf-8" | "utf-16" | "ascii") | fn.Fn
							LogGroupName?: (strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"[\.\-_/#A-Za-z0-9]+"#)) | fn.Fn
							LogPath?:      (strings.MinRunes(1) & strings.MaxRunes(260) & (=~#"^([a-zA-Z]:\\[\\\S|*\S]?.*|/[^"']*)$"#)) | fn.Fn
							LogType:       ("SQL_SERVER" | "MYSQL" | "MYSQL_SLOW_QUERY" | "POSTGRESQL" | "ORACLE_ALERT" | "ORACLE_LISTENER" | "IIS" | "APPLICATION" | "WINDOWS_EVENTS" | "WINDOWS_EVENTS_GENERIC_ERRORS" | "SQL_SERVER_ALWAYSON_AVAILABILITY_GROUP" | "DEFAULT" | "CUSTOM" | "STEP_FUNCTION" | "API_GATEWAY_ACCESS" | "API_GATEWAY_EXECUTION") | fn.Fn
							PatternSet?:   (strings.MinRunes(1) & strings.MaxRunes(30) & (=~#"[a-zA-Z0-9.-_]*"#)) | fn.Fn
						})] | fn.If
						WindowsEvents?: [...close({
							EventLevels:  [...(("INFORMATION" | "WARNING" | "ERROR" | "CRITICAL" | "VERBOSE") | fn.Fn)] | (("INFORMATION" | "WARNING" | "ERROR" | "CRITICAL" | "VERBOSE") | fn.Fn)
							EventName:    (strings.MinRunes(1) & strings.MaxRunes(260) & (=~#"^[a-zA-Z0-9_ \\/-]$"#)) | fn.Fn
							LogGroupName: (strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"[\.\-_/#A-Za-z0-9]+"#)) | fn.Fn
							PatternSet?:  (strings.MinRunes(1) & strings.MaxRunes(30) & (=~#"[a-zA-Z0-9.-_]*"#)) | fn.Fn
						})] | fn.If
					}) | fn.If
					SubComponentTypeConfigurations?: [...close({
						SubComponentConfigurationDetails: close({
							AlarmMetrics?: [...close({
								AlarmMetricName: string | fn.Fn
							})] | fn.If
							Logs?: [...close({
								Encoding?:     ("utf-8" | "utf-16" | "ascii") | fn.Fn
								LogGroupName?: (strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"[\.\-_/#A-Za-z0-9]+"#)) | fn.Fn
								LogPath?:      (strings.MinRunes(1) & strings.MaxRunes(260) & (=~#"^([a-zA-Z]:\\[\\\S|*\S]?.*|/[^"']*)$"#)) | fn.Fn
								LogType:       ("SQL_SERVER" | "MYSQL" | "MYSQL_SLOW_QUERY" | "POSTGRESQL" | "ORACLE_ALERT" | "ORACLE_LISTENER" | "IIS" | "APPLICATION" | "WINDOWS_EVENTS" | "WINDOWS_EVENTS_GENERIC_ERRORS" | "SQL_SERVER_ALWAYSON_AVAILABILITY_GROUP" | "DEFAULT" | "CUSTOM" | "STEP_FUNCTION" | "API_GATEWAY_ACCESS" | "API_GATEWAY_EXECUTION") | fn.Fn
								PatternSet?:   (strings.MinRunes(1) & strings.MaxRunes(30) & (=~#"[a-zA-Z0-9.-_]*"#)) | fn.Fn
							})] | fn.If
							WindowsEvents?: [...close({
								EventLevels:  [...(("INFORMATION" | "WARNING" | "ERROR" | "CRITICAL" | "VERBOSE") | fn.Fn)] | (("INFORMATION" | "WARNING" | "ERROR" | "CRITICAL" | "VERBOSE") | fn.Fn)
								EventName:    (strings.MinRunes(1) & strings.MaxRunes(260) & (=~#"^[a-zA-Z0-9_ \\/-]$"#)) | fn.Fn
								LogGroupName: (strings.MinRunes(1) & strings.MaxRunes(512) & (=~#"[\.\-_/#A-Za-z0-9]+"#)) | fn.Fn
								PatternSet?:  (strings.MinRunes(1) & strings.MaxRunes(30) & (=~#"[a-zA-Z0-9.-_]*"#)) | fn.Fn
							})] | fn.If
						}) | fn.If
						SubComponentType: ("AWS::EC2::Instance" | "AWS::EC2::Volume") | fn.Fn
					})] | fn.If
				}) | fn.If
				Tier?: ("DOT_NET_WORKER" | "DOT_NET_WEB" | "DOT_NET_CORE" | "SQL_SERVER" | "SQL_SERVER_ALWAYSON_AVAILABILITY_GROUP" | "MYSQL" | "POSTGRESQL" | "DEFAULT" | "CUSTOM" | "JAVA_JMX" | "ORACLE") | fn.Fn
			})] | fn.If
			CustomComponents?: [...close({
				ComponentName: (strings.MinRunes(1) & strings.MaxRunes(128)) | fn.Fn
				ResourceList:  [...((strings.MinRunes(20) & strings.MaxRunes(300) & (=~#"^arn:aws(-[\w]+)*:[\w\d-]+:([\w\d-]*)?:[\w\d_-]*([:/].+)*$"#)) | fn.Fn)] | ((strings.MinRunes(20) & strings.MaxRunes(300) & (=~#"^arn:aws(-[\w]+)*:[\w\d-]+:([\w\d-]*)?:[\w\d_-]*([:/].+)*$"#)) | fn.Fn)
			})] | fn.If
			LogPatternSets?: [...close({
				LogPatterns: [...close({
					Pattern:     (strings.MinRunes(1) & strings.MaxRunes(50)) | fn.Fn
					PatternName: (strings.MinRunes(1) & strings.MaxRunes(50) & (=~#"[a-zA-Z0-9.-_]*"#)) | fn.Fn
					Rank:        int | fn.Fn
				})] | fn.If
				PatternSetName: (strings.MinRunes(1) & strings.MaxRunes(30) & (=~#"[a-zA-Z0-9.-_]*"#)) | fn.Fn
			})] | fn.If
			OpsCenterEnabled?:   bool | fn.Fn
			OpsItemSNSTopicArn?: (strings.MinRunes(20) & strings.MaxRunes(300) & (=~#"^arn:aws(-[\w]+)*:[\w\d-]+:([\w\d-]*)?:[\w\d_-]*([:/].+)*$"#)) | fn.Fn
			ResourceGroupName:   (strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"[a-zA-Z0-9.-_]*"#)) | fn.Fn
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
