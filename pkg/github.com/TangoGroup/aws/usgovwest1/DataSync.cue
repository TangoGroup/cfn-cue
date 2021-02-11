package usgovwest1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

DataSync :: {
	Agent :: {
		Type:       "AWS::DataSync::Agent"
		Properties: close({
			ActivationKey:      (=~#"[A-Z0-9]{5}(-[A-Z0-9]{5}){4}"#) | fn.Fn
			AgentName?:         (strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^[a-zA-Z0-9\s+=._:@/-]+$"#)) | fn.Fn
			SecurityGroupArns?: [...((=~#"^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):ec2:[a-z\-0-9]*:[0-9]{12}:security-group/.*$"#) | fn.Fn)] | ((=~#"^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):ec2:[a-z\-0-9]*:[0-9]{12}:security-group/.*$"#) | fn.Fn)
			SubnetArns?:        [...((=~#"^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):ec2:[a-z\-0-9]*:[0-9]{12}:subnet/.*$"#) | fn.Fn)] | ((=~#"^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):ec2:[a-z\-0-9]*:[0-9]{12}:subnet/.*$"#) | fn.Fn)
			Tags?:              [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VpcEndpointId?: (=~#"^vpce-[0-9a-f]{17}$"#) | fn.Fn
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
				SecurityGroupArns: [...((=~#"^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):ec2:[a-z\-0-9]*:[0-9]{12}:security-group/.*$"#) | fn.Fn)] | ((=~#"^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):ec2:[a-z\-0-9]*:[0-9]{12}:security-group/.*$"#) | fn.Fn)
				SubnetArn:         (=~#"^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):ec2:[a-z\-0-9]*:[0-9]{12}:subnet/.*$"#) | fn.Fn
			}) | fn.If
			EfsFilesystemArn: (=~#"^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):elasticfilesystem:[a-z\-0-9]*:[0-9]{12}:file-system/fs-.*$"#) | fn.Fn
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
			Domain?:           (=~#"^([A-Za-z0-9]+[A-Za-z0-9-.]*)*[A-Za-z0-9-]*[A-Za-z0-9]$"#) | fn.Fn
			FsxFilesystemArn:  (=~#"^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):fsx:[a-z\-0-9]*:[0-9]{12}:file-system/fs-.*$"#) | fn.Fn
			Password:          (=~#"^.{0,104}$"#) | fn.Fn
			SecurityGroupArns: [...((=~#"^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):ec2:[a-z\-0-9]*:[0-9]{12}:security-group/.*$"#) | fn.Fn)] | ((=~#"^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):ec2:[a-z\-0-9]*:[0-9]{12}:security-group/.*$"#) | fn.Fn)
			Subdirectory?:     string | fn.Fn
			Tags?:             [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			User: (=~#"^[^\x5B\x5D\\/:;|=,+*?]{1,104}$"#) | fn.Fn
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
				Version?: ("AUTOMATIC" | "NFS3" | "NFS4_0" | "NFS4_1") | fn.Fn
			}) | fn.If
			OnPremConfig: close({
				AgentArns: [...((=~#"^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):datasync:[a-z\-0-9]+:[0-9]{12}:agent/agent-[0-9a-z]{17}$"#) | fn.Fn)] | ((=~#"^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):datasync:[a-z\-0-9]+:[0-9]{12}:agent/agent-[0-9a-z]{17}$"#) | fn.Fn)
			}) | fn.If
			ServerHostname: (=~#"^(([a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z0-9\-]*[A-Za-z0-9])$"#) | fn.Fn
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
			AccessKey?:      (strings.MinRunes(8) & strings.MaxRunes(200) & (=~#"^.+$"#)) | fn.Fn
			AgentArns:       [...((=~#"^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):datasync:[a-z\-0-9]+:[0-9]{12}:agent/agent-[0-9a-z]{17}$"#) | fn.Fn)] | ((=~#"^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):datasync:[a-z\-0-9]+:[0-9]{12}:agent/agent-[0-9a-z]{17}$"#) | fn.Fn)
			BucketName:      string | fn.Fn
			SecretKey?:      (strings.MinRunes(8) & strings.MaxRunes(200) & (=~#"^.+$"#)) | fn.Fn
			ServerHostname:  (=~#"^(([a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z0-9\-]*[A-Za-z0-9])$"#) | fn.Fn
			ServerPort?:     (>=1 & <=65536) | fn.Fn
			ServerProtocol?: ("HTTPS" | "HTTP") | fn.Fn
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
			S3BucketArn: (=~#"^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):s3:[a-z\-0-9]*:[0-9]*:.*$"#) | fn.Fn
			S3Config:    close({
				BucketAccessRoleArn: (=~#"^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):iam::[0-9]{12}:role/.*$"#) | fn.Fn
			}) | fn.If
			S3StorageClass?: ("STANDARD" | "STANDARD_IA" | "ONEZONE_IA" | "INTELLIGENT_TIERING" | "GLACIER" | "DEEP_ARCHIVE") | fn.Fn
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
			AgentArns:     [...((=~#"^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):datasync:[a-z\-0-9]+:[0-9]{12}:agent/agent-[0-9a-z]{17}$"#) | fn.Fn)] | ((=~#"^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):datasync:[a-z\-0-9]+:[0-9]{12}:agent/agent-[0-9a-z]{17}$"#) | fn.Fn)
			Domain?:       (=~#"^([A-Za-z0-9]+[A-Za-z0-9-.]*)*[A-Za-z0-9-]*[A-Za-z0-9]$"#) | fn.Fn
			MountOptions?: close({
				Version?: ("AUTOMATIC" | "SMB2" | "SMB3") | fn.Fn
			}) | fn.If
			Password:       (=~#"^.{0,104}$"#) | fn.Fn
			ServerHostname: (=~#"^(([a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z0-9\-]*[A-Za-z0-9])$"#) | fn.Fn
			Subdirectory:   string | fn.Fn
			Tags?:          [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			User: (=~#"^[^\x5B\x5D\\/:;|=,+*?]{1,104}$"#) | fn.Fn
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
			CloudWatchLogGroupArn?: (=~#"^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):logs:[a-z\-0-9]*:[0-9]{12}:log-group:([^:\*]*)(:\*)?$"#) | fn.Fn
			DestinationLocationArn: (=~#"^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):datasync:[a-z\-0-9]+:[0-9]{12}:location/loc-[0-9a-z]{17}$"#) | fn.Fn
			Excludes?:              [...close({
				FilterType?: ("SIMPLE_PATTERN" & (=~#"^[A-Z0-9_]+$"#)) | fn.Fn
				Value?:      (=~#"^[^\x00]+$"#) | fn.Fn
			})] | fn.If
			Name?:    (strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^[a-zA-Z0-9\s+=._:@/-]+$"#)) | fn.Fn
			Options?: close({
				Atime?:                ("NONE" | "BEST_EFFORT") | fn.Fn
				BytesPerSecond?:       int | fn.Fn
				Gid?:                  ("NONE" | "INT_VALUE" | "NAME" | "BOTH") | fn.Fn
				LogLevel?:             ("OFF" | "BASIC" | "TRANSFER") | fn.Fn
				Mtime?:                ("NONE" | "PRESERVE") | fn.Fn
				OverwriteMode?:        ("ALWAYS" | "NEVER") | fn.Fn
				PosixPermissions?:     ("NONE" | "PRESERVE") | fn.Fn
				PreserveDeletedFiles?: ("PRESERVE" | "REMOVE") | fn.Fn
				PreserveDevices?:      ("NONE" | "PRESERVE") | fn.Fn
				TaskQueueing?:         ("ENABLED" | "DISABLED") | fn.Fn
				TransferMode?:         ("CHANGED" | "ALL") | fn.Fn
				Uid?:                  ("NONE" | "INT_VALUE" | "NAME" | "BOTH") | fn.Fn
				VerifyMode?:           ("POINT_IN_TIME_CONSISTENT" | "ONLY_FILES_TRANSFERRED" | "NONE") | fn.Fn
			}) | fn.If
			Schedule?: close({
				ScheduleExpression: (=~#"^[a-zA-Z0-9\ \_\*\?\,\|\^\-\/\#\s\(\)\+]*$"#) | fn.Fn
			}) | fn.If
			SourceLocationArn: (=~#"^arn:(aws|aws-cn|aws-us-gov|aws-iso|aws-iso-b):datasync:[a-z\-0-9]+:[0-9]{12}:location/loc-[0-9a-z]{17}$"#) | fn.Fn
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
