package apsoutheast1

import "github.com/TangoGroup/fn"

ECS :: {
	Cluster :: {
		Type: "AWS::ECS::Cluster"
		Properties: {
			ClusterName?: string | fn.Fn
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Service :: {
		Type: "AWS::ECS::Service"
		Properties: {
			Cluster?: string | fn.Fn
			DeploymentConfiguration?: {
				MaximumPercent?:        int | fn.Fn
				MinimumHealthyPercent?: int | fn.Fn
			}
			DesiredCount?:                  int | fn.Fn
			EnableECSManagedTags?:          bool | fn.Fn
			HealthCheckGracePeriodSeconds?: int | fn.Fn
			LaunchType?:                    (string & ("EC2" | "FARGATE")) | fn.Fn
			LoadBalancers?: [...{
				ContainerName?:    string | fn.Fn
				ContainerPort:     int | fn.Fn
				LoadBalancerName?: string | fn.Fn
				TargetGroupArn?:   string | fn.Fn
			}]
			NetworkConfiguration?: AwsvpcConfiguration?: {
				AssignPublicIp?: string | fn.Fn
				SecurityGroups?: [...(string | fn.Fn)]
				Subnets: [...(string | fn.Fn)]
			}
			PlacementConstraints?: [...{
				Expression?: string | fn.Fn
				Type:        string | fn.Fn
			}]
			PlacementStrategies?: [...{
				Field?: string | fn.Fn
				Type:   string | fn.Fn
			}]
			PlatformVersion?:    string | fn.Fn
			PropagateTags?:      string | fn.Fn
			Role?:               string | fn.Fn
			SchedulingStrategy?: (string & ("DAEMON" | "REPLICA")) | fn.Fn
			ServiceName?:        string | fn.Fn
			ServiceRegistries?: [...{
				ContainerName?: string | fn.Fn
				ContainerPort?: int | fn.Fn
				Port?:          int | fn.Fn
				RegistryArn?:   string | fn.Fn
			}]
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			TaskDefinition: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	TaskDefinition :: {
		Type: "AWS::ECS::TaskDefinition"
		Properties: {
			ContainerDefinitions?: [...{
				Command?: [...(string | fn.Fn)]
				Cpu?: int | fn.Fn
				DependsOn?: [...{
					Condition:     string | fn.Fn
					ContainerName: string | fn.Fn
				}]
				DisableNetworking?: bool | fn.Fn
				DnsSearchDomains?: [...(string | fn.Fn)]
				DnsServers?: [...(string | fn.Fn)]
				DockerLabels?: [string]: string | fn.Fn
				DockerSecurityOptions?: [...(string | fn.Fn)]
				EntryPoint?: [...(string | fn.Fn)]
				Environment?: [...{
					Name?:  string | fn.Fn
					Value?: string | fn.Fn
				}]
				Essential?: bool | fn.Fn
				ExtraHosts?: [...{
					Hostname:  string | fn.Fn
					IpAddress: string | fn.Fn
				}]
				HealthCheck?: {
					Command: [...(string | fn.Fn)]
					Interval?:    int | fn.Fn
					Retries?:     int | fn.Fn
					StartPeriod?: int | fn.Fn
					Timeout?:     int | fn.Fn
				}
				Hostname?:    string | fn.Fn
				Image?:       string | fn.Fn
				Interactive?: bool | fn.Fn
				Links?: [...(string | fn.Fn)]
				LinuxParameters?: {
					Capabilities?: {
						Add?: [...(string | fn.Fn)]
						Drop?: [...(string | fn.Fn)]
					}
					Devices?: [...{
						ContainerPath?: string | fn.Fn
						HostPath:       string | fn.Fn
						Permissions?: [...(string | fn.Fn)]
					}]
					InitProcessEnabled?: bool | fn.Fn
					SharedMemorySize?:   int | fn.Fn
					Tmpfs?: [...{
						ContainerPath?: string | fn.Fn
						MountOptions?: [...(string | fn.Fn)]
						Size: int | fn.Fn
					}]
				}
				LogConfiguration?: {
					LogDriver: string | fn.Fn
					Options?: [string]: string | fn.Fn
					SecretOptions?: [...{
						Name:      string | fn.Fn
						ValueFrom: string | fn.Fn
					}]
				}
				Memory?:            int | fn.Fn
				MemoryReservation?: int | fn.Fn
				MountPoints?: [...{
					ContainerPath?: string | fn.Fn
					ReadOnly?:      bool | fn.Fn
					SourceVolume?:  string | fn.Fn
				}]
				Name?: string | fn.Fn
				PortMappings?: [...{
					ContainerPort?: int | fn.Fn
					HostPort?:      int | fn.Fn
					Protocol?:      string | fn.Fn
				}]
				Privileged?:             bool | fn.Fn
				PseudoTerminal?:         bool | fn.Fn
				ReadonlyRootFilesystem?: bool | fn.Fn
				RepositoryCredentials?: CredentialsParameter?: string | fn.Fn
				ResourceRequirements?: [...{
					Type:  string | fn.Fn
					Value: string | fn.Fn
				}]
				Secrets?: [...{
					Name:      string | fn.Fn
					ValueFrom: string | fn.Fn
				}]
				StartTimeout?: int | fn.Fn
				StopTimeout?:  int | fn.Fn
				SystemControls?: [...{
					Namespace: string | fn.Fn
					Value:     string | fn.Fn
				}]
				Ulimits?: [...{
					HardLimit: int | fn.Fn
					Name:      string | fn.Fn
					SoftLimit: int | fn.Fn
				}]
				User?: string | fn.Fn
				VolumesFrom?: [...{
					ReadOnly?:        bool | fn.Fn
					SourceContainer?: string | fn.Fn
				}]
				WorkingDirectory?: string | fn.Fn
			}]
			Cpu?:              string | fn.Fn
			ExecutionRoleArn?: (string & (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#)) | fn.Fn
			Family?:           string | fn.Fn
			InferenceAccelerators?: [...{
				DeviceName?: string | fn.Fn
				DeviceType?: string | fn.Fn
			}]
			IpcMode?:     string | fn.Fn
			Memory?:      string | fn.Fn
			NetworkMode?: (string & ("awsvpc" | "bridge" | "host" | "none")) | fn.Fn
			PidMode?:     string | fn.Fn
			PlacementConstraints?: [...{
				Expression?: string | fn.Fn
				Type:        string | fn.Fn
			}]
			ProxyConfiguration?: {
				ContainerName: string | fn.Fn
				ProxyConfigurationProperties?: [...{
					Name?:  string | fn.Fn
					Value?: string | fn.Fn
				}]
				Type?: (string & ("APPMESH")) | fn.Fn
			}
			RequiresCompatibilities?: [...(string | fn.Fn)]
			Tags?: [...{
				Key:   string | fn.Fn
				Value: string | fn.Fn
			}]
			TaskRoleArn?: string | fn.Fn
			Volumes?: [...{
				DockerVolumeConfiguration?: {
					Autoprovision?: bool | fn.Fn
					Driver?:        string | fn.Fn
					DriverOpts?: [string]: string | fn.Fn
					Labels?: [string]:     string | fn.Fn
					Scope?: string | fn.Fn
				}
				Host?: SourcePath?: string | fn.Fn
				Name?: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}
