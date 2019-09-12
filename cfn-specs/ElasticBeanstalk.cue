package ElasticBeanstalk

Application :: {
	Type: "AWS::ElasticBeanstalk::Application"
	Properties: {
		ApplicationName?:         string
		Description?:             string
		ResourceLifecycleConfig?: __ApplicationResourceLifecycleConfig
	}
	__ApplicationResourceLifecycleConfig = {
		ServiceRole?:            =~"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"
		ServiceRole?:            string
		VersionLifecycleConfig?: __ApplicationVersionLifecycleConfig
	}
	__ApplicationVersionLifecycleConfig = {
		MaxAgeRule?:   __MaxAgeRule
		MaxCountRule?: __MaxCountRule
	}
	__MaxAgeRule = {
		DeleteSourceFromS3?: bool
		Enabled?:            bool
		MaxAgeInDays?:       int
	}
	__MaxCountRule = {
		DeleteSourceFromS3?: bool
		Enabled?:            bool
		MaxCount?:           int
	}
}
ApplicationVersion :: {
	Type: "AWS::ElasticBeanstalk::ApplicationVersion"
	Properties: {
		ApplicationName: string
		Description?:    string
		SourceBundle:    __SourceBundle
	}
	__SourceBundle = {
		S3Bucket: string
		S3Key:    string
	}
}
ConfigurationTemplate :: {
	Type: "AWS::ElasticBeanstalk::ConfigurationTemplate"
	Properties: {
		ApplicationName: string
		Description?:    string
		EnvironmentId?:  string
		OptionSettings?: [...__ConfigurationOptionSetting]
		PlatformArn?:         string
		SolutionStackName?:   string
		SourceConfiguration?: __SourceConfiguration
	}
	__ConfigurationOptionSetting = {
		Namespace:     string
		OptionName:    string
		ResourceName?: string
		Value?:        string
	}
	__SourceConfiguration = {
		ApplicationName: string
		TemplateName:    string
	}
}
Environment :: {
	Type: "AWS::ElasticBeanstalk::Environment"
	Properties: {
		ApplicationName:  string
		CNAMEPrefix?:     string
		Description?:     string
		EnvironmentName?: string
		OptionSettings?: [...__OptionSetting]
		PlatformArn?:       string
		SolutionStackName?: string
		Tags?: [...__Tag]
		TemplateName?: string
		Tier?:         __Tier
		VersionLabel?: string
	}
	__OptionSetting = {
		Namespace:     string
		OptionName:    string
		ResourceName?: string
		Value?:        string
	}
	__Tier = {
		Name?:    string
		Type?:    string
		Version?: string
	}
}
