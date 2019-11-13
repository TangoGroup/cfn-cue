package apeast1

import "github.com/TangoGroup/aws/fn"

SecretsManager :: {
	ResourcePolicy :: {
		Type: "AWS::SecretsManager::ResourcePolicy"
		Properties: {
			ResourcePolicy: {
				[string]: _
			} | fn.Fn
			SecretId: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	RotationSchedule :: {
		Type: "AWS::SecretsManager::RotationSchedule"
		Properties: {
			RotationLambdaARN?: string | fn.Fn
			RotationRules?: {
			}
			SecretId: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Secret :: {
		Type: "AWS::SecretsManager::Secret"
		Properties: {
			Description?: string | fn.Fn
			GenerateSecretString?: {
			}
			KmsKeyId?:     string | fn.Fn
			Name?:         string | fn.Fn
			SecretString?: string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	SecretTargetAttachment :: {
		Type: "AWS::SecretsManager::SecretTargetAttachment"
		Properties: {
			SecretId:   string | fn.Fn
			TargetId:   string | fn.Fn
			TargetType: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}
