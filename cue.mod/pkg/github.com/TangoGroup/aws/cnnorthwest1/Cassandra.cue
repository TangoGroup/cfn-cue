package cnnorthwest1

import "github.com/TangoGroup/aws/fn"

#Cassandra: {
	#Keyspace: {
		Type: "AWS::Cassandra::Keyspace"
		Properties: KeyspaceName?: string | fn.#Fn
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Table: {
		Type: "AWS::Cassandra::Table"
		Properties: {
			BillingMode?: {
				Mode:                   string | fn.#Fn
				ProvisionedThroughput?: {
					ReadCapacityUnits:  int | fn.#Fn
					WriteCapacityUnits: int | fn.#Fn
				} | fn.#If
			} | fn.#If
			ClusteringKeyColumns?: [...{
				Column: {
					ColumnName: string | fn.#Fn
					ColumnType: string | fn.#Fn
				} | fn.#If
				OrderBy?: string | fn.#Fn
			}] | fn.#If
			KeyspaceName:        string | fn.#Fn
			PartitionKeyColumns: [...{
				ColumnName: string | fn.#Fn
				ColumnType: string | fn.#Fn
			}] | fn.#If
			RegularColumns?: [...{
				ColumnName: string | fn.#Fn
				ColumnType: string | fn.#Fn
			}] | fn.#If
			TableName?: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
