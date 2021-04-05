package uswest1

import "github.com/TangoGroup/aws/fn"

Batch :: {
	ComputeEnvironment :: {
		Type:       "AWS::Batch::ComputeEnvironment"
		Properties: close({
			ComputeEnvironmentName?: string | fn.Fn
			ComputeResources?:       close({
				AllocationStrategy?: string | fn.Fn
				BidPercentage?:      int | fn.Fn
				DesiredvCpus?:       int | fn.Fn
				Ec2Configuration?:   [...close({
					ImageIdOverride?: string | fn.Fn
					ImageType:        string | fn.Fn
				})] | fn.If
				Ec2KeyPair?:     string | fn.Fn
				ImageId?:        string | fn.Fn
				InstanceRole?:   string | fn.Fn
				InstanceTypes?:  [...(string | fn.Fn)] | (string | fn.Fn)
				LaunchTemplate?: close({
					LaunchTemplateId?:   string | fn.Fn
					LaunchTemplateName?: string | fn.Fn
					Version?:            string | fn.Fn
				}) | fn.If
				MaxvCpus:          int | fn.Fn
				MinvCpus?:         int | fn.Fn
				PlacementGroup?:   string | fn.Fn
				SecurityGroupIds?: [...(string | fn.Fn)] | (string | fn.Fn)
				SpotIamFleetRole?: (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#) | fn.Fn
				Subnets:           [...(string | fn.Fn)] | (string | fn.Fn)
				Tags?:             {
					[string]: _
				} | fn.Fn
				Type: string | fn.Fn
			}) | fn.If
			ServiceRole?: (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#) | fn.Fn
			State?:       string | fn.Fn
			Tags?:        {
				[string]: _
			} | fn.Fn
			Type: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	JobDefinition :: {
		Type:       "AWS::Batch::JobDefinition"
		Properties: close({
			ContainerProperties?: close({
				Command?:     [...(string | fn.Fn)] | (string | fn.Fn)
				Environment?: [...close({
					Name?:  string | fn.Fn
					Value?: string | fn.Fn
				})] | fn.If
				ExecutionRoleArn?:             string | fn.Fn
				FargatePlatformConfiguration?: close({
					PlatformVersion?: string | fn.Fn
				}) | fn.If
				Image:            string | fn.Fn
				InstanceType?:    string | fn.Fn
				JobRoleArn?:      string | fn.Fn
				LinuxParameters?: close({
					Devices?: [...close({
						ContainerPath?: string | fn.Fn
						HostPath?:      string | fn.Fn
						Permissions?:   [...(string | fn.Fn)] | (string | fn.Fn)
					})] | fn.If
					InitProcessEnabled?: bool | fn.Fn
					MaxSwap?:            int | fn.Fn
					SharedMemorySize?:   int | fn.Fn
					Swappiness?:         int | fn.Fn
					Tmpfs?:              [...close({
						ContainerPath: string | fn.Fn
						MountOptions?: [...(string | fn.Fn)] | (string | fn.Fn)
						Size:          int | fn.Fn
					})] | fn.If
				}) | fn.If
				LogConfiguration?: close({
					LogDriver: string | fn.Fn
					Options?:  {
						[string]: _
					} | fn.Fn
					SecretOptions?: [...close({
						Name:      string | fn.Fn
						ValueFrom: string | fn.Fn
					})] | fn.If
				}) | fn.If
				Memory?:      int | fn.Fn
				MountPoints?: [...close({
					ContainerPath?: string | fn.Fn
					ReadOnly?:      bool | fn.Fn
					SourceVolume?:  string | fn.Fn
				})] | fn.If
				NetworkConfiguration?: close({
					AssignPublicIp?: string | fn.Fn
				}) | fn.If
				Privileged?:             bool | fn.Fn
				ReadonlyRootFilesystem?: bool | fn.Fn
				ResourceRequirements?:   [...close({
					Type?:  string | fn.Fn
					Value?: string | fn.Fn
				})] | fn.If
				Secrets?: [...close({
					Name:      string | fn.Fn
					ValueFrom: string | fn.Fn
				})] | fn.If
				Ulimits?: [...close({
					HardLimit: int | fn.Fn
					Name:      string | fn.Fn
					SoftLimit: int | fn.Fn
				})] | fn.If
				User?:    string | fn.Fn
				Vcpus?:   int | fn.Fn
				Volumes?: [...close({
					EfsVolumeConfiguration?: close({
						AuthorizationConfig?: close({
							AccessPointId?: string | fn.Fn
							Iam?:           string | fn.Fn
						}) | fn.If
						FileSystemId:           string | fn.Fn
						RootDirectory?:         string | fn.Fn
						TransitEncryption?:     string | fn.Fn
						TransitEncryptionPort?: int | fn.Fn
					}) | fn.If
					Host?: close({
						SourcePath?: string | fn.Fn
					}) | fn.If
					Name?: string | fn.Fn
				})] | fn.If
			}) | fn.If
			JobDefinitionName?: string | fn.Fn
			NodeProperties?:    close({
				MainNode:            int | fn.Fn
				NodeRangeProperties: [...close({
					Container?: close({
						Command?:     [...(string | fn.Fn)] | (string | fn.Fn)
						Environment?: [...close({
							Name?:  string | fn.Fn
							Value?: string | fn.Fn
						})] | fn.If
						ExecutionRoleArn?:             string | fn.Fn
						FargatePlatformConfiguration?: close({
							PlatformVersion?: string | fn.Fn
						}) | fn.If
						Image:            string | fn.Fn
						InstanceType?:    string | fn.Fn
						JobRoleArn?:      string | fn.Fn
						LinuxParameters?: close({
							Devices?: [...close({
								ContainerPath?: string | fn.Fn
								HostPath?:      string | fn.Fn
								Permissions?:   [...(string | fn.Fn)] | (string | fn.Fn)
							})] | fn.If
							InitProcessEnabled?: bool | fn.Fn
							MaxSwap?:            int | fn.Fn
							SharedMemorySize?:   int | fn.Fn
							Swappiness?:         int | fn.Fn
							Tmpfs?:              [...close({
								ContainerPath: string | fn.Fn
								MountOptions?: [...(string | fn.Fn)] | (string | fn.Fn)
								Size:          int | fn.Fn
							})] | fn.If
						}) | fn.If
						LogConfiguration?: close({
							LogDriver: string | fn.Fn
							Options?:  {
								[string]: _
							} | fn.Fn
							SecretOptions?: [...close({
								Name:      string | fn.Fn
								ValueFrom: string | fn.Fn
							})] | fn.If
						}) | fn.If
						Memory?:      int | fn.Fn
						MountPoints?: [...close({
							ContainerPath?: string | fn.Fn
							ReadOnly?:      bool | fn.Fn
							SourceVolume?:  string | fn.Fn
						})] | fn.If
						NetworkConfiguration?: close({
							AssignPublicIp?: string | fn.Fn
						}) | fn.If
						Privileged?:             bool | fn.Fn
						ReadonlyRootFilesystem?: bool | fn.Fn
						ResourceRequirements?:   [...close({
							Type?:  string | fn.Fn
							Value?: string | fn.Fn
						})] | fn.If
						Secrets?: [...close({
							Name:      string | fn.Fn
							ValueFrom: string | fn.Fn
						})] | fn.If
						Ulimits?: [...close({
							HardLimit: int | fn.Fn
							Name:      string | fn.Fn
							SoftLimit: int | fn.Fn
						})] | fn.If
						User?:    string | fn.Fn
						Vcpus?:   int | fn.Fn
						Volumes?: [...close({
							EfsVolumeConfiguration?: close({
								AuthorizationConfig?: close({
									AccessPointId?: string | fn.Fn
									Iam?:           string | fn.Fn
								}) | fn.If
								FileSystemId:           string | fn.Fn
								RootDirectory?:         string | fn.Fn
								TransitEncryption?:     string | fn.Fn
								TransitEncryptionPort?: int | fn.Fn
							}) | fn.If
							Host?: close({
								SourcePath?: string | fn.Fn
							}) | fn.If
							Name?: string | fn.Fn
						})] | fn.If
					}) | fn.If
					TargetNodes: string | fn.Fn
				})] | fn.If
				NumNodes: int | fn.Fn
			}) | fn.If
			Parameters?: {
				[string]: _
			} | fn.Fn
			PlatformCapabilities?: [...(string | fn.Fn)] | (string | fn.Fn)
			PropagateTags?:        bool | fn.Fn
			RetryStrategy?:        close({
				Attempts?:       int | fn.Fn
				EvaluateOnExit?: [...close({
					Action:          string | fn.Fn
					OnExitCode?:     string | fn.Fn
					OnReason?:       string | fn.Fn
					OnStatusReason?: string | fn.Fn
				})] | fn.If
			}) | fn.If
			Tags?: {
				[string]: _
			} | fn.Fn
			Timeout?: close({
				AttemptDurationSeconds?: int | fn.Fn
			}) | fn.If
			Type: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
