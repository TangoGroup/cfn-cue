package apnortheast3

import "github.com/TangoGroup/aws/fn"

ResourceSpecificationVersion :: "20.0.0"
Template :: {
	AWSTemplateFormatVersion?: "2010-09-09"
	Description?:              string
	Metadata?: [string]: _
	Mappings?: [string]: [string]: [=~"[a-zA-Z0-9]"]: string | int | bool | [...(string | int | bool)]
	Conditions?: [string]: fn.And | fn.Equals | fn.If | fn.Not | fn.Or
	Parameters?: [=~"[a-zA-Z0-9]"]: {
		Type:                   "AWS::EC2::AvailabilityZone::Name" | "AWS::EC2::Image::Id" | "AWS::EC2::Instance::Id" | "AWS::EC2::KeyPair::KeyName" | "AWS::EC2::SecurityGroup::GroupName" | "AWS::EC2::SecurityGroup::Id" | "AWS::EC2::Subnet::Id" | "AWS::EC2::VPC::Id" | "AWS::EC2::Volume::Id" | "AWS::Route53::HostedZone::Id" | "AWS::SSM::Parameter::Name" | "AWS::SSM::Parameter::Value<AWS::EC2::AvailabilityZone::Name>" | "AWS::SSM::Parameter::Value<AWS::EC2::Image::Id>" | "AWS::SSM::Parameter::Value<AWS::EC2::Instance::Id>" | "AWS::SSM::Parameter::Value<AWS::EC2::KeyPair::KeyName>" | "AWS::SSM::Parameter::Value<AWS::EC2::SecurityGroup::GroupName>" | "AWS::SSM::Parameter::Value<AWS::EC2::SecurityGroup::Id>" | "AWS::SSM::Parameter::Value<AWS::EC2::Subnet::Id>" | "AWS::SSM::Parameter::Value<AWS::EC2::VPC::Id>" | "AWS::SSM::Parameter::Value<AWS::EC2::Volume::Id>" | "AWS::SSM::Parameter::Value<AWS::Route53::HostedZone::Id>" | "AWS::SSM::Parameter::Value<CommaDelimitedList>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::AvailabilityZone::Name>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::Image::Id>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::Instance::Id>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::KeyPair::KeyName>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::SecurityGroup::GroupName>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::SecurityGroup::Id>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::Subnet::Id>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::VPC::Id>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::Volume::Id>>" | "AWS::SSM::Parameter::Value<List<AWS::Route53::HostedZone::Id>>" | "AWS::SSM::Parameter::Value<List<String>>" | "AWS::SSM::Parameter::Value<String>" | "CommaDelimitedList" | "List<AWS::EC2::AvailabilityZone::Name>" | "List<AWS::EC2::Image::Id>" | "List<AWS::EC2::Instance::Id>" | "List<AWS::EC2::SecurityGroup::GroupName>" | "List<AWS::EC2::SecurityGroup::Id>" | "List<AWS::EC2::Subnet::Id>" | "List<AWS::EC2::VPC::Id>" | "List<AWS::EC2::Volume::Id>" | "List<AWS::Route53::HostedZone::Id>" | "List<Number>" | "Number" | "String"
		AllowedPattern?:        string
		AllowedValues?:         [...(string | number | bool)]
		ConstraintDescription?: string
		Default?:               string | number | bool
		Description?:           string
		MaxLength?:             int | =~"^[0-9]+$"
		MaxValue?:              int | =~"^[0-9]+$"
		MinLength?:             int | =~"^[0-9]+$"
		MinValue?:              int | =~"^[0-9]+$"
		NoEcho?:                bool | =~"^(true|false)$"
	}
	Resources: [=~"[a-zA-Z0-9]"]: {
		Description?: string
		Type:         "AWS::ApplicationAutoScaling::ScalableTarget" | "AWS::ApplicationAutoScaling::ScalingPolicy" | "AWS::AutoScaling::AutoScalingGroup" | "AWS::AutoScaling::LaunchConfiguration" | "AWS::AutoScaling::LifecycleHook" | "AWS::AutoScaling::ScalingPolicy" | "AWS::AutoScaling::ScheduledAction" | "AWS::CDK::Metadata" | "AWS::CertificateManager::Certificate" | "AWS::CloudFormation::CustomResource" | "AWS::CloudFormation::Macro" | "AWS::CloudFormation::Stack" | "AWS::CloudFormation::WaitCondition" | "AWS::CloudFormation::WaitConditionHandle" | "AWS::CloudFront::CachePolicy" | "AWS::CloudFront::OriginRequestPolicy" | "AWS::CloudFront::RealtimeLogConfig" | "AWS::CloudTrail::Trail" | "AWS::CloudWatch::Alarm" | "AWS::CloudWatch::AnomalyDetector" | "AWS::CloudWatch::CompositeAlarm" | "AWS::CloudWatch::Dashboard" | "AWS::CodeDeploy::Application" | "AWS::CodeDeploy::DeploymentConfig" | "AWS::CodeDeploy::DeploymentGroup" | "AWS::DynamoDB::Table" | "AWS::EC2::CustomerGateway" | "AWS::EC2::DHCPOptions" | "AWS::EC2::EC2Fleet" | "AWS::EC2::EIP" | "AWS::EC2::EIPAssociation" | "AWS::EC2::EgressOnlyInternetGateway" | "AWS::EC2::FlowLog" | "AWS::EC2::GatewayRouteTableAssociation" | "AWS::EC2::Host" | "AWS::EC2::Instance" | "AWS::EC2::InternetGateway" | "AWS::EC2::LaunchTemplate" | "AWS::EC2::NatGateway" | "AWS::EC2::NetworkAcl" | "AWS::EC2::NetworkAclEntry" | "AWS::EC2::NetworkInterface" | "AWS::EC2::NetworkInterfaceAttachment" | "AWS::EC2::NetworkInterfacePermission" | "AWS::EC2::PlacementGroup" | "AWS::EC2::Route" | "AWS::EC2::RouteTable" | "AWS::EC2::SecurityGroup" | "AWS::EC2::SecurityGroupEgress" | "AWS::EC2::SecurityGroupIngress" | "AWS::EC2::SpotFleet" | "AWS::EC2::Subnet" | "AWS::EC2::SubnetCidrBlock" | "AWS::EC2::SubnetNetworkAclAssociation" | "AWS::EC2::SubnetRouteTableAssociation" | "AWS::EC2::VPC" | "AWS::EC2::VPCCidrBlock" | "AWS::EC2::VPCDHCPOptionsAssociation" | "AWS::EC2::VPCEndpoint" | "AWS::EC2::VPCEndpointConnectionNotification" | "AWS::EC2::VPCEndpointService" | "AWS::EC2::VPCEndpointServicePermissions" | "AWS::EC2::VPCGatewayAttachment" | "AWS::EC2::VPCPeeringConnection" | "AWS::EC2::VPNConnection" | "AWS::EC2::VPNConnectionRoute" | "AWS::EC2::VPNGateway" | "AWS::EC2::VPNGatewayRoutePropagation" | "AWS::EC2::Volume" | "AWS::EC2::VolumeAttachment" | "AWS::EMR::Cluster" | "AWS::EMR::InstanceFleetConfig" | "AWS::EMR::InstanceGroupConfig" | "AWS::EMR::SecurityConfiguration" | "AWS::EMR::Step" | "AWS::ElastiCache::CacheCluster" | "AWS::ElastiCache::ParameterGroup" | "AWS::ElastiCache::ReplicationGroup" | "AWS::ElastiCache::SecurityGroup" | "AWS::ElastiCache::SecurityGroupIngress" | "AWS::ElastiCache::SubnetGroup" | "AWS::ElasticBeanstalk::Application" | "AWS::ElasticBeanstalk::ApplicationVersion" | "AWS::ElasticBeanstalk::ConfigurationTemplate" | "AWS::ElasticBeanstalk::Environment" | "AWS::ElasticLoadBalancing::LoadBalancer" | "AWS::ElasticLoadBalancingV2::Listener" | "AWS::ElasticLoadBalancingV2::ListenerCertificate" | "AWS::ElasticLoadBalancingV2::ListenerRule" | "AWS::ElasticLoadBalancingV2::LoadBalancer" | "AWS::ElasticLoadBalancingV2::TargetGroup" | "AWS::Events::Rule" | "AWS::IAM::AccessKey" | "AWS::IAM::Group" | "AWS::IAM::InstanceProfile" | "AWS::IAM::ManagedPolicy" | "AWS::IAM::Policy" | "AWS::IAM::Role" | "AWS::IAM::User" | "AWS::IAM::UserToGroupAddition" | "AWS::KMS::Alias" | "AWS::KMS::Key" | "AWS::Kinesis::Stream" | "AWS::Kinesis::StreamConsumer" | "AWS::Logs::Destination" | "AWS::Logs::LogGroup" | "AWS::Logs::LogStream" | "AWS::Logs::MetricFilter" | "AWS::Logs::SubscriptionFilter" | "AWS::RDS::DBCluster" | "AWS::RDS::DBClusterParameterGroup" | "AWS::RDS::DBInstance" | "AWS::RDS::DBParameterGroup" | "AWS::RDS::DBSecurityGroup" | "AWS::RDS::DBSecurityGroupIngress" | "AWS::RDS::DBSubnetGroup" | "AWS::RDS::EventSubscription" | "AWS::RDS::OptionGroup" | "AWS::Redshift::Cluster" | "AWS::Redshift::ClusterParameterGroup" | "AWS::Redshift::ClusterSecurityGroup" | "AWS::Redshift::ClusterSecurityGroupIngress" | "AWS::Redshift::ClusterSubnetGroup" | "AWS::ResourceGroups::Group" | "AWS::Route53::HealthCheck" | "AWS::Route53::HostedZone" | "AWS::Route53::RecordSet" | "AWS::Route53::RecordSetGroup" | "AWS::S3::AccessPoint" | "AWS::S3::Bucket" | "AWS::S3::BucketPolicy" | "AWS::SNS::Subscription" | "AWS::SNS::Topic" | "AWS::SNS::TopicPolicy" | "AWS::SQS::Queue" | "AWS::SQS::QueuePolicy" | "AWS::StepFunctions::StateMachine" | "AWS::WAF::ByteMatchSet" | "AWS::WAF::IPSet" | "AWS::WAF::Rule" | "AWS::WAF::SizeConstraintSet" | "AWS::WAF::SqlInjectionMatchSet" | "AWS::WAF::WebACL" | "AWS::WAF::XssMatchSet" | =~#"^Custom::[a-zA-Z0-9_@-]{1,60}$"#
		Properties: [string]: _
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain" | "Snapshot"
		UpdateReplacePolicy?: "Delete" | "Retain" | "Snapshot"
		CreationPolicy?:      _
		UpdatePolicy?:        _
		Metadata?: [string]: _
		Condition?: string
	}
	Outputs?: [=~"[a-zA-Z0-9]"]: {
		Description?: string
		Value:        _
		Condition?:   string
		Export?: Name: _
	}
}
ResourceTypesMap: {
	"AWS::ApplicationAutoScaling::ScalableTarget":      ApplicationAutoScaling.ScalableTarget
	"AWS::ApplicationAutoScaling::ScalingPolicy":       ApplicationAutoScaling.ScalingPolicy
	"AWS::AutoScaling::AutoScalingGroup":               AutoScaling.AutoScalingGroup
	"AWS::AutoScaling::LaunchConfiguration":            AutoScaling.LaunchConfiguration
	"AWS::AutoScaling::LifecycleHook":                  AutoScaling.LifecycleHook
	"AWS::AutoScaling::ScalingPolicy":                  AutoScaling.ScalingPolicy
	"AWS::AutoScaling::ScheduledAction":                AutoScaling.ScheduledAction
	"AWS::CDK::Metadata":                               CDK.Metadata
	"AWS::CertificateManager::Certificate":             CertificateManager.Certificate
	"AWS::CloudFormation::CustomResource":              CloudFormation.CustomResource
	"AWS::CloudFormation::Macro":                       CloudFormation.Macro
	"AWS::CloudFormation::Stack":                       CloudFormation.Stack
	"AWS::CloudFormation::WaitCondition":               CloudFormation.WaitCondition
	"AWS::CloudFormation::WaitConditionHandle":         CloudFormation.WaitConditionHandle
	"AWS::CloudFront::CachePolicy":                     CloudFront.CachePolicy
	"AWS::CloudFront::OriginRequestPolicy":             CloudFront.OriginRequestPolicy
	"AWS::CloudFront::RealtimeLogConfig":               CloudFront.RealtimeLogConfig
	"AWS::CloudTrail::Trail":                           CloudTrail.Trail
	"AWS::CloudWatch::Alarm":                           CloudWatch.Alarm
	"AWS::CloudWatch::AnomalyDetector":                 CloudWatch.AnomalyDetector
	"AWS::CloudWatch::CompositeAlarm":                  CloudWatch.CompositeAlarm
	"AWS::CloudWatch::Dashboard":                       CloudWatch.Dashboard
	"AWS::CodeDeploy::Application":                     CodeDeploy.Application
	"AWS::CodeDeploy::DeploymentConfig":                CodeDeploy.DeploymentConfig
	"AWS::CodeDeploy::DeploymentGroup":                 CodeDeploy.DeploymentGroup
	"AWS::DynamoDB::Table":                             DynamoDB.Table
	"AWS::EC2::CustomerGateway":                        EC2.CustomerGateway
	"AWS::EC2::DHCPOptions":                            EC2.DHCPOptions
	"AWS::EC2::EC2Fleet":                               EC2.EC2Fleet
	"AWS::EC2::EIP":                                    EC2.EIP
	"AWS::EC2::EIPAssociation":                         EC2.EIPAssociation
	"AWS::EC2::EgressOnlyInternetGateway":              EC2.EgressOnlyInternetGateway
	"AWS::EC2::FlowLog":                                EC2.FlowLog
	"AWS::EC2::GatewayRouteTableAssociation":           EC2.GatewayRouteTableAssociation
	"AWS::EC2::Host":                                   EC2.Host
	"AWS::EC2::Instance":                               EC2.Instance
	"AWS::EC2::InternetGateway":                        EC2.InternetGateway
	"AWS::EC2::LaunchTemplate":                         EC2.LaunchTemplate
	"AWS::EC2::NatGateway":                             EC2.NatGateway
	"AWS::EC2::NetworkAcl":                             EC2.NetworkAcl
	"AWS::EC2::NetworkAclEntry":                        EC2.NetworkAclEntry
	"AWS::EC2::NetworkInterface":                       EC2.NetworkInterface
	"AWS::EC2::NetworkInterfaceAttachment":             EC2.NetworkInterfaceAttachment
	"AWS::EC2::NetworkInterfacePermission":             EC2.NetworkInterfacePermission
	"AWS::EC2::PlacementGroup":                         EC2.PlacementGroup
	"AWS::EC2::Route":                                  EC2.Route
	"AWS::EC2::RouteTable":                             EC2.RouteTable
	"AWS::EC2::SecurityGroup":                          EC2.SecurityGroup
	"AWS::EC2::SecurityGroupEgress":                    EC2.SecurityGroupEgress
	"AWS::EC2::SecurityGroupIngress":                   EC2.SecurityGroupIngress
	"AWS::EC2::SpotFleet":                              EC2.SpotFleet
	"AWS::EC2::Subnet":                                 EC2.Subnet
	"AWS::EC2::SubnetCidrBlock":                        EC2.SubnetCidrBlock
	"AWS::EC2::SubnetNetworkAclAssociation":            EC2.SubnetNetworkAclAssociation
	"AWS::EC2::SubnetRouteTableAssociation":            EC2.SubnetRouteTableAssociation
	"AWS::EC2::VPC":                                    EC2.VPC
	"AWS::EC2::VPCCidrBlock":                           EC2.VPCCidrBlock
	"AWS::EC2::VPCDHCPOptionsAssociation":              EC2.VPCDHCPOptionsAssociation
	"AWS::EC2::VPCEndpoint":                            EC2.VPCEndpoint
	"AWS::EC2::VPCEndpointConnectionNotification":      EC2.VPCEndpointConnectionNotification
	"AWS::EC2::VPCEndpointService":                     EC2.VPCEndpointService
	"AWS::EC2::VPCEndpointServicePermissions":          EC2.VPCEndpointServicePermissions
	"AWS::EC2::VPCGatewayAttachment":                   EC2.VPCGatewayAttachment
	"AWS::EC2::VPCPeeringConnection":                   EC2.VPCPeeringConnection
	"AWS::EC2::VPNConnection":                          EC2.VPNConnection
	"AWS::EC2::VPNConnectionRoute":                     EC2.VPNConnectionRoute
	"AWS::EC2::VPNGateway":                             EC2.VPNGateway
	"AWS::EC2::VPNGatewayRoutePropagation":             EC2.VPNGatewayRoutePropagation
	"AWS::EC2::Volume":                                 EC2.Volume
	"AWS::EC2::VolumeAttachment":                       EC2.VolumeAttachment
	"AWS::EMR::Cluster":                                EMR.Cluster
	"AWS::EMR::InstanceFleetConfig":                    EMR.InstanceFleetConfig
	"AWS::EMR::InstanceGroupConfig":                    EMR.InstanceGroupConfig
	"AWS::EMR::SecurityConfiguration":                  EMR.SecurityConfiguration
	"AWS::EMR::Step":                                   EMR.Step
	"AWS::ElastiCache::CacheCluster":                   ElastiCache.CacheCluster
	"AWS::ElastiCache::ParameterGroup":                 ElastiCache.ParameterGroup
	"AWS::ElastiCache::ReplicationGroup":               ElastiCache.ReplicationGroup
	"AWS::ElastiCache::SecurityGroup":                  ElastiCache.SecurityGroup
	"AWS::ElastiCache::SecurityGroupIngress":           ElastiCache.SecurityGroupIngress
	"AWS::ElastiCache::SubnetGroup":                    ElastiCache.SubnetGroup
	"AWS::ElasticBeanstalk::Application":               ElasticBeanstalk.Application
	"AWS::ElasticBeanstalk::ApplicationVersion":        ElasticBeanstalk.ApplicationVersion
	"AWS::ElasticBeanstalk::ConfigurationTemplate":     ElasticBeanstalk.ConfigurationTemplate
	"AWS::ElasticBeanstalk::Environment":               ElasticBeanstalk.Environment
	"AWS::ElasticLoadBalancing::LoadBalancer":          ElasticLoadBalancing.LoadBalancer
	"AWS::ElasticLoadBalancingV2::Listener":            ElasticLoadBalancingV2.Listener
	"AWS::ElasticLoadBalancingV2::ListenerCertificate": ElasticLoadBalancingV2.ListenerCertificate
	"AWS::ElasticLoadBalancingV2::ListenerRule":        ElasticLoadBalancingV2.ListenerRule
	"AWS::ElasticLoadBalancingV2::LoadBalancer":        ElasticLoadBalancingV2.LoadBalancer
	"AWS::ElasticLoadBalancingV2::TargetGroup":         ElasticLoadBalancingV2.TargetGroup
	"AWS::Events::Rule":                                Events.Rule
	"AWS::IAM::AccessKey":                              IAM.AccessKey
	"AWS::IAM::Group":                                  IAM.Group
	"AWS::IAM::InstanceProfile":                        IAM.InstanceProfile
	"AWS::IAM::ManagedPolicy":                          IAM.ManagedPolicy
	"AWS::IAM::Policy":                                 IAM.Policy
	"AWS::IAM::Role":                                   IAM.Role
	"AWS::IAM::User":                                   IAM.User
	"AWS::IAM::UserToGroupAddition":                    IAM.UserToGroupAddition
	"AWS::KMS::Alias":                                  KMS.Alias
	"AWS::KMS::Key":                                    KMS.Key
	"AWS::Kinesis::Stream":                             Kinesis.Stream
	"AWS::Kinesis::StreamConsumer":                     Kinesis.StreamConsumer
	"AWS::Logs::Destination":                           Logs.Destination
	"AWS::Logs::LogGroup":                              Logs.LogGroup
	"AWS::Logs::LogStream":                             Logs.LogStream
	"AWS::Logs::MetricFilter":                          Logs.MetricFilter
	"AWS::Logs::SubscriptionFilter":                    Logs.SubscriptionFilter
	"AWS::RDS::DBCluster":                              RDS.DBCluster
	"AWS::RDS::DBClusterParameterGroup":                RDS.DBClusterParameterGroup
	"AWS::RDS::DBInstance":                             RDS.DBInstance
	"AWS::RDS::DBParameterGroup":                       RDS.DBParameterGroup
	"AWS::RDS::DBSecurityGroup":                        RDS.DBSecurityGroup
	"AWS::RDS::DBSecurityGroupIngress":                 RDS.DBSecurityGroupIngress
	"AWS::RDS::DBSubnetGroup":                          RDS.DBSubnetGroup
	"AWS::RDS::EventSubscription":                      RDS.EventSubscription
	"AWS::RDS::OptionGroup":                            RDS.OptionGroup
	"AWS::Redshift::Cluster":                           Redshift.Cluster
	"AWS::Redshift::ClusterParameterGroup":             Redshift.ClusterParameterGroup
	"AWS::Redshift::ClusterSecurityGroup":              Redshift.ClusterSecurityGroup
	"AWS::Redshift::ClusterSecurityGroupIngress":       Redshift.ClusterSecurityGroupIngress
	"AWS::Redshift::ClusterSubnetGroup":                Redshift.ClusterSubnetGroup
	"AWS::ResourceGroups::Group":                       ResourceGroups.Group
	"AWS::Route53::HealthCheck":                        Route53.HealthCheck
	"AWS::Route53::HostedZone":                         Route53.HostedZone
	"AWS::Route53::RecordSet":                          Route53.RecordSet
	"AWS::Route53::RecordSetGroup":                     Route53.RecordSetGroup
	"AWS::S3::AccessPoint":                             S3.AccessPoint
	"AWS::S3::Bucket":                                  S3.Bucket
	"AWS::S3::BucketPolicy":                            S3.BucketPolicy
	"AWS::SNS::Subscription":                           SNS.Subscription
	"AWS::SNS::Topic":                                  SNS.Topic
	"AWS::SNS::TopicPolicy":                            SNS.TopicPolicy
	"AWS::SQS::Queue":                                  SQS.Queue
	"AWS::SQS::QueuePolicy":                            SQS.QueuePolicy
	"AWS::StepFunctions::StateMachine":                 StepFunctions.StateMachine
	"AWS::WAF::ByteMatchSet":                           WAF.ByteMatchSet
	"AWS::WAF::IPSet":                                  WAF.IPSet
	"AWS::WAF::Rule":                                   WAF.Rule
	"AWS::WAF::SizeConstraintSet":                      WAF.SizeConstraintSet
	"AWS::WAF::SqlInjectionMatchSet":                   WAF.SqlInjectionMatchSet
	"AWS::WAF::WebACL":                                 WAF.WebACL
	"AWS::WAF::XssMatchSet":                            WAF.XssMatchSet
}
