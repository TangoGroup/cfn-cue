package mesouth1

import "github.com/TangoGroup/aws/fn"

Cassandra :: {
	Keyspace :: {
		Type:       "AWS::Cassandra::Keyspace"
		Properties: close({
			KeyspaceName?: (=~#"^[a-zA-Z0-9][a-zA-Z0-9_]{1,47}$"#) | fn.Fn
			Tags?:         [...close({
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
	Table :: {
		Type:       "AWS::Cassandra::Table"
		Properties: close({
			BillingMode?: close({
				Mode:                   ("PROVISIONED" | "ON_DEMAND") | fn.Fn
				ProvisionedThroughput?: close({
					ReadCapacityUnits:  int | fn.Fn
					WriteCapacityUnits: int | fn.Fn
				}) | fn.If
			}) | fn.If
			ClusteringKeyColumns?: [...close({
				Column: close({
					ColumnName: (=~#"^[a-zA-Z0-9][a-zA-Z0-9_]{1,47}$"#) | fn.Fn
					ColumnType: string | fn.Fn
				}) | fn.If
				OrderBy?: ("ASC" | "DESC") | fn.Fn
			})] | fn.If
			KeyspaceName:        (=~#"^[a-zA-Z0-9][a-zA-Z0-9_]{1,47}$"#) | fn.Fn
			PartitionKeyColumns: [...close({
				ColumnName: (=~#"^[a-zA-Z0-9][a-zA-Z0-9_]{1,47}$"#) | fn.Fn
				ColumnType: string | fn.Fn
			})] | fn.If
			PointInTimeRecoveryEnabled?: bool | fn.Fn
			RegularColumns?:             [...close({
				ColumnName: (=~#"^[a-zA-Z0-9][a-zA-Z0-9_]{1,47}$"#) | fn.Fn
				ColumnType: string | fn.Fn
			})] | fn.If
			TableName?: (=~#"^[a-zA-Z0-9][a-zA-Z0-9_]{1,47}$"#) | fn.Fn
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
