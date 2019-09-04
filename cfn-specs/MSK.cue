package MSK

Cluster :: {
  Type: "AWS::MSK::Cluster"
  Properties: {
    BrokerNodeGroupInfo:   __BrokerNodeGroupInfo
    ClientAuthentication?: __ClientAuthentication
    ClusterName:           string
    ConfigurationInfo?:    __ConfigurationInfo
    EncryptionInfo?:       __EncryptionInfo
    EnhancedMonitoring?:   string
    KafkaVersion:          string
    NumberOfBrokerNodes:   int
    Tags?: {
    }
  }
  __BrokerNodeGroupInfo = {
    BrokerAZDistribution?: string
    ClientSubnets: [...string]
    InstanceType: string
    SecurityGroups?: [...string]
    StorageInfo?: __StorageInfo
  }
  __ClientAuthentication = {
    Tls?: __Tls
  }
  __ConfigurationInfo = {
    Arn:      string
    Revision: int
  }
  __EBSStorageInfo = {
    VolumeSize?: int
  }
  __EncryptionAtRest = {
    DataVolumeKMSKeyId: string
  }
  __EncryptionInTransit = {
    ClientBroker?: string
    InCluster?:    bool
  }
  __EncryptionInfo = {
    EncryptionAtRest?:    __EncryptionAtRest
    EncryptionInTransit?: __EncryptionInTransit
  }
  __StorageInfo = {
    EBSStorageInfo?: __EBSStorageInfo
  }
  __Tls = {
    CertificateAuthorityArnList?: [...string]
  }
}
