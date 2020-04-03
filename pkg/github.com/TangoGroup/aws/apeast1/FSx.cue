package apeast1

import "github.com/TangoGroup/aws/fn"

FSx :: {
	FileSystem :: {
		Type:       "AWS::FSx::FileSystem"
		Properties: close({
			BackupId?:            string | fn.Fn
			FileSystemType:       string | fn.Fn
			KmsKeyId?:            string | fn.Fn
			LustreConfiguration?: close({
			}) | fn.If
			SecurityGroupIds?: [...(string | fn.Fn)] | (string | fn.Fn)
			StorageCapacity?:  int | fn.Fn
			StorageType?:      string | fn.Fn
			SubnetIds:         [...(string | fn.Fn)] | (string | fn.Fn)
			Tags?:             [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			WindowsConfiguration?: close({
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
