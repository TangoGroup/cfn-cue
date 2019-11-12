package apeast1

import "github.com/TangoGroup/fn"

SecretsManager :: {
	ResourcePolicy :: {
		Type: "AWS::SecretsManager::ResourcePolicy"
		Properties: {
			ResourcePolicy: {
			} | fn.Fn
			SecretId: string | fn.Fn
		}
	}
	RotationSchedule :: {
		Type: "AWS::SecretsManager::RotationSchedule"
		Properties: {
			RotationLambdaARN?: string | fn.Fn
			RotationRules?: {
			}
			SecretId: string | fn.Fn
		}
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
			}]
		}
	}
	SecretTargetAttachment :: {
		Type: "AWS::SecretsManager::SecretTargetAttachment"
		Properties: {
			SecretId:   string | fn.Fn
			TargetId:   string | fn.Fn
			TargetType: string | fn.Fn
		}
	}
}
