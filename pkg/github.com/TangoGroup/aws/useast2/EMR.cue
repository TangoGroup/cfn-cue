package useast2

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
						SpotSpecification: close({
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
						SpotSpecification: close({
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
					AvailabilityZone: string | fn.Fn
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
			LogUri?:                string | fn.Fn
			Name:                   string | fn.Fn
			ReleaseLabel?:          string | fn.Fn
			ScaleDownBehavior?:     string | fn.Fn
			SecurityConfiguration?: string | fn.Fn
			ServiceRole:            string | fn.Fn
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
				SpotSpecification: close({
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
			InstanceType:  ("c4.2xlarge" | "c4.4xlarge" | "c4.8xlarge" | "c4.large" | "c4.xlarge" | "c5.12xlarge" | "c5.18xlarge" | "c5.24xlarge" | "c5.2xlarge" | "c5.4xlarge" | "c5.9xlarge" | "c5.xlarge" | "c5d.12xlarge" | "c5d.18xlarge" | "c5d.24xlarge" | "c5d.2xlarge" | "c5d.4xlarge" | "c5d.9xlarge" | "c5d.xlarge" | "c5n.18xlarge" | "c5n.2xlarge" | "c5n.4xlarge" | "c5n.9xlarge" | "c5n.xlarge" | "d2.2xlarge" | "d2.4xlarge" | "d2.8xlarge" | "d2.xlarge" | "g3.4xlarge" | "g3s.xlarge" | "h1.16xlarge" | "h1.2xlarge" | "h1.4xlarge" | "h1.8xlarge" | "i2.2xlarge" | "i2.4xlarge" | "i2.8xlarge" | "i2.xlarge" | "i3.16xlarge" | "i3.2xlarge" | "i3.4xlarge" | "i3.8xlarge" | "i3.xlarge" | "i3en.12xlarge" | "i3en.24xlarge" | "i3en.2xlarge" | "i3en.3xlarge" | "i3en.6xlarge" | "i3en.xlarge" | "m4.10xlarge" | "m4.16xlarge" | "m4.2xlarge" | "m4.4xlarge" | "m4.large" | "m4.xlarge" | "m5.12xlarge" | "m5.16xlarge" | "m5.24xlarge" | "m5.2xlarge" | "m5.4xlarge" | "m5.8xlarge" | "m5.xlarge" | "m5a.12xlarge" | "m5a.16xlarge" | "m5a.24xlarge" | "m5a.2xlarge" | "m5a.4xlarge" | "m5a.8xlarge" | "m5a.xlarge" | "m5ad.12xlarge" | "m5ad.24xlarge" | "m5ad.2xlarge" | "m5ad.4xlarge" | "m5ad.xlarge" | "m5d.12xlarge" | "m5d.16xlarge" | "m5d.24xlarge" | "m5d.2xlarge" | "m5d.4xlarge" | "m5d.8xlarge" | "m5d.xlarge" | "p2.16xlarge" | "p2.8xlarge" | "p2.xlarge" | "p3.16xlarge" | "p3.2xlarge" | "p3.8xlarge" | "r3.2xlarge" | "r3.4xlarge" | "r3.8xlarge" | "r3.xlarge" | "r4.16xlarge" | "r4.2xlarge" | "r4.4xlarge" | "r4.8xlarge" | "r4.large" | "r4.xlarge" | "r5.12xlarge" | "r5.16xlarge" | "r5.24xlarge" | "r5.2xlarge" | "r5.4xlarge" | "r5.8xlarge" | "r5.xlarge" | "r5a.12xlarge" | "r5a.16xlarge" | "r5a.24xlarge" | "r5a.2xlarge" | "r5a.4xlarge" | "r5a.8xlarge" | "r5a.xlarge" | "r5d.12xlarge" | "r5d.16xlarge" | "r5d.24xlarge" | "r5d.2xlarge" | "r5d.4xlarge" | "r5d.8xlarge" | "r5d.xlarge" | "z1d.12xlarge" | "z1d.2xlarge" | "z1d.3xlarge" | "z1d.6xlarge" | "z1d.xlarge") | fn.Fn
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
