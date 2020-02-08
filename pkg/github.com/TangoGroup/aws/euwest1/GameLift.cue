package euwest1

import "github.com/TangoGroup/aws/fn"

GameLift :: {
	Alias :: {
		Type: "AWS::GameLift::Alias"
		Properties: {
			Description?: string | fn.Fn
			Name:         string | fn.Fn
			RoutingStrategy: {
				FleetId?: string | fn.Fn
				Message?: string | fn.Fn
				Type:     string | fn.Fn
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Build :: {
		Type: "AWS::GameLift::Build"
		Properties: {
			Name?:            string | fn.Fn
			OperatingSystem?: string | fn.Fn
			StorageLocation?: {
				Bucket:         string | fn.Fn
				Key:            string | fn.Fn
				ObjectVersion?: string | fn.Fn
				RoleArn:        string | fn.Fn
			}
			Version?: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Fleet :: {
		Type: "AWS::GameLift::Fleet"
		Properties: {
			BuildId?: string | fn.Fn
			CertificateConfiguration?: CertificateType: string | fn.Fn
			Description?:         string | fn.Fn
			DesiredEC2Instances?: int | fn.Fn
			EC2InboundPermissions?: [...{
				FromPort: int | fn.Fn
				IpRange:  string | fn.Fn
				Protocol: string | fn.Fn
				ToPort:   int | fn.Fn
			}]
			EC2InstanceType:                 string | fn.Fn
			FleetType?:                      string | fn.Fn
			InstanceRoleARN?:                string | fn.Fn
			LogPaths?:                       [...(string | fn.Fn)] | (string | fn.Fn)
			MaxSize?:                        int | fn.Fn
			MetricGroups?:                   [...(string | fn.Fn)] | (string | fn.Fn)
			MinSize?:                        int | fn.Fn
			Name:                            string | fn.Fn
			NewGameSessionProtectionPolicy?: string | fn.Fn
			PeerVpcAwsAccountId?:            string | fn.Fn
			PeerVpcId?:                      string | fn.Fn
			ResourceCreationLimitPolicy?: {
				NewGameSessionsPerCreator?: int | fn.Fn
				PolicyPeriodInMinutes?:     int | fn.Fn
			}
			RuntimeConfiguration?: {
				GameSessionActivationTimeoutSeconds?: int | fn.Fn
				MaxConcurrentGameSessionActivations?: int | fn.Fn
				ServerProcesses?: [...{
					ConcurrentExecutions: int | fn.Fn
					LaunchPath:           string | fn.Fn
					Parameters?:          string | fn.Fn
				}]
			}
			ScriptId?:               string | fn.Fn
			ServerLaunchParameters?: string | fn.Fn
			ServerLaunchPath?:       string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	GameSessionQueue :: {
		Type: "AWS::GameLift::GameSessionQueue"
		Properties: {
			Destinations?: [...{
				DestinationArn?: string | fn.Fn
			}]
			Name: string | fn.Fn
			PlayerLatencyPolicies?: [...{
				MaximumIndividualPlayerLatencyMilliseconds?: int | fn.Fn
				PolicyDurationSeconds?:                      int | fn.Fn
			}]
			TimeoutInSeconds?: int | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	MatchmakingConfiguration :: {
		Type: "AWS::GameLift::MatchmakingConfiguration"
		Properties: {
			AcceptanceRequired:        bool | fn.Fn
			AcceptanceTimeoutSeconds?: int | fn.Fn
			AdditionalPlayerCount?:    int | fn.Fn
			BackfillMode?:             string | fn.Fn
			CustomEventData?:          string | fn.Fn
			Description?:              string | fn.Fn
			GameProperties?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			GameSessionData?:      string | fn.Fn
			GameSessionQueueArns:  [...(string | fn.Fn)] | (string | fn.Fn)
			Name:                  string | fn.Fn
			NotificationTarget?:   string | fn.Fn
			RequestTimeoutSeconds: int | fn.Fn
			RuleSetName:           string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	MatchmakingRuleSet :: {
		Type: "AWS::GameLift::MatchmakingRuleSet"
		Properties: {
			Name:        string | fn.Fn
			RuleSetBody: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Script :: {
		Type: "AWS::GameLift::Script"
		Properties: {
			Name?: string | fn.Fn
			StorageLocation: {
				Bucket:         string | fn.Fn
				Key:            string | fn.Fn
				ObjectVersion?: string | fn.Fn
				RoleArn:        string | fn.Fn
			}
			Version?: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
