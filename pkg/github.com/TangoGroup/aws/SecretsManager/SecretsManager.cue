package SecretsManager

import "github.com/TangoGroup/fn"

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
		RotationRules?:     propRotationRules
		SecretId:           string | fn.Fn
	}
	propRotationRules :: {
		AutomaticallyAfterDays?: int | fn.Fn
	}
}
Secret :: {
	Type: "AWS::SecretsManager::Secret"
	Properties: {
		Description?:          string | fn.Fn
		GenerateSecretString?: propGenerateSecretString
		KmsKeyId?:             string | fn.Fn
		Name?:                 string | fn.Fn
		SecretString?:         string | fn.Fn
		Tags?: [...propTag]
	}
	propGenerateSecretString :: {
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
}
SecretTargetAttachment :: {
	Type: "AWS::SecretsManager::SecretTargetAttachment"
	Properties: {
		SecretId:   string | fn.Fn
		TargetId:   string | fn.Fn
		TargetType: (string & ("AWS::RDS::DBCluster" | "AWS::RDS::DBInstance")) | fn.Fn
	}
}
