package useast1

import "github.com/TangoGroup/aws/fn"

ECS :: {
	Cluster :: {
		Type: "AWS::ECS::Cluster"
		Properties: {
			ClusterName?:     string | fn.Fn
			ClusterSettings?: [...{
				Name:  string | fn.Fn
				Value: string | fn.Fn
			}] | fn.If
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	PrimaryTaskSet :: {
		Type: "AWS::ECS::PrimaryTaskSet"
		Properties: {
			Cluster:   string | fn.Fn
			Service:   string | fn.Fn
			TaskSetId: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Service :: {
		Type: "AWS::ECS::Service"
		Properties: {
			Cluster?:                 string | fn.Fn
			DeploymentConfiguration?: {
				MaximumPercent?:        int | fn.Fn
				MinimumHealthyPercent?: int | fn.Fn
			} | fn.If
			DeploymentController?: {
				Type?: string | fn.Fn
			} | fn.If
			DesiredCount?:                  int | fn.Fn
			EnableECSManagedTags?:          bool | fn.Fn
			HealthCheckGracePeriodSeconds?: int | fn.Fn
			LaunchType?:                    ("EC2" | "FARGATE") | fn.Fn
			LoadBalancers?:                 [...{
				ContainerName?:    string | fn.Fn
				ContainerPort:     int | fn.Fn
				LoadBalancerName?: string | fn.Fn
				TargetGroupArn?:   string | fn.Fn
			}] | fn.If
			NetworkConfiguration?: {
				AwsvpcConfiguration?: {
					AssignPublicIp?: string | fn.Fn
					SecurityGroups?: [...(string | fn.Fn)] | (string | fn.Fn)
					Subnets:         [...(string | fn.Fn)] | (string | fn.Fn)
				} | fn.If
			} | fn.If
			PlacementConstraints?: [...{
				Expression?: string | fn.Fn
				Type:        string | fn.Fn
			}] | fn.If
			PlacementStrategies?: [...{
				Field?: string | fn.Fn
				Type:   string | fn.Fn
			}] | fn.If
			PlatformVersion?:    string | fn.Fn
			PropagateTags?:      string | fn.Fn
			Role?:               string | fn.Fn
			SchedulingStrategy?: ("DAEMON" | "REPLICA") | fn.Fn
			ServiceName?:        string | fn.Fn
			ServiceRegistries?:  [...{
				ContainerName?: string | fn.Fn
				ContainerPort?: int | fn.Fn
				Port?:          int | fn.Fn
				RegistryArn?:   string | fn.Fn
			}] | fn.If
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}] | fn.If
			TaskDefinition?: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	TaskDefinition :: {
		Type: "AWS::ECS::TaskDefinition"
		Properties: {
			ContainerDefinitions?: [...{
				Command?:   [...(string | fn.Fn)] | (string | fn.Fn)
				Cpu?:       int | fn.Fn
				DependsOn?: [...{
					Condition:     string | fn.Fn
					ContainerName: string | fn.Fn
				}] | fn.If
				DisableNetworking?: bool | fn.Fn
				DnsSearchDomains?:  [...(string | fn.Fn)] | (string | fn.Fn)
				DnsServers?:        [...(string | fn.Fn)] | (string | fn.Fn)
				DockerLabels?:      {
					[string]: string | fn.Fn
				} | fn.If
				DockerSecurityOptions?: [...(string | fn.Fn)] | (string | fn.Fn)
				EntryPoint?:            [...(string | fn.Fn)] | (string | fn.Fn)
				Environment?:           [...{
					Name?:  string | fn.Fn
					Value?: string | fn.Fn
				}] | fn.If
				Essential?:  bool | fn.Fn
				ExtraHosts?: [...{
					Hostname:  string | fn.Fn
					IpAddress: string | fn.Fn
				}] | fn.If
				FirelensConfiguration?: {
					Options?: {
						[string]: string | fn.Fn
					} | fn.If
					Type: string | fn.Fn
				} | fn.If
				HealthCheck?: {
					Command:      [...(string | fn.Fn)] | (string | fn.Fn)
					Interval?:    int | fn.Fn
					Retries?:     int | fn.Fn
					StartPeriod?: int | fn.Fn
					Timeout?:     int | fn.Fn
				} | fn.If
				Hostname?:        string | fn.Fn
				Image?:           string | fn.Fn
				Interactive?:     bool | fn.Fn
				Links?:           [...(string | fn.Fn)] | (string | fn.Fn)
				LinuxParameters?: {
					Capabilities?: {
						Add?:  [...(string | fn.Fn)] | (string | fn.Fn)
						Drop?: [...(string | fn.Fn)] | (string | fn.Fn)
					} | fn.If
					Devices?: [...{
						ContainerPath?: string | fn.Fn
						HostPath:       string | fn.Fn
						Permissions?:   [...(string | fn.Fn)] | (string | fn.Fn)
					}] | fn.If
					InitProcessEnabled?: bool | fn.Fn
					MaxSwap?:            int | fn.Fn
					SharedMemorySize?:   int | fn.Fn
					Swappiness?:         int | fn.Fn
					Tmpfs?:              [...{
						ContainerPath?: string | fn.Fn
						MountOptions?:  [...(string | fn.Fn)] | (string | fn.Fn)
						Size:           int | fn.Fn
					}] | fn.If
				} | fn.If
				LogConfiguration?: {
					LogDriver: string | fn.Fn
					Options?:  {
						[string]: string | fn.Fn
					} | fn.If
					SecretOptions?: [...{
						Name:      string | fn.Fn
						ValueFrom: string | fn.Fn
					}] | fn.If
				} | fn.If
				Memory?:            int | fn.Fn
				MemoryReservation?: int | fn.Fn
				MountPoints?:       [...{
					ContainerPath?: string | fn.Fn
					ReadOnly?:      bool | fn.Fn
					SourceVolume?:  string | fn.Fn
				}] | fn.If
				Name?:         string | fn.Fn
				PortMappings?: [...{
					ContainerPort?: int | fn.Fn
					HostPort?:      int | fn.Fn
					Protocol?:      string | fn.Fn
				}] | fn.If
				Privileged?:             bool | fn.Fn
				PseudoTerminal?:         bool | fn.Fn
				ReadonlyRootFilesystem?: bool | fn.Fn
				RepositoryCredentials?:  {
					CredentialsParameter?: string | fn.Fn
				} | fn.If
				ResourceRequirements?: [...{
					Type:  string | fn.Fn
					Value: string | fn.Fn
				}] | fn.If
				Secrets?: [...{
					Name:      string | fn.Fn
					ValueFrom: string | fn.Fn
				}] | fn.If
				StartTimeout?:   int | fn.Fn
				StopTimeout?:    int | fn.Fn
				SystemControls?: [...{
					Namespace: string | fn.Fn
					Value:     string | fn.Fn
				}] | fn.If
				Ulimits?: [...{
					HardLimit: int | fn.Fn
					Name:      string | fn.Fn
					SoftLimit: int | fn.Fn
				}] | fn.If
				User?:        string | fn.Fn
				VolumesFrom?: [...{
					ReadOnly?:        bool | fn.Fn
					SourceContainer?: string | fn.Fn
				}] | fn.If
				WorkingDirectory?: string | fn.Fn
			}] | fn.If
			Cpu?:                   string | fn.Fn
			ExecutionRoleArn?:      (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#) | fn.Fn
			Family?:                string | fn.Fn
			InferenceAccelerators?: [...{
				DeviceName?:   string | fn.Fn
				DevicePolicy?: string | fn.Fn
				DeviceType?:   string | fn.Fn
			}] | fn.If
			IpcMode?:              string | fn.Fn
			Memory?:               string | fn.Fn
			NetworkMode?:          ("awsvpc" | "bridge" | "host" | "none") | fn.Fn
			PidMode?:              string | fn.Fn
			PlacementConstraints?: [...{
				Expression?: string | fn.Fn
				Type:        string | fn.Fn
			}] | fn.If
			ProxyConfiguration?: {
				ContainerName:                 string | fn.Fn
				ProxyConfigurationProperties?: [...{
					Name?:  string | fn.Fn
					Value?: string | fn.Fn
				}] | fn.If
				Type?: ("APPMESH") | fn.Fn
			} | fn.If
			RequiresCompatibilities?: [...(string | fn.Fn)] | (string | fn.Fn)
			Tags?:                    [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}] | fn.If
			TaskRoleArn?: string | fn.Fn
			Volumes?:     [...{
				DockerVolumeConfiguration?: {
					Autoprovision?: bool | fn.Fn
					Driver?:        string | fn.Fn
					DriverOpts?:    {
						[string]: string | fn.Fn
					} | fn.If
					Labels?: {
						[string]: string | fn.Fn
					} | fn.If
					Scope?: string | fn.Fn
				} | fn.If
				Host?: {
					SourcePath?: string | fn.Fn
				} | fn.If
				Name?: string | fn.Fn
			}] | fn.If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	TaskSet :: {
		Type: "AWS::ECS::TaskSet"
		Properties: {
			Cluster:        string | fn.Fn
			ExternalId?:    string | fn.Fn
			LaunchType?:    string | fn.Fn
			LoadBalancers?: [...{
				ContainerName?:    string | fn.Fn
				ContainerPort?:    int | fn.Fn
				LoadBalancerName?: string | fn.Fn
				TargetGroupArn?:   string | fn.Fn
			}] | fn.If
			NetworkConfiguration?: {
				AwsVpcConfiguration?: {
					AssignPublicIp?: string | fn.Fn
					SecurityGroups?: [...(string | fn.Fn)] | (string | fn.Fn)
					Subnets:         [...(string | fn.Fn)] | (string | fn.Fn)
				} | fn.If
			} | fn.If
			PlatformVersion?: string | fn.Fn
			Scale?:           {
				Unit?:  string | fn.Fn
				Value?: number | fn.Fn
			} | fn.If
			Service:            string | fn.Fn
			ServiceRegistries?: [...{
				ContainerName?: string | fn.Fn
				ContainerPort?: int | fn.Fn
				Port?:          int | fn.Fn
				RegistryArn?:   string | fn.Fn
			}] | fn.If
			TaskDefinition: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
