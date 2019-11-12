package cacentral1

import "github.com/TangoGroup/fn"

Elasticsearch :: {
	Domain :: {
		Type: "AWS::Elasticsearch::Domain"
		Properties: {
			AccessPolicies?: {
			} | fn.Fn
			AdvancedOptions?: [string]: string | fn.Fn
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
				SecurityGroupIds?: [...(string | fn.Fn)]
				SubnetIds?: [...(string | fn.Fn)]
			}
		}
	}
}
