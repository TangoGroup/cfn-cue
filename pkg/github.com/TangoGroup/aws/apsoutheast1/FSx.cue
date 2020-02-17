package apsoutheast1

import "github.com/TangoGroup/aws/fn"

FSx :: {
	FileSystem :: {
		Type: "AWS::FSx::FileSystem"
		Properties: {
			BackupId?:            string | fn.Fn
			FileSystemType:       string | fn.Fn
			KmsKeyId?:            string | fn.Fn
			LustreConfiguration?: {
			} | fn.If
			SecurityGroupIds?: [...(string | fn.Fn)] | (string | fn.Fn)
			StorageCapacity?:  int | fn.Fn
			SubnetIds:         [...(string | fn.Fn)] | (string | fn.Fn)
			Tags?:             [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}] | fn.If
			WindowsConfiguration?: {
			} | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
