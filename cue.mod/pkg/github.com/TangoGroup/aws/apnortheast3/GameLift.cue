package apnortheast3

import "github.com/TangoGroup/aws/fn"

#GameLift: {
	#Alias: {
		Type:       "AWS::GameLift::Alias"
		Properties: close({
			Description?:    string | fn.#Fn
			Name:            string | fn.#Fn
			RoutingStrategy: close({
				FleetId?: string | fn.#Fn
				Message?: string | fn.#Fn
				Type:     string | fn.#Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Build: {
		Type:       "AWS::GameLift::Build"
		Properties: close({
			Name?:            string | fn.#Fn
			OperatingSystem?: string | fn.#Fn
			StorageLocation?: close({
				Bucket:         string | fn.#Fn
				Key:            string | fn.#Fn
				ObjectVersion?: string | fn.#Fn
				RoleArn:        string | fn.#Fn
			}) | fn.If
			Version?: string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Fleet: {
		Type:       "AWS::GameLift::Fleet"
		Properties: close({
			BuildId?:                  string | fn.#Fn
			CertificateConfiguration?: close({
				CertificateType: string | fn.#Fn
			}) | fn.If
			Description?:           string | fn.#Fn
			DesiredEC2Instances?:   int | fn.#Fn
			EC2InboundPermissions?: [...close({
				FromPort: int | fn.#Fn
				IpRange:  string | fn.#Fn
				Protocol: string | fn.#Fn
				ToPort:   int | fn.#Fn
			})] | fn.If
			EC2InstanceType:                 string | fn.#Fn
			FleetType?:                      string | fn.#Fn
			InstanceRoleARN?:                string | fn.#Fn
			LogPaths?:                       [...(string | fn.#Fn)] | (string | fn.#Fn)
			MaxSize?:                        int | fn.#Fn
			MetricGroups?:                   [...(string | fn.#Fn)] | (string | fn.#Fn)
			MinSize?:                        int | fn.#Fn
			Name:                            string | fn.#Fn
			NewGameSessionProtectionPolicy?: string | fn.#Fn
			PeerVpcAwsAccountId?:            string | fn.#Fn
			PeerVpcId?:                      string | fn.#Fn
			ResourceCreationLimitPolicy?:    close({
				NewGameSessionsPerCreator?: int | fn.#Fn
				PolicyPeriodInMinutes?:     int | fn.#Fn
			}) | fn.If
			RuntimeConfiguration?: close({
				GameSessionActivationTimeoutSeconds?: int | fn.#Fn
				MaxConcurrentGameSessionActivations?: int | fn.#Fn
				ServerProcesses?:                     [...close({
					ConcurrentExecutions: int | fn.#Fn
					LaunchPath:           string | fn.#Fn
					Parameters?:          string | fn.#Fn
				})] | fn.If
			}) | fn.If
			ScriptId?:               string | fn.#Fn
			ServerLaunchParameters?: string | fn.#Fn
			ServerLaunchPath?:       string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
