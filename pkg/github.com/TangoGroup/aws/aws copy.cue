package aws

import (
	ask "github.com/TangoGroup/aws/ASK"
	amazonmq "github.com/TangoGroup/aws/AmazonMQ"
	amplify "github.com/TangoGroup/aws/Amplify"
	apigateway "github.com/TangoGroup/aws/ApiGateway"
	apigatewayv2 "github.com/TangoGroup/aws/ApiGatewayV2"
	appmesh "github.com/TangoGroup/aws/AppMesh"
	appstream "github.com/TangoGroup/aws/AppStream"
	appsync "github.com/TangoGroup/aws/AppSync"
	applicationautoscaling "github.com/TangoGroup/aws/ApplicationAutoScaling"
	athena "github.com/TangoGroup/aws/Athena"
	autoscaling "github.com/TangoGroup/aws/AutoScaling"
	autoscalingplans "github.com/TangoGroup/aws/AutoScalingPlans"
	backup "github.com/TangoGroup/aws/Backup"
	batch "github.com/TangoGroup/aws/Batch"
	budgets "github.com/TangoGroup/aws/Budgets"
	cdk "github.com/TangoGroup/aws/CDK"
	certificatemanager "github.com/TangoGroup/aws/CertificateManager"
	cloud9 "github.com/TangoGroup/aws/Cloud9"
	cloudformation "github.com/TangoGroup/aws/CloudFormation"
	cloudfront "github.com/TangoGroup/aws/CloudFront"
	cloudtrail "github.com/TangoGroup/aws/CloudTrail"
	cloudwatch "github.com/TangoGroup/aws/CloudWatch"
	codebuild "github.com/TangoGroup/aws/CodeBuild"
	codecommit "github.com/TangoGroup/aws/CodeCommit"
	codedeploy "github.com/TangoGroup/aws/CodeDeploy"
	codepipeline "github.com/TangoGroup/aws/CodePipeline"
	codestar "github.com/TangoGroup/aws/CodeStar"
	cognito "github.com/TangoGroup/aws/Cognito"
	config "github.com/TangoGroup/aws/Config"
	dax "github.com/TangoGroup/aws/DAX"
	dlm "github.com/TangoGroup/aws/DLM"
	dms "github.com/TangoGroup/aws/DMS"
	datapipeline "github.com/TangoGroup/aws/DataPipeline"
	directoryservice "github.com/TangoGroup/aws/DirectoryService"
	docdb "github.com/TangoGroup/aws/DocDB"
	dynamodb "github.com/TangoGroup/aws/DynamoDB"
	ec2 "github.com/TangoGroup/aws/EC2"
	ecr "github.com/TangoGroup/aws/ECR"
	ecs "github.com/TangoGroup/aws/ECS"
	efs "github.com/TangoGroup/aws/EFS"
	eks "github.com/TangoGroup/aws/EKS"
	emr "github.com/TangoGroup/aws/EMR"
	elasticache "github.com/TangoGroup/aws/ElastiCache"
	elasticbeanstalk "github.com/TangoGroup/aws/ElasticBeanstalk"
	elasticloadbalancing "github.com/TangoGroup/aws/ElasticLoadBalancing"
	elasticloadbalancingv2 "github.com/TangoGroup/aws/ElasticLoadBalancingV2"
	elasticsearch "github.com/TangoGroup/aws/Elasticsearch"
	events "github.com/TangoGroup/aws/Events"
	fsx "github.com/TangoGroup/aws/FSx"
	gamelift "github.com/TangoGroup/aws/GameLift"
	glue "github.com/TangoGroup/aws/Glue"
	greengrass "github.com/TangoGroup/aws/Greengrass"
	guardduty "github.com/TangoGroup/aws/GuardDuty"
	iam "github.com/TangoGroup/aws/IAM"
	inspector "github.com/TangoGroup/aws/Inspector"
	iot "github.com/TangoGroup/aws/IoT"
	iot1click "github.com/TangoGroup/aws/IoT1Click"
	iotanalytics "github.com/TangoGroup/aws/IoTAnalytics"
	iotevents "github.com/TangoGroup/aws/IoTEvents"
	iotthingsgraph "github.com/TangoGroup/aws/IoTThingsGraph"
	kms "github.com/TangoGroup/aws/KMS"
	kinesis "github.com/TangoGroup/aws/Kinesis"
	kinesisanalytics "github.com/TangoGroup/aws/KinesisAnalytics"
	kinesisanalyticsv2 "github.com/TangoGroup/aws/KinesisAnalyticsV2"
	kinesisfirehose "github.com/TangoGroup/aws/KinesisFirehose"
	lakeformation "github.com/TangoGroup/aws/LakeFormation"
	lambda "github.com/TangoGroup/aws/Lambda"
	logs "github.com/TangoGroup/aws/Logs"
	msk "github.com/TangoGroup/aws/MSK"
	medialive "github.com/TangoGroup/aws/MediaLive"
	mediastore "github.com/TangoGroup/aws/MediaStore"
	neptune "github.com/TangoGroup/aws/Neptune"
	opsworks "github.com/TangoGroup/aws/OpsWorks"
	opsworkscm "github.com/TangoGroup/aws/OpsWorksCM"
	pinpoint "github.com/TangoGroup/aws/Pinpoint"
	pinpointemail "github.com/TangoGroup/aws/PinpointEmail"
	qldb "github.com/TangoGroup/aws/QLDB"
	ram "github.com/TangoGroup/aws/RAM"
	rds "github.com/TangoGroup/aws/RDS"
	redshift "github.com/TangoGroup/aws/Redshift"
	robomaker "github.com/TangoGroup/aws/RoboMaker"
	route53 "github.com/TangoGroup/aws/Route53"
	route53resolver "github.com/TangoGroup/aws/Route53Resolver"
	s3 "github.com/TangoGroup/aws/S3"
	sdb "github.com/TangoGroup/aws/SDB"
	ses "github.com/TangoGroup/aws/SES"
	sns "github.com/TangoGroup/aws/SNS"
	sqs "github.com/TangoGroup/aws/SQS"
	ssm "github.com/TangoGroup/aws/SSM"
	sagemaker "github.com/TangoGroup/aws/SageMaker"
	secretsmanager "github.com/TangoGroup/aws/SecretsManager"
	securityhub "github.com/TangoGroup/aws/SecurityHub"
	servicecatalog "github.com/TangoGroup/aws/ServiceCatalog"
	servicediscovery "github.com/TangoGroup/aws/ServiceDiscovery"
	stepfunctions "github.com/TangoGroup/aws/StepFunctions"
	transfer "github.com/TangoGroup/aws/Transfer"
	waf "github.com/TangoGroup/aws/WAF"
	wafregional "github.com/TangoGroup/aws/WAFRegional"
	workspaces "github.com/TangoGroup/aws/WorkSpaces"
)

ASK ::                    ask
AmazonMQ ::               amazonmq
Amplify ::                amplify
ApiGateway ::             apigateway
ApiGatewayV2 ::           apigatewayv2
AppMesh ::                appmesh
AppStream ::              appstream
AppSync ::                appsync
ApplicationAutoScaling :: applicationautoscaling
Athena ::                 athena
AutoScaling ::            autoscaling
AutoScalingPlans ::       autoscalingplans
Backup ::                 backup
Batch ::                  batch
Budgets ::                budgets
CDK ::                    cdk
CertificateManager ::     certificatemanager
Cloud9 ::                 cloud9
CloudFormation ::         cloudformation
CloudFront ::             cloudfront
CloudTrail ::             cloudtrail
CloudWatch ::             cloudwatch
CodeBuild ::              codebuild
CodeCommit ::             codecommit
CodeDeploy ::             codedeploy
CodePipeline ::           codepipeline
CodeStar ::               codestar
Cognito ::                cognito
Config ::                 config
DAX ::                    dax
DLM ::                    dlm
DMS ::                    dms
DataPipeline ::           datapipeline
DirectoryService ::       directoryservice
DocDB ::                  docdb
DynamoDB ::               dynamodb
EC2 ::                    ec2
ECR ::                    ecr
ECS ::                    ecs
EFS ::                    efs
EKS ::                    eks
EMR ::                    emr
ElastiCache ::            elasticache
ElasticBeanstalk ::       elasticbeanstalk
ElasticLoadBalancing ::   elasticloadbalancing
ElasticLoadBalancingV2 :: elasticloadbalancingv2
Elasticsearch ::          elasticsearch
Events ::                 events
FSx ::                    fsx
GameLift ::               gamelift
Glue ::                   glue
Greengrass ::             greengrass
GuardDuty ::              guardduty
IAM ::                    iam
Inspector ::              inspector
IoT ::                    iot
IoT1Click ::              iot1click
IoTAnalytics ::           iotanalytics
IoTEvents ::              iotevents
IoTThingsGraph ::         iotthingsgraph
KMS ::                    kms
Kinesis ::                kinesis
KinesisAnalytics ::       kinesisanalytics
KinesisAnalyticsV2 ::     kinesisanalyticsv2
KinesisFirehose ::        kinesisfirehose
LakeFormation ::          lakeformation
Lambda ::                 lambda
Logs ::                   logs
MSK ::                    msk
MediaLive ::              medialive
MediaStore ::             mediastore
Neptune ::                neptune
OpsWorks ::               opsworks
OpsWorksCM ::             opsworkscm
Pinpoint ::               pinpoint
PinpointEmail ::          pinpointemail
QLDB ::                   qldb
RAM ::                    ram
RDS ::                    rds
Redshift ::               redshift
RoboMaker ::              robomaker
Route53 ::                route53
Route53Resolver ::        route53resolver
S3 ::                     s3
SDB ::                    sdb
SES ::                    ses
SNS ::                    sns
SQS ::                    sqs
SSM ::                    ssm
SageMaker ::              sagemaker
SecretsManager ::         secretsmanager
SecurityHub ::            securityhub
ServiceCatalog ::         servicecatalog
ServiceDiscovery ::       servicediscovery
StepFunctions ::          stepfunctions
Transfer ::               transfer
WAF ::                    waf
WAFRegional ::            wafregional
WorkSpaces ::             workspaces
// ResourceTypes ::          ASK.Skill | AmazonMQ.Broker | AmazonMQ.Configuration | AmazonMQ.ConfigurationAssociation | Amplify.App | Amplify.Branch | Amplify.Domain | ApiGateway.Account | ApiGateway.ApiKey | ApiGateway.Authorizer | ApiGateway.BasePathMapping | ApiGateway.ClientCertificate | ApiGateway.Deployment | ApiGateway.DocumentationPart | ApiGateway.DocumentationVersion | ApiGateway.DomainName | ApiGateway.GatewayResponse | ApiGateway.Method | ApiGateway.Model | ApiGateway.RequestValidator | ApiGateway.Resource | ApiGateway.RestApi | ApiGateway.Stage | ApiGateway.UsagePlan | ApiGateway.UsagePlanKey | ApiGateway.VpcLink | ApiGatewayV2.Api | ApiGatewayV2.ApiMapping | ApiGatewayV2.Authorizer | ApiGatewayV2.Deployment | ApiGatewayV2.DomainName | ApiGatewayV2.Integration | ApiGatewayV2.IntegrationResponse | ApiGatewayV2.Model | ApiGatewayV2.Route | ApiGatewayV2.RouteResponse | ApiGatewayV2.Stage | AppMesh.Mesh | AppMesh.Route | AppMesh.VirtualNode | AppMesh.VirtualRouter | AppMesh.VirtualService | AppStream.DirectoryConfig | AppStream.Fleet | AppStream.ImageBuilder | AppStream.Stack | AppStream.StackFleetAssociation | AppStream.StackUserAssociation | AppStream.User | AppSync.ApiKey | AppSync.DataSource | AppSync.FunctionConfiguration | AppSync.GraphQLApi | AppSync.GraphQLSchema | AppSync.Resolver | ApplicationAutoScaling.ScalableTarget | ApplicationAutoScaling.ScalingPolicy | Athena.NamedQuery | AutoScaling.AutoScalingGroup | AutoScaling.LaunchConfiguration | AutoScaling.LifecycleHook | AutoScaling.ScalingPolicy | AutoScaling.ScheduledAction | AutoScalingPlans.ScalingPlan | Backup.BackupPlan | Backup.BackupSelection | Backup.BackupVault | Batch.ComputeEnvironment | Batch.JobDefinition | Batch.JobQueue | Budgets.Budget | CDK.Metadata | CertificateManager.Certificate | Cloud9.EnvironmentEC2 | CloudFormation.CustomResource | CloudFormation.Macro | CloudFormation.Stack | CloudFormation.WaitCondition | CloudFormation.WaitConditionHandle | CloudFront.CloudFrontOriginAccessIdentity | CloudFront.Distribution | CloudFront.StreamingDistribution | CloudTrail.Trail | CloudWatch.Alarm | CloudWatch.AnomalyDetector | CloudWatch.Dashboard | CodeBuild.Project | CodeBuild.SourceCredential | CodeCommit.Repository | CodeDeploy.Application | CodeDeploy.DeploymentConfig | CodeDeploy.DeploymentGroup | CodePipeline.CustomActionType | CodePipeline.Pipeline | CodePipeline.Webhook | CodeStar.GitHubRepository | Cognito.IdentityPool | Cognito.IdentityPoolRoleAttachment | Cognito.UserPool | Cognito.UserPoolClient | Cognito.UserPoolDomain | Cognito.UserPoolGroup | Cognito.UserPoolIdentityProvider | Cognito.UserPoolResourceServer | Cognito.UserPoolRiskConfigurationAttachment | Cognito.UserPoolUICustomizationAttachment | Cognito.UserPoolUser | Cognito.UserPoolUserToGroupAttachment | Config.AggregationAuthorization | Config.ConfigRule | Config.ConfigurationAggregator | Config.ConfigurationRecorder | Config.DeliveryChannel | Config.OrganizationConfigRule | Config.RemediationConfiguration | DAX.Cluster | DAX.ParameterGroup | DAX.SubnetGroup | DLM.LifecyclePolicy | DMS.Certificate | DMS.Endpoint | DMS.EventSubscription | DMS.ReplicationInstance | DMS.ReplicationSubnetGroup | DMS.ReplicationTask | DataPipeline.Pipeline | DirectoryService.MicrosoftAD | DirectoryService.SimpleAD | DocDB.DBCluster | DocDB.DBClusterParameterGroup | DocDB.DBInstance | DocDB.DBSubnetGroup | DynamoDB.Table | EC2.CapacityReservation | EC2.ClientVpnAuthorizationRule | EC2.ClientVpnEndpoint | EC2.ClientVpnRoute | EC2.ClientVpnTargetNetworkAssociation | EC2.CustomerGateway | EC2.DHCPOptions | EC2.EC2Fleet | EC2.EIP | EC2.EIPAssociation | EC2.EgressOnlyInternetGateway | EC2.FlowLog | EC2.Host | EC2.Instance | EC2.InternetGateway | EC2.LaunchTemplate | EC2.NatGateway | EC2.NetworkAcl | EC2.NetworkAclEntry | EC2.NetworkInterface | EC2.NetworkInterfaceAttachment | EC2.NetworkInterfacePermission | EC2.PlacementGroup | EC2.Route | EC2.RouteTable | EC2.SecurityGroup | EC2.SecurityGroupEgress | EC2.SecurityGroupIngress | EC2.SpotFleet | EC2.Subnet | EC2.SubnetCidrBlock | EC2.SubnetNetworkAclAssociation | EC2.SubnetRouteTableAssociation | EC2.TrafficMirrorFilter | EC2.TrafficMirrorFilterRule | EC2.TrafficMirrorSession | EC2.TrafficMirrorTarget | EC2.TransitGateway | EC2.TransitGatewayAttachment | EC2.TransitGatewayRoute | EC2.TransitGatewayRouteTable | EC2.TransitGatewayRouteTableAssociation | EC2.TransitGatewayRouteTablePropagation | EC2.VPC | EC2.VPCCidrBlock | EC2.VPCDHCPOptionsAssociation | EC2.VPCEndpoint | EC2.VPCEndpointService | EC2.VPCEndpointServicePermissions | EC2.VPCGatewayAttachment | EC2.VPCPeeringConnection | EC2.VPNConnection | EC2.VPNConnectionRoute | EC2.VPNGateway | EC2.VPNGatewayRoutePropagation | EC2.Volume | EC2.VolumeAttachment | ECR.Repository | ECS.Cluster | ECS.Service | ECS.TaskDefinition | EFS.FileSystem | EFS.MountTarget | EKS.Cluster | EMR.Cluster | EMR.InstanceFleetConfig | EMR.InstanceGroupConfig | EMR.SecurityConfiguration | EMR.Step | ElastiCache.CacheCluster | ElastiCache.ParameterGroup | ElastiCache.ReplicationGroup | ElastiCache.SecurityGroup | ElastiCache.SecurityGroupIngress | ElastiCache.SubnetGroup | ElasticBeanstalk.Application | ElasticBeanstalk.ApplicationVersion | ElasticBeanstalk.ConfigurationTemplate | ElasticBeanstalk.Environment | ElasticLoadBalancing.LoadBalancer | ElasticLoadBalancingV2.Listener | ElasticLoadBalancingV2.ListenerCertificate | ElasticLoadBalancingV2.ListenerRule | ElasticLoadBalancingV2.LoadBalancer | ElasticLoadBalancingV2.TargetGroup | Elasticsearch.Domain | Events.EventBus | Events.EventBusPolicy | Events.Rule | FSx.FileSystem | GameLift.Alias | GameLift.Build | GameLift.Fleet | Glue.Classifier | Glue.Connection | Glue.Crawler | Glue.DataCatalogEncryptionSettings | Glue.Database | Glue.DevEndpoint | Glue.Job | Glue.MLTransform | Glue.Partition | Glue.SecurityConfiguration | Glue.Table | Glue.Trigger | Glue.Workflow | Greengrass.ConnectorDefinition | Greengrass.ConnectorDefinitionVersion | Greengrass.CoreDefinition | Greengrass.CoreDefinitionVersion | Greengrass.DeviceDefinition | Greengrass.DeviceDefinitionVersion | Greengrass.FunctionDefinition | Greengrass.FunctionDefinitionVersion | Greengrass.Group | Greengrass.GroupVersion | Greengrass.LoggerDefinition | Greengrass.LoggerDefinitionVersion | Greengrass.ResourceDefinition | Greengrass.ResourceDefinitionVersion | Greengrass.SubscriptionDefinition | Greengrass.SubscriptionDefinitionVersion | GuardDuty.Detector | GuardDuty.Filter | GuardDuty.IPSet | GuardDuty.Master | GuardDuty.Member | GuardDuty.ThreatIntelSet | IAM.AccessKey | IAM.Group | IAM.InstanceProfile | IAM.ManagedPolicy | IAM.Policy | IAM.Role | IAM.ServiceLinkedRole | IAM.User | IAM.UserToGroupAddition | Inspector.AssessmentTarget | Inspector.AssessmentTemplate | Inspector.ResourceGroup | IoT.Certificate | IoT.Policy | IoT.PolicyPrincipalAttachment | IoT.Thing | IoT.ThingPrincipalAttachment | IoT.TopicRule | IoT1Click.Device | IoT1Click.Placement | IoT1Click.Project | IoTAnalytics.Channel | IoTAnalytics.Dataset | IoTAnalytics.Datastore | IoTAnalytics.Pipeline | IoTEvents.DetectorModel | IoTEvents.Input | IoTThingsGraph.FlowTemplate | KMS.Alias | KMS.Key | Kinesis.Stream | Kinesis.StreamConsumer | KinesisAnalytics.Application | KinesisAnalytics.ApplicationOutput | KinesisAnalytics.ApplicationReferenceDataSource | KinesisAnalyticsV2.Application | KinesisAnalyticsV2.ApplicationCloudWatchLoggingOption | KinesisAnalyticsV2.ApplicationOutput | KinesisAnalyticsV2.ApplicationReferenceDataSource | KinesisFirehose.DeliveryStream | LakeFormation.DataLakeSettings | LakeFormation.Permissions | LakeFormation.Resource | Lambda.Alias | Lambda.EventSourceMapping | Lambda.Function | Lambda.LayerVersion | Lambda.LayerVersionPermission | Lambda.Permission | Lambda.Version | Logs.Destination | Logs.LogGroup | Logs.LogStream | Logs.MetricFilter | Logs.SubscriptionFilter | MSK.Cluster | MediaLive.Channel | MediaLive.Input | MediaLive.InputSecurityGroup | MediaStore.Container | Neptune.DBCluster | Neptune.DBClusterParameterGroup | Neptune.DBInstance | Neptune.DBParameterGroup | Neptune.DBSubnetGroup | OpsWorks.App | OpsWorks.ElasticLoadBalancerAttachment | OpsWorks.Instance | OpsWorks.Layer | OpsWorks.Stack | OpsWorks.UserProfile | OpsWorks.Volume | OpsWorksCM.Server | Pinpoint.ADMChannel | Pinpoint.APNSChannel | Pinpoint.APNSSandboxChannel | Pinpoint.APNSVoipChannel | Pinpoint.APNSVoipSandboxChannel | Pinpoint.App | Pinpoint.ApplicationSettings | Pinpoint.BaiduChannel | Pinpoint.Campaign | Pinpoint.EmailChannel | Pinpoint.EventStream | Pinpoint.GCMChannel | Pinpoint.SMSChannel | Pinpoint.Segment | Pinpoint.VoiceChannel | PinpointEmail.ConfigurationSet | PinpointEmail.ConfigurationSetEventDestination | PinpointEmail.Identity | QLDB.Ledger | RAM.ResourceShare | RDS.DBCluster | RDS.DBClusterParameterGroup | RDS.DBInstance | RDS.DBParameterGroup | RDS.DBSecurityGroup | RDS.DBSecurityGroupIngress | RDS.DBSubnetGroup | RDS.EventSubscription | RDS.OptionGroup | Redshift.Cluster | Redshift.ClusterParameterGroup | Redshift.ClusterSecurityGroup | Redshift.ClusterSecurityGroupIngress | Redshift.ClusterSubnetGroup | RoboMaker.Fleet | RoboMaker.Robot | RoboMaker.RobotApplication | RoboMaker.RobotApplicationVersion | RoboMaker.SimulationApplication | RoboMaker.SimulationApplicationVersion | Route53.HealthCheck | Route53.HostedZone | Route53.RecordSet | Route53.RecordSetGroup | Route53Resolver.ResolverEndpoint | Route53Resolver.ResolverRule | Route53Resolver.ResolverRuleAssociation | S3.Bucket | S3.BucketPolicy | SDB.Domain | SES.ConfigurationSet | SES.ConfigurationSetEventDestination | SES.ReceiptFilter | SES.ReceiptRule | SES.ReceiptRuleSet | SES.Template | SNS.Subscription | SNS.Topic | SNS.TopicPolicy | SQS.Queue | SQS.QueuePolicy | SSM.Association | SSM.Document | SSM.MaintenanceWindow | SSM.MaintenanceWindowTarget | SSM.MaintenanceWindowTask | SSM.Parameter | SSM.PatchBaseline | SSM.ResourceDataSync | SageMaker.CodeRepository | SageMaker.Endpoint | SageMaker.EndpointConfig | SageMaker.Model | SageMaker.NotebookInstance | SageMaker.NotebookInstanceLifecycleConfig | SageMaker.Workteam | SecretsManager.ResourcePolicy | SecretsManager.RotationSchedule | SecretsManager.Secret | SecretsManager.SecretTargetAttachment | SecurityHub.Hub | ServiceCatalog.AcceptedPortfolioShare | ServiceCatalog.CloudFormationProduct | ServiceCatalog.CloudFormationProvisionedProduct | ServiceCatalog.LaunchNotificationConstraint | ServiceCatalog.LaunchRoleConstraint | ServiceCatalog.LaunchTemplateConstraint | ServiceCatalog.Portfolio | ServiceCatalog.PortfolioPrincipalAssociation | ServiceCatalog.PortfolioProductAssociation | ServiceCatalog.PortfolioShare | ServiceCatalog.ResourceUpdateConstraint | ServiceCatalog.StackSetConstraint | ServiceCatalog.TagOption | ServiceCatalog.TagOptionAssociation | ServiceDiscovery.HttpNamespace | ServiceDiscovery.Instance | ServiceDiscovery.PrivateDnsNamespace | ServiceDiscovery.PublicDnsNamespace | ServiceDiscovery.Service | StepFunctions.Activity | StepFunctions.StateMachine | Transfer.Server | Transfer.User | WAF.ByteMatchSet | WAF.IPSet | WAF.Rule | WAF.SizeConstraintSet | WAF.SqlInjectionMatchSet | WAF.WebACL | WAF.XssMatchSet | WAFRegional.ByteMatchSet | WAFRegional.GeoMatchSet | WAFRegional.IPSet | WAFRegional.RateBasedRule | WAFRegional.RegexPatternSet | WAFRegional.Rule | WAFRegional.SizeConstraintSet | WAFRegional.SqlInjectionMatchSet | WAFRegional.WebACL | WAFRegional.WebACLAssociation | WAFRegional.XssMatchSet | WorkSpaces.Workspace
ResourceTypes ::          S3.Bucket | S3.BucketPolicy 
Template :: {
	AWSTemplateFormatVersion: "2010-09-09"
	Description?:             string
	Resources: [LogicalID=string]: ResourceTypes
}
