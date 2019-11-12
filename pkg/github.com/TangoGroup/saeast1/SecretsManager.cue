package saeast1

import "github.com/TangoGroup/fn"

SecretsManager :: {
	ResourcePolicy :: {
		Type: "AWS::SecretsManager::ResourcePolicy"
		Properties: {
			ResourcePolicy: {
				[string]: _
			} | fn.Fn
			SecretId: string | fn.Fn
		}
	}
	RotationSchedule :: {
		Type: "AWS::SecretsManager::RotationSchedule"
		Properties: {
			RotationLambdaARN?: string | fn.Fn
			RotationRules?: AutomaticallyAfterDays?: int | fn.Fn
			SecretId: string | fn.Fn
		}
	}
	Secret :: {
		Type: "AWS::SecretsManager::Secret"
		Properties: {
			Description?: string | fn.Fn
			GenerateSecretString?: {
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
			}
			KmsKeyId?:     string | fn.Fn
			Name?:         string | fn.Fn
			SecretString?: string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
	}
	SecretTargetAttachment :: {
		Type: "AWS::SecretsManager::SecretTargetAttachment"
		Properties: {
			SecretId:   string | fn.Fn
			TargetId:   string | fn.Fn
			TargetType: (string & ("AWS::RDS::DBCluster" | "AWS::RDS::DBInstance")) | fn.Fn
		}
	}
}
