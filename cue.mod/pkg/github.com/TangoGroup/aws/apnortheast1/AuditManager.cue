package apnortheast1

import "github.com/TangoGroup/aws/fn"

#AuditManager: {
	#Assessment: {
		Type: "AWS::AuditManager::Assessment"
		Properties: {
			assessmentReportsDestination?: {
				destination?:     string | fn.#Fn
				destinationType?: string | fn.#Fn
			} | fn.#If
			awsAccount?: {
				emailAddress?: string | fn.#Fn
				id?:           string | fn.#Fn
				name?:         string | fn.#Fn
			} | fn.#If
			description?: string | fn.#Fn
			frameworkId?: string | fn.#Fn
			name?:        string | fn.#Fn
			roles?:       [...{
				roleArn?:  string | fn.#Fn
				roleType?: string | fn.#Fn
			}] | fn.#If
			scope?: {
				awsAccounts?: {
					AWSAccounts?: [...{
						emailAddress?: string | fn.#Fn
						id?:           string | fn.#Fn
						name?:         string | fn.#Fn
					}] | fn.#If
				} | fn.#If
				awsServices?: {
					AWSServices?: [...{
						serviceName?: string | fn.#Fn
					}] | fn.#If
				} | fn.#If
			} | fn.#If
			status?: string | fn.#Fn
			tags?:   [...{
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
