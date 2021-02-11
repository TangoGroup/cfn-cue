package useast1

import "github.com/TangoGroup/aws/fn"

QLDB :: {
	Ledger :: {
		Type:       "AWS::QLDB::Ledger"
		Properties: close({
			DeletionProtection?: bool | fn.Fn
			Name?:               string | fn.Fn
			PermissionsMode:     string | fn.Fn
			Tags?:               [...close({
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
	Stream :: {
		Type:       "AWS::QLDB::Stream"
		Properties: close({
			ExclusiveEndTime?:    string | fn.Fn
			InclusiveStartTime:   string | fn.Fn
			KinesisConfiguration: close({
				AggregationEnabled?: bool | fn.Fn
				StreamArn?:          (=~#"arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]*:[\w+=,.@-]+(/[\w+=,.@-]+)*"#) | fn.Fn
			}) | fn.If
			LedgerName: string | fn.Fn
			RoleArn:    (=~#"arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]*:[\w+=,.@-]+(/[\w+=,.@-]+)*"#) | fn.Fn
			StreamName: string | fn.Fn
			Tags?:      [...close({
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
