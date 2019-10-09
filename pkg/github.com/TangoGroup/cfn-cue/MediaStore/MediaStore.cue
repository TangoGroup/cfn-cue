package MediaStore

import "github.com/TangoGroup/fn"

Container :: {
	Type: "AWS::MediaStore::Container"
	Properties: {
		AccessLoggingEnabled?: bool | fn.Fn
		ContainerName:         string | fn.Fn
		CorsPolicy?: [...__CorsRule]
		LifecyclePolicy?: string | fn.Fn
		Policy?:          string | fn.Fn
	}
	__CorsRule :: {
		AllowedHeaders?: [...string] | fn.Fn
		AllowedMethods?: [...string] | fn.Fn
		AllowedOrigins?: [...string] | fn.Fn
		ExposeHeaders?:  [...string] | fn.Fn
		MaxAgeSeconds?:  int | fn.Fn
	}
}
