package ElasticBeanstalk

import "github.com/TangoGroup/fn"

Application :: {
	Type: "AWS::ElasticBeanstalk::Application"
	Properties: {
		ApplicationName?:         string | fn.Fn
		Description?:             string | fn.Fn
		ResourceLifecycleConfig?: __ApplicationResourceLifecycleConfig
	}
	__ApplicationResourceLifecycleConfig :: {
		ServiceRole?:            (string & (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#)) | fn.Fn
		VersionLifecycleConfig?: __ApplicationVersionLifecycleConfig
	}
	__ApplicationVersionLifecycleConfig :: {
		MaxAgeRule?:   __MaxAgeRule
		MaxCountRule?: __MaxCountRule
	}
	__MaxAgeRule :: {
		DeleteSourceFromS3?: bool | fn.Fn
		Enabled?:            bool | fn.Fn
		MaxAgeInDays?:       int | fn.Fn
	}
	__MaxCountRule :: {
		DeleteSourceFromS3?: bool | fn.Fn
		Enabled?:            bool | fn.Fn
		MaxCount?:           int | fn.Fn
	}
}
ApplicationVersion :: {
	Type: "AWS::ElasticBeanstalk::ApplicationVersion"
	Properties: {
		ApplicationName: string | fn.Fn
		Description?:    string | fn.Fn
		SourceBundle:    __SourceBundle
	}
	__SourceBundle :: {
		S3Bucket: string | fn.Fn
		S3Key:    string | fn.Fn
	}
}
ConfigurationTemplate :: {
	Type: "AWS::ElasticBeanstalk::ConfigurationTemplate"
	Properties: {
		ApplicationName: string | fn.Fn
		Description?:    string | fn.Fn
		EnvironmentId?:  string | fn.Fn
		OptionSettings?: [...__ConfigurationOptionSetting]
		PlatformArn?:         string | fn.Fn
		SolutionStackName?:   string | fn.Fn
		SourceConfiguration?: __SourceConfiguration
	}
	__ConfigurationOptionSetting :: {
		Namespace:     string | fn.Fn
		OptionName:    string | fn.Fn
		ResourceName?: string | fn.Fn
		Value?:        string | fn.Fn
	}
	__SourceConfiguration :: {
		ApplicationName: string | fn.Fn
		TemplateName:    string | fn.Fn
	}
}
Environment :: {
	Type: "AWS::ElasticBeanstalk::Environment"
	Properties: {
		ApplicationName:  string | fn.Fn
		CNAMEPrefix?:     string | fn.Fn
		Description?:     string | fn.Fn
		EnvironmentName?: string | fn.Fn
		OptionSettings?: [...__OptionSetting]
		PlatformArn?:       string | fn.Fn
		SolutionStackName?: string | fn.Fn
		Tags?: [...__Tag]
		TemplateName?: string | fn.Fn
		Tier?:         __Tier
		VersionLabel?: string | fn.Fn
	}
	__OptionSetting :: {
		Namespace:     string | fn.Fn
		OptionName:    string | fn.Fn
		ResourceName?: string | fn.Fn
		Value?:        string | fn.Fn
	}
	__Tier :: {
		Name?:    string | fn.Fn
		Type?:    string | fn.Fn
		Version?: string | fn.Fn
	}
}
