package apnortheast3

import "github.com/TangoGroup/aws/fn"

ManagedBlockchain :: {
	Member :: {
		Type: "AWS::ManagedBlockchain::Member"
		Properties: {
			InvitationId?: string | fn.Fn
			MemberConfiguration: {
				Description?: string | fn.Fn
				MemberFrameworkConfiguration?: MemberFabricConfiguration?: {
					AdminPassword: string | fn.Fn
					AdminUsername: string | fn.Fn
				}
				Name: string | fn.Fn
			}
			NetworkConfiguration?: {
				Description?:     string | fn.Fn
				Framework:        string | fn.Fn
				FrameworkVersion: string | fn.Fn
				Name:             string | fn.Fn
				NetworkFrameworkConfiguration?: NetworkFabricConfiguration?: Edition: string | fn.Fn
				VotingPolicy: ApprovalThresholdPolicy?: {
					ProposalDurationInHours?: int | fn.Fn
					ThresholdComparator?:     string | fn.Fn
					ThresholdPercentage?:     int | fn.Fn
				}
			}
			NetworkId?: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Node :: {
		Type: "AWS::ManagedBlockchain::Node"
		Properties: {
			MemberId:  string | fn.Fn
			NetworkId: string | fn.Fn
			NodeConfiguration: {
				AvailabilityZone: string | fn.Fn
				InstanceType:     string | fn.Fn
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
