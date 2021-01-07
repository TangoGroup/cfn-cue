package uswest1

import "github.com/TangoGroup/aws/fn"

#OpsWorksCM: {
	#Server: {
		Type: "AWS::OpsWorksCM::Server"
		Properties: {
			AssociatePublicIpAddress?: bool | fn.#Fn
			BackupId?:                 string | fn.#Fn
			BackupRetentionCount?:     int | fn.#Fn
			CustomCertificate?:        string | fn.#Fn
			CustomDomain?:             string | fn.#Fn
			CustomPrivateKey?:         string | fn.#Fn
			DisableAutomatedBackup?:   bool | fn.#Fn
			Engine?:                   string | fn.#Fn
			EngineAttributes?:         [...{
				Name?:  string | fn.#Fn
				Value?: string | fn.#Fn
			}] | fn.#If
			EngineModel?:                string | fn.#Fn
			EngineVersion?:              string | fn.#Fn
			InstanceProfileArn:          string | fn.#Fn
			InstanceType:                string | fn.#Fn
			KeyPair?:                    string | fn.#Fn
			PreferredBackupWindow?:      string | fn.#Fn
			PreferredMaintenanceWindow?: string | fn.#Fn
			SecurityGroupIds?:           [...(string | fn.#Fn)] | (string | fn.#Fn)
			ServerName?:                 string | fn.#Fn
			ServiceRoleArn:              string | fn.#Fn
			SubnetIds?:                  [...(string | fn.#Fn)] | (string | fn.#Fn)
			Tags?:                       [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
