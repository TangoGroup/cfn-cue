package euwest2

import "github.com/TangoGroup/aws/fn"

Elasticsearch :: {
	Domain :: {
		Type: "AWS::Elasticsearch::Domain"
		Properties: {
			AccessPolicies?: {
				[string]: _
			} | fn.Fn
			AdvancedOptions?: [string]: string | fn.Fn
			CognitoOptions?: {
				Enabled?:        bool | fn.Fn
				IdentityPoolId?: string | fn.Fn
				RoleArn?:        string | fn.Fn
				UserPoolId?:     string | fn.Fn
			}
			DomainName?: string | fn.Fn
			EBSOptions?: {
				EBSEnabled?: bool | fn.Fn
				Iops?:       int | fn.Fn
				VolumeSize?: int | fn.Fn
				VolumeType?: string | fn.Fn
			}
			ElasticsearchClusterConfig?: {
				DedicatedMasterCount?:   int | fn.Fn
				DedicatedMasterEnabled?: bool | fn.Fn
				DedicatedMasterType?:    string | fn.Fn
				InstanceCount?:          int | fn.Fn
				InstanceType?:           string | fn.Fn
				ZoneAwarenessConfig?: AvailabilityZoneCount?: int | fn.Fn
				ZoneAwarenessEnabled?: bool | fn.Fn
			}
			ElasticsearchVersion?: string | fn.Fn
			EncryptionAtRestOptions?: {
				Enabled?:  bool | fn.Fn
				KmsKeyId?: string | fn.Fn
			}
			LogPublishingOptions?: [string]: {
				CloudWatchLogsLogGroupArn?: string | fn.Fn
				Enabled?:                   bool | fn.Fn
			}
			NodeToNodeEncryptionOptions?: Enabled?:        bool | fn.Fn
			SnapshotOptions?: AutomatedSnapshotStartHour?: int | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VPCOptions?: {
				SecurityGroupIds?: [...(string | fn.Fn)] | (string | fn.Fn)
				SubnetIds?:        [...(string | fn.Fn)] | (string | fn.Fn)
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		UpdatePolicy?: [string]: _
		Metadata?: [string]:     _
		Condition?: string
	}
}
