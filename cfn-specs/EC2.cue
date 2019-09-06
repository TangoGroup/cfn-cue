package EC2

CapacityReservation :: {
  Type: "AWS::EC2::CapacityReservation"
  Properties: {
    AvailabilityZone:       string
    EbsOptimized?:          bool
    EndDate?:               string
    EndDateType?:           "limited" | "unlimited"
    EndDateType?:           string
    EphemeralStorage?:      bool
    InstanceCount:          int
    InstanceMatchCriteria?: "open" | "targeted"
    InstanceMatchCriteria?: string
    InstancePlatform:       "Linux/UNIX" | "Red Hat Enterprise Linux" | "SUSE Linux" | "Windows with SQL Server Enterprise" | "Windows with SQL Server Standard" | "Windows with SQL Server Web" | "Windows with SQL Server" | "Windows"
    InstancePlatform:       string
    InstanceType:           "a1.2xlarge" | "a1.4xlarge" | "a1.large" | "a1.medium" | "a1.xlarge" | "c1.medium" | "c1.xlarge" | "c3.2xlarge" | "c3.4xlarge" | "c3.8xlarge" | "c3.large" | "c3.xlarge" | "c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.metal" | "c5.xlarge" | "c5d.18xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.xlarge" | "c5n.18xlarge" | "c5n.2xlarge" | "c5n.4xlarge" | "c5n.9xlarge" | "c5n.large" | "c5n.metal" | "c5n.xlarge" | "cc2.8xlarge" | "cr1.8xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "f1.16xlarge" | "f1.2xlarge" | "f1.4xlarge" | "g2.2xlarge" | "g2.8xlarge" | "g3.16xlarge" | "g3.4xlarge" | "g3.8xlarge" | "g3s.xlarge" | "h1.16xlarge" | "h1.2xlarge" | "h1.4xlarge" | "h1.8xlarge" | "hs1.8xlarge" | "i2.2xlarge" | "i2.4xlarge" | "i2.8xlarge" | "i2.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.metal" | "i3.xlarge" | "i3en.12xlarge" | "i3en.24xlarge" | "i3en.2xlarge" | "i3en.3xlarge" | "i3en.6xlarge" | "i3en.large" | "i3en.metal" | "i3en.xlarge" | "m1.large" | "m1.medium" | "m1.small" | "m1.xlarge" | "m2.2xlarge" | "m2.4xlarge" | "m2.xlarge" | "m3.2xlarge" | "m3.large" | "m3.medium" | "m3.xlarge" | "m4.10xlarge" | "m4.16xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5a.12xlarge" | "m5a.16xlarge" | "m5a.24xlarge" | "m5a.2xlarge" | "m5a.4xlarge" | "m5a.8xlarge" | "m5a.large" | "m5a.xlarge" | "m5ad.12xlarge" | "m5ad.24xlarge" | "m5ad.2xlarge" | "m5ad.4xlarge" | "m5ad.large" | "m5ad.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "p2.16xlarge" | "p2.8xlarge" | "p2.xlarge" | "p3.16xlarge" | "p3.2xlarge" | "p3.8xlarge" | "p3dn.24xlarge" | "r3.2xlarge" | "r3.4xlarge" | "r3.8xlarge" | "r3.large" | "r3.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5a.12xlarge" | "r5a.16xlarge" | "r5a.24xlarge" | "r5a.2xlarge" | "r5a.4xlarge" | "r5a.8xlarge" | "r5a.large" | "r5a.xlarge" | "r5ad.12xlarge" | "r5ad.24xlarge" | "r5ad.2xlarge" | "r5ad.4xlarge" | "r5ad.large" | "r5ad.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "t1.micro" | "t2.2xlarge" | "t2.large" | "t2.medium" | "t2.micro" | "t2.nano" | "t2.small" | "t2.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "t3a.2xlarge" | "t3a.large" | "t3a.medium" | "t3a.micro" | "t3a.nano" | "t3a.small" | "t3a.xlarge" | "x1.16xlarge" | "x1.32xlarge" | "x1e.16xlarge" | "x1e.2xlarge" | "x1e.32xlarge" | "x1e.4xlarge" | "x1e.8xlarge" | "x1e.xlarge" | "z1d.12xlarge" | "z1d.2xlarge" | "z1d.3xlarge" | "z1d.6xlarge" | "z1d.large" | "z1d.metal" | "z1d.xlarge"
    InstanceType:           string
    TagSpecifications?: [...__TagSpecification]
    Tenancy?: "dedicated" | "default"
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
    Type: "ipsec.1"
    Type: string
  }
}
DHCPOptions :: {
  Type: "AWS::EC2::DHCPOptions"
  Properties: {
    DomainName?: string
    DomainNameServers?: [...string]
    NetbiosNameServers?: [...string]
    NetbiosNodeType?: "1" | "2" | "4" | "8"
    NetbiosNodeType?: int
    NtpServers?: [...string]
    Tags?: [...__Tag]
  }
}
EC2Fleet :: {
  Type: "AWS::EC2::EC2Fleet"
  Properties: {
    ExcessCapacityTerminationPolicy?: "no-termination" | "termination"
    ExcessCapacityTerminationPolicy?: string
    LaunchTemplateConfigs: [...__FleetLaunchTemplateConfigRequest]
    OnDemandOptions?:           __OnDemandOptionsRequest
    ReplaceUnhealthyInstances?: bool
    SpotOptions?:               __SpotOptionsRequest
    TagSpecifications?: [...__TagSpecification]
    TargetCapacitySpecification:       __TargetCapacitySpecificationRequest
    TerminateInstancesWithExpiration?: bool
    Type?:                             "instant" | "maintain" | "request"
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
    InstanceType?:     "a1.2xlarge" | "a1.4xlarge" | "a1.large" | "a1.medium" | "a1.xlarge" | "c1.medium" | "c1.xlarge" | "c3.2xlarge" | "c3.4xlarge" | "c3.8xlarge" | "c3.large" | "c3.xlarge" | "c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.metal" | "c5.xlarge" | "c5d.18xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.xlarge" | "c5n.18xlarge" | "c5n.2xlarge" | "c5n.4xlarge" | "c5n.9xlarge" | "c5n.large" | "c5n.metal" | "c5n.xlarge" | "cc2.8xlarge" | "cr1.8xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "f1.16xlarge" | "f1.2xlarge" | "f1.4xlarge" | "g2.2xlarge" | "g2.8xlarge" | "g3.16xlarge" | "g3.4xlarge" | "g3.8xlarge" | "g3s.xlarge" | "h1.16xlarge" | "h1.2xlarge" | "h1.4xlarge" | "h1.8xlarge" | "hs1.8xlarge" | "i2.2xlarge" | "i2.4xlarge" | "i2.8xlarge" | "i2.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.metal" | "i3.xlarge" | "i3en.12xlarge" | "i3en.24xlarge" | "i3en.2xlarge" | "i3en.3xlarge" | "i3en.6xlarge" | "i3en.large" | "i3en.metal" | "i3en.xlarge" | "m1.large" | "m1.medium" | "m1.small" | "m1.xlarge" | "m2.2xlarge" | "m2.4xlarge" | "m2.xlarge" | "m3.2xlarge" | "m3.large" | "m3.medium" | "m3.xlarge" | "m4.10xlarge" | "m4.16xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5a.12xlarge" | "m5a.16xlarge" | "m5a.24xlarge" | "m5a.2xlarge" | "m5a.4xlarge" | "m5a.8xlarge" | "m5a.large" | "m5a.xlarge" | "m5ad.12xlarge" | "m5ad.24xlarge" | "m5ad.2xlarge" | "m5ad.4xlarge" | "m5ad.large" | "m5ad.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "p2.16xlarge" | "p2.8xlarge" | "p2.xlarge" | "p3.16xlarge" | "p3.2xlarge" | "p3.8xlarge" | "p3dn.24xlarge" | "r3.2xlarge" | "r3.4xlarge" | "r3.8xlarge" | "r3.large" | "r3.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5a.12xlarge" | "r5a.16xlarge" | "r5a.24xlarge" | "r5a.2xlarge" | "r5a.4xlarge" | "r5a.8xlarge" | "r5a.large" | "r5a.xlarge" | "r5ad.12xlarge" | "r5ad.24xlarge" | "r5ad.2xlarge" | "r5ad.4xlarge" | "r5ad.large" | "r5ad.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "t1.micro" | "t2.2xlarge" | "t2.large" | "t2.medium" | "t2.micro" | "t2.nano" | "t2.small" | "t2.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "t3a.2xlarge" | "t3a.large" | "t3a.medium" | "t3a.micro" | "t3a.nano" | "t3a.small" | "t3a.xlarge" | "x1.16xlarge" | "x1.32xlarge" | "x1e.16xlarge" | "x1e.2xlarge" | "x1e.32xlarge" | "x1e.4xlarge" | "x1e.8xlarge" | "x1e.xlarge" | "z1d.12xlarge" | "z1d.2xlarge" | "z1d.3xlarge" | "z1d.6xlarge" | "z1d.large" | "z1d.metal" | "z1d.xlarge"
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
    AllocationStrategy?: "lowest-price" | "prioritized"
    AllocationStrategy?: string
  }
  __SpotOptionsRequest = {
    AllocationStrategy?:           "diversified" | "lowest-price"
    AllocationStrategy?:           string
    InstanceInterruptionBehavior?: "hibernate" | "stop" | "terminate"
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
    DefaultTargetCapacityType?: "on-demand" | "spot"
    DefaultTargetCapacityType?: string
    OnDemandTargetCapacity?:    int
    SpotTargetCapacity?:        int
    TotalTargetCapacity:        int
  }
}
EIP :: {
  Type: "AWS::EC2::EIP"
  Properties: {
    Domain?:         "standard" | "vpc"
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
    LogDestinationType?:       "cloud-watch-logs" | "s3"
    LogDestinationType?:       string
    LogGroupName?:             string
    ResourceId:                string
    ResourceType:              "NetworkInterface" | "Subnet" | "VPC"
    ResourceType:              string
    TrafficType:               "ACCEPT" | "ALL" | "REJECT"
    TrafficType:               string
  }
}
Host :: {
  Type: "AWS::EC2::Host"
  Properties: {
    AutoPlacement?:   "off" | "on"
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
    Affinity?:         "default" | "host"
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
    InstanceType?:                      "a1.2xlarge" | "a1.4xlarge" | "a1.large" | "a1.medium" | "a1.xlarge" | "c1.medium" | "c1.xlarge" | "c3.2xlarge" | "c3.4xlarge" | "c3.8xlarge" | "c3.large" | "c3.xlarge" | "c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.metal" | "c5.xlarge" | "c5d.18xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.xlarge" | "c5n.18xlarge" | "c5n.2xlarge" | "c5n.4xlarge" | "c5n.9xlarge" | "c5n.large" | "c5n.metal" | "c5n.xlarge" | "cc2.8xlarge" | "cr1.8xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "f1.16xlarge" | "f1.2xlarge" | "f1.4xlarge" | "g2.2xlarge" | "g2.8xlarge" | "g3.16xlarge" | "g3.4xlarge" | "g3.8xlarge" | "g3s.xlarge" | "h1.16xlarge" | "h1.2xlarge" | "h1.4xlarge" | "h1.8xlarge" | "hs1.8xlarge" | "i2.2xlarge" | "i2.4xlarge" | "i2.8xlarge" | "i2.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.metal" | "i3.xlarge" | "i3en.12xlarge" | "i3en.24xlarge" | "i3en.2xlarge" | "i3en.3xlarge" | "i3en.6xlarge" | "i3en.large" | "i3en.metal" | "i3en.xlarge" | "m1.large" | "m1.medium" | "m1.small" | "m1.xlarge" | "m2.2xlarge" | "m2.4xlarge" | "m2.xlarge" | "m3.2xlarge" | "m3.large" | "m3.medium" | "m3.xlarge" | "m4.10xlarge" | "m4.16xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5a.12xlarge" | "m5a.16xlarge" | "m5a.24xlarge" | "m5a.2xlarge" | "m5a.4xlarge" | "m5a.8xlarge" | "m5a.large" | "m5a.xlarge" | "m5ad.12xlarge" | "m5ad.24xlarge" | "m5ad.2xlarge" | "m5ad.4xlarge" | "m5ad.large" | "m5ad.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "p2.16xlarge" | "p2.8xlarge" | "p2.xlarge" | "p3.16xlarge" | "p3.2xlarge" | "p3.8xlarge" | "p3dn.24xlarge" | "r3.2xlarge" | "r3.4xlarge" | "r3.8xlarge" | "r3.large" | "r3.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5a.12xlarge" | "r5a.16xlarge" | "r5a.24xlarge" | "r5a.2xlarge" | "r5a.4xlarge" | "r5a.8xlarge" | "r5a.large" | "r5a.xlarge" | "r5ad.12xlarge" | "r5ad.24xlarge" | "r5ad.2xlarge" | "r5ad.4xlarge" | "r5ad.large" | "r5ad.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "t1.micro" | "t2.2xlarge" | "t2.large" | "t2.medium" | "t2.micro" | "t2.nano" | "t2.small" | "t2.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "t3a.2xlarge" | "t3a.large" | "t3a.medium" | "t3a.micro" | "t3a.nano" | "t3a.small" | "t3a.xlarge" | "x1.16xlarge" | "x1.32xlarge" | "x1e.16xlarge" | "x1e.2xlarge" | "x1e.32xlarge" | "x1e.4xlarge" | "x1e.8xlarge" | "x1e.xlarge" | "z1d.12xlarge" | "z1d.2xlarge" | "z1d.3xlarge" | "z1d.6xlarge" | "z1d.large" | "z1d.metal" | "z1d.xlarge"
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
    Tenancy?:  "dedicated" | "default" | "host"
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
    CPUCredits?: "standard" | "unlimited"
    CPUCredits?: string
  }
  __Ebs = {
    DeleteOnTermination?: bool
    Encrypted?:           bool
    Iops?:                >=100 & <=20000
    Iops?:                int
    KmsKeyId?:            string
    SnapshotId?:          string
    VolumeSize?:          int
    VolumeType?:          "gp2" | "io1" | "sc1" | "st1" | "standard"
    VolumeType?:          string
  }
  __ElasticGpuSpecification = {
    Type: string
  }
  __ElasticInferenceAccelerator = {
    Type: "eia1.large" | "eia1.medium" | "eia1.xlarge"
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
    CpuCredits?: "standard" | "unlimited"
    CpuCredits?: string
  }
  __Ebs = {
    DeleteOnTermination?: bool
    Encrypted?:           bool
    Iops?:                int
    KmsKeyId?:            string
    SnapshotId?:          string
    VolumeSize?:          int
    VolumeType?:          "gp2" | "io1" | "sc1" | "st1" | "standard"
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
    MarketType?:  "spot"
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
    InstanceInitiatedShutdownBehavior?: "stop" | "terminate"
    InstanceInitiatedShutdownBehavior?: string
    InstanceMarketOptions?:             __InstanceMarketOptions
    InstanceType?:                      "a1.2xlarge" | "a1.4xlarge" | "a1.large" | "a1.medium" | "a1.xlarge" | "c1.medium" | "c1.xlarge" | "c3.2xlarge" | "c3.4xlarge" | "c3.8xlarge" | "c3.large" | "c3.xlarge" | "c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.metal" | "c5.xlarge" | "c5d.18xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.xlarge" | "c5n.18xlarge" | "c5n.2xlarge" | "c5n.4xlarge" | "c5n.9xlarge" | "c5n.large" | "c5n.metal" | "c5n.xlarge" | "cc2.8xlarge" | "cr1.8xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "f1.16xlarge" | "f1.2xlarge" | "f1.4xlarge" | "g2.2xlarge" | "g2.8xlarge" | "g3.16xlarge" | "g3.4xlarge" | "g3.8xlarge" | "g3s.xlarge" | "h1.16xlarge" | "h1.2xlarge" | "h1.4xlarge" | "h1.8xlarge" | "hs1.8xlarge" | "i2.2xlarge" | "i2.4xlarge" | "i2.8xlarge" | "i2.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.metal" | "i3.xlarge" | "i3en.12xlarge" | "i3en.24xlarge" | "i3en.2xlarge" | "i3en.3xlarge" | "i3en.6xlarge" | "i3en.large" | "i3en.metal" | "i3en.xlarge" | "m1.large" | "m1.medium" | "m1.small" | "m1.xlarge" | "m2.2xlarge" | "m2.4xlarge" | "m2.xlarge" | "m3.2xlarge" | "m3.large" | "m3.medium" | "m3.xlarge" | "m4.10xlarge" | "m4.16xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5a.12xlarge" | "m5a.16xlarge" | "m5a.24xlarge" | "m5a.2xlarge" | "m5a.4xlarge" | "m5a.8xlarge" | "m5a.large" | "m5a.xlarge" | "m5ad.12xlarge" | "m5ad.24xlarge" | "m5ad.2xlarge" | "m5ad.4xlarge" | "m5ad.large" | "m5ad.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "p2.16xlarge" | "p2.8xlarge" | "p2.xlarge" | "p3.16xlarge" | "p3.2xlarge" | "p3.8xlarge" | "p3dn.24xlarge" | "r3.2xlarge" | "r3.4xlarge" | "r3.8xlarge" | "r3.large" | "r3.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5a.12xlarge" | "r5a.16xlarge" | "r5a.24xlarge" | "r5a.2xlarge" | "r5a.4xlarge" | "r5a.8xlarge" | "r5a.large" | "r5a.xlarge" | "r5ad.12xlarge" | "r5ad.24xlarge" | "r5ad.2xlarge" | "r5ad.4xlarge" | "r5ad.large" | "r5ad.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "t1.micro" | "t2.2xlarge" | "t2.large" | "t2.medium" | "t2.micro" | "t2.nano" | "t2.small" | "t2.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "t3a.2xlarge" | "t3a.large" | "t3a.medium" | "t3a.micro" | "t3a.nano" | "t3a.small" | "t3a.xlarge" | "x1.16xlarge" | "x1.32xlarge" | "x1e.16xlarge" | "x1e.2xlarge" | "x1e.32xlarge" | "x1e.4xlarge" | "x1e.8xlarge" | "x1e.xlarge" | "z1d.12xlarge" | "z1d.2xlarge" | "z1d.3xlarge" | "z1d.6xlarge" | "z1d.large" | "z1d.metal" | "z1d.xlarge"
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
    Tenancy?:          "dedicated" | "default" | "host"
    Tenancy?:          string
  }
  __PrivateIpAdd = {
    Primary?:          bool
    PrivateIpAddress?: string
  }
  __SpotOptions = {
    BlockDurationMinutes?:         int
    InstanceInterruptionBehavior?: "hibernate" | "stop" | "terminate"
    InstanceInterruptionBehavior?: string
    MaxPrice?:                     string
    SpotInstanceType?:             "one-time" | "persistent"
    SpotInstanceType?:             string
    ValidUntil?:                   string
  }
  __TagSpecification = {
    ResourceType: "instance" | "volume"
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
    RuleAction:     "allow" | "deny"
    RuleAction:     string
    RuleNumber:     >=1 & <=32766
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
    Permission:         "EIP-ASSOCIATE" | "INSTANCE-ATTACH"
    Permission:         string
  }
}
PlacementGroup :: {
  Type: "AWS::EC2::PlacementGroup"
  Properties: {
    Strategy?: "cluster" | "partition" | "spread"
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
    VolumeType?:          "gp2" | "io1" | "sc1" | "st1" | "standard"
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
    InstanceType:        "a1.2xlarge" | "a1.4xlarge" | "a1.large" | "a1.medium" | "a1.xlarge" | "c1.medium" | "c1.xlarge" | "c3.2xlarge" | "c3.4xlarge" | "c3.8xlarge" | "c3.large" | "c3.xlarge" | "c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.large" | "c5.metal" | "c5.xlarge" | "c5d.18xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.large" | "c5d.xlarge" | "c5n.18xlarge" | "c5n.2xlarge" | "c5n.4xlarge" | "c5n.9xlarge" | "c5n.large" | "c5n.metal" | "c5n.xlarge" | "cc2.8xlarge" | "cr1.8xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "f1.16xlarge" | "f1.2xlarge" | "f1.4xlarge" | "g2.2xlarge" | "g2.8xlarge" | "g3.16xlarge" | "g3.4xlarge" | "g3.8xlarge" | "g3s.xlarge" | "h1.16xlarge" | "h1.2xlarge" | "h1.4xlarge" | "h1.8xlarge" | "hs1.8xlarge" | "i2.2xlarge" | "i2.4xlarge" | "i2.8xlarge" | "i2.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.large" | "i3.metal" | "i3.xlarge" | "i3en.12xlarge" | "i3en.24xlarge" | "i3en.2xlarge" | "i3en.3xlarge" | "i3en.6xlarge" | "i3en.large" | "i3en.metal" | "i3en.xlarge" | "m1.large" | "m1.medium" | "m1.small" | "m1.xlarge" | "m2.2xlarge" | "m2.4xlarge" | "m2.xlarge" | "m3.2xlarge" | "m3.large" | "m3.medium" | "m3.xlarge" | "m4.10xlarge" | "m4.16xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.large" | "m5.metal" | "m5.xlarge" | "m5a.12xlarge" | "m5a.16xlarge" | "m5a.24xlarge" | "m5a.2xlarge" | "m5a.4xlarge" | "m5a.8xlarge" | "m5a.large" | "m5a.xlarge" | "m5ad.12xlarge" | "m5ad.24xlarge" | "m5ad.2xlarge" | "m5ad.4xlarge" | "m5ad.large" | "m5ad.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.large" | "m5d.metal" | "m5d.xlarge" | "p2.16xlarge" | "p2.8xlarge" | "p2.xlarge" | "p3.16xlarge" | "p3.2xlarge" | "p3.8xlarge" | "p3dn.24xlarge" | "r3.2xlarge" | "r3.4xlarge" | "r3.8xlarge" | "r3.large" | "r3.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.large" | "r5.metal" | "r5.xlarge" | "r5a.12xlarge" | "r5a.16xlarge" | "r5a.24xlarge" | "r5a.2xlarge" | "r5a.4xlarge" | "r5a.8xlarge" | "r5a.large" | "r5a.xlarge" | "r5ad.12xlarge" | "r5ad.24xlarge" | "r5ad.2xlarge" | "r5ad.4xlarge" | "r5ad.large" | "r5ad.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.large" | "r5d.metal" | "r5d.xlarge" | "t1.micro" | "t2.2xlarge" | "t2.large" | "t2.medium" | "t2.micro" | "t2.nano" | "t2.small" | "t2.xlarge" | "t3.2xlarge" | "t3.large" | "t3.medium" | "t3.micro" | "t3.nano" | "t3.small" | "t3.xlarge" | "t3a.2xlarge" | "t3a.large" | "t3a.medium" | "t3a.micro" | "t3a.nano" | "t3a.small" | "t3a.xlarge" | "x1.16xlarge" | "x1.32xlarge" | "x1e.16xlarge" | "x1e.2xlarge" | "x1e.32xlarge" | "x1e.4xlarge" | "x1e.8xlarge" | "x1e.xlarge" | "z1d.12xlarge" | "z1d.2xlarge" | "z1d.3xlarge" | "z1d.6xlarge" | "z1d.large" | "z1d.metal" | "z1d.xlarge"
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
    AllocationStrategy?:              "diversified" | "lowestPrice"
    AllocationStrategy?:              string
    ExcessCapacityTerminationPolicy?: "default" | "noTermination"
    ExcessCapacityTerminationPolicy?: string
    IamFleetRole:                     string
    InstanceInterruptionBehavior?:    "hibernate" | "stop" | "terminate"
    InstanceInterruptionBehavior?:    string
    LaunchSpecifications?: [...__SpotFleetLaunchSpecification]
    LaunchTemplateConfigs?: [...__LaunchTemplateConfig]
    LoadBalancersConfig?:              __LoadBalancersConfig
    ReplaceUnhealthyInstances?:        bool
    SpotPrice?:                        string
    TargetCapacity:                    int
    TerminateInstancesWithExpiration?: bool
    Type?:                             "instant" | "maintain" | "request"
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
    AutoAcceptSharedAttachments?:  "disable" | "enable"
    AutoAcceptSharedAttachments?:  string
    DefaultRouteTableAssociation?: "disable" | "enable"
    DefaultRouteTableAssociation?: string
    DefaultRouteTablePropagation?: "disable" | "enable"
    DefaultRouteTablePropagation?: string
    Description?:                  string
    DnsSupport?:                   "disable" | "enable"
    DnsSupport?:                   string
    Tags?: [...__Tag]
    VpnEcmpSupport?: "disable" | "enable"
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
    InstanceTenancy?:    "dedicated" | "default"
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
    VpcEndpointType?: "Gateway" | "Interface"
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
    Type:              "ipsec.1"
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
    Type: "ipsec.1"
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
    VolumeType?: "gp2" | "io1" | "sc1" | "st1" | "standard"
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
