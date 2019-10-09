package WorkSpaces

import "github.com/TangoGroup/fn"

Workspace :: {
	Type: "AWS::WorkSpaces::Workspace"
	Properties: {
		BundleId:                     string | fn.Fn
		DirectoryId:                  string | fn.Fn
		RootVolumeEncryptionEnabled?: bool | fn.Fn
		Tags?: [...__Tag]
		UserName:                     string | fn.Fn
		UserVolumeEncryptionEnabled?: bool | fn.Fn
		VolumeEncryptionKey?:         string | fn.Fn
		WorkspaceProperties?:         __WorkspaceProperties
	}
	__WorkspaceProperties :: {
		ComputeTypeName?:                     (string & ("GRAPHICS" | "PERFORMANCE" | "POWER" | "STANDARD" | "VALUE")) | fn.Fn
		RootVolumeSizeGib?:                   int | fn.Fn
		RunningMode?:                         (string & ("ALWAYS_ON" | "AUTO_STOP")) | fn.Fn
		RunningModeAutoStopTimeoutInMinutes?: int | fn.Fn
		UserVolumeSizeGib?:                   int | fn.Fn
	}
}
