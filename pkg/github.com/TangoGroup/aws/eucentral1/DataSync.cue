package eucentral1

import "github.com/TangoGroup/aws/fn"

DataSync :: {
	Agent :: {
		Type:       "AWS::DataSync::Agent"
		Properties: close({
			ActivationKey:      string | fn.Fn
			AgentName?:         string | fn.Fn
			SecurityGroupArns?: [...(string | fn.Fn)] | (string | fn.Fn)
			SubnetArns?:        [...(string | fn.Fn)] | (string | fn.Fn)
			Tags?:              [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VpcEndpointId?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	LocationEFS :: {
		Type:       "AWS::DataSync::LocationEFS"
		Properties: close({
			Ec2Config: close({
				SecurityGroupArns: [...(string | fn.Fn)] | (string | fn.Fn)
				SubnetArn:         string | fn.Fn
			}) | fn.If
			EfsFilesystemArn: string | fn.Fn
			Subdirectory?:    string | fn.Fn
			Tags?:            [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	LocationFSxWindows :: {
		Type:       "AWS::DataSync::LocationFSxWindows"
		Properties: close({
			Domain?:           string | fn.Fn
			FsxFilesystemArn:  string | fn.Fn
			Password:          string | fn.Fn
			SecurityGroupArns: [...(string | fn.Fn)] | (string | fn.Fn)
			Subdirectory?:     string | fn.Fn
			Tags?:             [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			User: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	LocationNFS :: {
		Type:       "AWS::DataSync::LocationNFS"
		Properties: close({
			MountOptions?: close({
				Version?: string | fn.Fn
			}) | fn.If
			OnPremConfig: close({
				AgentArns: [...(string | fn.Fn)] | (string | fn.Fn)
			}) | fn.If
			ServerHostname: string | fn.Fn
			Subdirectory:   string | fn.Fn
			Tags?:          [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	LocationObjectStorage :: {
		Type:       "AWS::DataSync::LocationObjectStorage"
		Properties: close({
			AccessKey?:      string | fn.Fn
			AgentArns:       [...(string | fn.Fn)] | (string | fn.Fn)
			BucketName:      string | fn.Fn
			SecretKey?:      string | fn.Fn
			ServerHostname:  string | fn.Fn
			ServerPort?:     int | fn.Fn
			ServerProtocol?: string | fn.Fn
			Subdirectory?:   string | fn.Fn
			Tags?:           [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	LocationS3 :: {
		Type:       "AWS::DataSync::LocationS3"
		Properties: close({
			S3BucketArn: string | fn.Fn
			S3Config:    close({
				BucketAccessRoleArn: string | fn.Fn
			}) | fn.If
			S3StorageClass?: string | fn.Fn
			Subdirectory?:   string | fn.Fn
			Tags?:           [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	LocationSMB :: {
		Type:       "AWS::DataSync::LocationSMB"
		Properties: close({
			AgentArns:     [...(string | fn.Fn)] | (string | fn.Fn)
			Domain?:       string | fn.Fn
			MountOptions?: close({
				Version?: string | fn.Fn
			}) | fn.If
			Password:       string | fn.Fn
			ServerHostname: string | fn.Fn
			Subdirectory:   string | fn.Fn
			Tags?:          [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			User: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Task :: {
		Type:       "AWS::DataSync::Task"
		Properties: close({
			CloudWatchLogGroupArn?: string | fn.Fn
			DestinationLocationArn: string | fn.Fn
			Excludes?:              [...close({
				FilterType?: string | fn.Fn
				Value?:      string | fn.Fn
			})] | fn.If
			Name?:    string | fn.Fn
			Options?: close({
				Atime?:                string | fn.Fn
				BytesPerSecond?:       int | fn.Fn
				Gid?:                  string | fn.Fn
				LogLevel?:             string | fn.Fn
				Mtime?:                string | fn.Fn
				OverwriteMode?:        string | fn.Fn
				PosixPermissions?:     string | fn.Fn
				PreserveDeletedFiles?: string | fn.Fn
				PreserveDevices?:      string | fn.Fn
				TaskQueueing?:         string | fn.Fn
				TransferMode?:         string | fn.Fn
				Uid?:                  string | fn.Fn
				VerifyMode?:           string | fn.Fn
			}) | fn.If
			Schedule?: close({
				ScheduleExpression: string | fn.Fn
			}) | fn.If
			SourceLocationArn: string | fn.Fn
			Tags?:             [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
