package MSK

import "github.com/TangoGroup/fn"

Cluster :: {
	Type: "AWS::MSK::Cluster"
	Properties: {
		BrokerNodeGroupInfo:   propBrokerNodeGroupInfo
		ClientAuthentication?: propClientAuthentication
		ClusterName:           string | fn.Fn
		ConfigurationInfo?:    propConfigurationInfo
		EncryptionInfo?:       propEncryptionInfo
		EnhancedMonitoring?:   string | fn.Fn
		KafkaVersion:          string | fn.Fn
		NumberOfBrokerNodes:   int | fn.Fn
		Tags?:                 {
		} | fn.Fn
	}
	propBrokerNodeGroupInfo :: {
		BrokerAZDistribution?: string | fn.Fn
		ClientSubnets:         [...string] | fn.Fn
		InstanceType:          string | fn.Fn
		SecurityGroups?:       [...string] | fn.Fn
		StorageInfo?:          propStorageInfo
	}
	propClientAuthentication :: {
		Tls?: propTls
	}
	propConfigurationInfo :: {
		Arn:      string | fn.Fn
		Revision: int | fn.Fn
	}
	propEBSStorageInfo :: {
		VolumeSize?: int | fn.Fn
	}
	propEncryptionAtRest :: {
		DataVolumeKMSKeyId: string | fn.Fn
	}
	propEncryptionInTransit :: {
		ClientBroker?: string | fn.Fn
		InCluster?:    bool | fn.Fn
	}
	propEncryptionInfo :: {
		EncryptionAtRest?:    propEncryptionAtRest
		EncryptionInTransit?: propEncryptionInTransit
	}
	propStorageInfo :: {
		EBSStorageInfo?: propEBSStorageInfo
	}
	propTls :: {
		CertificateAuthorityArnList?: [...string] | fn.Fn
	}
}
