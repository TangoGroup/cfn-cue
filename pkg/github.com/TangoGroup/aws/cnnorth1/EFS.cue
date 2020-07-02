package cnnorth1

import "github.com/TangoGroup/aws/fn"

EFS :: {
	AccessPoint :: {
		Type:       "AWS::EFS::AccessPoint"
		Properties: close({
			AccessPointTags?: [...close({
				Key?:   string | fn.Fn
				Value?: string | fn.Fn
			})] | fn.If
			ClientToken?: string | fn.Fn
			FileSystemId: string | fn.Fn
			PosixUser?:   close({
				Gid:            string | fn.Fn
				SecondaryGids?: [...(string | fn.Fn)] | (string | fn.Fn)
				Uid:            string | fn.Fn
			}) | fn.If
			RootDirectory?: close({
				CreationInfo?: close({
					OwnerGid:    string | fn.Fn
					OwnerUid:    string | fn.Fn
					Permissions: string | fn.Fn
				}) | fn.If
				Path?: string | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	FileSystem :: {
		Type:       "AWS::EFS::FileSystem"
		Properties: close({
			Encrypted?:        bool | fn.Fn
			FileSystemPolicy?: {
				[string]: _
			} | fn.Fn
			FileSystemTags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			KmsKeyId?:          string | fn.Fn
			LifecyclePolicies?: [...close({
				TransitionToIA: ("AFTER_7_DAYS" | "AFTER_14_DAYS" | "AFTER_30_DAYS" | "AFTER_60_DAYS" | "AFTER_90_DAYS") | fn.Fn
			})] | fn.If
			PerformanceMode?:              ("generalPurpose" | "maxIO") | fn.Fn
			ProvisionedThroughputInMibps?: number | fn.Fn
			ThroughputMode?:               ("bursting" | "provisioned") | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	MountTarget :: {
		Type:       "AWS::EFS::MountTarget"
		Properties: close({
			FileSystemId:   string | fn.Fn
			IpAddress?:     string | fn.Fn
			SecurityGroups: [...(string | fn.Fn)] | (string | fn.Fn)
			SubnetId:       string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
