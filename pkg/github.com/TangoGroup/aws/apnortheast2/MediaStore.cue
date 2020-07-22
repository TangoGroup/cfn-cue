package apnortheast2

import "github.com/TangoGroup/aws/fn"

#MediaStore: {
	#Container: {
		Type:       "AWS::MediaStore::Container"
		Properties: close({
			AccessLoggingEnabled?: bool | fn.#Fn
			ContainerName:         string | fn.#Fn
			CorsPolicy?:           [...close({
				AllowedHeaders?: [...(string | fn.#Fn)] | (string | fn.#Fn)
				AllowedMethods?: [...(string | fn.#Fn)] | (string | fn.#Fn)
				AllowedOrigins?: [...(string | fn.#Fn)] | (string | fn.#Fn)
				ExposeHeaders?:  [...(string | fn.#Fn)] | (string | fn.#Fn)
				MaxAgeSeconds?:  int | fn.#Fn
			})] | fn.If
			LifecyclePolicy?: string | fn.#Fn
			MetricPolicy?:    close({
				ContainerLevelMetrics: string | fn.#Fn
				MetricPolicyRules?:    [...close({
					ObjectGroup:     string | fn.#Fn
					ObjectGroupName: string | fn.#Fn
				})] | fn.If
			}) | fn.If
			Policy?: string | fn.#Fn
			Tags?:   [...close({
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
