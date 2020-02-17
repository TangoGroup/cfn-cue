package euwest3

import "github.com/TangoGroup/aws/fn"

Batch :: {
	ComputeEnvironment :: {
		Type: "AWS::Batch::ComputeEnvironment"
		Properties: {
			ComputeEnvironmentName?: string | fn.Fn
			ComputeResources?:       {
				AllocationStrategy?: string | fn.Fn
				BidPercentage?:      int | fn.Fn
				DesiredvCpus?:       int | fn.Fn
				Ec2KeyPair?:         string | fn.Fn
				ImageId?:            string | fn.Fn
				InstanceRole:        string | fn.Fn
				InstanceTypes:       [...(string | fn.Fn)] | (string | fn.Fn)
				LaunchTemplate?:     {
					LaunchTemplateId?:   string | fn.Fn
					LaunchTemplateName?: string | fn.Fn
					Version?:            string | fn.Fn
				} | fn.If
				MaxvCpus:          int | fn.Fn
				MinvCpus:          int | fn.Fn
				PlacementGroup?:   string | fn.Fn
				SecurityGroupIds?: [...(string | fn.Fn)] | (string | fn.Fn)
				SpotIamFleetRole?: (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#) | fn.Fn
				Subnets:           [...(string | fn.Fn)] | (string | fn.Fn)
				Tags?:             {
					[string]: _
				} | fn.Fn
				Type: string | fn.Fn
			} | fn.If
			ServiceRole: (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#) | fn.Fn
			State?:      string | fn.Fn
			Type:        string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	JobDefinition :: {
		Type: "AWS::Batch::JobDefinition"
		Properties: {
			ContainerProperties?: {
				Command?:     [...(string | fn.Fn)] | (string | fn.Fn)
				Environment?: [...{
					Name?:  string | fn.Fn
					Value?: string | fn.Fn
				}] | fn.If
				Image:            string | fn.Fn
				InstanceType?:    string | fn.Fn
				JobRoleArn?:      string | fn.Fn
				LinuxParameters?: {
					Devices?: [...{
						ContainerPath?: string | fn.Fn
						HostPath?:      string | fn.Fn
						Permissions?:   [...(string | fn.Fn)] | (string | fn.Fn)
					}] | fn.If
				} | fn.If
				Memory:       int | fn.Fn
				MountPoints?: [...{
					ContainerPath?: string | fn.Fn
					ReadOnly?:      bool | fn.Fn
					SourceVolume?:  string | fn.Fn
				}] | fn.If
				Privileged?:             bool | fn.Fn
				ReadonlyRootFilesystem?: bool | fn.Fn
				ResourceRequirements?:   [...{
					Type?:  string | fn.Fn
					Value?: string | fn.Fn
				}] | fn.If
				Ulimits?: [...{
					HardLimit: int | fn.Fn
					Name:      string | fn.Fn
					SoftLimit: int | fn.Fn
				}] | fn.If
				User?:    string | fn.Fn
				Vcpus:    int | fn.Fn
				Volumes?: [...{
					Host?: {
						SourcePath?: string | fn.Fn
					} | fn.If
					Name?: string | fn.Fn
				}] | fn.If
			} | fn.If
			JobDefinitionName?: string | fn.Fn
			NodeProperties?:    {
				MainNode:            int | fn.Fn
				NodeRangeProperties: [...{
					Container?: {
						Command?:     [...(string | fn.Fn)] | (string | fn.Fn)
						Environment?: [...{
							Name?:  string | fn.Fn
							Value?: string | fn.Fn
						}] | fn.If
						Image:            string | fn.Fn
						InstanceType?:    string | fn.Fn
						JobRoleArn?:      string | fn.Fn
						LinuxParameters?: {
							Devices?: [...{
								ContainerPath?: string | fn.Fn
								HostPath?:      string | fn.Fn
								Permissions?:   [...(string | fn.Fn)] | (string | fn.Fn)
							}] | fn.If
						} | fn.If
						Memory:       int | fn.Fn
						MountPoints?: [...{
							ContainerPath?: string | fn.Fn
							ReadOnly?:      bool | fn.Fn
							SourceVolume?:  string | fn.Fn
						}] | fn.If
						Privileged?:             bool | fn.Fn
						ReadonlyRootFilesystem?: bool | fn.Fn
						ResourceRequirements?:   [...{
							Type?:  string | fn.Fn
							Value?: string | fn.Fn
						}] | fn.If
						Ulimits?: [...{
							HardLimit: int | fn.Fn
							Name:      string | fn.Fn
							SoftLimit: int | fn.Fn
						}] | fn.If
						User?:    string | fn.Fn
						Vcpus:    int | fn.Fn
						Volumes?: [...{
							Host?: {
								SourcePath?: string | fn.Fn
							} | fn.If
							Name?: string | fn.Fn
						}] | fn.If
					} | fn.If
					TargetNodes: string | fn.Fn
				}] | fn.If
				NumNodes: int | fn.Fn
			} | fn.If
			Parameters?: {
				[string]: _
			} | fn.Fn
			RetryStrategy?: {
				Attempts?: int | fn.Fn
			} | fn.If
			Timeout?: {
				AttemptDurationSeconds?: int | fn.Fn
			} | fn.If
			Type: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	JobQueue :: {
		Type: "AWS::Batch::JobQueue"
		Properties: {
			ComputeEnvironmentOrder: [...{
				ComputeEnvironment: string | fn.Fn
				Order:              int | fn.Fn
			}] | fn.If
			JobQueueName?: string | fn.Fn
			Priority:      int | fn.Fn
			State?:        string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
