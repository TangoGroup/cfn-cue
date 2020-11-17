package apnortheast1

import "github.com/TangoGroup/aws/fn"

#WorkSpaces: {
	#ConnectionAlias: {
		Type: "AWS::WorkSpaces::ConnectionAlias"
		Properties: {
			ConnectionString: string | fn.#Fn
			Tags?:            [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Workspace: {
		Type: "AWS::WorkSpaces::Workspace"
		Properties: {
			BundleId:                     string | fn.#Fn
			DirectoryId:                  string | fn.#Fn
			RootVolumeEncryptionEnabled?: bool | fn.#Fn
			Tags?:                        [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.If
			UserName:                     string | fn.#Fn
			UserVolumeEncryptionEnabled?: bool | fn.#Fn
			VolumeEncryptionKey?:         string | fn.#Fn
			WorkspaceProperties?:         {
				ComputeTypeName?:                     ("GRAPHICS" | "GRAPHICSPRO" | "PERFORMANCE" | "POWER" | "POWERPRO" | "STANDARD" | "VALUE") | fn.#Fn
				RootVolumeSizeGib?:                   int | fn.#Fn
				RunningMode?:                         ("ALWAYS_ON" | "AUTO_STOP") | fn.#Fn
				RunningModeAutoStopTimeoutInMinutes?: int | fn.#Fn
				UserVolumeSizeGib?:                   int | fn.#Fn
			} | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
