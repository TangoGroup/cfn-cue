package uswest1

import "github.com/TangoGroup/fn"

OpsWorksCM :: {
	Server :: {
		Type: "AWS::OpsWorksCM::Server"
		Properties: {
			AssociatePublicIpAddress?: bool | fn.Fn
			BackupId?:                 string | fn.Fn
			BackupRetentionCount?:     int | fn.Fn
			DisableAutomatedBackup?:   bool | fn.Fn
			Engine?:                   string | fn.Fn
			EngineAttributes?: [...{
				Name?:  string | fn.Fn
				Value?: string | fn.Fn
			}]
			EngineModel?:                string | fn.Fn
			EngineVersion?:              string | fn.Fn
			InstanceProfileArn:          string | fn.Fn
			InstanceType:                string | fn.Fn
			KeyPair?:                    string | fn.Fn
			PreferredBackupWindow?:      string | fn.Fn
			PreferredMaintenanceWindow?: string | fn.Fn
			SecurityGroupIds?: [...(string | fn.Fn)]
			ServerName?:    string | fn.Fn
			ServiceRoleArn: string | fn.Fn
			SubnetIds?: [...(string | fn.Fn)]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}
