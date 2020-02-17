package cnnorth1

import "github.com/TangoGroup/aws/fn"

Elasticsearch :: {
	Domain :: {
		Type: "AWS::Elasticsearch::Domain"
		Properties: {
			AccessPolicies?: {
				[string]: _
			} | fn.Fn
			AdvancedOptions?: {
				[string]: string | fn.Fn
			} | fn.If
			CognitoOptions?: {
				Enabled?:        bool | fn.Fn
				IdentityPoolId?: string | fn.Fn
				RoleArn?:        string | fn.Fn
				UserPoolId?:     string | fn.Fn
			} | fn.If
			DomainName?: string | fn.Fn
			EBSOptions?: {
				EBSEnabled?: bool | fn.Fn
				Iops?:       int | fn.Fn
				VolumeSize?: int | fn.Fn
				VolumeType?: string | fn.Fn
			} | fn.If
			ElasticsearchClusterConfig?: {
				DedicatedMasterCount?:   int | fn.Fn
				DedicatedMasterEnabled?: bool | fn.Fn
				DedicatedMasterType?:    string | fn.Fn
				InstanceCount?:          int | fn.Fn
				InstanceType?:           string | fn.Fn
				ZoneAwarenessConfig?:    {
					AvailabilityZoneCount?: int | fn.Fn
				} | fn.If
				ZoneAwarenessEnabled?: bool | fn.Fn
			} | fn.If
			ElasticsearchVersion?:    string | fn.Fn
			EncryptionAtRestOptions?: {
				Enabled?:  bool | fn.Fn
				KmsKeyId?: string | fn.Fn
			} | fn.If
			LogPublishingOptions?: {
				[string]: {
					CloudWatchLogsLogGroupArn?: string | fn.Fn
					Enabled?:                   bool | fn.Fn
				}
			} | fn.If
			NodeToNodeEncryptionOptions?: {
				Enabled?: bool | fn.Fn
			} | fn.If
			SnapshotOptions?: {
				AutomatedSnapshotStartHour?: int | fn.Fn
			} | fn.If
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}] | fn.If
			VPCOptions?: {
				SecurityGroupIds?: [...(string | fn.Fn)] | (string | fn.Fn)
				SubnetIds?:        [...(string | fn.Fn)] | (string | fn.Fn)
			} | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		UpdatePolicy?: [string]: _
		Metadata?: [string]:     _
		Condition?: string
	}
}
