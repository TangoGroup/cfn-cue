package apnortheast1

import "github.com/TangoGroup/aws/fn"

#FSx: {
	#FileSystem: {
		Type:       "AWS::FSx::FileSystem"
		Properties: close({
			BackupId?:            string | fn.#Fn
			FileSystemType:       string | fn.#Fn
			KmsKeyId?:            string | fn.#Fn
			LustreConfiguration?: close({
				AutoImportPolicy?:              string | fn.#Fn
				AutomaticBackupRetentionDays?:  int | fn.#Fn
				CopyTagsToBackups?:             bool | fn.#Fn
				DailyAutomaticBackupStartTime?: string | fn.#Fn
				DeploymentType?:                string | fn.#Fn
				DriveCacheType?:                string | fn.#Fn
				ExportPath?:                    string | fn.#Fn
				ImportPath?:                    string | fn.#Fn
				ImportedFileChunkSize?:         int | fn.#Fn
				PerUnitStorageThroughput?:      int | fn.#Fn
				WeeklyMaintenanceStartTime?:    string | fn.#Fn
			}) | fn.If
			SecurityGroupIds?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			StorageCapacity?:  (>=300 & <=65536) | fn.#Fn
			StorageType?:      string | fn.#Fn
			SubnetIds:         [...(string | fn.#Fn)] | (string | fn.#Fn)
			Tags?:             [...close({
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
			WindowsConfiguration?: close({
				ActiveDirectoryId?:                       string | fn.#Fn
				AutomaticBackupRetentionDays?:            int | fn.#Fn
				CopyTagsToBackups?:                       bool | fn.#Fn
				DailyAutomaticBackupStartTime?:           string | fn.#Fn
				DeploymentType?:                          string | fn.#Fn
				PreferredSubnetId?:                       string | fn.#Fn
				SelfManagedActiveDirectoryConfiguration?: close({
					DnsIps?:                              [...(string | fn.#Fn)] | (string | fn.#Fn)
					DomainName?:                          string | fn.#Fn
					FileSystemAdministratorsGroup?:       string | fn.#Fn
					OrganizationalUnitDistinguishedName?: string | fn.#Fn
					Password?:                            string | fn.#Fn
					UserName?:                            string | fn.#Fn
				}) | fn.If
				ThroughputCapacity?:         int | fn.#Fn
				WeeklyMaintenanceStartTime?: string | fn.#Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
