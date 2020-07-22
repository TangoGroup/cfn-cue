package useast2

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
			EC2InstanceType:                 ("c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.xlarge" | "m4.10xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.xlarge" | "t2.large" | "t2.medium" | "t2.micro" | "t2.small") | fn.#Fn
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
	#GameSessionQueue: {
		Type:       "AWS::GameLift::GameSessionQueue"
		Properties: close({
			Destinations?: [...close({
				DestinationArn?: string | fn.#Fn
			})] | fn.If
			Name:                   string | fn.#Fn
			PlayerLatencyPolicies?: [...close({
				MaximumIndividualPlayerLatencyMilliseconds?: int | fn.#Fn
				PolicyDurationSeconds?:                      int | fn.#Fn
			})] | fn.If
			TimeoutInSeconds?: int | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#MatchmakingConfiguration: {
		Type:       "AWS::GameLift::MatchmakingConfiguration"
		Properties: close({
			AcceptanceRequired:        bool | fn.#Fn
			AcceptanceTimeoutSeconds?: int | fn.#Fn
			AdditionalPlayerCount?:    int | fn.#Fn
			BackfillMode?:             string | fn.#Fn
			CustomEventData?:          string | fn.#Fn
			Description?:              string | fn.#Fn
			GameProperties?:           [...close({
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
			GameSessionData?:      string | fn.#Fn
			GameSessionQueueArns:  [...(string | fn.#Fn)] | (string | fn.#Fn)
			Name:                  string | fn.#Fn
			NotificationTarget?:   string | fn.#Fn
			RequestTimeoutSeconds: int | fn.#Fn
			RuleSetName:           string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#MatchmakingRuleSet: {
		Type:       "AWS::GameLift::MatchmakingRuleSet"
		Properties: close({
			Name:        string | fn.#Fn
			RuleSetBody: string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Script: {
		Type:       "AWS::GameLift::Script"
		Properties: close({
			Name?:           string | fn.#Fn
			StorageLocation: close({
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
}
