package euwest1

import "github.com/TangoGroup/aws/fn"

ResourceSpecificationVersion :: "10.4.0"
Template :: {
	AWSTemplateFormatVersion?: "2010-09-09"
	Description?:              string
	Metadata?: [string]: _
	Mappings?: [string]: [string]: [=~"[a-zA-Z0-9]"]: string | [...string]
	Conditions?: [string]: fn.And | fn.Equals | fn.If | fn.Not | fn.Or
	Parameters?: [=~"[a-zA-Z0-9]"]: {
		Type:                   "AWS::EC2::AvailabilityZone::Name" | "AWS::EC2::Image::Id" | "AWS::EC2::Instance::Id" | "AWS::EC2::KeyPair::KeyName" | "AWS::EC2::SecurityGroup::GroupName" | "AWS::EC2::SecurityGroup::Id" | "AWS::EC2::Subnet::Id" | "AWS::EC2::VPC::Id" | "AWS::EC2::Volume::Id" | "AWS::Route53::HostedZone::Id" | "AWS::SSM::Parameter::Name" | "AWS::SSM::Parameter::Value<AWS::EC2::AvailabilityZone::Name>" | "AWS::SSM::Parameter::Value<AWS::EC2::Image::Id>" | "AWS::SSM::Parameter::Value<AWS::EC2::Instance::Id>" | "AWS::SSM::Parameter::Value<AWS::EC2::KeyPair::KeyName>" | "AWS::SSM::Parameter::Value<AWS::EC2::SecurityGroup::GroupName>" | "AWS::SSM::Parameter::Value<AWS::EC2::SecurityGroup::Id>" | "AWS::SSM::Parameter::Value<AWS::EC2::Subnet::Id>" | "AWS::SSM::Parameter::Value<AWS::EC2::VPC::Id>" | "AWS::SSM::Parameter::Value<AWS::EC2::Volume::Id>" | "AWS::SSM::Parameter::Value<AWS::Route53::HostedZone::Id>" | "AWS::SSM::Parameter::Value<CommaDelimitedList>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::AvailabilityZone::Name>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::Image::Id>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::Instance::Id>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::KeyPair::KeyName>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::SecurityGroup::GroupName>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::SecurityGroup::Id>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::Subnet::Id>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::VPC::Id>>" | "AWS::SSM::Parameter::Value<List<AWS::EC2::Volume::Id>>" | "AWS::SSM::Parameter::Value<List<AWS::Route53::HostedZone::Id>>" | "AWS::SSM::Parameter::Value<List<String>>" | "AWS::SSM::Parameter::Value<String>" | "CommaDelimitedList" | "List<AWS::EC2::AvailabilityZone::Name>" | "List<AWS::EC2::Image::Id>" | "List<AWS::EC2::Instance::Id>" | "List<AWS::EC2::SecurityGroup::GroupName>" | "List<AWS::EC2::SecurityGroup::Id>" | "List<AWS::EC2::Subnet::Id>" | "List<AWS::EC2::VPC::Id>" | "List<AWS::EC2::Volume::Id>" | "List<AWS::Route53::HostedZone::Id>" | "List<Number>" | "Number" | "String"
		AllowedPattern?:        string
		AllowedValues?:         [...(string | number)]
		ConstraintDescription?: string
		Default?:               string
		Description?:           string
		MaxLength?:             int
		MaxValue?:              int
		MinLength?:             int
		MinValue?:              int
		NoEcho?:                bool
	}
	Resources: [=~"[a-zA-Z0-9]"]: ACMPCA.Certificate | ACMPCA.CertificateAuthority | ACMPCA.CertificateAuthorityActivation | ASK.Skill | AccessAnalyzer.Analyzer | AmazonMQ.Broker | AmazonMQ.Configuration | AmazonMQ.ConfigurationAssociation | Amplify.App | Amplify.Branch | Amplify.Domain | ApiGateway.Account | ApiGateway.ApiKey | ApiGateway.Authorizer | ApiGateway.BasePathMapping | ApiGateway.ClientCertificate | ApiGateway.Deployment | ApiGateway.DocumentationPart | ApiGateway.DocumentationVersion | ApiGateway.DomainName | ApiGateway.GatewayResponse | ApiGateway.Method | ApiGateway.Model | ApiGateway.RequestValidator | ApiGateway.Resource | ApiGateway.RestApi | ApiGateway.Stage | ApiGateway.UsagePlan | ApiGateway.UsagePlanKey | ApiGateway.VpcLink | ApiGatewayV2.Api | ApiGatewayV2.ApiMapping | ApiGatewayV2.Authorizer | ApiGatewayV2.Deployment | ApiGatewayV2.DomainName | ApiGatewayV2.Integration | ApiGatewayV2.IntegrationResponse | ApiGatewayV2.Model | ApiGatewayV2.Route | ApiGatewayV2.RouteResponse | ApiGatewayV2.Stage | AppMesh.Mesh | AppMesh.Route | AppMesh.VirtualNode | AppMesh.VirtualRouter | AppMesh.VirtualService | AppStream.DirectoryConfig | AppStream.Fleet | AppStream.ImageBuilder | AppStream.Stack | AppStream.StackFleetAssociation | AppStream.StackUserAssociation | AppStream.User | AppSync.ApiCache | AppSync.ApiKey | AppSync.DataSource | AppSync.FunctionConfiguration | AppSync.GraphQLApi | AppSync.GraphQLSchema | AppSync.Resolver | ApplicationAutoScaling.ScalableTarget | ApplicationAutoScaling.ScalingPolicy | Athena.NamedQuery | AutoScaling.AutoScalingGroup | AutoScaling.LaunchConfiguration | AutoScaling.LifecycleHook | AutoScaling.ScalingPolicy | AutoScaling.ScheduledAction | AutoScalingPlans.ScalingPlan | Backup.BackupPlan | Backup.BackupSelection | Backup.BackupVault | Batch.ComputeEnvironment | Batch.JobDefinition | Batch.JobQueue | Budgets.Budget | CDK.Metadata | CertificateManager.Certificate | Cloud9.EnvironmentEC2 | CloudFormation.CustomResource | CloudFormation.Macro | CloudFormation.Stack | CloudFormation.WaitCondition | CloudFormation.WaitConditionHandle | CloudFront.CloudFrontOriginAccessIdentity | CloudFront.Distribution | CloudFront.StreamingDistribution | CloudTrail.Trail | CloudWatch.Alarm | CloudWatch.AnomalyDetector | CloudWatch.Dashboard | CloudWatch.InsightRule | CodeBuild.Project | CodeBuild.ReportGroup | CodeBuild.SourceCredential | CodeCommit.Repository | CodeDeploy.Application | CodeDeploy.DeploymentConfig | CodeDeploy.DeploymentGroup | CodePipeline.CustomActionType | CodePipeline.Pipeline | CodePipeline.Webhook | CodeStar.GitHubRepository | CodeStarNotifications.NotificationRule | Cognito.IdentityPool | Cognito.IdentityPoolRoleAttachment | Cognito.UserPool | Cognito.UserPoolClient | Cognito.UserPoolDomain | Cognito.UserPoolGroup | Cognito.UserPoolIdentityProvider | Cognito.UserPoolResourceServer | Cognito.UserPoolRiskConfigurationAttachment | Cognito.UserPoolUICustomizationAttachment | Cognito.UserPoolUser | Cognito.UserPoolUserToGroupAttachment | Config.AggregationAuthorization | Config.ConfigRule | Config.ConfigurationAggregator | Config.ConfigurationRecorder | Config.DeliveryChannel | Config.OrganizationConfigRule | Config.RemediationConfiguration | DAX.Cluster | DAX.ParameterGroup | DAX.SubnetGroup | DLM.LifecyclePolicy | DMS.Certificate | DMS.Endpoint | DMS.EventSubscription | DMS.ReplicationInstance | DMS.ReplicationSubnetGroup | DMS.ReplicationTask | DataPipeline.Pipeline | DirectoryService.MicrosoftAD | DirectoryService.SimpleAD | DocDB.DBCluster | DocDB.DBClusterParameterGroup | DocDB.DBInstance | DocDB.DBSubnetGroup | DynamoDB.Table | EC2.CapacityReservation | EC2.ClientVpnAuthorizationRule | EC2.ClientVpnEndpoint | EC2.ClientVpnRoute | EC2.ClientVpnTargetNetworkAssociation | EC2.CustomerGateway | EC2.DHCPOptions | EC2.EC2Fleet | EC2.EIP | EC2.EIPAssociation | EC2.EgressOnlyInternetGateway | EC2.FlowLog | EC2.GatewayRouteTableAssociation | EC2.Host | EC2.Instance | EC2.InternetGateway | EC2.LaunchTemplate | EC2.NatGateway | EC2.NetworkAcl | EC2.NetworkAclEntry | EC2.NetworkInterface | EC2.NetworkInterfaceAttachment | EC2.NetworkInterfacePermission | EC2.PlacementGroup | EC2.Route | EC2.RouteTable | EC2.SecurityGroup | EC2.SecurityGroupEgress | EC2.SecurityGroupIngress | EC2.SpotFleet | EC2.Subnet | EC2.SubnetCidrBlock | EC2.SubnetNetworkAclAssociation | EC2.SubnetRouteTableAssociation | EC2.TrafficMirrorFilter | EC2.TrafficMirrorFilterRule | EC2.TrafficMirrorSession | EC2.TrafficMirrorTarget | EC2.TransitGateway | EC2.TransitGatewayAttachment | EC2.TransitGatewayRoute | EC2.TransitGatewayRouteTable | EC2.TransitGatewayRouteTableAssociation | EC2.TransitGatewayRouteTablePropagation | EC2.VPC | EC2.VPCCidrBlock | EC2.VPCDHCPOptionsAssociation | EC2.VPCEndpoint | EC2.VPCEndpointConnectionNotification | EC2.VPCEndpointService | EC2.VPCEndpointServicePermissions | EC2.VPCGatewayAttachment | EC2.VPCPeeringConnection | EC2.VPNConnection | EC2.VPNConnectionRoute | EC2.VPNGateway | EC2.VPNGatewayRoutePropagation | EC2.Volume | EC2.VolumeAttachment | ECR.Repository | ECS.Cluster | ECS.PrimaryTaskSet | ECS.Service | ECS.TaskDefinition | ECS.TaskSet | EFS.FileSystem | EFS.MountTarget | EKS.Cluster | EKS.Nodegroup | EMR.Cluster | EMR.InstanceFleetConfig | EMR.InstanceGroupConfig | EMR.SecurityConfiguration | EMR.Step | ElastiCache.CacheCluster | ElastiCache.ParameterGroup | ElastiCache.ReplicationGroup | ElastiCache.SecurityGroup | ElastiCache.SecurityGroupIngress | ElastiCache.SubnetGroup | ElasticBeanstalk.Application | ElasticBeanstalk.ApplicationVersion | ElasticBeanstalk.ConfigurationTemplate | ElasticBeanstalk.Environment | ElasticLoadBalancing.LoadBalancer | ElasticLoadBalancingV2.Listener | ElasticLoadBalancingV2.ListenerCertificate | ElasticLoadBalancingV2.ListenerRule | ElasticLoadBalancingV2.LoadBalancer | ElasticLoadBalancingV2.TargetGroup | Elasticsearch.Domain | EventSchemas.Discoverer | EventSchemas.Registry | EventSchemas.Schema | Events.EventBus | Events.EventBusPolicy | Events.Rule | FSx.FileSystem | GameLift.Alias | GameLift.Build | GameLift.Fleet | GameLift.GameSessionQueue | GameLift.MatchmakingConfiguration | GameLift.MatchmakingRuleSet | GameLift.Script | Glue.Classifier | Glue.Connection | Glue.Crawler | Glue.DataCatalogEncryptionSettings | Glue.Database | Glue.DevEndpoint | Glue.Job | Glue.MLTransform | Glue.Partition | Glue.SecurityConfiguration | Glue.Table | Glue.Trigger | Glue.Workflow | Greengrass.ConnectorDefinition | Greengrass.ConnectorDefinitionVersion | Greengrass.CoreDefinition | Greengrass.CoreDefinitionVersion | Greengrass.DeviceDefinition | Greengrass.DeviceDefinitionVersion | Greengrass.FunctionDefinition | Greengrass.FunctionDefinitionVersion | Greengrass.Group | Greengrass.GroupVersion | Greengrass.LoggerDefinition | Greengrass.LoggerDefinitionVersion | Greengrass.ResourceDefinition | Greengrass.ResourceDefinitionVersion | Greengrass.SubscriptionDefinition | Greengrass.SubscriptionDefinitionVersion | GuardDuty.Detector | GuardDuty.Filter | GuardDuty.IPSet | GuardDuty.Master | GuardDuty.Member | GuardDuty.ThreatIntelSet | IAM.AccessKey | IAM.Group | IAM.InstanceProfile | IAM.ManagedPolicy | IAM.Policy | IAM.Role | IAM.ServiceLinkedRole | IAM.User | IAM.UserToGroupAddition | Inspector.AssessmentTarget | Inspector.AssessmentTemplate | Inspector.ResourceGroup | IoT.Certificate | IoT.Policy | IoT.PolicyPrincipalAttachment | IoT.Thing | IoT.ThingPrincipalAttachment | IoT.TopicRule | IoT1Click.Device | IoT1Click.Placement | IoT1Click.Project | IoTAnalytics.Channel | IoTAnalytics.Dataset | IoTAnalytics.Datastore | IoTAnalytics.Pipeline | IoTEvents.DetectorModel | IoTEvents.Input | IoTThingsGraph.FlowTemplate | KMS.Alias | KMS.Key | Kinesis.Stream | Kinesis.StreamConsumer | KinesisAnalytics.Application | KinesisAnalytics.ApplicationOutput | KinesisAnalytics.ApplicationReferenceDataSource | KinesisAnalyticsV2.Application | KinesisAnalyticsV2.ApplicationCloudWatchLoggingOption | KinesisAnalyticsV2.ApplicationOutput | KinesisAnalyticsV2.ApplicationReferenceDataSource | KinesisFirehose.DeliveryStream | LakeFormation.DataLakeSettings | LakeFormation.Permissions | LakeFormation.Resource | Lambda.Alias | Lambda.EventInvokeConfig | Lambda.EventSourceMapping | Lambda.Function | Lambda.LayerVersion | Lambda.LayerVersionPermission | Lambda.Permission | Lambda.Version | Logs.Destination | Logs.LogGroup | Logs.LogStream | Logs.MetricFilter | Logs.SubscriptionFilter | MSK.Cluster | MediaConvert.JobTemplate | MediaConvert.Preset | MediaConvert.Queue | MediaLive.Channel | MediaLive.Input | MediaLive.InputSecurityGroup | MediaStore.Container | Neptune.DBCluster | Neptune.DBClusterParameterGroup | Neptune.DBInstance | Neptune.DBParameterGroup | Neptune.DBSubnetGroup | OpsWorks.App | OpsWorks.ElasticLoadBalancerAttachment | OpsWorks.Instance | OpsWorks.Layer | OpsWorks.Stack | OpsWorks.UserProfile | OpsWorks.Volume | OpsWorksCM.Server | Pinpoint.ADMChannel | Pinpoint.APNSChannel | Pinpoint.APNSSandboxChannel | Pinpoint.APNSVoipChannel | Pinpoint.APNSVoipSandboxChannel | Pinpoint.App | Pinpoint.ApplicationSettings | Pinpoint.BaiduChannel | Pinpoint.Campaign | Pinpoint.EmailChannel | Pinpoint.EmailTemplate | Pinpoint.EventStream | Pinpoint.GCMChannel | Pinpoint.PushTemplate | Pinpoint.SMSChannel | Pinpoint.Segment | Pinpoint.SmsTemplate | Pinpoint.VoiceChannel | PinpointEmail.ConfigurationSet | PinpointEmail.ConfigurationSetEventDestination | PinpointEmail.DedicatedIpPool | PinpointEmail.Identity | QLDB.Ledger | RAM.ResourceShare | RDS.DBCluster | RDS.DBClusterParameterGroup | RDS.DBInstance | RDS.DBParameterGroup | RDS.DBSecurityGroup | RDS.DBSecurityGroupIngress | RDS.DBSubnetGroup | RDS.EventSubscription | RDS.OptionGroup | Redshift.Cluster | Redshift.ClusterParameterGroup | Redshift.ClusterSecurityGroup | Redshift.ClusterSecurityGroupIngress | Redshift.ClusterSubnetGroup | RoboMaker.Fleet | RoboMaker.Robot | RoboMaker.RobotApplication | RoboMaker.RobotApplicationVersion | RoboMaker.SimulationApplication | RoboMaker.SimulationApplicationVersion | Route53.HealthCheck | Route53.HostedZone | Route53.RecordSet | Route53.RecordSetGroup | Route53Resolver.ResolverEndpoint | Route53Resolver.ResolverRule | Route53Resolver.ResolverRuleAssociation | S3.AccessPoint | S3.Bucket | S3.BucketPolicy | SDB.Domain | SES.ConfigurationSet | SES.ConfigurationSetEventDestination | SES.ReceiptFilter | SES.ReceiptRule | SES.ReceiptRuleSet | SES.Template | SNS.Subscription | SNS.Topic | SNS.TopicPolicy | SQS.Queue | SQS.QueuePolicy | SSM.Association | SSM.Document | SSM.MaintenanceWindow | SSM.MaintenanceWindowTarget | SSM.MaintenanceWindowTask | SSM.Parameter | SSM.PatchBaseline | SSM.ResourceDataSync | SageMaker.CodeRepository | SageMaker.Endpoint | SageMaker.EndpointConfig | SageMaker.Model | SageMaker.NotebookInstance | SageMaker.NotebookInstanceLifecycleConfig | SageMaker.Workteam | SecretsManager.ResourcePolicy | SecretsManager.RotationSchedule | SecretsManager.Secret | SecretsManager.SecretTargetAttachment | SecurityHub.Hub | ServiceCatalog.AcceptedPortfolioShare | ServiceCatalog.CloudFormationProduct | ServiceCatalog.CloudFormationProvisionedProduct | ServiceCatalog.LaunchNotificationConstraint | ServiceCatalog.LaunchRoleConstraint | ServiceCatalog.LaunchTemplateConstraint | ServiceCatalog.Portfolio | ServiceCatalog.PortfolioPrincipalAssociation | ServiceCatalog.PortfolioProductAssociation | ServiceCatalog.PortfolioShare | ServiceCatalog.ResourceUpdateConstraint | ServiceCatalog.StackSetConstraint | ServiceCatalog.TagOption | ServiceCatalog.TagOptionAssociation | ServiceDiscovery.HttpNamespace | ServiceDiscovery.Instance | ServiceDiscovery.PrivateDnsNamespace | ServiceDiscovery.PublicDnsNamespace | ServiceDiscovery.Service | StepFunctions.Activity | StepFunctions.StateMachine | Transfer.Server | Transfer.User | WAF.ByteMatchSet | WAF.IPSet | WAF.Rule | WAF.SizeConstraintSet | WAF.SqlInjectionMatchSet | WAF.WebACL | WAF.XssMatchSet | WAFRegional.ByteMatchSet | WAFRegional.GeoMatchSet | WAFRegional.IPSet | WAFRegional.RateBasedRule | WAFRegional.RegexPatternSet | WAFRegional.Rule | WAFRegional.SizeConstraintSet | WAFRegional.SqlInjectionMatchSet | WAFRegional.WebACL | WAFRegional.WebACLAssociation | WAFRegional.XssMatchSet | WAFv2.IPSet | WAFv2.RegexPatternSet | WAFv2.RuleGroup | WAFv2.WebACL | WorkSpaces.Workspace
	Outputs?: [=~"[a-zA-Z0-9]"]: {
		Description?: string
		Value:        _
		Export?: Name: _
	}
}
