package useast1

import "github.com/TangoGroup/aws/fn"

FSx :: {
	FileSystem :: {
		Type: "AWS::FSx::FileSystem"
		Properties: {
			BackupId?:      string | fn.Fn
			FileSystemType: string | fn.Fn
			KmsKeyId?:      string | fn.Fn
			LustreConfiguration?: {
				ExportPath?:                 string | fn.Fn
				ImportPath?:                 string | fn.Fn
				ImportedFileChunkSize?:      int | fn.Fn
				WeeklyMaintenanceStartTime?: string | fn.Fn
			}
			SecurityGroupIds?: [...(string | fn.Fn)] | fn.Fn
			StorageCapacity?:  (int & (>=300 & <=65536)) | fn.Fn
			SubnetIds:         [...(string | fn.Fn)] | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			WindowsConfiguration?: {
				ActiveDirectoryId?:             string | fn.Fn
				AutomaticBackupRetentionDays?:  int | fn.Fn
				CopyTagsToBackups?:             bool | fn.Fn
				DailyAutomaticBackupStartTime?: string | fn.Fn
				SelfManagedActiveDirectoryConfiguration?: {
					DnsIps?:                              [...(string | fn.Fn)] | fn.Fn
					DomainName?:                          string | fn.Fn
					FileSystemAdministratorsGroup?:       string | fn.Fn
					OrganizationalUnitDistinguishedName?: string | fn.Fn
					Password?:                            string | fn.Fn
					UserName?:                            string | fn.Fn
				}
				ThroughputCapacity?:         int | fn.Fn
				WeeklyMaintenanceStartTime?: string | fn.Fn
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}
