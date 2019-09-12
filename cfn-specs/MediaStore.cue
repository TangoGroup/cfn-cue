package MediaStore

Container :: {
	Type: "AWS::MediaStore::Container"
	Properties: {
		AccessLoggingEnabled?: bool
		ContainerName:         string
		CorsPolicy?: [...__CorsRule]
		LifecyclePolicy?: string
		Policy?:          string
	}
	__CorsRule = {
		AllowedHeaders?: [...string]
		AllowedMethods?: [...string]
		AllowedOrigins?: [...string]
		ExposeHeaders?: [...string]
		MaxAgeSeconds?: int
	}
}
