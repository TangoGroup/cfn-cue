package ElasticBeanstalk

import "github.com/TangoGroup/fn"

Application :: {
	Type: "AWS::ElasticBeanstalk::Application"
	Properties: {
		ApplicationName?:         string | fn.Fn
		Description?:             string | fn.Fn
		ResourceLifecycleConfig?: propApplicationResourceLifecycleConfig
	}
	propApplicationResourceLifecycleConfig :: {
		ServiceRole?:            (string & (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#)) | fn.Fn
		VersionLifecycleConfig?: propApplicationVersionLifecycleConfig
	}
	propApplicationVersionLifecycleConfig :: {
		MaxAgeRule?:   propMaxAgeRule
		MaxCountRule?: propMaxCountRule
	}
	propMaxAgeRule :: {
		DeleteSourceFromS3?: bool | fn.Fn
		Enabled?:            bool | fn.Fn
		MaxAgeInDays?:       int | fn.Fn
	}
	propMaxCountRule :: {
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
		SourceBundle:    propSourceBundle
	}
	propSourceBundle :: {
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
		OptionSettings?: [...propConfigurationOptionSetting]
		PlatformArn?:         string | fn.Fn
		SolutionStackName?:   string | fn.Fn
		SourceConfiguration?: propSourceConfiguration
	}
	propConfigurationOptionSetting :: {
		Namespace:     string | fn.Fn
		OptionName:    string | fn.Fn
		ResourceName?: string | fn.Fn
		Value?:        string | fn.Fn
	}
	propSourceConfiguration :: {
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
		OptionSettings?: [...propOptionSetting]
		PlatformArn?:       string | fn.Fn
		SolutionStackName?: string | fn.Fn
		Tags?: [...propTag]
		TemplateName?: string | fn.Fn
		Tier?:         propTier
		VersionLabel?: string | fn.Fn
	}
	propOptionSetting :: {
		Namespace:     string | fn.Fn
		OptionName:    string | fn.Fn
		ResourceName?: string | fn.Fn
		Value?:        string | fn.Fn
	}
	propTier :: {
		Name?:    string | fn.Fn
		Type?:    string | fn.Fn
		Version?: string | fn.Fn
	}
}
