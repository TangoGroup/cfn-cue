package euwest3

import "github.com/TangoGroup/aws/fn"

Budgets :: {
	BudgetsAction :: {
		Type:       "AWS::Budgets::BudgetsAction"
		Properties: close({
			ActionThreshold: close({
				Type:  ("PERCENTAGE" | "ABSOLUTE_VALUE") | fn.Fn
				Value: number | fn.Fn
			}) | fn.If
			ActionType:     ("APPLY_IAM_POLICY" | "APPLY_SCP_POLICY" | "RUN_SSM_DOCUMENTS") | fn.Fn
			ApprovalModel?: ("AUTOMATIC" | "MANUAL") | fn.Fn
			BudgetName:     string | fn.Fn
			Definition:     close({
				IamActionDefinition?: close({
					Groups?:   [...(string | fn.Fn)] | (string | fn.Fn)
					PolicyArn: string | fn.Fn
					Roles?:    [...(string | fn.Fn)] | (string | fn.Fn)
					Users?:    [...(string | fn.Fn)] | (string | fn.Fn)
				}) | fn.If
				ScpActionDefinition?: close({
					PolicyId:  string | fn.Fn
					TargetIds: [...(string | fn.Fn)] | (string | fn.Fn)
				}) | fn.If
				SsmActionDefinition?: close({
					InstanceIds: [...(string | fn.Fn)] | (string | fn.Fn)
					Region:      string | fn.Fn
					Subtype:     ("STOP_EC2_INSTANCES" | "STOP_RDS_INSTANCES") | fn.Fn
				}) | fn.If
			}) | fn.If
			ExecutionRoleArn: string | fn.Fn
			NotificationType: ("ACTUAL" | "FORECASTED") | fn.Fn
			Subscribers?:     [...close({
				Address: string | fn.Fn
				Type:    ("SNS" | "EMAIL") | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
