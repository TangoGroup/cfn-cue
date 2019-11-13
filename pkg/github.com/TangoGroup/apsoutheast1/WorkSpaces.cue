package apsoutheast1

import "github.com/TangoGroup/fn"

WorkSpaces :: {
	Workspace :: {
		Type: "AWS::WorkSpaces::Workspace"
		Properties: {
			BundleId:                     string | fn.Fn
			DirectoryId:                  string | fn.Fn
			RootVolumeEncryptionEnabled?: bool | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			UserName:                     string | fn.Fn
			UserVolumeEncryptionEnabled?: bool | fn.Fn
			VolumeEncryptionKey?:         string | fn.Fn
			WorkspaceProperties?: {
				ComputeTypeName?:                     (string & ("GRAPHICS" | "PERFORMANCE" | "POWER" | "STANDARD" | "VALUE")) | fn.Fn
				RootVolumeSizeGib?:                   int | fn.Fn
				RunningMode?:                         (string & ("ALWAYS_ON" | "AUTO_STOP")) | fn.Fn
				RunningModeAutoStopTimeoutInMinutes?: int | fn.Fn
				UserVolumeSizeGib?:                   int | fn.Fn
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}
