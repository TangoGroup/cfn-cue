package usgoveast1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

ECS :: {
	CapacityProvider :: {
		Type:       "AWS::ECS::CapacityProvider"
		Properties: close({
			AutoScalingGroupProvider: close({
				AutoScalingGroupArn: string | fn.Fn
				ManagedScaling?:     close({
					MaximumScalingStepSize?: int | fn.Fn
					MinimumScalingStepSize?: int | fn.Fn
					Status?:                 ("DISABLED" | "ENABLED") | fn.Fn
					TargetCapacity?:         int | fn.Fn
				}) | fn.If
				ManagedTerminationProtection?: ("DISABLED" | "ENABLED") | fn.Fn
			}) | fn.If
			Name?: string | fn.Fn
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Cluster :: {
		Type:       "AWS::ECS::Cluster"
		Properties: close({
			CapacityProviders?: [...(string | fn.Fn)] | (string | fn.Fn)
			ClusterName?:       string | fn.Fn
			ClusterSettings?:   [...close({
				Name?:  string | fn.Fn
				Value?: string | fn.Fn
			})] | fn.If
			DefaultCapacityProviderStrategy?: [...close({
				Base?:             int | fn.Fn
				CapacityProvider?: string | fn.Fn
				Weight?:           int | fn.Fn
			})] | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ClusterCapacityProviderAssociations :: {
		Type:       "AWS::ECS::ClusterCapacityProviderAssociations"
		Properties: close({
			CapacityProviders:               [...(string | fn.Fn)] | (string | fn.Fn)
			Cluster:                         (strings.MinRunes(1) & strings.MaxRunes(2048)) | fn.Fn
			DefaultCapacityProviderStrategy: [...close({
				Base?:            int | fn.Fn
				CapacityProvider: string | fn.Fn
				Weight?:          int | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	PrimaryTaskSet :: {
		Type:       "AWS::ECS::PrimaryTaskSet"
		Properties: close({
			Cluster:   string | fn.Fn
			Service:   string | fn.Fn
			TaskSetId: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Service :: {
		Type:       "AWS::ECS::Service"
		Properties: close({
			CapacityProviderStrategy?: [...close({
				Base?:             int | fn.Fn
				CapacityProvider?: string | fn.Fn
				Weight?:           int | fn.Fn
			})] | fn.If
			Cluster?:                 string | fn.Fn
			DeploymentConfiguration?: close({
				DeploymentCircuitBreaker?: close({
					Enable:   bool | fn.Fn
					Rollback: bool | fn.Fn
				}) | fn.If
				MaximumPercent?:        int | fn.Fn
				MinimumHealthyPercent?: int | fn.Fn
			}) | fn.If
			DeploymentController?: close({
				Type?: ("CODE_DEPLOY" | "ECS" | "EXTERNAL") | fn.Fn
			}) | fn.If
			DesiredCount?:                  int | fn.Fn
			EnableECSManagedTags?:          bool | fn.Fn
			EnableExecuteCommand?:          bool | fn.Fn
			HealthCheckGracePeriodSeconds?: int | fn.Fn
			LaunchType?:                    ("EC2" | "FARGATE") | fn.Fn
			LoadBalancers?:                 [...close({
				ContainerName?:    string | fn.Fn
				ContainerPort?:    int | fn.Fn
				LoadBalancerName?: string | fn.Fn
				TargetGroupArn?:   string | fn.Fn
			})] | fn.If
			NetworkConfiguration?: close({
				AwsvpcConfiguration?: close({
					AssignPublicIp?: ("DISABLED" | "ENABLED") | fn.Fn
					SecurityGroups?: [...(string | fn.Fn)] | (string | fn.Fn)
					Subnets?:        [...(string | fn.Fn)] | (string | fn.Fn)
				}) | fn.If
			}) | fn.If
			PlacementConstraints?: [...close({
				Expression?: string | fn.Fn
				Type:        ("distinctInstance" | "memberOf") | fn.Fn
			})] | fn.If
			PlacementStrategies?: [...close({
				Field?: string | fn.Fn
				Type:   ("binpack" | "random" | "spread") | fn.Fn
			})] | fn.If
			PlatformVersion?:    string | fn.Fn
			PropagateTags?:      ("SERVICE" | "TASK_DEFINITION") | fn.Fn
			Role?:               string | fn.Fn
			SchedulingStrategy?: ("DAEMON" | "REPLICA") | fn.Fn
			ServiceArn?:         string | fn.Fn
			ServiceName?:        string | fn.Fn
			ServiceRegistries?:  [...close({
				ContainerName?: string | fn.Fn
				ContainerPort?: int | fn.Fn
				Port?:          int | fn.Fn
				RegistryArn?:   string | fn.Fn
			})] | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			TaskDefinition?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	TaskDefinition :: {
		Type:       "AWS::ECS::TaskDefinition"
		Properties: close({
			ContainerDefinitions?: [...close({
				Command?:   [...(string | fn.Fn)] | (string | fn.Fn)
				Cpu?:       int | fn.Fn
				DependsOn?: [...close({
					Condition?:     string | fn.Fn
					ContainerName?: string | fn.Fn
				})] | fn.If
				DisableNetworking?: bool | fn.Fn
				DnsSearchDomains?:  [...(string | fn.Fn)] | (string | fn.Fn)
				DnsServers?:        [...(string | fn.Fn)] | (string | fn.Fn)
				DockerLabels?:      {
					[string]: string | fn.Fn
				} | fn.If
				DockerSecurityOptions?: [...(string | fn.Fn)] | (string | fn.Fn)
				EntryPoint?:            [...(string | fn.Fn)] | (string | fn.Fn)
				Environment?:           [...close({
					Name?:  string | fn.Fn
					Value?: string | fn.Fn
				})] | fn.If
				EnvironmentFiles?: [...close({
					Type?:  string | fn.Fn
					Value?: string | fn.Fn
				})] | fn.If
				Essential?:  bool | fn.Fn
				ExtraHosts?: [...close({
					Hostname?:  string | fn.Fn
					IpAddress?: string | fn.Fn
				})] | fn.If
				FirelensConfiguration?: close({
					Options?: {
						[string]: string | fn.Fn
					} | fn.If
					Type?: string | fn.Fn
				}) | fn.If
				HealthCheck?: close({
					Command?:     [...(string | fn.Fn)] | (string | fn.Fn)
					Interval?:    int | fn.Fn
					Retries?:     int | fn.Fn
					StartPeriod?: int | fn.Fn
					Timeout?:     int | fn.Fn
				}) | fn.If
				Hostname?:        string | fn.Fn
				Image?:           string | fn.Fn
				Interactive?:     bool | fn.Fn
				Links?:           [...(string | fn.Fn)] | (string | fn.Fn)
				LinuxParameters?: close({
					Capabilities?: close({
						Add?:  [...(string | fn.Fn)] | (string | fn.Fn)
						Drop?: [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
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
						ContainerPath?: string | fn.Fn
						MountOptions?:  [...(string | fn.Fn)] | (string | fn.Fn)
						Size:           int | fn.Fn
					})] | fn.If
				}) | fn.If
				LogConfiguration?: close({
					LogDriver: string | fn.Fn
					Options?:  {
						[string]: string | fn.Fn
					} | fn.If
					SecretOptions?: [...close({
						Name:      string | fn.Fn
						ValueFrom: string | fn.Fn
					})] | fn.If
				}) | fn.If
				Memory?:            int | fn.Fn
				MemoryReservation?: int | fn.Fn
				MountPoints?:       [...close({
					ContainerPath?: string | fn.Fn
					ReadOnly?:      bool | fn.Fn
					SourceVolume?:  string | fn.Fn
				})] | fn.If
				Name?:         string | fn.Fn
				PortMappings?: [...close({
					ContainerPort?: int | fn.Fn
					HostPort?:      int | fn.Fn
					Protocol?:      string | fn.Fn
				})] | fn.If
				Privileged?:             bool | fn.Fn
				PseudoTerminal?:         bool | fn.Fn
				ReadonlyRootFilesystem?: bool | fn.Fn
				RepositoryCredentials?:  close({
					CredentialsParameter?: string | fn.Fn
				}) | fn.If
				ResourceRequirements?: [...close({
					Type:  string | fn.Fn
					Value: string | fn.Fn
				})] | fn.If
				Secrets?: [...close({
					Name:      string | fn.Fn
					ValueFrom: string | fn.Fn
				})] | fn.If
				StartTimeout?:   int | fn.Fn
				StopTimeout?:    int | fn.Fn
				SystemControls?: [...close({
					Namespace?: string | fn.Fn
					Value?:     string | fn.Fn
				})] | fn.If
				Ulimits?: [...close({
					HardLimit: int | fn.Fn
					Name:      string | fn.Fn
					SoftLimit: int | fn.Fn
				})] | fn.If
				User?:        string | fn.Fn
				VolumesFrom?: [...close({
					ReadOnly?:        bool | fn.Fn
					SourceContainer?: string | fn.Fn
				})] | fn.If
				WorkingDirectory?: string | fn.Fn
			})] | fn.If
			Cpu?:                   string | fn.Fn
			ExecutionRoleArn?:      (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#) | fn.Fn
			Family?:                string | fn.Fn
			InferenceAccelerators?: [...close({
				DeviceName?: string | fn.Fn
				DeviceType?: string | fn.Fn
			})] | fn.If
			IpcMode?:              string | fn.Fn
			Memory?:               string | fn.Fn
			NetworkMode?:          ("awsvpc" | "bridge" | "host" | "none") | fn.Fn
			PidMode?:              string | fn.Fn
			PlacementConstraints?: [...close({
				Expression?: string | fn.Fn
				Type:        string | fn.Fn
			})] | fn.If
			ProxyConfiguration?: close({
				ContainerName:                 string | fn.Fn
				ProxyConfigurationProperties?: [...close({
					Name?:  string | fn.Fn
					Value?: string | fn.Fn
				})] | fn.If
				Type?: ("APPMESH") | fn.Fn
			}) | fn.If
			RequiresCompatibilities?: [...(string | fn.Fn)] | (string | fn.Fn)
			Tags?:                    [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			TaskRoleArn?: string | fn.Fn
			Volumes?:     [...close({
				DockerVolumeConfiguration?: close({
					Autoprovision?: bool | fn.Fn
					Driver?:        string | fn.Fn
					DriverOpts?:    {
						[string]: string | fn.Fn
					} | fn.If
					Labels?: {
						[string]: string | fn.Fn
					} | fn.If
					Scope?: string | fn.Fn
				}) | fn.If
				EFSVolumeConfiguration?: close({
					AuthorizationConfig?: {
						[string]: _
					} | fn.Fn
					FilesystemId:           string | fn.Fn
					RootDirectory?:         string | fn.Fn
					TransitEncryption?:     ("ENABLED" | "DISABLED") | fn.Fn
					TransitEncryptionPort?: int | fn.Fn
				}) | fn.If
				Host?: close({
					SourcePath?: string | fn.Fn
				}) | fn.If
				Name?: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	TaskSet :: {
		Type:       "AWS::ECS::TaskSet"
		Properties: close({
			Cluster:        string | fn.Fn
			ExternalId?:    string | fn.Fn
			LaunchType?:    ("EC2" | "FARGATE") | fn.Fn
			LoadBalancers?: [...close({
				ContainerName?:    string | fn.Fn
				ContainerPort?:    int | fn.Fn
				LoadBalancerName?: string | fn.Fn
				TargetGroupArn?:   string | fn.Fn
			})] | fn.If
			NetworkConfiguration?: close({
				AwsVpcConfiguration?: close({
					AssignPublicIp?: ("DISABLED" | "ENABLED") | fn.Fn
					SecurityGroups?: [...(string | fn.Fn)] | (string | fn.Fn)
					Subnets:         [...(string | fn.Fn)] | (string | fn.Fn)
				}) | fn.If
			}) | fn.If
			PlatformVersion?: string | fn.Fn
			Scale?:           close({
				Unit?:  ("PERCENT") | fn.Fn
				Value?: number | fn.Fn
			}) | fn.If
			Service:            string | fn.Fn
			ServiceRegistries?: [...close({
				ContainerName?: string | fn.Fn
				ContainerPort?: int | fn.Fn
				Port?:          int | fn.Fn
				RegistryArn?:   string | fn.Fn
			})] | fn.If
			TaskDefinition: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
