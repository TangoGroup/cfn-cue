package mesouth1

import "github.com/TangoGroup/aws/fn"

#Kinesis: {
	#Stream: {
		Type: "AWS::Kinesis::Stream"
		Properties: {
			Name?:                 string | fn.#Fn
			RetentionPeriodHours?: (>=1 & <=168) | fn.#Fn
			ShardCount:            (>=1 & <=100000) | fn.#Fn
			StreamEncryption?:     {
				EncryptionType: string | fn.#Fn
				KeyId:          string | fn.#Fn
			} | fn.#If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
