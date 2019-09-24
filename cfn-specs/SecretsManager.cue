package SecretsManager

ResourcePolicy :: {
	Type: "AWS::SecretsManager::ResourcePolicy"
	Properties: {
		ResourcePolicy: {
		}
		SecretId: string
	}
}
RotationSchedule :: {
	Type: "AWS::SecretsManager::RotationSchedule"
	Properties: {
		RotationLambdaARN?: string
		RotationRules?:     __RotationRules
		SecretId:           string
	}
	__RotationRules :: {
		AutomaticallyAfterDays?: int
	}
}
Secret :: {
	Type: "AWS::SecretsManager::Secret"
	Properties: {
		Description?:          string
		GenerateSecretString?: __GenerateSecretString
		KmsKeyId?:             string
		Name?:                 string
		SecretString?:         string
		Tags?: [...__Tag]
	}
	__GenerateSecretString :: {
		ExcludeCharacters?:       string
		ExcludeLowercase?:        bool
		ExcludeNumbers?:          bool
		ExcludePunctuation?:      bool
		ExcludeUppercase?:        bool
		GenerateStringKey?:       string
		IncludeSpace?:            bool
		PasswordLength?:          int
		RequireEachIncludedType?: bool
		SecretStringTemplate?:    string
	}
}
SecretTargetAttachment :: {
	Type: "AWS::SecretsManager::SecretTargetAttachment"
	Properties: {
		SecretId:   string
		TargetId:   string
		TargetType: "AWS::RDS::DBCluster" | "AWS::RDS::DBInstance"
		TargetType: string
	}
}
