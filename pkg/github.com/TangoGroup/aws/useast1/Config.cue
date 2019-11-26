package useast1

import "github.com/TangoGroup/aws/fn"

Config :: {
	AggregationAuthorization :: {
		Type: "AWS::Config::AggregationAuthorization"
		Properties: {
			AuthorizedAccountId: string | fn.Fn
			AuthorizedAwsRegion: (string & ("ap-northeast-1" | "ap-northeast-2" | "ap-northeast-3" | "ap-south-1" | "ap-southeast-1" | "ap-southeast-2" | "ca-central-1" | "eu-central-1" | "eu-north-1" | "eu-west-1" | "eu-west-2" | "eu-west-3" | "sa-east-1" | "us-east-1" | "us-east-2" | "us-gov-east-1" | "us-gov-west-1" | "us-west-1" | "us-west-2")) | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	ConfigRule :: {
		Type: "AWS::Config::ConfigRule"
		Properties: {
			ConfigRuleName?:  string | fn.Fn
			Description?:     string | fn.Fn
			InputParameters?: {
				[string]: _
			} | fn.Fn
			MaximumExecutionFrequency?: (string & ("One_Hour" | "Six_Hours" | "Three_Hours" | "Twelve_Hours" | "TwentyFour_Hours")) | fn.Fn
			Scope?: {
				ComplianceResourceId?: string | fn.Fn
				ComplianceResourceTypes?: [...((string & ("AWS::ACM::Certificate" | "AWS::AutoScaling::AutoScalingGroup" | "AWS::AutoScaling::LaunchConfiguration" | "AWS::AutoScaling::ScalingPolicy" | "AWS::AutoScaling::ScheduledAction" | "AWS::CloudFormation::Stack" | "AWS::CloudFront::Distribution" | "AWS::CloudFront::StreamingDistribution" | "AWS::CloudTrail::Trail" | "AWS::CloudWatch::Alarm" | "AWS::CodeBuild::Project" | "AWS::CodePipeline::Pipeline" | "AWS::DynamoDB::Table" | "AWS::EC2::CustomerGateway" | "AWS::EC2::EIP" | "AWS::EC2::Host" | "AWS::EC2::Instance" | "AWS::EC2::InternetGateway" | "AWS::EC2::NetworkAcl" | "AWS::EC2::NetworkInterface" | "AWS::EC2::RouteTable" | "AWS::EC2::SecurityGroup" | "AWS::EC2::Subnet" | "AWS::EC2::Volume" | "AWS::EC2::VPC" | "AWS::EC2::VPNConnection" | "AWS::EC2::VPNGateway" | "AWS::ElasticBeanstalk::Application" | "AWS::ElasticBeanstalk::ApplicationVersion" | "AWS::ElasticBeanstalk::Environment" | "AWS::ElasticLoadBalancing::LoadBalancer" | "AWS::ElasticLoadBalancingV2::LoadBalancer" | "AWS::Elasticsearch::Domain" | "AWS::IAM::Group" | "AWS::IAM::Policy" | "AWS::IAM::Role" | "AWS::IAM::User" | "AWS::KMS::Key" | "AWS::Lambda::Function" | "AWS::RDS::DBInstance" | "AWS::RDS::DBSecurityGroup" | "AWS::RDS::DBSnapshot" | "AWS::RDS::DBSubnetGroup" | "AWS::RDS::EventSubscription" | "AWS::Redshift::Cluster" | "AWS::Redshift::ClusterParameterGroup" | "AWS::Redshift::ClusterSecurityGroup" | "AWS::Redshift::ClusterSnapshot" | "AWS::Redshift::ClusterSubnetGroup" | "AWS::Redshift::EventSubscription" | "AWS::S3::Bucket" | "AWS::ServiceCatalog::CloudFormationProduct" | "AWS::ServiceCatalog::CloudFormationProvisionedProduct" | "AWS::ServiceCatalog::Portfolio" | "AWS::Shield::Protection" | "AWS::ShieldRegional::Protection" | "AWS::SSM::AssociationCompliance" | "AWS::SSM::ManagedInstanceInventory" | "AWS::SSM::PatchCompliance" | "AWS::WAF::RateBasedRule" | "AWS::WAF::Rule" | "AWS::WAF::RuleGroup" | "AWS::WAF::WebACL" | "AWS::WAFRegional::RateBasedRule" | "AWS::WAFRegional::Rule" | "AWS::WAFRegional::RuleGroup" | "AWS::WAFRegional::WebACL" | "AWS::XRay::EncryptionConfig")) | fn.Fn)]
				TagKey?:   string | fn.Fn
				TagValue?: string | fn.Fn
			}
			Source: {
				Owner: (string & ("AWS" | "CUSTOM_LAMBDA")) | fn.Fn
				SourceDetails?: [...{
					EventSource:                (string & ("aws.config")) | fn.Fn
					MaximumExecutionFrequency?: (string & ("One_Hour" | "Six_Hours" | "Three_Hours" | "Twelve_Hours" | "TwentyFour_Hours")) | fn.Fn
					MessageType:                (string & ("ConfigurationItemChangeNotification" | "ConfigurationSnapshotDeliveryCompleted" | "OversizedConfigurationItemChangeNotification" | "ScheduledNotification")) | fn.Fn
				}]
				SourceIdentifier: string | fn.Fn
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	ConfigurationAggregator :: {
		Type: "AWS::Config::ConfigurationAggregator"
		Properties: {
			AccountAggregationSources?: [...{
				AccountIds: [...(string | fn.Fn)]
				AllAwsRegions?: bool | fn.Fn
				AwsRegions?: [...(string | fn.Fn)]
			}]
			ConfigurationAggregatorName: string | fn.Fn
			OrganizationAggregationSource?: {
				AllAwsRegions?: bool | fn.Fn
				AwsRegions?: [...(string | fn.Fn)]
				RoleArn: string | fn.Fn
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	ConfigurationRecorder :: {
		Type: "AWS::Config::ConfigurationRecorder"
		Properties: {
			Name?: string | fn.Fn
			RecordingGroup?: {
				AllSupported?:               bool | fn.Fn
				IncludeGlobalResourceTypes?: bool | fn.Fn
				ResourceTypes?: [...((string & ("AWS::ACM::Certificate" | "AWS::AutoScaling::AutoScalingGroup" | "AWS::AutoScaling::LaunchConfiguration" | "AWS::AutoScaling::ScalingPolicy" | "AWS::AutoScaling::ScheduledAction" | "AWS::CloudFormation::Stack" | "AWS::CloudFront::Distribution" | "AWS::CloudFront::StreamingDistribution" | "AWS::CloudTrail::Trail" | "AWS::CloudWatch::Alarm" | "AWS::CodeBuild::Project" | "AWS::CodePipeline::Pipeline" | "AWS::DynamoDB::Table" | "AWS::EC2::CustomerGateway" | "AWS::EC2::EIP" | "AWS::EC2::Host" | "AWS::EC2::Instance" | "AWS::EC2::InternetGateway" | "AWS::EC2::NetworkAcl" | "AWS::EC2::NetworkInterface" | "AWS::EC2::RouteTable" | "AWS::EC2::SecurityGroup" | "AWS::EC2::Subnet" | "AWS::EC2::Volume" | "AWS::EC2::VPC" | "AWS::EC2::VPNConnection" | "AWS::EC2::VPNGateway" | "AWS::ElasticBeanstalk::Application" | "AWS::ElasticBeanstalk::ApplicationVersion" | "AWS::ElasticBeanstalk::Environment" | "AWS::ElasticLoadBalancing::LoadBalancer" | "AWS::ElasticLoadBalancingV2::LoadBalancer" | "AWS::Elasticsearch::Domain" | "AWS::IAM::Group" | "AWS::IAM::Policy" | "AWS::IAM::Role" | "AWS::IAM::User" | "AWS::KMS::Key" | "AWS::Lambda::Function" | "AWS::RDS::DBInstance" | "AWS::RDS::DBSecurityGroup" | "AWS::RDS::DBSnapshot" | "AWS::RDS::DBSubnetGroup" | "AWS::RDS::EventSubscription" | "AWS::Redshift::Cluster" | "AWS::Redshift::ClusterParameterGroup" | "AWS::Redshift::ClusterSecurityGroup" | "AWS::Redshift::ClusterSnapshot" | "AWS::Redshift::ClusterSubnetGroup" | "AWS::Redshift::EventSubscription" | "AWS::S3::Bucket" | "AWS::ServiceCatalog::CloudFormationProduct" | "AWS::ServiceCatalog::CloudFormationProvisionedProduct" | "AWS::ServiceCatalog::Portfolio" | "AWS::Shield::Protection" | "AWS::ShieldRegional::Protection" | "AWS::SSM::AssociationCompliance" | "AWS::SSM::ManagedInstanceInventory" | "AWS::SSM::PatchCompliance" | "AWS::WAF::RateBasedRule" | "AWS::WAF::Rule" | "AWS::WAF::RuleGroup" | "AWS::WAF::WebACL" | "AWS::WAFRegional::RateBasedRule" | "AWS::WAFRegional::Rule" | "AWS::WAFRegional::RuleGroup" | "AWS::WAFRegional::WebACL" | "AWS::XRay::EncryptionConfig")) | fn.Fn)]
			}
			RoleARN: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	DeliveryChannel :: {
		Type: "AWS::Config::DeliveryChannel"
		Properties: {
			ConfigSnapshotDeliveryProperties?: DeliveryFrequency?: (string & ("One_Hour" | "Six_Hours" | "Three_Hours" | "Twelve_Hours" | "TwentyFour_Hours")) | fn.Fn
			Name?:        string | fn.Fn
			S3BucketName: string | fn.Fn
			S3KeyPrefix?: string | fn.Fn
			SnsTopicARN?: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	OrganizationConfigRule :: {
		Type: "AWS::Config::OrganizationConfigRule"
		Properties: {
			ExcludedAccounts?: [...(string | fn.Fn)]
			OrganizationConfigRuleName: string | fn.Fn
			OrganizationCustomRuleMetadata?: {
				Description?:               string | fn.Fn
				InputParameters?:           string | fn.Fn
				LambdaFunctionArn:          string | fn.Fn
				MaximumExecutionFrequency?: string | fn.Fn
				OrganizationConfigRuleTriggerTypes: [...(string | fn.Fn)]
				ResourceIdScope?: string | fn.Fn
				ResourceTypesScope?: [...(string | fn.Fn)]
				TagKeyScope?:   string | fn.Fn
				TagValueScope?: string | fn.Fn
			}
			OrganizationManagedRuleMetadata?: {
				Description?:               string | fn.Fn
				InputParameters?:           string | fn.Fn
				MaximumExecutionFrequency?: string | fn.Fn
				ResourceIdScope?:           string | fn.Fn
				ResourceTypesScope?: [...(string | fn.Fn)]
				RuleIdentifier: string | fn.Fn
				TagKeyScope?:   string | fn.Fn
				TagValueScope?: string | fn.Fn
			}
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	RemediationConfiguration :: {
		Type: "AWS::Config::RemediationConfiguration"
		Properties: {
			Automatic?:     bool | fn.Fn
			ConfigRuleName: string | fn.Fn
			ExecutionControls?: SsmControls?: {
				ConcurrentExecutionRatePercentage?: int | fn.Fn
				ErrorPercentage?:                   int | fn.Fn
			}
			MaximumAutomaticAttempts?: int | fn.Fn
			Parameters?:               {
				[string]: _
			} | fn.Fn
			ResourceType?:        string | fn.Fn
			RetryAttemptSeconds?: int | fn.Fn
			TargetId:             string | fn.Fn
			TargetType:           string | fn.Fn
			TargetVersion?:       string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}
