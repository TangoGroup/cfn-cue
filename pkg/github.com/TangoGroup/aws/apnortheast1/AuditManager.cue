package apnortheast1

import "github.com/TangoGroup/aws/fn"

#AuditManager: {
	#Assessment: {
		Type:       "AWS::AuditManager::Assessment"
		Properties: close({
			assessmentReportsDestination?: close({
				destination?:     string | fn.#Fn
				destinationType?: string | fn.#Fn
			}) | fn.If
			awsAccount?: close({
				emailAddress?: string | fn.#Fn
				id?:           string | fn.#Fn
				name?:         string | fn.#Fn
			}) | fn.If
			description?: string | fn.#Fn
			frameworkId?: string | fn.#Fn
			name?:        string | fn.#Fn
			roles?:       close({
				Roles?: [...close({
					roleArn?:  string | fn.#Fn
					roleType?: string | fn.#Fn
				})] | fn.If
			}) | fn.If
			scope?: close({
				awsAccounts?: close({
					AWSAccounts?: [...close({
						emailAddress?: string | fn.#Fn
						id?:           string | fn.#Fn
						name?:         string | fn.#Fn
					})] | fn.If
				}) | fn.If
				awsServices?: close({
					AWSServices?: [...close({
						serviceName?: string | fn.#Fn
					})] | fn.If
				}) | fn.If
			}) | fn.If
			status?: string | fn.#Fn
			tags?:   close({
				Tags?: [...close({
					Key:   string | fn.#Fn
					Value: string | fn.#Fn
				})] | fn.If
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
