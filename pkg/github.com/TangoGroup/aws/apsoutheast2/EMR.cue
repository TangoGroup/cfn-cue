package apsoutheast2

import "github.com/TangoGroup/aws/fn"

EMR :: {
	Cluster :: {
		Type: "AWS::EMR::Cluster"
		Properties: {
			AdditionalInfo?: {
				[string]: _
			} | fn.Fn
			Applications?: [...{
				AdditionalInfo?: [string]: string | fn.Fn
				Args?:    [...(string | fn.Fn)] | fn.Fn
				Name?:    string | fn.Fn
				Version?: string | fn.Fn
			}]
			AutoScalingRole?: string | fn.Fn
			BootstrapActions?: [...{
				Name: string | fn.Fn
				ScriptBootstrapAction: {
					Args?: [...(string | fn.Fn)] | fn.Fn
					Path:  string | fn.Fn
				}
			}]
			Configurations?: [...{
				Classification?: string | fn.Fn
				ConfigurationProperties?: [string]: string | fn.Fn
				Configurations?: [...{
					[string]: _
				}]
			}]
			CustomAmiId?:       string | fn.Fn
			EbsRootVolumeSize?: int | fn.Fn
			Instances: {
				AdditionalMasterSecurityGroups?: [...(string | fn.Fn)] | fn.Fn
				AdditionalSlaveSecurityGroups?:  [...(string | fn.Fn)] | fn.Fn
				CoreInstanceFleet?: {
					InstanceTypeConfigs?: [...{
						BidPrice?:                            string | fn.Fn
						BidPriceAsPercentageOfOnDemandPrice?: float | fn.Fn
						Configurations?: [...{
							Classification?: string | fn.Fn
							ConfigurationProperties?: [string]: string | fn.Fn
							Configurations?: [...{
								[string]: _
							}]
						}]
						EbsConfiguration?: {
							EbsBlockDeviceConfigs?: [...{
								VolumeSpecification: {
									Iops?:      int | fn.Fn
									SizeInGB:   int | fn.Fn
									VolumeType: string | fn.Fn
								}
								VolumesPerInstance?: int | fn.Fn
							}]
							EbsOptimized?: bool | fn.Fn
						}
						InstanceType:      string | fn.Fn
						WeightedCapacity?: int | fn.Fn
					}]
					LaunchSpecifications?: SpotSpecification: {
						BlockDurationMinutes?:  int | fn.Fn
						TimeoutAction:          string | fn.Fn
						TimeoutDurationMinutes: int | fn.Fn
					}
					Name?:                   string | fn.Fn
					TargetOnDemandCapacity?: int | fn.Fn
					TargetSpotCapacity?:     int | fn.Fn
				}
				CoreInstanceGroup?: {
					AutoScalingPolicy?: {
						Constraints: {
							MaxCapacity: int | fn.Fn
							MinCapacity: int | fn.Fn
						}
						Rules: [...{
							Action: {
								Market?: string | fn.Fn
								SimpleScalingPolicyConfiguration: {
									AdjustmentType?:   string | fn.Fn
									CoolDown?:         int | fn.Fn
									ScalingAdjustment: int | fn.Fn
								}
							}
							Description?: string | fn.Fn
							Name:         string | fn.Fn
							Trigger: CloudWatchAlarmDefinition: {
								ComparisonOperator: string | fn.Fn
								Dimensions?: [...{
									Key:   string | fn.Fn
									Value: string | fn.Fn
								}]
								EvaluationPeriods?: int | fn.Fn
								MetricName:         string | fn.Fn
								Namespace?:         string | fn.Fn
								Period:             int | fn.Fn
								Statistic?:         string | fn.Fn
								Threshold:          float | fn.Fn
								Unit?:              string | fn.Fn
							}
						}]
					}
					BidPrice?: string | fn.Fn
					Configurations?: [...{
						Classification?: string | fn.Fn
						ConfigurationProperties?: [string]: string | fn.Fn
						Configurations?: [...{
							[string]: _
						}]
					}]
					EbsConfiguration?: {
						EbsBlockDeviceConfigs?: [...{
							VolumeSpecification: {
								Iops?:      int | fn.Fn
								SizeInGB:   int | fn.Fn
								VolumeType: string | fn.Fn
							}
							VolumesPerInstance?: int | fn.Fn
						}]
						EbsOptimized?: bool | fn.Fn
					}
					InstanceCount: int | fn.Fn
					InstanceType:  string | fn.Fn
					Market?:       string | fn.Fn
					Name?:         string | fn.Fn
				}
				Ec2KeyName?:                    string | fn.Fn
				Ec2SubnetId?:                   string | fn.Fn
				Ec2SubnetIds?:                  [...(string | fn.Fn)] | fn.Fn
				EmrManagedMasterSecurityGroup?: string | fn.Fn
				EmrManagedSlaveSecurityGroup?:  string | fn.Fn
				HadoopVersion?:                 string | fn.Fn
				KeepJobFlowAliveWhenNoSteps?:   bool | fn.Fn
				MasterInstanceFleet?: {
					InstanceTypeConfigs?: [...{
						BidPrice?:                            string | fn.Fn
						BidPriceAsPercentageOfOnDemandPrice?: float | fn.Fn
						Configurations?: [...{
							Classification?: string | fn.Fn
							ConfigurationProperties?: [string]: string | fn.Fn
							Configurations?: [...{
								[string]: _
							}]
						}]
						EbsConfiguration?: {
							EbsBlockDeviceConfigs?: [...{
								VolumeSpecification: {
									Iops?:      int | fn.Fn
									SizeInGB:   int | fn.Fn
									VolumeType: string | fn.Fn
								}
								VolumesPerInstance?: int | fn.Fn
							}]
							EbsOptimized?: bool | fn.Fn
						}
						InstanceType:      string | fn.Fn
						WeightedCapacity?: int | fn.Fn
					}]
					LaunchSpecifications?: SpotSpecification: {
						BlockDurationMinutes?:  int | fn.Fn
						TimeoutAction:          string | fn.Fn
						TimeoutDurationMinutes: int | fn.Fn
					}
					Name?:                   string | fn.Fn
					TargetOnDemandCapacity?: int | fn.Fn
					TargetSpotCapacity?:     int | fn.Fn
				}
				MasterInstanceGroup?: {
					AutoScalingPolicy?: {
						Constraints: {
							MaxCapacity: int | fn.Fn
							MinCapacity: int | fn.Fn
						}
						Rules: [...{
							Action: {
								Market?: string | fn.Fn
								SimpleScalingPolicyConfiguration: {
									AdjustmentType?:   string | fn.Fn
									CoolDown?:         int | fn.Fn
									ScalingAdjustment: int | fn.Fn
								}
							}
							Description?: string | fn.Fn
							Name:         string | fn.Fn
							Trigger: CloudWatchAlarmDefinition: {
								ComparisonOperator: string | fn.Fn
								Dimensions?: [...{
									Key:   string | fn.Fn
									Value: string | fn.Fn
								}]
								EvaluationPeriods?: int | fn.Fn
								MetricName:         string | fn.Fn
								Namespace?:         string | fn.Fn
								Period:             int | fn.Fn
								Statistic?:         string | fn.Fn
								Threshold:          float | fn.Fn
								Unit?:              string | fn.Fn
							}
						}]
					}
					BidPrice?: string | fn.Fn
					Configurations?: [...{
						Classification?: string | fn.Fn
						ConfigurationProperties?: [string]: string | fn.Fn
						Configurations?: [...{
							[string]: _
						}]
					}]
					EbsConfiguration?: {
						EbsBlockDeviceConfigs?: [...{
							VolumeSpecification: {
								Iops?:      int | fn.Fn
								SizeInGB:   int | fn.Fn
								VolumeType: string | fn.Fn
							}
							VolumesPerInstance?: int | fn.Fn
						}]
						EbsOptimized?: bool | fn.Fn
					}
					InstanceCount: int | fn.Fn
					InstanceType:  string | fn.Fn
					Market?:       string | fn.Fn
					Name?:         string | fn.Fn
				}
				Placement?: AvailabilityZone: string | fn.Fn
				ServiceAccessSecurityGroup?: string | fn.Fn
				TerminationProtected?:       bool | fn.Fn
			}
			JobFlowRole: (=~#"[a-zA-Z0-9+=,.@\-_]+"#) | fn.Fn
			KerberosAttributes?: {
				ADDomainJoinPassword?:             string | fn.Fn
				ADDomainJoinUser?:                 string | fn.Fn
				CrossRealmTrustPrincipalPassword?: string | fn.Fn
				KdcAdminPassword:                  string | fn.Fn
				Realm:                             string | fn.Fn
			}
			LogUri?:                string | fn.Fn
			Name:                   string | fn.Fn
			ReleaseLabel?:          string | fn.Fn
			ScaleDownBehavior?:     string | fn.Fn
			SecurityConfiguration?: string | fn.Fn
			ServiceRole:            string | fn.Fn
			Steps?: [...{
				ActionOnFailure?: string | fn.Fn
				HadoopJarStep: {
					Args?:      [...(string | fn.Fn)] | fn.Fn
					Jar:        string | fn.Fn
					MainClass?: string | fn.Fn
					StepProperties?: [...{
						Key?:   string | fn.Fn
						Value?: string | fn.Fn
					}]
				}
				Name: string | fn.Fn
			}]
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			VisibleToAllUsers?: bool | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	InstanceFleetConfig :: {
		Type: "AWS::EMR::InstanceFleetConfig"
		Properties: {
			ClusterId:         string | fn.Fn
			InstanceFleetType: string | fn.Fn
			InstanceTypeConfigs?: [...{
				BidPrice?:                            string | fn.Fn
				BidPriceAsPercentageOfOnDemandPrice?: float | fn.Fn
				Configurations?: [...{
					Classification?: string | fn.Fn
					ConfigurationProperties?: [string]: string | fn.Fn
					Configurations?: [...{
						[string]: _
					}]
				}]
				EbsConfiguration?: {
					EbsBlockDeviceConfigs?: [...{
						VolumeSpecification: {
							Iops?:      int | fn.Fn
							SizeInGB:   int | fn.Fn
							VolumeType: string | fn.Fn
						}
						VolumesPerInstance?: int | fn.Fn
					}]
					EbsOptimized?: bool | fn.Fn
				}
				InstanceType:      string | fn.Fn
				WeightedCapacity?: int | fn.Fn
			}]
			LaunchSpecifications?: SpotSpecification: {
				BlockDurationMinutes?:  int | fn.Fn
				TimeoutAction:          string | fn.Fn
				TimeoutDurationMinutes: int | fn.Fn
			}
			Name?:                   string | fn.Fn
			TargetOnDemandCapacity?: int | fn.Fn
			TargetSpotCapacity?:     int | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	InstanceGroupConfig :: {
		Type: "AWS::EMR::InstanceGroupConfig"
		Properties: {
			AutoScalingPolicy?: {
				Constraints: {
					MaxCapacity: int | fn.Fn
					MinCapacity: int | fn.Fn
				}
				Rules: [...{
					Action: {
						Market?: string | fn.Fn
						SimpleScalingPolicyConfiguration: {
							AdjustmentType?:   string | fn.Fn
							CoolDown?:         int | fn.Fn
							ScalingAdjustment: int | fn.Fn
						}
					}
					Description?: string | fn.Fn
					Name:         string | fn.Fn
					Trigger: CloudWatchAlarmDefinition: {
						ComparisonOperator: string | fn.Fn
						Dimensions?: [...{
							Key:   string | fn.Fn
							Value: string | fn.Fn
						}]
						EvaluationPeriods?: int | fn.Fn
						MetricName:         string | fn.Fn
						Namespace?:         string | fn.Fn
						Period:             int | fn.Fn
						Statistic?:         string | fn.Fn
						Threshold:          float | fn.Fn
						Unit?:              string | fn.Fn
					}
				}]
			}
			BidPrice?: string | fn.Fn
			Configurations?: [...{
				Classification?: string | fn.Fn
				ConfigurationProperties?: [string]: string | fn.Fn
				Configurations?: [...{
					[string]: _
				}]
			}]
			EbsConfiguration?: {
				EbsBlockDeviceConfigs?: [...{
					VolumeSpecification: {
						Iops?:      int | fn.Fn
						SizeInGB:   int | fn.Fn
						VolumeType: string | fn.Fn
					}
					VolumesPerInstance?: int | fn.Fn
				}]
				EbsOptimized?: bool | fn.Fn
			}
			InstanceCount: int | fn.Fn
			InstanceRole:  string | fn.Fn
			InstanceType:  string | fn.Fn
			JobFlowId:     string | fn.Fn
			Market?:       string | fn.Fn
			Name?:         string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	SecurityConfiguration :: {
		Type: "AWS::EMR::SecurityConfiguration"
		Properties: {
			Name?:                 string | fn.Fn
			SecurityConfiguration: {
				[string]: _
			} | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Step :: {
		Type: "AWS::EMR::Step"
		Properties: {
			ActionOnFailure: string | fn.Fn
			HadoopJarStep: {
				Args?:      [...(string | fn.Fn)] | fn.Fn
				Jar:        string | fn.Fn
				MainClass?: string | fn.Fn
				StepProperties?: [...{
					Key?:   string | fn.Fn
					Value?: string | fn.Fn
				}]
			}
			JobFlowId: string | fn.Fn
			Name:      string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}
