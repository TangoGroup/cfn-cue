Description: "EMR cluster to run Apache Beam App in Spark."
Resources: EmrCluster: {
	Type: "AWS::EMR::Cluster"
	Properties: {
		Name:         "DataBeamEmr"
		ReleaseLabel: "emr-5.20.0"
		Applications: [{
			Name: "Ganglia"
		}, {
			Name: "Spark"
		}, {
			Name: "Hadoop"
		}]
		Configurations: [{
			Classification: "spark"
			ConfigurationProperties: maximizeResourceAllocation: "true"
		}]
		EbsRootVolumeSize: "16"
		Instances: {
			MasterInstanceGroup: {
				Name:          "Master Instance Group"
				InstanceType:  "m4.large"
				InstanceCount: "1"
				EbsConfiguration: EbsBlockDeviceConfigs: [{
					VolumeSpecification: {
						SizeInGB:   "32"
						VolumeType: "gp2"
					}
				}]
				Market: "ON_DEMAND"
			}
			CoreInstanceGroup: {
				Name:          "Core Instance Group"
				InstanceType:  "r4.xlarge"
				InstanceCount: "2"
				EbsConfiguration: EbsBlockDeviceConfigs: [{
					VolumeSpecification: {
						SizeInGB:   "32"
						VolumeType: "gp2"
					}
				}]
				Market:   "SPOT"
				BidPrice: "0.13"
			}
		}
		JobFlowRole: "EMR_EC2_DefaultRole"
		ServiceRole: "EMR_DefaultRole"
		// LogUri: "s3n://example-bucket/logs/"
		ScaleDownBehavior: "TERMINATE_AT_TASK_COMPLETION"
		VisibleToAllUsers: "true"
	}
}
