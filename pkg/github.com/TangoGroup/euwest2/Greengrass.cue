package euwest2

import "github.com/TangoGroup/fn"

Greengrass :: {
	ConnectorDefinition :: {
		Type: "AWS::Greengrass::ConnectorDefinition"
		Properties: {
			InitialVersion?: Connectors: [...{
				ConnectorArn: string | fn.Fn
				Id:           string | fn.Fn
				Parameters?:  {
					[string]: _
				} | fn.Fn
			}]
			Name:  string | fn.Fn
			Tags?: {
				[string]: _
			} | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	ConnectorDefinitionVersion :: {
		Type: "AWS::Greengrass::ConnectorDefinitionVersion"
		Properties: {
			ConnectorDefinitionId: string | fn.Fn
			Connectors: [...{
				ConnectorArn: string | fn.Fn
				Id:           string | fn.Fn
				Parameters?:  {
					[string]: _
				} | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	CoreDefinition :: {
		Type: "AWS::Greengrass::CoreDefinition"
		Properties: {
			InitialVersion?: Cores: [...{
				CertificateArn: string | fn.Fn
				Id:             string | fn.Fn
				SyncShadow?:    bool | fn.Fn
				ThingArn:       string | fn.Fn
			}]
			Name:  string | fn.Fn
			Tags?: {
				[string]: _
			} | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	CoreDefinitionVersion :: {
		Type: "AWS::Greengrass::CoreDefinitionVersion"
		Properties: {
			CoreDefinitionId: string | fn.Fn
			Cores: [...{
				CertificateArn: string | fn.Fn
				Id:             string | fn.Fn
				SyncShadow?:    bool | fn.Fn
				ThingArn:       string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	DeviceDefinition :: {
		Type: "AWS::Greengrass::DeviceDefinition"
		Properties: {
			InitialVersion?: Devices: [...{
				CertificateArn: string | fn.Fn
				Id:             string | fn.Fn
				SyncShadow?:    bool | fn.Fn
				ThingArn:       string | fn.Fn
			}]
			Name:  string | fn.Fn
			Tags?: {
				[string]: _
			} | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	DeviceDefinitionVersion :: {
		Type: "AWS::Greengrass::DeviceDefinitionVersion"
		Properties: {
			DeviceDefinitionId: string | fn.Fn
			Devices: [...{
				CertificateArn: string | fn.Fn
				Id:             string | fn.Fn
				SyncShadow?:    bool | fn.Fn
				ThingArn:       string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	FunctionDefinition :: {
		Type: "AWS::Greengrass::FunctionDefinition"
		Properties: {
			InitialVersion?: {
				DefaultConfig?: Execution: {
					IsolationMode?: string | fn.Fn
					RunAs?: {
						Gid?: int | fn.Fn
						Uid?: int | fn.Fn
					}
				}
				Functions: [...{
					FunctionArn: string | fn.Fn
					FunctionConfiguration: {
						EncodingType?: string | fn.Fn
						Environment?: {
							AccessSysfs?: bool | fn.Fn
							Execution?: {
								IsolationMode?: string | fn.Fn
								RunAs?: {
									Gid?: int | fn.Fn
									Uid?: int | fn.Fn
								}
							}
							ResourceAccessPolicies?: [...{
								Permission?: string | fn.Fn
								ResourceId:  string | fn.Fn
							}]
							Variables?: {
								[string]: _
							} | fn.Fn
						}
						ExecArgs?:   string | fn.Fn
						Executable?: string | fn.Fn
						MemorySize?: int | fn.Fn
						Pinned?:     bool | fn.Fn
						Timeout?:    int | fn.Fn
					}
					Id: string | fn.Fn
				}]
			}
			Name:  string | fn.Fn
			Tags?: {
				[string]: _
			} | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	FunctionDefinitionVersion :: {
		Type: "AWS::Greengrass::FunctionDefinitionVersion"
		Properties: {
			DefaultConfig?: Execution: {
				IsolationMode?: string | fn.Fn
				RunAs?: {
					Gid?: int | fn.Fn
					Uid?: int | fn.Fn
				}
			}
			FunctionDefinitionId: string | fn.Fn
			Functions: [...{
				FunctionArn: string | fn.Fn
				FunctionConfiguration: {
					EncodingType?: string | fn.Fn
					Environment?: {
						AccessSysfs?: bool | fn.Fn
						Execution?: {
							IsolationMode?: string | fn.Fn
							RunAs?: {
								Gid?: int | fn.Fn
								Uid?: int | fn.Fn
							}
						}
						ResourceAccessPolicies?: [...{
							Permission?: string | fn.Fn
							ResourceId:  string | fn.Fn
						}]
						Variables?: {
							[string]: _
						} | fn.Fn
					}
					ExecArgs?:   string | fn.Fn
					Executable?: string | fn.Fn
					MemorySize?: int | fn.Fn
					Pinned?:     bool | fn.Fn
					Timeout?:    int | fn.Fn
				}
				Id: string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	Group :: {
		Type: "AWS::Greengrass::Group"
		Properties: {
			InitialVersion?: {
				ConnectorDefinitionVersionArn?:    string | fn.Fn
				CoreDefinitionVersionArn?:         string | fn.Fn
				DeviceDefinitionVersionArn?:       string | fn.Fn
				FunctionDefinitionVersionArn?:     string | fn.Fn
				LoggerDefinitionVersionArn?:       string | fn.Fn
				ResourceDefinitionVersionArn?:     string | fn.Fn
				SubscriptionDefinitionVersionArn?: string | fn.Fn
			}
			Name:     string | fn.Fn
			RoleArn?: string | fn.Fn
			Tags?:    {
				[string]: _
			} | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	GroupVersion :: {
		Type: "AWS::Greengrass::GroupVersion"
		Properties: {
			ConnectorDefinitionVersionArn?:    string | fn.Fn
			CoreDefinitionVersionArn?:         string | fn.Fn
			DeviceDefinitionVersionArn?:       string | fn.Fn
			FunctionDefinitionVersionArn?:     string | fn.Fn
			GroupId:                           string | fn.Fn
			LoggerDefinitionVersionArn?:       string | fn.Fn
			ResourceDefinitionVersionArn?:     string | fn.Fn
			SubscriptionDefinitionVersionArn?: string | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	LoggerDefinition :: {
		Type: "AWS::Greengrass::LoggerDefinition"
		Properties: {
			InitialVersion?: Loggers: [...{
				Component: string | fn.Fn
				Id:        string | fn.Fn
				Level:     string | fn.Fn
				Space?:    int | fn.Fn
				Type:      string | fn.Fn
			}]
			Name:  string | fn.Fn
			Tags?: {
				[string]: _
			} | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	LoggerDefinitionVersion :: {
		Type: "AWS::Greengrass::LoggerDefinitionVersion"
		Properties: {
			LoggerDefinitionId: string | fn.Fn
			Loggers: [...{
				Component: string | fn.Fn
				Id:        string | fn.Fn
				Level:     string | fn.Fn
				Space?:    int | fn.Fn
				Type:      string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	ResourceDefinition :: {
		Type: "AWS::Greengrass::ResourceDefinition"
		Properties: {
			InitialVersion?: Resources: [...{
				Id:   string | fn.Fn
				Name: string | fn.Fn
				ResourceDataContainer: {
					LocalDeviceResourceData?: {
						GroupOwnerSetting?: {
							AutoAddGroupOwner: bool | fn.Fn
							GroupOwner?:       string | fn.Fn
						}
						SourcePath: string | fn.Fn
					}
					LocalVolumeResourceData?: {
						DestinationPath: string | fn.Fn
						GroupOwnerSetting?: {
							AutoAddGroupOwner: bool | fn.Fn
							GroupOwner?:       string | fn.Fn
						}
						SourcePath: string | fn.Fn
					}
					S3MachineLearningModelResourceData?: {
						DestinationPath: string | fn.Fn
						S3Uri:           string | fn.Fn
					}
					SageMakerMachineLearningModelResourceData?: {
						DestinationPath: string | fn.Fn
						SageMakerJobArn: string | fn.Fn
					}
					SecretsManagerSecretResourceData?: {
						ARN: string | fn.Fn
						AdditionalStagingLabelsToDownload?: [...(string | fn.Fn)]
					}
				}
			}]
			Name:  string | fn.Fn
			Tags?: {
				[string]: _
			} | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	ResourceDefinitionVersion :: {
		Type: "AWS::Greengrass::ResourceDefinitionVersion"
		Properties: {
			ResourceDefinitionId: string | fn.Fn
			Resources: [...{
				Id:   string | fn.Fn
				Name: string | fn.Fn
				ResourceDataContainer: {
					LocalDeviceResourceData?: {
						GroupOwnerSetting?: {
							AutoAddGroupOwner: bool | fn.Fn
							GroupOwner?:       string | fn.Fn
						}
						SourcePath: string | fn.Fn
					}
					LocalVolumeResourceData?: {
						DestinationPath: string | fn.Fn
						GroupOwnerSetting?: {
							AutoAddGroupOwner: bool | fn.Fn
							GroupOwner?:       string | fn.Fn
						}
						SourcePath: string | fn.Fn
					}
					S3MachineLearningModelResourceData?: {
						DestinationPath: string | fn.Fn
						S3Uri:           string | fn.Fn
					}
					SageMakerMachineLearningModelResourceData?: {
						DestinationPath: string | fn.Fn
						SageMakerJobArn: string | fn.Fn
					}
					SecretsManagerSecretResourceData?: {
						ARN: string | fn.Fn
						AdditionalStagingLabelsToDownload?: [...(string | fn.Fn)]
					}
				}
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	SubscriptionDefinition :: {
		Type: "AWS::Greengrass::SubscriptionDefinition"
		Properties: {
			InitialVersion?: Subscriptions: [...{
				Id:      string | fn.Fn
				Source:  string | fn.Fn
				Subject: string | fn.Fn
				Target:  string | fn.Fn
			}]
			Name:  string | fn.Fn
			Tags?: {
				[string]: _
			} | fn.Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
	SubscriptionDefinitionVersion :: {
		Type: "AWS::Greengrass::SubscriptionDefinitionVersion"
		Properties: {
			SubscriptionDefinitionId: string | fn.Fn
			Subscriptions: [...{
				Id:      string | fn.Fn
				Source:  string | fn.Fn
				Subject: string | fn.Fn
				Target:  string | fn.Fn
			}]
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
	}
}
