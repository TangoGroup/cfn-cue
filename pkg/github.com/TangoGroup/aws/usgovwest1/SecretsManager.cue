package usgovwest1

import "github.com/TangoGroup/aws/fn"

SecretsManager :: {
	ResourcePolicy :: {
		Type:       "AWS::SecretsManager::ResourcePolicy"
		Properties: close({
			ResourcePolicy: {
				[string]: _
			} | fn.Fn
			SecretId: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	RotationSchedule :: {
		Type:       "AWS::SecretsManager::RotationSchedule"
		Properties: close({
			RotationLambdaARN?: string | fn.Fn
			RotationRules?:     close({
				AutomaticallyAfterDays?: int | fn.Fn
			}) | fn.If
			SecretId: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Secret :: {
		Type:       "AWS::SecretsManager::Secret"
		Properties: close({
			Description?:          string | fn.Fn
			GenerateSecretString?: close({
				ExcludeCharacters?:       string | fn.Fn
				ExcludeLowercase?:        bool | fn.Fn
				ExcludeNumbers?:          bool | fn.Fn
				ExcludePunctuation?:      bool | fn.Fn
				ExcludeUppercase?:        bool | fn.Fn
				GenerateStringKey?:       string | fn.Fn
				IncludeSpace?:            bool | fn.Fn
				PasswordLength?:          int | fn.Fn
				RequireEachIncludedType?: bool | fn.Fn
				SecretStringTemplate?:    string | fn.Fn
			}) | fn.If
			KmsKeyId?:     string | fn.Fn
			Name?:         string | fn.Fn
			SecretString?: string | fn.Fn
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
	SecretTargetAttachment :: {
		Type:       "AWS::SecretsManager::SecretTargetAttachment"
		Properties: close({
			SecretId:   string | fn.Fn
			TargetId:   string | fn.Fn
			TargetType: ("AWS::RDS::DBCluster" | "AWS::RDS::DBInstance") | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
