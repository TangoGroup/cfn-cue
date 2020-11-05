package cnnorth1

import "github.com/TangoGroup/aws/fn"

EMR :: {
	Cluster :: {
		Type:       "AWS::EMR::Cluster"
		Properties: close({
			AdditionalInfo?: {
				[string]: _
			} | fn.Fn
			Applications?: [...close({
				AdditionalInfo?: {
					[string]: string | fn.Fn
				} | fn.If
				Args?:    [...(string | fn.Fn)] | (string | fn.Fn)
				Name?:    string | fn.Fn
				Version?: string | fn.Fn
			})] | fn.If
			AutoScalingRole?:  string | fn.Fn
			BootstrapActions?: [...close({
				Name:                  string | fn.Fn
				ScriptBootstrapAction: close({
					Args?: [...(string | fn.Fn)] | (string | fn.Fn)
					Path:  string | fn.Fn
				}) | fn.If
			})] | fn.If
			Configurations?: [...close({
				Classification?:          string | fn.Fn
				ConfigurationProperties?: {
					[string]: string | fn.Fn
				} | fn.If
				Configurations?: [...close({
					[string]: _
				})] | fn.If
			})] | fn.If
			CustomAmiId?:       string | fn.Fn
			EbsRootVolumeSize?: int | fn.Fn
			Instances:          close({
				AdditionalMasterSecurityGroups?: [...(string | fn.Fn)] | (string | fn.Fn)
				AdditionalSlaveSecurityGroups?:  [...(string | fn.Fn)] | (string | fn.Fn)
				CoreInstanceFleet?:              close({
					InstanceTypeConfigs?: [...close({
						BidPrice?:                            string | fn.Fn
						BidPriceAsPercentageOfOnDemandPrice?: number | fn.Fn
						Configurations?:                      [...close({
							Classification?:          string | fn.Fn
							ConfigurationProperties?: {
								[string]: string | fn.Fn
							} | fn.If
							Configurations?: [...close({
								[string]: _
							})] | fn.If
						})] | fn.If
						EbsConfiguration?: close({
							EbsBlockDeviceConfigs?: [...close({
								VolumeSpecification: close({
									Iops?:      int | fn.Fn
									SizeInGB:   int | fn.Fn
									VolumeType: string | fn.Fn
								}) | fn.If
								VolumesPerInstance?: int | fn.Fn
							})] | fn.If
							EbsOptimized?: bool | fn.Fn
						}) | fn.If
						InstanceType:      string | fn.Fn
						WeightedCapacity?: int | fn.Fn
					})] | fn.If
					LaunchSpecifications?: close({
						OnDemandSpecification?: close({
							AllocationStrategy: string | fn.Fn
						}) | fn.If
						SpotSpecification?: close({
							AllocationStrategy?:    string | fn.Fn
							BlockDurationMinutes?:  int | fn.Fn
							TimeoutAction:          string | fn.Fn
							TimeoutDurationMinutes: int | fn.Fn
						}) | fn.If
					}) | fn.If
					Name?:                   string | fn.Fn
					TargetOnDemandCapacity?: int | fn.Fn
					TargetSpotCapacity?:     int | fn.Fn
				}) | fn.If
				CoreInstanceGroup?: close({
					AutoScalingPolicy?: close({
						Constraints: close({
							MaxCapacity: int | fn.Fn
							MinCapacity: int | fn.Fn
						}) | fn.If
						Rules: [...close({
							Action: close({
								Market?:                          string | fn.Fn
								SimpleScalingPolicyConfiguration: close({
									AdjustmentType?:   string | fn.Fn
									CoolDown?:         int | fn.Fn
									ScalingAdjustment: int | fn.Fn
								}) | fn.If
							}) | fn.If
							Description?: string | fn.Fn
							Name:         string | fn.Fn
							Trigger:      close({
								CloudWatchAlarmDefinition: close({
									ComparisonOperator: string | fn.Fn
									Dimensions?:        [...close({
										Key:   string | fn.Fn
										Value: string | fn.Fn
									})] | fn.If
									EvaluationPeriods?: int | fn.Fn
									MetricName:         string | fn.Fn
									Namespace?:         string | fn.Fn
									Period:             int | fn.Fn
									Statistic?:         string | fn.Fn
									Threshold:          number | fn.Fn
									Unit?:              string | fn.Fn
								}) | fn.If
							}) | fn.If
						})] | fn.If
					}) | fn.If
					BidPrice?:       string | fn.Fn
					Configurations?: [...close({
						Classification?:          string | fn.Fn
						ConfigurationProperties?: {
							[string]: string | fn.Fn
						} | fn.If
						Configurations?: [...close({
							[string]: _
						})] | fn.If
					})] | fn.If
					EbsConfiguration?: close({
						EbsBlockDeviceConfigs?: [...close({
							VolumeSpecification: close({
								Iops?:      int | fn.Fn
								SizeInGB:   int | fn.Fn
								VolumeType: string | fn.Fn
							}) | fn.If
							VolumesPerInstance?: int | fn.Fn
						})] | fn.If
						EbsOptimized?: bool | fn.Fn
					}) | fn.If
					InstanceCount: int | fn.Fn
					InstanceType:  string | fn.Fn
					Market?:       string | fn.Fn
					Name?:         string | fn.Fn
				}) | fn.If
				Ec2KeyName?:                    string | fn.Fn
				Ec2SubnetId?:                   string | fn.Fn
				Ec2SubnetIds?:                  [...(string | fn.Fn)] | (string | fn.Fn)
				EmrManagedMasterSecurityGroup?: string | fn.Fn
				EmrManagedSlaveSecurityGroup?:  string | fn.Fn
				HadoopVersion?:                 string | fn.Fn
				KeepJobFlowAliveWhenNoSteps?:   bool | fn.Fn
				MasterInstanceFleet?:           close({
					InstanceTypeConfigs?: [...close({
						BidPrice?:                            string | fn.Fn
						BidPriceAsPercentageOfOnDemandPrice?: number | fn.Fn
						Configurations?:                      [...close({
							Classification?:          string | fn.Fn
							ConfigurationProperties?: {
								[string]: string | fn.Fn
							} | fn.If
							Configurations?: [...close({
								[string]: _
							})] | fn.If
						})] | fn.If
						EbsConfiguration?: close({
							EbsBlockDeviceConfigs?: [...close({
								VolumeSpecification: close({
									Iops?:      int | fn.Fn
									SizeInGB:   int | fn.Fn
									VolumeType: string | fn.Fn
								}) | fn.If
								VolumesPerInstance?: int | fn.Fn
							})] | fn.If
							EbsOptimized?: bool | fn.Fn
						}) | fn.If
						InstanceType:      string | fn.Fn
						WeightedCapacity?: int | fn.Fn
					})] | fn.If
					LaunchSpecifications?: close({
						OnDemandSpecification?: close({
							AllocationStrategy: string | fn.Fn
						}) | fn.If
						SpotSpecification?: close({
							AllocationStrategy?:    string | fn.Fn
							BlockDurationMinutes?:  int | fn.Fn
							TimeoutAction:          string | fn.Fn
							TimeoutDurationMinutes: int | fn.Fn
						}) | fn.If
					}) | fn.If
					Name?:                   string | fn.Fn
					TargetOnDemandCapacity?: int | fn.Fn
					TargetSpotCapacity?:     int | fn.Fn
				}) | fn.If
				MasterInstanceGroup?: close({
					AutoScalingPolicy?: close({
						Constraints: close({
							MaxCapacity: int | fn.Fn
							MinCapacity: int | fn.Fn
						}) | fn.If
						Rules: [...close({
							Action: close({
								Market?:                          string | fn.Fn
								SimpleScalingPolicyConfiguration: close({
									AdjustmentType?:   string | fn.Fn
									CoolDown?:         int | fn.Fn
									ScalingAdjustment: int | fn.Fn
								}) | fn.If
							}) | fn.If
							Description?: string | fn.Fn
							Name:         string | fn.Fn
							Trigger:      close({
								CloudWatchAlarmDefinition: close({
									ComparisonOperator: string | fn.Fn
									Dimensions?:        [...close({
										Key:   string | fn.Fn
										Value: string | fn.Fn
									})] | fn.If
									EvaluationPeriods?: int | fn.Fn
									MetricName:         string | fn.Fn
									Namespace?:         string | fn.Fn
									Period:             int | fn.Fn
									Statistic?:         string | fn.Fn
									Threshold:          number | fn.Fn
									Unit?:              string | fn.Fn
								}) | fn.If
							}) | fn.If
						})] | fn.If
					}) | fn.If
					BidPrice?:       string | fn.Fn
					Configurations?: [...close({
						Classification?:          string | fn.Fn
						ConfigurationProperties?: {
							[string]: string | fn.Fn
						} | fn.If
						Configurations?: [...close({
							[string]: _
						})] | fn.If
					})] | fn.If
					EbsConfiguration?: close({
						EbsBlockDeviceConfigs?: [...close({
							VolumeSpecification: close({
								Iops?:      int | fn.Fn
								SizeInGB:   int | fn.Fn
								VolumeType: string | fn.Fn
							}) | fn.If
							VolumesPerInstance?: int | fn.Fn
						})] | fn.If
						EbsOptimized?: bool | fn.Fn
					}) | fn.If
					InstanceCount: int | fn.Fn
					InstanceType:  string | fn.Fn
					Market?:       string | fn.Fn
					Name?:         string | fn.Fn
				}) | fn.If
				Placement?: close({
					AvailabilityZone: ("af-south-1a" | "af-south-1b" | "af-south-1c" | "ap-east-1a" | "ap-east-1b" | "ap-east-1c" | "ap-northeast-1a" | "ap-northeast-1b" | "ap-northeast-1c" | "ap-northeast-1d" | "ap-northeast-2a" | "ap-northeast-2b" | "ap-northeast-2c" | "ap-northeast-2d" | "ap-northeast-3a" | "ap-south-1a" | "ap-south-1b" | "ap-south-1c" | "ap-southeast-1a" | "ap-southeast-1b" | "ap-southeast-1c" | "ap-southeast-2a" | "ap-southeast-2b" | "ap-southeast-2c" | "ca-central-1a" | "ca-central-1b" | "ca-central-1d" | "cn-north-1a" | "cn-north-1b" | "cn-northwest-1a" | "cn-northwest-1b" | "cn-northwest-1c" | "eu-central-1a" | "eu-central-1b" | "eu-central-1c" | "eu-north-1a" | "eu-north-1b" | "eu-north-1c" | "eu-south-1a" | "eu-south-1b" | "eu-south-1c" | "eu-west-1a" | "eu-west-1b" | "eu-west-1c" | "eu-west-2a" | "eu-west-2b" | "eu-west-2c" | "eu-west-3a" | "eu-west-3b" | "eu-west-3c" | "me-south-1a" | "me-south-1b" | "me-south-1c" | "sa-east-1a" | "sa-east-1b" | "sa-east-1c" | "us-east-1a" | "us-east-1b" | "us-east-1c" | "us-east-1d" | "us-east-1e" | "us-east-1f" | "us-east-2a" | "us-east-2b" | "us-east-2c" | "us-gov-east-1a" | "us-gov-east-1b" | "us-gov-east-1c" | "us-gov-west-1a" | "us-gov-west-1b" | "us-gov-west-1c" | "us-west-1a" | "us-west-1b" | "us-west-1c" | "us-west-2a" | "us-west-2b" | "us-west-2c" | "us-west-2d" | "us-west-2-lax-1a" | "us-west-2-lax-1b") | fn.Fn
				}) | fn.If
				ServiceAccessSecurityGroup?: string | fn.Fn
				TerminationProtected?:       bool | fn.Fn
			}) | fn.If
			JobFlowRole:         (=~#"[a-zA-Z0-9+=,.@\-_]+"#) | fn.Fn
			KerberosAttributes?: close({
				ADDomainJoinPassword?:             string | fn.Fn
				ADDomainJoinUser?:                 string | fn.Fn
				CrossRealmTrustPrincipalPassword?: string | fn.Fn
				KdcAdminPassword:                  string | fn.Fn
				Realm:                             string | fn.Fn
			}) | fn.If
			LogEncryptionKmsKeyId?: string | fn.Fn
			LogUri?:                string | fn.Fn
			ManagedScalingPolicy?:  close({
				ComputeLimits?: close({
					MaximumCapacityUnits:          int | fn.Fn
					MaximumCoreCapacityUnits?:     int | fn.Fn
					MaximumOnDemandCapacityUnits?: int | fn.Fn
					MinimumCapacityUnits:          int | fn.Fn
					UnitType:                      string | fn.Fn
				}) | fn.If
			}) | fn.If
			Name:                   string | fn.Fn
			ReleaseLabel?:          string | fn.Fn
			ScaleDownBehavior?:     string | fn.Fn
			SecurityConfiguration?: string | fn.Fn
			ServiceRole:            string | fn.Fn
			StepConcurrencyLevel?:  int | fn.Fn
			Steps?:                 [...close({
				ActionOnFailure?: string | fn.Fn
				HadoopJarStep:    close({
					Args?:           [...(string | fn.Fn)] | (string | fn.Fn)
					Jar:             string | fn.Fn
					MainClass?:      string | fn.Fn
					StepProperties?: [...close({
						Key?:   string | fn.Fn
						Value?: string | fn.Fn
					})] | fn.If
				}) | fn.If
				Name: string | fn.Fn
			})] | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			VisibleToAllUsers?: bool | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	InstanceFleetConfig :: {
		Type:       "AWS::EMR::InstanceFleetConfig"
		Properties: close({
			ClusterId:            string | fn.Fn
			InstanceFleetType:    string | fn.Fn
			InstanceTypeConfigs?: [...close({
				BidPrice?:                            string | fn.Fn
				BidPriceAsPercentageOfOnDemandPrice?: number | fn.Fn
				Configurations?:                      [...close({
					Classification?:          string | fn.Fn
					ConfigurationProperties?: {
						[string]: string | fn.Fn
					} | fn.If
					Configurations?: [...close({
						[string]: _
					})] | fn.If
				})] | fn.If
				EbsConfiguration?: close({
					EbsBlockDeviceConfigs?: [...close({
						VolumeSpecification: close({
							Iops?:      int | fn.Fn
							SizeInGB:   int | fn.Fn
							VolumeType: string | fn.Fn
						}) | fn.If
						VolumesPerInstance?: int | fn.Fn
					})] | fn.If
					EbsOptimized?: bool | fn.Fn
				}) | fn.If
				InstanceType:      string | fn.Fn
				WeightedCapacity?: int | fn.Fn
			})] | fn.If
			LaunchSpecifications?: close({
				OnDemandSpecification?: close({
					AllocationStrategy: string | fn.Fn
				}) | fn.If
				SpotSpecification?: close({
					AllocationStrategy?:    string | fn.Fn
					BlockDurationMinutes?:  int | fn.Fn
					TimeoutAction:          string | fn.Fn
					TimeoutDurationMinutes: int | fn.Fn
				}) | fn.If
			}) | fn.If
			Name?:                   string | fn.Fn
			TargetOnDemandCapacity?: int | fn.Fn
			TargetSpotCapacity?:     int | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	InstanceGroupConfig :: {
		Type:       "AWS::EMR::InstanceGroupConfig"
		Properties: close({
			AutoScalingPolicy?: close({
				Constraints: close({
					MaxCapacity: int | fn.Fn
					MinCapacity: int | fn.Fn
				}) | fn.If
				Rules: [...close({
					Action: close({
						Market?:                          string | fn.Fn
						SimpleScalingPolicyConfiguration: close({
							AdjustmentType?:   string | fn.Fn
							CoolDown?:         int | fn.Fn
							ScalingAdjustment: int | fn.Fn
						}) | fn.If
					}) | fn.If
					Description?: string | fn.Fn
					Name:         string | fn.Fn
					Trigger:      close({
						CloudWatchAlarmDefinition: close({
							ComparisonOperator: string | fn.Fn
							Dimensions?:        [...close({
								Key:   string | fn.Fn
								Value: string | fn.Fn
							})] | fn.If
							EvaluationPeriods?: int | fn.Fn
							MetricName:         string | fn.Fn
							Namespace?:         string | fn.Fn
							Period:             int | fn.Fn
							Statistic?:         string | fn.Fn
							Threshold:          number | fn.Fn
							Unit?:              string | fn.Fn
						}) | fn.If
					}) | fn.If
				})] | fn.If
			}) | fn.If
			BidPrice?:       string | fn.Fn
			Configurations?: [...close({
				Classification?:          string | fn.Fn
				ConfigurationProperties?: {
					[string]: string | fn.Fn
				} | fn.If
				Configurations?: [...close({
					[string]: _
				})] | fn.If
			})] | fn.If
			EbsConfiguration?: close({
				EbsBlockDeviceConfigs?: [...close({
					VolumeSpecification: close({
						Iops?:      int | fn.Fn
						SizeInGB:   int | fn.Fn
						VolumeType: string | fn.Fn
					}) | fn.If
					VolumesPerInstance?: int | fn.Fn
				})] | fn.If
				EbsOptimized?: bool | fn.Fn
			}) | fn.If
			InstanceCount: int | fn.Fn
			InstanceRole:  string | fn.Fn
			InstanceType:  string | fn.Fn
			JobFlowId:     string | fn.Fn
			Market?:       string | fn.Fn
			Name?:         string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	SecurityConfiguration :: {
		Type:       "AWS::EMR::SecurityConfiguration"
		Properties: close({
			Name?:                 string | fn.Fn
			SecurityConfiguration: {
				[string]: _
			} | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Step :: {
		Type:       "AWS::EMR::Step"
		Properties: close({
			ActionOnFailure: string | fn.Fn
			HadoopJarStep:   close({
				Args?:           [...(string | fn.Fn)] | (string | fn.Fn)
				Jar:             string | fn.Fn
				MainClass?:      string | fn.Fn
				StepProperties?: [...close({
					Key?:   string | fn.Fn
					Value?: string | fn.Fn
				})] | fn.If
			}) | fn.If
			JobFlowId: string | fn.Fn
			Name:      string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
