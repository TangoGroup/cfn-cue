package apsouth1

import "github.com/TangoGroup/aws/fn"

ElasticBeanstalk :: {
	Application :: {
		Type: "AWS::ElasticBeanstalk::Application"
		Properties: {
			ApplicationName?: string | fn.Fn
			Description?:     string | fn.Fn
			ResourceLifecycleConfig?: {
				ServiceRole?: (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#) | fn.Fn
				VersionLifecycleConfig?: {
					MaxAgeRule?: {
						DeleteSourceFromS3?: bool | fn.Fn
						Enabled?:            bool | fn.Fn
						MaxAgeInDays?:       int | fn.Fn
					}
					MaxCountRule?: {
						DeleteSourceFromS3?: bool | fn.Fn
						Enabled?:            bool | fn.Fn
						MaxCount?:           int | fn.Fn
					}
				}
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	ApplicationVersion :: {
		Type: "AWS::ElasticBeanstalk::ApplicationVersion"
		Properties: {
			ApplicationName: string | fn.Fn
			Description?:    string | fn.Fn
			SourceBundle: {
				S3Bucket: string | fn.Fn
				S3Key:    string | fn.Fn
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	ConfigurationTemplate :: {
		Type: "AWS::ElasticBeanstalk::ConfigurationTemplate"
		Properties: {
			ApplicationName: string | fn.Fn
			Description?:    string | fn.Fn
			EnvironmentId?:  string | fn.Fn
			OptionSettings?: [...{
				Namespace:     string | fn.Fn
				OptionName:    string | fn.Fn
				ResourceName?: string | fn.Fn
				Value?:        string | fn.Fn
			}]
			PlatformArn?:       string | fn.Fn
			SolutionStackName?: string | fn.Fn
			SourceConfiguration?: {
				ApplicationName: string | fn.Fn
				TemplateName:    string | fn.Fn
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Environment :: {
		Type: "AWS::ElasticBeanstalk::Environment"
		Properties: {
			ApplicationName:  string | fn.Fn
			CNAMEPrefix?:     string | fn.Fn
			Description?:     string | fn.Fn
			EnvironmentName?: string | fn.Fn
			OptionSettings?: [...{
				Namespace:     string | fn.Fn
				OptionName:    string | fn.Fn
				ResourceName?: string | fn.Fn
				Value?:        string | fn.Fn
			}]
			PlatformArn?:       string | fn.Fn
			SolutionStackName?: string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			TemplateName?: string | fn.Fn
			Tier?: {
				Name?:    string | fn.Fn
				Type?:    string | fn.Fn
				Version?: string | fn.Fn
			}
			VersionLabel?: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}
