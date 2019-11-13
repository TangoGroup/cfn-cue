package eucentral1

import "github.com/TangoGroup/fn"

MediaStore :: {
	Container :: {
		Type: "AWS::MediaStore::Container"
		Properties: {
			AccessLoggingEnabled?: bool | fn.Fn
			ContainerName:         string | fn.Fn
			CorsPolicy?: [...{
				AllowedHeaders?: [...(string | fn.Fn)]
				AllowedMethods?: [...(string | fn.Fn)]
				AllowedOrigins?: [...(string | fn.Fn)]
				ExposeHeaders?: [...(string | fn.Fn)]
				MaxAgeSeconds?: int | fn.Fn
			}]
			LifecyclePolicy?: string | fn.Fn
			Policy?:          string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}
