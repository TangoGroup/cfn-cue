package Elasticsearch

import "github.com/TangoGroup/fn"

Domain :: {
	Type: "AWS::Elasticsearch::Domain"
	Properties: {
		AccessPolicies?: {
		} | fn.Fn
		AdvancedOptions?: {
		}
		DomainName?:                  string | fn.Fn
		EBSOptions?:                  __EBSOptions
		ElasticsearchClusterConfig?:  __ElasticsearchClusterConfig
		ElasticsearchVersion?:        string | fn.Fn
		EncryptionAtRestOptions?:     __EncryptionAtRestOptions
		NodeToNodeEncryptionOptions?: __NodeToNodeEncryptionOptions
		SnapshotOptions?:             __SnapshotOptions
		Tags?: [...__Tag]
		VPCOptions?: __VPCOptions
	}
	__EBSOptions :: {
		EBSEnabled?: bool | fn.Fn
		Iops?:       int | fn.Fn
		VolumeSize?: int | fn.Fn
		VolumeType?: string | fn.Fn
	}
	__ElasticsearchClusterConfig :: {
		DedicatedMasterCount?:   int | fn.Fn
		DedicatedMasterEnabled?: bool | fn.Fn
		DedicatedMasterType?:    string | fn.Fn
		InstanceCount?:          int | fn.Fn
		InstanceType?:           string | fn.Fn
		ZoneAwarenessConfig?:    __ZoneAwarenessConfig
		ZoneAwarenessEnabled?:   bool | fn.Fn
	}
	__EncryptionAtRestOptions :: {
		Enabled?:  bool | fn.Fn
		KmsKeyId?: string | fn.Fn
	}
	__NodeToNodeEncryptionOptions :: {
		Enabled?: bool | fn.Fn
	}
	__SnapshotOptions :: {
		AutomatedSnapshotStartHour?: int | fn.Fn
	}
	__VPCOptions :: {
		SecurityGroupIds?: [...string] | fn.Fn
		SubnetIds?:        [...string] | fn.Fn
	}
	__ZoneAwarenessConfig :: {
		AvailabilityZoneCount?: int | fn.Fn
	}
}
