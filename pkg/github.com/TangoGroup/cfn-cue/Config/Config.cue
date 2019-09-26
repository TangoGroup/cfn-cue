package Config

AggregationAuthorization :: {
	Type: "AWS::Config::AggregationAuthorization"
	Properties: {
		AuthorizedAccountId: string
		AuthorizedAwsRegion: "ap-northeast-1" | "ap-northeast-2" | "ap-northeast-3" | "ap-south-1" | "ap-southeast-1" | "ap-southeast-2" | "ca-central-1" | "eu-central-1" | "eu-north-1" | "eu-west-1" | "eu-west-2" | "eu-west-3" | "sa-east-1" | "us-east-1" | "us-east-2" | "us-gov-east-1" | "us-gov-west-1" | "us-west-1" | "us-west-2"
		AuthorizedAwsRegion: string
	}
}
ConfigRule :: {
	Type: "AWS::Config::ConfigRule"
	Properties: {
		ConfigRuleName?: string
		Description?:    string
		InputParameters?: {
		}
		MaximumExecutionFrequency?: "One_Hour" | "Six_Hours" | "Three_Hours" | "Twelve_Hours" | "TwentyFour_Hours"
		MaximumExecutionFrequency?: string
		Scope?:                     __Scope
		Source:                     __Source
	}
	__Scope :: {
		ComplianceResourceId?:    string
		ComplianceResourceTypes?: "AWS::ACM::Certificate" | "AWS::AutoScaling::AutoScalingGroup" | "AWS::AutoScaling::LaunchConfiguration" | "AWS::AutoScaling::ScalingPolicy" | "AWS::AutoScaling::ScheduledAction" | "AWS::CloudFormation::Stack" | "AWS::CloudFront::Distribution" | "AWS::CloudFront::StreamingDistribution" | "AWS::CloudTrail::Trail" | "AWS::CloudWatch::Alarm" | "AWS::CodeBuild::Project" | "AWS::CodePipeline::Pipeline" | "AWS::DynamoDB::Table" | "AWS::EC2::CustomerGateway" | "AWS::EC2::EIP" | "AWS::EC2::Host" | "AWS::EC2::Instance" | "AWS::EC2::InternetGateway" | "AWS::EC2::NetworkAcl" | "AWS::EC2::NetworkInterface" | "AWS::EC2::RouteTable" | "AWS::EC2::SecurityGroup" | "AWS::EC2::Subnet" | "AWS::EC2::Volume" | "AWS::EC2::VPC" | "AWS::EC2::VPNConnection" | "AWS::EC2::VPNGateway" | "AWS::ElasticBeanstalk::Application" | "AWS::ElasticBeanstalk::ApplicationVersion" | "AWS::ElasticBeanstalk::Environment" | "AWS::ElasticLoadBalancing::LoadBalancer" | "AWS::ElasticLoadBalancingV2::LoadBalancer" | "AWS::IAM::Group" | "AWS::IAM::Policy" | "AWS::IAM::Role" | "AWS::IAM::User" | "AWS::Lambda::Function" | "AWS::RDS::DBInstance" | "AWS::RDS::DBSecurityGroup" | "AWS::RDS::DBSnapshot" | "AWS::RDS::DBSubnetGroup" | "AWS::RDS::EventSubscription" | "AWS::Redshift::Cluster" | "AWS::Redshift::ClusterParameterGroup" | "AWS::Redshift::ClusterSecurityGroup" | "AWS::Redshift::ClusterSnapshot" | "AWS::Redshift::ClusterSubnetGroup" | "AWS::Redshift::EventSubscription" | "AWS::S3::Bucket" | "AWS::ServiceCatalog::CloudFormationProduct" | "AWS::ServiceCatalog::CloudFormationProvisionedProduct" | "AWS::ServiceCatalog::Portfolio" | "AWS::Shield::Protection" | "AWS::ShieldRegional::Protection" | "AWS::SSM::AssociationCompliance" | "AWS::SSM::ManagedInstanceInventory" | "AWS::SSM::PatchCompliance" | "AWS::WAF::RateBasedRule" | "AWS::WAF::Rule" | "AWS::WAF::RuleGroup" | "AWS::WAF::WebACL" | "AWS::WAFRegional::RateBasedRule" | "AWS::WAFRegional::Rule" | "AWS::WAFRegional::RuleGroup" | "AWS::WAFRegional::WebACL" | "AWS::XRay::EncryptionConfig"
		ComplianceResourceTypes?: [...string]
		TagKey?:   string
		TagValue?: string
	}
	__Source :: {
		Owner: "AWS" | "CUSTOM_LAMBDA"
		Owner: string
		SourceDetails?: [...__SourceDetail]
		SourceIdentifier: string
	}
	__SourceDetail :: {
		EventSource:                "aws.config"
		EventSource:                string
		MaximumExecutionFrequency?: "One_Hour" | "Six_Hours" | "Three_Hours" | "Twelve_Hours" | "TwentyFour_Hours"
		MaximumExecutionFrequency?: string
		MessageType:                "ConfigurationItemChangeNotification" | "ConfigurationSnapshotDeliveryCompleted" | "OversizedConfigurationItemChangeNotification" | "ScheduledNotification"
		MessageType:                string
	}
}
ConfigurationAggregator :: {
	Type: "AWS::Config::ConfigurationAggregator"
	Properties: {
		AccountAggregationSources?: [...__AccountAggregationSource]
		ConfigurationAggregatorName:    string
		OrganizationAggregationSource?: __OrganizationAggregationSource
	}
	__AccountAggregationSource :: {
		AccountIds: [...string]
		AllAwsRegions?: bool
		AwsRegions?: [...string]
	}
	__OrganizationAggregationSource :: {
		AllAwsRegions?: bool
		AwsRegions?: [...string]
		RoleArn: string
	}
}
ConfigurationRecorder :: {
	Type: "AWS::Config::ConfigurationRecorder"
	Properties: {
		Name?:           string
		RecordingGroup?: __RecordingGroup
		RoleARN:         string
	}
	__RecordingGroup :: {
		AllSupported?:               bool
		IncludeGlobalResourceTypes?: bool
		ResourceTypes?:              "AWS::ACM::Certificate" | "AWS::AutoScaling::AutoScalingGroup" | "AWS::AutoScaling::LaunchConfiguration" | "AWS::AutoScaling::ScalingPolicy" | "AWS::AutoScaling::ScheduledAction" | "AWS::CloudFormation::Stack" | "AWS::CloudFront::Distribution" | "AWS::CloudFront::StreamingDistribution" | "AWS::CloudTrail::Trail" | "AWS::CloudWatch::Alarm" | "AWS::CodeBuild::Project" | "AWS::CodePipeline::Pipeline" | "AWS::DynamoDB::Table" | "AWS::EC2::CustomerGateway" | "AWS::EC2::EIP" | "AWS::EC2::Host" | "AWS::EC2::Instance" | "AWS::EC2::InternetGateway" | "AWS::EC2::NetworkAcl" | "AWS::EC2::NetworkInterface" | "AWS::EC2::RouteTable" | "AWS::EC2::SecurityGroup" | "AWS::EC2::Subnet" | "AWS::EC2::Volume" | "AWS::EC2::VPC" | "AWS::EC2::VPNConnection" | "AWS::EC2::VPNGateway" | "AWS::ElasticBeanstalk::Application" | "AWS::ElasticBeanstalk::ApplicationVersion" | "AWS::ElasticBeanstalk::Environment" | "AWS::ElasticLoadBalancing::LoadBalancer" | "AWS::ElasticLoadBalancingV2::LoadBalancer" | "AWS::IAM::Group" | "AWS::IAM::Policy" | "AWS::IAM::Role" | "AWS::IAM::User" | "AWS::Lambda::Function" | "AWS::RDS::DBInstance" | "AWS::RDS::DBSecurityGroup" | "AWS::RDS::DBSnapshot" | "AWS::RDS::DBSubnetGroup" | "AWS::RDS::EventSubscription" | "AWS::Redshift::Cluster" | "AWS::Redshift::ClusterParameterGroup" | "AWS::Redshift::ClusterSecurityGroup" | "AWS::Redshift::ClusterSnapshot" | "AWS::Redshift::ClusterSubnetGroup" | "AWS::Redshift::EventSubscription" | "AWS::S3::Bucket" | "AWS::ServiceCatalog::CloudFormationProduct" | "AWS::ServiceCatalog::CloudFormationProvisionedProduct" | "AWS::ServiceCatalog::Portfolio" | "AWS::Shield::Protection" | "AWS::ShieldRegional::Protection" | "AWS::SSM::AssociationCompliance" | "AWS::SSM::ManagedInstanceInventory" | "AWS::SSM::PatchCompliance" | "AWS::WAF::RateBasedRule" | "AWS::WAF::Rule" | "AWS::WAF::RuleGroup" | "AWS::WAF::WebACL" | "AWS::WAFRegional::RateBasedRule" | "AWS::WAFRegional::Rule" | "AWS::WAFRegional::RuleGroup" | "AWS::WAFRegional::WebACL" | "AWS::XRay::EncryptionConfig"
		ResourceTypes?: [...string]
	}
}
DeliveryChannel :: {
	Type: "AWS::Config::DeliveryChannel"
	Properties: {
		ConfigSnapshotDeliveryProperties?: __ConfigSnapshotDeliveryProperties
		Name?:                             string
		S3BucketName:                      string
		S3KeyPrefix?:                      string
		SnsTopicARN?:                      string
	}
	__ConfigSnapshotDeliveryProperties :: {
		DeliveryFrequency?: "One_Hour" | "Six_Hours" | "Three_Hours" | "Twelve_Hours" | "TwentyFour_Hours"
		DeliveryFrequency?: string
	}
}
OrganizationConfigRule :: {
	Type: "AWS::Config::OrganizationConfigRule"
	Properties: {
		ExcludedAccounts?: [...string]
		OrganizationConfigRuleName:       string
		OrganizationCustomRuleMetadata?:  __OrganizationCustomRuleMetadata
		OrganizationManagedRuleMetadata?: __OrganizationManagedRuleMetadata
	}
	__OrganizationCustomRuleMetadata :: {
		Description?:               string
		InputParameters?:           string
		LambdaFunctionArn:          string
		MaximumExecutionFrequency?: string
		OrganizationConfigRuleTriggerTypes: [...string]
		ResourceIdScope?: string
		ResourceTypesScope?: [...string]
		TagKeyScope?:   string
		TagValueScope?: string
	}
	__OrganizationManagedRuleMetadata :: {
		Description?:               string
		InputParameters?:           string
		MaximumExecutionFrequency?: string
		ResourceIdScope?:           string
		ResourceTypesScope?: [...string]
		RuleIdentifier: string
		TagKeyScope?:   string
		TagValueScope?: string
	}
}
RemediationConfiguration :: {
	Type: "AWS::Config::RemediationConfiguration"
	Properties: {
		Automatic?:                bool
		ConfigRuleName:            string
		ExecutionControls?:        __ExecutionControls
		MaximumAutomaticAttempts?: int
		Parameters?: {
		}
		ResourceType?:        string
		RetryAttemptSeconds?: int
		TargetId:             string
		TargetType:           string
		TargetVersion?:       string
	}
	__ExecutionControls :: {
		SsmControls?: __SsmControls
	}
	__RemediationParameterValue :: {
		ResourceValue?: __ResourceValue
		StaticValue?:   __StaticValue
	}
	__ResourceValue :: {
		Value?: string
	}
	__SsmControls :: {
		ConcurrentExecutionRatePercentage?: int
		ErrorPercentage?:                   int
	}
	__StaticValue :: {
		Values?: [...string]
	}
}
