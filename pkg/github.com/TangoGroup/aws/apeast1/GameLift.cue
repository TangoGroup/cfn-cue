package apeast1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

GameLift :: {
	Alias :: {
		Type:       "AWS::GameLift::Alias"
		Properties: close({
			Description?:    (strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.Fn
			Name:            (strings.MinRunes(1) & strings.MaxRunes(1024) & (=~#".*\S.*"#)) | fn.Fn
			RoutingStrategy: close({
				FleetId?: (=~#"^fleet-\S+"#) | fn.Fn
				Message?: string | fn.Fn
				Type:     ("SIMPLE" | "TERMINAL") | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Build :: {
		Type:       "AWS::GameLift::Build"
		Properties: close({
			Name?:            string | fn.Fn
			OperatingSystem?: string | fn.Fn
			StorageLocation?: close({
				Bucket:         string | fn.Fn
				Key:            string | fn.Fn
				ObjectVersion?: string | fn.Fn
				RoleArn:        string | fn.Fn
			}) | fn.If
			Version?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Fleet :: {
		Type:       "AWS::GameLift::Fleet"
		Properties: close({
			BuildId?:                  (=~#"^build-\S+|^arn:.*:build\/build-\S+"#) | fn.Fn
			CertificateConfiguration?: close({
				CertificateType: ("DISABLED" | "GENERATED") | fn.Fn
			}) | fn.If
			Description?:           (strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.Fn
			DesiredEC2Instances?:   int | fn.Fn
			EC2InboundPermissions?: [...close({
				FromPort: (>=1 & <=60000) | fn.Fn
				IpRange:  (=~#"(^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$)"#) | fn.Fn
				Protocol: ("TCP" | "UDP") | fn.Fn
				ToPort:   (>=1 & <=60000) | fn.Fn
			})] | fn.If
			EC2InstanceType:                 (("c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.xlarge" | "c5a.12xlarge" | "c5a.16xlarge" | "c5a.24xlarge" | "c5a.2xlarge" | "c5a.4xlarge" | "c5a.8xlarge" | "c5a.large" | "c5a.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.xlarge") & (=~#"^.*..*$"#)) | fn.Fn
			FleetType?:                      ("ON_DEMAND" | "SPOT") | fn.Fn
			InstanceRoleARN?:                (=~#"^arn:aws(-.*)?:[a-z-]+:(([a-z]+-)+[0-9])?:([0-9]{12})?:[^.]+$"#) | fn.Fn
			LogPaths?:                       [...(string | fn.Fn)] | (string | fn.Fn)
			MaxSize?:                        int | fn.Fn
			MetricGroups?:                   [...(string | fn.Fn)] | (string | fn.Fn)
			MinSize?:                        int | fn.Fn
			Name:                            (strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.Fn
			NewGameSessionProtectionPolicy?: ("FullProtection" | "NoProtection") | fn.Fn
			PeerVpcAwsAccountId?:            (strings.MinRunes(1) & strings.MaxRunes(1024) & (=~#"^[0-9]{12}$"#)) | fn.Fn
			PeerVpcId?:                      (strings.MinRunes(1) & strings.MaxRunes(1024) & (=~#"^vpc-\S+"#)) | fn.Fn
			ResourceCreationLimitPolicy?:    close({
				NewGameSessionsPerCreator?: int | fn.Fn
				PolicyPeriodInMinutes?:     int | fn.Fn
			}) | fn.If
			RuntimeConfiguration?: close({
				GameSessionActivationTimeoutSeconds?: (>=1 & <=600) | fn.Fn
				MaxConcurrentGameSessionActivations?: (>=1 & <=2147483647) | fn.Fn
				ServerProcesses?:                     [...close({
					ConcurrentExecutions: int | fn.Fn
					LaunchPath:           (strings.MinRunes(1) & strings.MaxRunes(1024) & (=~#"^([Cc]:\\game\S+|/local/game/\S+)"#)) | fn.Fn
					Parameters?:          (strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.Fn
				})] | fn.If
			}) | fn.If
			ScriptId?:               (=~#"^script-\S+|^arn:.*:script\/script-\S+"#) | fn.Fn
			ServerLaunchParameters?: (strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.Fn
			ServerLaunchPath?:       (strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
