package apnortheast2

import "github.com/TangoGroup/fn"

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
	}
	Build :: {
		Type: "AWS::GameLift::Build"
		Properties: {
			Name?: string | fn.Fn
			StorageLocation?: {
				Bucket:  string | fn.Fn
				Key:     string | fn.Fn
				RoleArn: string | fn.Fn
			}
			Version?: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Fleet :: {
		Type: "AWS::GameLift::Fleet"
		Properties: {
			BuildId:             string | fn.Fn
			Description?:        string | fn.Fn
			DesiredEC2Instances: int | fn.Fn
			EC2InboundPermissions?: [...{
				FromPort: int | fn.Fn
				IpRange:  string | fn.Fn
				Protocol: string | fn.Fn
				ToPort:   int | fn.Fn
			}]
			EC2InstanceType: string | fn.Fn
			LogPaths?: [...(string | fn.Fn)]
			MaxSize?:                int | fn.Fn
			MinSize?:                int | fn.Fn
			Name:                    string | fn.Fn
			ServerLaunchParameters?: string | fn.Fn
			ServerLaunchPath:        string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}
