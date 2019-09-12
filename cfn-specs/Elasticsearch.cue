package Elasticsearch

Domain :: {
	Type: "AWS::Elasticsearch::Domain"
	Properties: {
		AccessPolicies?: {
		}
		AdvancedOptions?: {
		}
		DomainName?:                  string
		EBSOptions?:                  __EBSOptions
		ElasticsearchClusterConfig?:  __ElasticsearchClusterConfig
		ElasticsearchVersion?:        string
		EncryptionAtRestOptions?:     __EncryptionAtRestOptions
		NodeToNodeEncryptionOptions?: __NodeToNodeEncryptionOptions
		SnapshotOptions?:             __SnapshotOptions
		Tags?: [...__Tag]
		VPCOptions?: __VPCOptions
	}
	__EBSOptions = {
		EBSEnabled?: bool
		Iops?:       int
		VolumeSize?: int
		VolumeType?: string
	}
	__ElasticsearchClusterConfig = {
		DedicatedMasterCount?:   int
		DedicatedMasterEnabled?: bool
		DedicatedMasterType?:    string
		InstanceCount?:          int
		InstanceType?:           string
		ZoneAwarenessConfig?:    __ZoneAwarenessConfig
		ZoneAwarenessEnabled?:   bool
	}
	__EncryptionAtRestOptions = {
		Enabled?:  bool
		KmsKeyId?: string
	}
	__NodeToNodeEncryptionOptions = {
		Enabled?: bool
	}
	__SnapshotOptions = {
		AutomatedSnapshotStartHour?: int
	}
	__VPCOptions = {
		SecurityGroupIds?: [...string]
		SubnetIds?: [...string]
	}
	__ZoneAwarenessConfig = {
		AvailabilityZoneCount?: int
	}
}
