package uswest1

import "github.com/TangoGroup/aws/fn"

Batch :: {
	ComputeEnvironment :: {
		Type: "AWS::Batch::ComputeEnvironment"
		Properties: {
			ComputeEnvironmentName?: string | fn.Fn
			ComputeResources?: {
				AllocationStrategy?: string | fn.Fn
				BidPercentage?:      int | fn.Fn
				DesiredvCpus?:       int | fn.Fn
				Ec2KeyPair?:         string | fn.Fn
				ImageId?:            string | fn.Fn
				InstanceRole:        string | fn.Fn
				InstanceTypes:       [...(string | fn.Fn)] | fn.Fn
				LaunchTemplate?: {
					LaunchTemplateId?:   string | fn.Fn
					LaunchTemplateName?: string | fn.Fn
					Version?:            string | fn.Fn
				}
				MaxvCpus:          int | fn.Fn
				MinvCpus:          int | fn.Fn
				PlacementGroup?:   string | fn.Fn
				SecurityGroupIds?: [...(string | fn.Fn)] | fn.Fn
				SpotIamFleetRole?: (string & (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#)) | fn.Fn
				Subnets:           [...(string | fn.Fn)] | fn.Fn
				Tags?:             {
					[string]: _
				} | fn.Fn
				Type: string | fn.Fn
			}
			ServiceRole: (string & (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#)) | fn.Fn
			State?:      string | fn.Fn
			Type:        string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	JobDefinition :: {
		Type: "AWS::Batch::JobDefinition"
		Properties: {
			ContainerProperties?: {
				Command?: [...(string | fn.Fn)] | fn.Fn
				Environment?: [...{
					Name?:  string | fn.Fn
					Value?: string | fn.Fn
				}]
				Image:         string | fn.Fn
				InstanceType?: string | fn.Fn
				JobRoleArn?:   string | fn.Fn
				LinuxParameters?: Devices?: [...{
					ContainerPath?: string | fn.Fn
					HostPath?:      string | fn.Fn
					Permissions?:   [...(string | fn.Fn)] | fn.Fn
				}]
				Memory: int | fn.Fn
				MountPoints?: [...{
					ContainerPath?: string | fn.Fn
					ReadOnly?:      bool | fn.Fn
					SourceVolume?:  string | fn.Fn
				}]
				Privileged?:             bool | fn.Fn
				ReadonlyRootFilesystem?: bool | fn.Fn
				ResourceRequirements?: [...{
					Type?:  string | fn.Fn
					Value?: string | fn.Fn
				}]
				Ulimits?: [...{
					HardLimit: int | fn.Fn
					Name:      string | fn.Fn
					SoftLimit: int | fn.Fn
				}]
				User?: string | fn.Fn
				Vcpus: int | fn.Fn
				Volumes?: [...{
					Host?: SourcePath?: string | fn.Fn
					Name?: string | fn.Fn
				}]
			}
			JobDefinitionName?: string | fn.Fn
			NodeProperties?: {
				MainNode: int | fn.Fn
				NodeRangeProperties: [...{
					Container?: {
						Command?: [...(string | fn.Fn)] | fn.Fn
						Environment?: [...{
							Name?:  string | fn.Fn
							Value?: string | fn.Fn
						}]
						Image:         string | fn.Fn
						InstanceType?: string | fn.Fn
						JobRoleArn?:   string | fn.Fn
						LinuxParameters?: Devices?: [...{
							ContainerPath?: string | fn.Fn
							HostPath?:      string | fn.Fn
							Permissions?:   [...(string | fn.Fn)] | fn.Fn
						}]
						Memory: int | fn.Fn
						MountPoints?: [...{
							ContainerPath?: string | fn.Fn
							ReadOnly?:      bool | fn.Fn
							SourceVolume?:  string | fn.Fn
						}]
						Privileged?:             bool | fn.Fn
						ReadonlyRootFilesystem?: bool | fn.Fn
						ResourceRequirements?: [...{
							Type?:  string | fn.Fn
							Value?: string | fn.Fn
						}]
						Ulimits?: [...{
							HardLimit: int | fn.Fn
							Name:      string | fn.Fn
							SoftLimit: int | fn.Fn
						}]
						User?: string | fn.Fn
						Vcpus: int | fn.Fn
						Volumes?: [...{
							Host?: SourcePath?: string | fn.Fn
							Name?: string | fn.Fn
						}]
					}
					TargetNodes: string | fn.Fn
				}]
				NumNodes: int | fn.Fn
			}
			Parameters?: {
				[string]: _
			} | fn.Fn
			RetryStrategy?: Attempts?:         int | fn.Fn
			Timeout?: AttemptDurationSeconds?: int | fn.Fn
			Type: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}
