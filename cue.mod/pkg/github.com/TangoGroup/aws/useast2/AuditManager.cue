package useast2

import "github.com/TangoGroup/aws/fn"

#AuditManager: {
	#Assessment: {
		Type: "AWS::AuditManager::Assessment"
		Properties: {
			AssessmentReportsDestination?: {
				Destination?:     string | fn.#Fn
				DestinationType?: string | fn.#Fn
			} | fn.#If
			AwsAccount?: {
				EmailAddress?: string | fn.#Fn
				Id?:           string | fn.#Fn
				Name?:         string | fn.#Fn
			} | fn.#If
			Description?: string | fn.#Fn
			FrameworkId?: string | fn.#Fn
			Name?:        string | fn.#Fn
			Roles?:       [...{
				RoleArn?:  string | fn.#Fn
				RoleType?: string | fn.#Fn
			}] | fn.#If
			Scope?: {
				AwsAccounts?: [...{
					EmailAddress?: string | fn.#Fn
					Id?:           string | fn.#Fn
					Name?:         string | fn.#Fn
				}] | fn.#If
				AwsServices?: [...{
					ServiceName?: string | fn.#Fn
				}] | fn.#If
			} | fn.#If
			Status?: string | fn.#Fn
			Tags?:   [...{
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
