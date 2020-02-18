package apeast1

import "github.com/TangoGroup/aws/fn"

EMR :: {
	Cluster :: {
		Type: "AWS::EMR::Cluster"
		Properties: {
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
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	InstanceFleetConfig :: {
		Type: "AWS::EMR::InstanceFleetConfig"
		Properties: {
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
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	InstanceGroupConfig :: {
		Type: "AWS::EMR::InstanceGroupConfig"
		Properties: {
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
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
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
		Condition?: string
	}
	Step :: {
		Type: "AWS::EMR::Step"
		Properties: {
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
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
