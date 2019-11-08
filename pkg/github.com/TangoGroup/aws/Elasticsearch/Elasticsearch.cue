package Elasticsearch

import "github.com/TangoGroup/fn"

Domain :: {
	Type: "AWS::Elasticsearch::Domain"
	Properties: {
		AccessPolicies?: {
		} | fn.Fn
		AdvancedOptions?: {
		}
		DomainName?:                 string | fn.Fn
		EBSOptions?:                 propEBSOptions
		ElasticsearchClusterConfig?: propElasticsearchClusterConfig
		ElasticsearchVersion?:       string | fn.Fn
		EncryptionAtRestOptions?:    propEncryptionAtRestOptions
		LogPublishingOptions?: {
		}
		NodeToNodeEncryptionOptions?: propNodeToNodeEncryptionOptions
		SnapshotOptions?:             propSnapshotOptions
		Tags?: [...propTag]
		VPCOptions?: propVPCOptions
	}
	propEBSOptions :: {
		EBSEnabled?: bool | fn.Fn
		Iops?:       int | fn.Fn
		VolumeSize?: int | fn.Fn
		VolumeType?: string | fn.Fn
	}
	propElasticsearchClusterConfig :: {
		DedicatedMasterCount?:   int | fn.Fn
		DedicatedMasterEnabled?: bool | fn.Fn
		DedicatedMasterType?:    string | fn.Fn
		InstanceCount?:          int | fn.Fn
		InstanceType?:           string | fn.Fn
		ZoneAwarenessConfig?:    propZoneAwarenessConfig
		ZoneAwarenessEnabled?:   bool | fn.Fn
	}
	propEncryptionAtRestOptions :: {
		Enabled?:  bool | fn.Fn
		KmsKeyId?: string | fn.Fn
	}
	propLogPublishingOption :: {
		CloudWatchLogsLogGroupArn?: string | fn.Fn
		Enabled?:                   bool | fn.Fn
	}
	propNodeToNodeEncryptionOptions :: {
		Enabled?: bool | fn.Fn
	}
	propSnapshotOptions :: {
		AutomatedSnapshotStartHour?: int | fn.Fn
	}
	propVPCOptions :: {
		SecurityGroupIds?: [...(string | fn.Fn)]
		SubnetIds?: [...(string | fn.Fn)]
	}
	propZoneAwarenessConfig :: {
		AvailabilityZoneCount?: int | fn.Fn
	}
}
