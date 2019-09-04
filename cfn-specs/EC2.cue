package EC2

CapacityReservation :: {
  Type: "AWS::EC2::CapacityReservation"
  Properties: {
    AvailabilityZone:       string
    EbsOptimized?:          bool
    EndDate?:               string
    EndDateType?:           string
    EphemeralStorage?:      bool
    InstanceCount:          int
    InstanceMatchCriteria?: string
    InstancePlatform:       string
    InstanceType:           string
    TagSpecifications?: [...__TagSpecification]
    Tenancy?: string
  }
  __TagSpecification = {
    ResourceType?: string
    Tags?: [...__Tag]
  }
}
ClientVpnAuthorizationRule :: {
  Type: "AWS::EC2::ClientVpnAuthorizationRule"
  Properties: {
    AccessGroupId?:      string
    AuthorizeAllGroups?: bool
    ClientVpnEndpointId: string
    Description?:        string
    TargetNetworkCidr:   string
  }
}
ClientVpnEndpoint :: {
  Type: "AWS::EC2::ClientVpnEndpoint"
  Properties: {
    AuthenticationOptions: [...__ClientAuthenticationRequest]
    ClientCidrBlock:      string
    ConnectionLogOptions: __ConnectionLogOptions
    Description?:         string
    DnsServers?: [...string]
    ServerCertificateArn: string
    SplitTunnel?:         bool
    TagSpecifications?: [...__TagSpecification]
    TransportProtocol?: string
  }
  __CertificateAuthenticationRequest = {
    ClientRootCertificateChainArn: string
  }
  __ClientAuthenticationRequest = {
    ActiveDirectory?:      __DirectoryServiceAuthenticationRequest
    MutualAuthentication?: __CertificateAuthenticationRequest
    Type:                  string
  }
  __ConnectionLogOptions = {
    CloudwatchLogGroup?:  string
    CloudwatchLogStream?: string
    Enabled:              bool
  }
  __DirectoryServiceAuthenticationRequest = {
    DirectoryId: string
  }
  __TagSpecification = {
    ResourceType: string
    Tags: [...__Tag]
  }
}
ClientVpnRoute :: {
  Type: "AWS::EC2::ClientVpnRoute"
  Properties: {
    ClientVpnEndpointId:  string
    Description?:         string
    DestinationCidrBlock: string
    TargetVpcSubnetId:    string
  }
}
ClientVpnTargetNetworkAssociation :: {
  Type: "AWS::EC2::ClientVpnTargetNetworkAssociation"
  Properties: {
    ClientVpnEndpointId: string
    SubnetId:            string
  }
}
CustomerGateway :: {
  Type: "AWS::EC2::CustomerGateway"
  Properties: {
    BgpAsn:    int
    IpAddress: string
    Tags?: [...__Tag]
    Type: string
  }
}
DHCPOptions :: {
  Type: "AWS::EC2::DHCPOptions"
  Properties: {
    DomainName?: string
    DomainNameServers?: [...string]
    NetbiosNameServers?: [...string]
    NetbiosNodeType?: int
    NtpServers?: [...string]
    Tags?: [...__Tag]
  }
}
EC2Fleet :: {
  Type: "AWS::EC2::EC2Fleet"
  Properties: {
    ExcessCapacityTerminationPolicy?: string
    LaunchTemplateConfigs: [...__FleetLaunchTemplateConfigRequest]
    OnDemandOptions?:           __OnDemandOptionsRequest
    ReplaceUnhealthyInstances?: bool
    SpotOptions?:               __SpotOptionsRequest
    TagSpecifications?: [...__TagSpecification]
    TargetCapacitySpecification:       __TargetCapacitySpecificationRequest
    TerminateInstancesWithExpiration?: bool
    Type?:                             string
    ValidFrom?:                        string
    ValidUntil?:                       string
  }
  __FleetLaunchTemplateConfigRequest = {
    LaunchTemplateSpecification?: __FleetLaunchTemplateSpecificationRequest
    Overrides?: [...__FleetLaunchTemplateOverridesRequest]
  }
  __FleetLaunchTemplateOverridesRequest = {
    AvailabilityZone?: string
    InstanceType?:     string
    MaxPrice?:         string
    Priority?:         float
    SubnetId?:         string
    WeightedCapacity?: float
  }
  __FleetLaunchTemplateSpecificationRequest = {
    LaunchTemplateId?:   string
    LaunchTemplateName?: string
    Version?:            string
  }
  __OnDemandOptionsRequest = {
    AllocationStrategy?: string
  }
  __SpotOptionsRequest = {
    AllocationStrategy?:           string
    InstanceInterruptionBehavior?: string
    InstancePoolsToUseCount?:      int
  }
  __TagRequest = {
    Key?:   string
    Value?: string
  }
  __TagSpecification = {
    ResourceType?: string
    Tags?: [...__TagRequest]
  }
  __TargetCapacitySpecificationRequest = {
    DefaultTargetCapacityType?: string
    OnDemandTargetCapacity?:    int
    SpotTargetCapacity?:        int
    TotalTargetCapacity:        int
  }
}
EIP :: {
  Type: "AWS::EC2::EIP"
  Properties: {
    Domain?:         string
    InstanceId?:     string
    PublicIpv4Pool?: string
  }
}
EIPAssociation :: {
  Type: "AWS::EC2::EIPAssociation"
  Properties: {
    AllocationId?:       string
    EIP?:                string
    InstanceId?:         string
    NetworkInterfaceId?: string
    PrivateIpAddress?:   string
  }
}
EgressOnlyInternetGateway :: {
  Type: "AWS::EC2::EgressOnlyInternetGateway"
  Properties: {
    VpcId: string
  }
}
FlowLog :: {
  Type: "AWS::EC2::FlowLog"
  Properties: {
    DeliverLogsPermissionArn?: string
    LogDestination?:           string
    LogDestinationType?:       string
    LogGroupName?:             string
    ResourceId:                string
    ResourceType:              string
    TrafficType:               string
  }
}
Host :: {
  Type: "AWS::EC2::Host"
  Properties: {
    AutoPlacement?:   string
    AvailabilityZone: string
    HostRecovery?:    string
    InstanceType:     string
  }
}
Instance :: {
  Type: "AWS::EC2::Instance"
  Properties: {
    AdditionalInfo?:   string
    Affinity?:         string
    AvailabilityZone?: string
    BlockDeviceMappings?: [...__BlockDeviceMapping]
    CpuOptions?:            __CpuOptions
    CreditSpecification?:   __CreditSpecification
    DisableApiTermination?: bool
    EbsOptimized?:          bool
    ElasticGpuSpecifications?: [...__ElasticGpuSpecification]
    ElasticInferenceAccelerators?: [...__ElasticInferenceAccelerator]
    HostId?:                            string
    IamInstanceProfile?:                string
    ImageId?:                           string
    InstanceInitiatedShutdownBehavior?: string
    InstanceType?:                      string
    Ipv6AddressCount?:                  int
    Ipv6Addresses?: [...__InstanceIpv6Address]
    KernelId?:       string
    KeyName?:        string
    LaunchTemplate?: __LaunchTemplateSpecification
    LicenseSpecifications?: [...__LicenseSpecification]
    Monitoring?: bool
    NetworkInterfaces?: [...__NetworkInterface]
    PlacementGroupName?: string
    PrivateIpAddress?:   string
    RamdiskId?:          string
    SecurityGroupIds?: [...string]
    SecurityGroups?: [...string]
    SourceDestCheck?: bool
    SsmAssociations?: [...__SsmAssociation]
    SubnetId?: string
    Tags?: [...__Tag]
    Tenancy?:  string
    UserData?: string
    Volumes?: [...__Volume]
  }
  __AssociationParameter = {
    Key: string
    Value: [...string]
  }
  __BlockDeviceMapping = {
    DeviceName:   string
    Ebs?:         __Ebs
    NoDevice?:    __NoDevice
    VirtualName?: string
  }
  __CpuOptions = {
    CoreCount?:      int
    ThreadsPerCore?: int
  }
  __CreditSpecification = {
    CPUCredits?: string
  }
  __Ebs = {
    DeleteOnTermination?: bool
    Encrypted?:           bool
    Iops?:                int
    KmsKeyId?:            string
    SnapshotId?:          string
    VolumeSize?:          int
    VolumeType?:          string
  }
  __ElasticGpuSpecification = {
    Type: string
  }
  __ElasticInferenceAccelerator = {
    Type: string
  }
  __InstanceIpv6Address = {
    Ipv6Address: string
  }
  __LaunchTemplateSpecification = {
    LaunchTemplateId?:   string
    LaunchTemplateName?: string
    Version:             string
  }
  __LicenseSpecification = {
    LicenseConfigurationArn: string
  }
  __NetworkInterface = {
    AssociatePublicIpAddress?: bool
    DeleteOnTermination?:      bool
    Description?:              string
    DeviceIndex:               string
    GroupSet?: [...string]
    Ipv6AddressCount?: int
    Ipv6Addresses?: [...__InstanceIpv6Address]
    NetworkInterfaceId?: string
    PrivateIpAddress?:   string
    PrivateIpAddresses?: [...__PrivateIpAddressSpecification]
    SecondaryPrivateIpAddressCount?: int
    SubnetId?:                       string
  }
  __NoDevice = {
  }
  __PrivateIpAddressSpecification = {
    Primary:          bool
    PrivateIpAddress: string
  }
  __SsmAssociation = {
    AssociationParameters?: [...__AssociationParameter]
    DocumentName: string
  }
  __Volume = {
    Device:   string
    VolumeId: string
  }
}
InternetGateway :: {
  Type: "AWS::EC2::InternetGateway"
  Properties: {
    Tags?: [...__Tag]
  }
}
LaunchTemplate :: {
  Type: "AWS::EC2::LaunchTemplate"
  Properties: {
    LaunchTemplateData?: __LaunchTemplateData
    LaunchTemplateName?: string
  }
  __BlockDeviceMapping = {
    DeviceName?:  string
    Ebs?:         __Ebs
    NoDevice?:    string
    VirtualName?: string
  }
  __CapacityReservationSpecification = {
    CapacityReservationPreference?: string
    CapacityReservationTarget?:     __CapacityReservationTarget
  }
  __CapacityReservationTarget = {
    CapacityReservationId?: string
  }
  __CpuOptions = {
    CoreCount?:      int
    ThreadsPerCore?: int
  }
  __CreditSpecification = {
    CpuCredits?: string
  }
  __Ebs = {
    DeleteOnTermination?: bool
    Encrypted?:           bool
    Iops?:                int
    KmsKeyId?:            string
    SnapshotId?:          string
    VolumeSize?:          int
    VolumeType?:          string
  }
  __ElasticGpuSpecification = {
    Type?: string
  }
  __HibernationOptions = {
    Configured?: bool
  }
  __IamInstanceProfile = {
    Arn?:  string
    Name?: string
  }
  __InstanceMarketOptions = {
    MarketType?:  string
    SpotOptions?: __SpotOptions
  }
  __Ipv6Add = {
    Ipv6Address?: string
  }
  __LaunchTemplateData = {
    BlockDeviceMappings?: [...__BlockDeviceMapping]
    CapacityReservationSpecification?: __CapacityReservationSpecification
    CpuOptions?:                       __CpuOptions
    CreditSpecification?:              __CreditSpecification
    DisableApiTermination?:            bool
    EbsOptimized?:                     bool
    ElasticGpuSpecifications?: [...__ElasticGpuSpecification]
    ElasticInferenceAccelerators?: [...__LaunchTemplateElasticInferenceAccelerator]
    HibernationOptions?:                __HibernationOptions
    IamInstanceProfile?:                __IamInstanceProfile
    ImageId?:                           string
    InstanceInitiatedShutdownBehavior?: string
    InstanceMarketOptions?:             __InstanceMarketOptions
    InstanceType?:                      string
    KernelId?:                          string
    KeyName?:                           string
    LicenseSpecifications?: [...__LicenseSpecification]
    Monitoring?: __Monitoring
    NetworkInterfaces?: [...__NetworkInterface]
    Placement?: __Placement
    RamDiskId?: string
    SecurityGroupIds?: [...string]
    SecurityGroups?: [...string]
    TagSpecifications?: [...__TagSpecification]
    UserData?: string
  }
  __LaunchTemplateElasticInferenceAccelerator = {
    Type?: string
  }
  __LicenseSpecification = {
    LicenseConfigurationArn?: string
  }
  __Monitoring = {
    Enabled?: bool
  }
  __NetworkInterface = {
    AssociatePublicIpAddress?: bool
    DeleteOnTermination?:      bool
    Description?:              string
    DeviceIndex?:              int
    Groups?: [...string]
    InterfaceType?:    string
    Ipv6AddressCount?: int
    Ipv6Addresses?: [...__Ipv6Add]
    NetworkInterfaceId?: string
    PrivateIpAddress?:   string
    PrivateIpAddresses?: [...__PrivateIpAdd]
    SecondaryPrivateIpAddressCount?: int
    SubnetId?:                       string
  }
  __Placement = {
    Affinity?:         string
    AvailabilityZone?: string
    GroupName?:        string
    HostId?:           string
    Tenancy?:          string
  }
  __PrivateIpAdd = {
    Primary?:          bool
    PrivateIpAddress?: string
  }
  __SpotOptions = {
    BlockDurationMinutes?:         int
    InstanceInterruptionBehavior?: string
    MaxPrice?:                     string
    SpotInstanceType?:             string
    ValidUntil?:                   string
  }
  __TagSpecification = {
    ResourceType: string
    Tags: [...__Tag]
  }
}
NatGateway :: {
  Type: "AWS::EC2::NatGateway"
  Properties: {
    AllocationId: string
    SubnetId:     string
    Tags?: [...__Tag]
  }
}
NetworkAcl :: {
  Type: "AWS::EC2::NetworkAcl"
  Properties: {
    Tags?: [...__Tag]
    VpcId: string
  }
}
NetworkAclEntry :: {
  Type: "AWS::EC2::NetworkAclEntry"
  Properties: {
    CidrBlock?:     string
    Egress?:        bool
    Icmp?:          __Icmp
    Ipv6CidrBlock?: string
    NetworkAclId:   string
    PortRange?:     __PortRange
    Protocol:       int
    RuleAction:     string
    RuleNumber:     int
  }
  __Icmp = {
    Code?: int
    Type?: int
  }
  __PortRange = {
    From?: int
    To?:   int
  }
}
NetworkInterface :: {
  Type: "AWS::EC2::NetworkInterface"
  Properties: {
    Description?: string
    GroupSet?: [...string]
    InterfaceType?:    string
    Ipv6AddressCount?: int
    Ipv6Addresses?:    __InstanceIpv6Address
    PrivateIpAddress?: string
    PrivateIpAddresses?: [...__PrivateIpAddressSpecification]
    SecondaryPrivateIpAddressCount?: int
    SourceDestCheck?:                bool
    SubnetId:                        string
    Tags?: [...__Tag]
  }
  __InstanceIpv6Address = {
    Ipv6Address: string
  }
  __PrivateIpAddressSpecification = {
    Primary:          bool
    PrivateIpAddress: string
  }
}
NetworkInterfaceAttachment :: {
  Type: "AWS::EC2::NetworkInterfaceAttachment"
  Properties: {
    DeleteOnTermination?: bool
    DeviceIndex:          string
    InstanceId:           string
    NetworkInterfaceId:   string
  }
}
NetworkInterfacePermission :: {
  Type: "AWS::EC2::NetworkInterfacePermission"
  Properties: {
    AwsAccountId:       string
    NetworkInterfaceId: string
    Permission:         string
  }
}
PlacementGroup :: {
  Type: "AWS::EC2::PlacementGroup"
  Properties: {
    Strategy?: string
  }
}
Route :: {
  Type: "AWS::EC2::Route"
  Properties: {
    DestinationCidrBlock?:        string
    DestinationIpv6CidrBlock?:    string
    EgressOnlyInternetGatewayId?: string
    GatewayId?:                   string
    InstanceId?:                  string
    NatGatewayId?:                string
    NetworkInterfaceId?:          string
    RouteTableId:                 string
    TransitGatewayId?:            string
    VpcPeeringConnectionId?:      string
  }
}
RouteTable :: {
  Type: "AWS::EC2::RouteTable"
  Properties: {
    Tags?: [...__Tag]
    VpcId: string
  }
}
SecurityGroup :: {
  Type: "AWS::EC2::SecurityGroup"
  Properties: {
    GroupDescription: string
    GroupName?:       string
    SecurityGroupEgress?: [...__Egress]
    SecurityGroupIngress?: [...__Ingress]
    Tags?: [...__Tag]
    VpcId?: string
  }
  __Egress = {
    CidrIp?:                     string
    CidrIpv6?:                   string
    Description?:                string
    DestinationPrefixListId?:    string
    DestinationSecurityGroupId?: string
    FromPort?:                   int
    IpProtocol:                  string
    ToPort?:                     int
  }
  __Ingress = {
    CidrIp?:                     string
    CidrIpv6?:                   string
    Description?:                string
    FromPort?:                   int
    IpProtocol:                  string
    SourcePrefixListId?:         string
    SourceSecurityGroupId?:      string
    SourceSecurityGroupName?:    string
    SourceSecurityGroupOwnerId?: string
    ToPort?:                     int
  }
}
SecurityGroupEgress :: {
  Type: "AWS::EC2::SecurityGroupEgress"
  Properties: {
    CidrIp?:                     string
    CidrIpv6?:                   string
    Description?:                string
    DestinationPrefixListId?:    string
    DestinationSecurityGroupId?: string
    FromPort?:                   int
    GroupId:                     string
    IpProtocol:                  string
    ToPort?:                     int
  }
}
SecurityGroupIngress :: {
  Type: "AWS::EC2::SecurityGroupIngress"
  Properties: {
    CidrIp?:                     string
    CidrIpv6?:                   string
    Description?:                string
    FromPort?:                   int
    GroupId?:                    string
    GroupName?:                  string
    IpProtocol:                  string
    SourcePrefixListId?:         string
    SourceSecurityGroupId?:      string
    SourceSecurityGroupName?:    string
    SourceSecurityGroupOwnerId?: string
    ToPort?:                     int
  }
}
SpotFleet :: {
  Type: "AWS::EC2::SpotFleet"
  Properties: {
    SpotFleetRequestConfigData: __SpotFleetRequestConfigData
  }
  __BlockDeviceMapping = {
    DeviceName:   string
    Ebs?:         __EbsBlockDevice
    NoDevice?:    string
    VirtualName?: string
  }
  __ClassicLoadBalancer = {
    Name: string
  }
  __ClassicLoadBalancersConfig = {
    ClassicLoadBalancers: [...__ClassicLoadBalancer]
  }
  __EbsBlockDevice = {
    DeleteOnTermination?: bool
    Encrypted?:           bool
    Iops?:                int
    SnapshotId?:          string
    VolumeSize?:          int
    VolumeType?:          string
  }
  __FleetLaunchTemplateSpecification = {
    LaunchTemplateId?:   string
    LaunchTemplateName?: string
    Version:             string
  }
  __GroupIdentifier = {
    GroupId: string
  }
  __IamInstanceProfileSpecification = {
    Arn?: string
  }
  __InstanceIpv6Address = {
    Ipv6Address: string
  }
  __InstanceNetworkInterfaceSpecification = {
    AssociatePublicIpAddress?: bool
    DeleteOnTermination?:      bool
    Description?:              string
    DeviceIndex?:              int
    Groups?: [...string]
    Ipv6AddressCount?: int
    Ipv6Addresses?: [...__InstanceIpv6Address]
    NetworkInterfaceId?: string
    PrivateIpAddresses?: [...__PrivateIpAddressSpecification]
    SecondaryPrivateIpAddressCount?: int
    SubnetId?:                       string
  }
  __LaunchTemplateConfig = {
    LaunchTemplateSpecification?: __FleetLaunchTemplateSpecification
    Overrides?: [...__LaunchTemplateOverrides]
  }
  __LaunchTemplateOverrides = {
    AvailabilityZone?: string
    InstanceType?:     string
    SpotPrice?:        string
    SubnetId?:         string
    WeightedCapacity?: float
  }
  __LoadBalancersConfig = {
    ClassicLoadBalancersConfig?: __ClassicLoadBalancersConfig
    TargetGroupsConfig?:         __TargetGroupsConfig
  }
  __PrivateIpAddressSpecification = {
    Primary?:         bool
    PrivateIpAddress: string
  }
  __SpotFleetLaunchSpecification = {
    BlockDeviceMappings?: [...__BlockDeviceMapping]
    EbsOptimized?:       bool
    IamInstanceProfile?: __IamInstanceProfileSpecification
    ImageId:             string
    InstanceType:        string
    KernelId?:           string
    KeyName?:            string
    Monitoring?:         __SpotFleetMonitoring
    NetworkInterfaces?: [...__InstanceNetworkInterfaceSpecification]
    Placement?: __SpotPlacement
    RamdiskId?: string
    SecurityGroups?: [...__GroupIdentifier]
    SpotPrice?: string
    SubnetId?:  string
    TagSpecifications?: [...__SpotFleetTagSpecification]
    UserData?:         string
    WeightedCapacity?: float
  }
  __SpotFleetMonitoring = {
    Enabled?: bool
  }
  __SpotFleetRequestConfigData = {
    AllocationStrategy?:              string
    ExcessCapacityTerminationPolicy?: string
    IamFleetRole:                     string
    InstanceInterruptionBehavior?:    string
    LaunchSpecifications?: [...__SpotFleetLaunchSpecification]
    LaunchTemplateConfigs?: [...__LaunchTemplateConfig]
    LoadBalancersConfig?:              __LoadBalancersConfig
    ReplaceUnhealthyInstances?:        bool
    SpotPrice?:                        string
    TargetCapacity:                    int
    TerminateInstancesWithExpiration?: bool
    Type?:                             string
    ValidFrom?:                        string
    ValidUntil?:                       string
  }
  __SpotFleetTagSpecification = {
    ResourceType?: string
    Tags?: [...__Tag]
  }
  __SpotPlacement = {
    AvailabilityZone?: string
    GroupName?:        string
    Tenancy?:          string
  }
  __TargetGroup = {
    Arn: string
  }
  __TargetGroupsConfig = {
    TargetGroups: [...__TargetGroup]
  }
}
Subnet :: {
  Type: "AWS::EC2::Subnet"
  Properties: {
    AssignIpv6AddressOnCreation?: bool
    AvailabilityZone?:            string
    CidrBlock:                    string
    Ipv6CidrBlock?:               string
    MapPublicIpOnLaunch?:         bool
    Tags?: [...__Tag]
    VpcId: string
  }
}
SubnetCidrBlock :: {
  Type: "AWS::EC2::SubnetCidrBlock"
  Properties: {
    Ipv6CidrBlock: string
    SubnetId:      string
  }
}
SubnetNetworkAclAssociation :: {
  Type: "AWS::EC2::SubnetNetworkAclAssociation"
  Properties: {
    NetworkAclId: string
    SubnetId:     string
  }
}
SubnetRouteTableAssociation :: {
  Type: "AWS::EC2::SubnetRouteTableAssociation"
  Properties: {
    RouteTableId: string
    SubnetId:     string
  }
}
TransitGateway :: {
  Type: "AWS::EC2::TransitGateway"
  Properties: {
    AmazonSideAsn?:                int
    AutoAcceptSharedAttachments?:  string
    DefaultRouteTableAssociation?: string
    DefaultRouteTablePropagation?: string
    Description?:                  string
    DnsSupport?:                   string
    Tags?: [...__Tag]
    VpnEcmpSupport?: string
  }
}
TransitGatewayAttachment :: {
  Type: "AWS::EC2::TransitGatewayAttachment"
  Properties: {
    SubnetIds: [...string]
    Tags?: [...__Tag]
    TransitGatewayId: string
    VpcId:            string
  }
}
TransitGatewayRoute :: {
  Type: "AWS::EC2::TransitGatewayRoute"
  Properties: {
    Blackhole?:                  bool
    DestinationCidrBlock?:       string
    TransitGatewayAttachmentId?: string
    TransitGatewayRouteTableId:  string
  }
}
TransitGatewayRouteTable :: {
  Type: "AWS::EC2::TransitGatewayRouteTable"
  Properties: {
    Tags?: [...__Tag]
    TransitGatewayId: string
  }
}
TransitGatewayRouteTableAssociation :: {
  Type: "AWS::EC2::TransitGatewayRouteTableAssociation"
  Properties: {
    TransitGatewayAttachmentId: string
    TransitGatewayRouteTableId: string
  }
}
TransitGatewayRouteTablePropagation :: {
  Type: "AWS::EC2::TransitGatewayRouteTablePropagation"
  Properties: {
    TransitGatewayAttachmentId: string
    TransitGatewayRouteTableId: string
  }
}
VPC :: {
  Type: "AWS::EC2::VPC"
  Properties: {
    CidrBlock:           string
    EnableDnsHostnames?: bool
    EnableDnsSupport?:   bool
    InstanceTenancy?:    string
    Tags?: [...__Tag]
  }
}
VPCCidrBlock :: {
  Type: "AWS::EC2::VPCCidrBlock"
  Properties: {
    AmazonProvidedIpv6CidrBlock?: bool
    CidrBlock?:                   string
    VpcId:                        string
  }
}
VPCDHCPOptionsAssociation :: {
  Type: "AWS::EC2::VPCDHCPOptionsAssociation"
  Properties: {
    DhcpOptionsId: string
    VpcId:         string
  }
}
VPCEndpoint :: {
  Type: "AWS::EC2::VPCEndpoint"
  Properties: {
    PolicyDocument?: {
    }
    PrivateDnsEnabled?: bool
    RouteTableIds?: [...string]
    SecurityGroupIds?: [...string]
    ServiceName: string
    SubnetIds?: [...string]
    VpcEndpointType?: string
    VpcId:            string
  }
}
VPCEndpointService :: {
  Type: "AWS::EC2::VPCEndpointService"
  Properties: {
    AcceptanceRequired?: bool
    NetworkLoadBalancerArns: [...string]
  }
}
VPCEndpointServicePermissions :: {
  Type: "AWS::EC2::VPCEndpointServicePermissions"
  Properties: {
    AllowedPrincipals?: [...string]
    ServiceId: string
  }
}
VPCGatewayAttachment :: {
  Type: "AWS::EC2::VPCGatewayAttachment"
  Properties: {
    InternetGatewayId?: string
    VpcId:              string
    VpnGatewayId?:      string
  }
}
VPCPeeringConnection :: {
  Type: "AWS::EC2::VPCPeeringConnection"
  Properties: {
    PeerOwnerId?: string
    PeerRegion?:  string
    PeerRoleArn?: string
    PeerVpcId:    string
    Tags?: [...__Tag]
    VpcId: string
  }
}
VPNConnection :: {
  Type: "AWS::EC2::VPNConnection"
  Properties: {
    CustomerGatewayId: string
    StaticRoutesOnly?: bool
    Tags?: [...__Tag]
    TransitGatewayId?: string
    Type:              string
    VpnGatewayId?:     string
    VpnTunnelOptionsSpecifications?: [...__VpnTunnelOptionsSpecification]
  }
  __VpnTunnelOptionsSpecification = {
    PreSharedKey?:     string
    TunnelInsideCidr?: string
  }
}
VPNConnectionRoute :: {
  Type: "AWS::EC2::VPNConnectionRoute"
  Properties: {
    DestinationCidrBlock: string
    VpnConnectionId:      string
  }
}
VPNGateway :: {
  Type: "AWS::EC2::VPNGateway"
  Properties: {
    AmazonSideAsn?: int
    Tags?: [...__Tag]
    Type: string
  }
}
VPNGatewayRoutePropagation :: {
  Type: "AWS::EC2::VPNGatewayRoutePropagation"
  Properties: {
    RouteTableIds: [...string]
    VpnGatewayId: string
  }
}
Volume :: {
  Type: "AWS::EC2::Volume"
  Properties: {
    AutoEnableIO?:    bool
    AvailabilityZone: string
    Encrypted?:       bool
    Iops?:            int
    KmsKeyId?:        string
    Size?:            int
    SnapshotId?:      string
    Tags?: [...__Tag]
    VolumeType?: string
  }
}
VolumeAttachment :: {
  Type: "AWS::EC2::VolumeAttachment"
  Properties: {
    Device:     string
    InstanceId: string
    VolumeId:   string
  }
}
