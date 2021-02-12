package apnortheast1

import "github.com/TangoGroup/aws/fn"

ManagedBlockchain :: {
	Member :: {
		Type:       "AWS::ManagedBlockchain::Member"
		Properties: close({
			InvitationId?:       string | fn.Fn
			MemberConfiguration: close({
				Description?:                  string | fn.Fn
				MemberFrameworkConfiguration?: close({
					MemberFabricConfiguration?: close({
						AdminPassword: string | fn.Fn
						AdminUsername: string | fn.Fn
					}) | fn.If
				}) | fn.If
				Name: string | fn.Fn
			}) | fn.If
			NetworkConfiguration?: close({
				Description?:                   string | fn.Fn
				Framework:                      string | fn.Fn
				FrameworkVersion:               string | fn.Fn
				Name:                           string | fn.Fn
				NetworkFrameworkConfiguration?: close({
					NetworkFabricConfiguration?: close({
						Edition: string | fn.Fn
					}) | fn.If
				}) | fn.If
				VotingPolicy: close({
					ApprovalThresholdPolicy?: close({
						ProposalDurationInHours?: int | fn.Fn
						ThresholdComparator?:     string | fn.Fn
						ThresholdPercentage?:     int | fn.Fn
					}) | fn.If
				}) | fn.If
			}) | fn.If
			NetworkId?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Node :: {
		Type:       "AWS::ManagedBlockchain::Node"
		Properties: close({
			MemberId?:         string | fn.Fn
			NetworkId:         string | fn.Fn
			NodeConfiguration: close({
				AvailabilityZone: string | fn.Fn
				InstanceType:     ("bc.c5.2xlarge" | "bc.c5.4xlarge" | "bc.c5.large" | "bc.c5.xlarge" | "bc.m5.2xlarge" | "bc.m5.4xlarge" | "bc.m5.large" | "bc.m5.xlarge" | "bc.t3.large" | "bc.t3.medium" | "bc.t3.small" | "bc.t3.xlarge") | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
