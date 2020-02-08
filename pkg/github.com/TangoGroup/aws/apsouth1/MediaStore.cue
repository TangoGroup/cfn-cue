package apsouth1

import "github.com/TangoGroup/aws/fn"

MediaStore :: {
	Container :: {
		Type: "AWS::MediaStore::Container"
		Properties: {
			AccessLoggingEnabled?: bool | fn.Fn
			ContainerName:         string | fn.Fn
			CorsPolicy?: [...{
				AllowedHeaders?: [...(string | fn.Fn)] | (string | fn.Fn)
				AllowedMethods?: [...(string | fn.Fn)] | (string | fn.Fn)
				AllowedOrigins?: [...(string | fn.Fn)] | (string | fn.Fn)
				ExposeHeaders?:  [...(string | fn.Fn)] | (string | fn.Fn)
				MaxAgeSeconds?:  int | fn.Fn
			}]
			LifecyclePolicy?: string | fn.Fn
			Policy?:          string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
