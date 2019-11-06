package MediaStore

import "github.com/TangoGroup/fn"

Container :: {
	Type: "AWS::MediaStore::Container"
	Properties: {
		AccessLoggingEnabled?: bool | fn.Fn
		ContainerName:         string | fn.Fn
		CorsPolicy?: [...propCorsRule]
		LifecyclePolicy?: string | fn.Fn
		Policy?:          string | fn.Fn
	}
	propCorsRule :: {
		AllowedHeaders?: [...(string | fn.Fn)]
		AllowedMethods?: [...(string | fn.Fn)]
		AllowedOrigins?: [...(string | fn.Fn)]
		ExposeHeaders?: [...(string | fn.Fn)]
		MaxAgeSeconds?: int | fn.Fn
	}
}
