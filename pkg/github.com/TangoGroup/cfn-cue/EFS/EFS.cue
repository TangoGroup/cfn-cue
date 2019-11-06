package EFS

import "github.com/TangoGroup/fn"

FileSystem :: {
	Type: "AWS::EFS::FileSystem"
	Properties: {
		Encrypted?: bool | fn.Fn
		FileSystemTags?: [...propElasticFileSystemTag]
		KmsKeyId?: string | fn.Fn
		LifecyclePolicies?: [...propLifecyclePolicy]
		PerformanceMode?:              (string & ("generalPurpose" | "maxIO")) | fn.Fn
		ProvisionedThroughputInMibps?: float | fn.Fn
		ThroughputMode?:               (string & ("bursting" | "provisioned")) | fn.Fn
	}
	propElasticFileSystemTag :: {
		Key:   string | fn.Fn
		Value: string | fn.Fn
	}
	propLifecyclePolicy :: {
		TransitionToIA: (string & ("AFTER_14_DAYS" | "AFTER_30_DAYS" | "AFTER_60_DAYS" | "AFTER_90_DAYS")) | fn.Fn
	}
}
MountTarget :: {
	Type: "AWS::EFS::MountTarget"
	Properties: {
		FileSystemId:   string | fn.Fn
		IpAddress?:     string | fn.Fn
		SecurityGroups: [...string] | fn.Fn
		SubnetId:       string | fn.Fn
	}
}
