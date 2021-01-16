package useast1

import "github.com/TangoGroup/aws/fn"

AuditManager :: {
	Assessment :: {
		Type:       "AWS::AuditManager::Assessment"
		Properties: close({
			AssessmentReportsDestination?: close({
				Destination?:     string | fn.Fn
				DestinationType?: string | fn.Fn
			}) | fn.If
			AwsAccount?: close({
				EmailAddress?: string | fn.Fn
				Id?:           string | fn.Fn
				Name?:         string | fn.Fn
			}) | fn.If
			Description?: string | fn.Fn
			FrameworkId?: string | fn.Fn
			Name?:        string | fn.Fn
			Roles?:       [...close({
				RoleArn?:  string | fn.Fn
				RoleType?: string | fn.Fn
			})] | fn.If
			Scope?: close({
				AwsAccounts?: [...close({
					EmailAddress?: string | fn.Fn
					Id?:           string | fn.Fn
					Name?:         string | fn.Fn
				})] | fn.If
				AwsServices?: [...close({
					ServiceName?: string | fn.Fn
				})] | fn.If
			}) | fn.If
			Status?: string | fn.Fn
			Tags?:   [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
