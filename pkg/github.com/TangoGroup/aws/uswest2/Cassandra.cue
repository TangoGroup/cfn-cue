package uswest2

import "github.com/TangoGroup/aws/fn"

Cassandra :: {
	Keyspace :: {
		Type:       "AWS::Cassandra::Keyspace"
		Properties: close({
			KeyspaceName?: string | fn.Fn
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
				Mode:                   string | fn.Fn
				ProvisionedThroughput?: close({
					ReadCapacityUnits:  int | fn.Fn
					WriteCapacityUnits: int | fn.Fn
				}) | fn.If
			}) | fn.If
			ClusteringKeyColumns?: [...close({
				Column: close({
					ColumnName: string | fn.Fn
					ColumnType: string | fn.Fn
				}) | fn.If
				OrderBy?: string | fn.Fn
			})] | fn.If
			KeyspaceName:        string | fn.Fn
			PartitionKeyColumns: [...close({
				ColumnName: string | fn.Fn
				ColumnType: string | fn.Fn
			})] | fn.If
			PointInTimeRecoveryEnabled?: bool | fn.Fn
			RegularColumns?:             [...close({
				ColumnName: string | fn.Fn
				ColumnType: string | fn.Fn
			})] | fn.If
			TableName?: string | fn.Fn
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
