package MSK

import "github.com/TangoGroup/fn"

Cluster :: {
	Type: "AWS::MSK::Cluster"
	Properties: {
		BrokerNodeGroupInfo:   __BrokerNodeGroupInfo
		ClientAuthentication?: __ClientAuthentication
		ClusterName:           string | fn.Fn
		ConfigurationInfo?:    __ConfigurationInfo
		EncryptionInfo?:       __EncryptionInfo
		EnhancedMonitoring?:   string | fn.Fn
		KafkaVersion:          string | fn.Fn
		NumberOfBrokerNodes:   int | fn.Fn
		Tags?:                 {
		} | fn.Fn
	}
	__BrokerNodeGroupInfo :: {
		BrokerAZDistribution?: string | fn.Fn
		ClientSubnets:         [...string] | fn.Fn
		InstanceType:          string | fn.Fn
		SecurityGroups?:       [...string] | fn.Fn
		StorageInfo?:          __StorageInfo
	}
	__ClientAuthentication :: {
		Tls?: __Tls
	}
	__ConfigurationInfo :: {
		Arn:      string | fn.Fn
		Revision: int | fn.Fn
	}
	__EBSStorageInfo :: {
		VolumeSize?: int | fn.Fn
	}
	__EncryptionAtRest :: {
		DataVolumeKMSKeyId: string | fn.Fn
	}
	__EncryptionInTransit :: {
		ClientBroker?: string | fn.Fn
		InCluster?:    bool | fn.Fn
	}
	__EncryptionInfo :: {
		EncryptionAtRest?:    __EncryptionAtRest
		EncryptionInTransit?: __EncryptionInTransit
	}
	__StorageInfo :: {
		EBSStorageInfo?: __EBSStorageInfo
	}
	__Tls :: {
		CertificateAuthorityArnList?: [...string] | fn.Fn
	}
}
