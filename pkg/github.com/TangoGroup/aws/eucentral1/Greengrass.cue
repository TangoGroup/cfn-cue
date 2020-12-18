package eucentral1

import "github.com/TangoGroup/aws/fn"

#Greengrass: {
	#ConnectorDefinition: {
		Type:       "AWS::Greengrass::ConnectorDefinition"
		Properties: close({
			InitialVersion?: close({
				Connectors: [...close({
					ConnectorArn: string | fn.#Fn
					Id:           string | fn.#Fn
					Parameters?:  {
						[string]: _
					} | fn.#Fn
				})] | fn.If
			}) | fn.If
			Name:  string | fn.#Fn
			Tags?: {
				[string]: _
			} | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ConnectorDefinitionVersion: {
		Type:       "AWS::Greengrass::ConnectorDefinitionVersion"
		Properties: close({
			ConnectorDefinitionId: string | fn.#Fn
			Connectors:            [...close({
				ConnectorArn: string | fn.#Fn
				Id:           string | fn.#Fn
				Parameters?:  {
					[string]: _
				} | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#CoreDefinition: {
		Type:       "AWS::Greengrass::CoreDefinition"
		Properties: close({
			InitialVersion?: close({
				Cores: [...close({
					CertificateArn: string | fn.#Fn
					Id:             string | fn.#Fn
					SyncShadow?:    bool | fn.#Fn
					ThingArn:       string | fn.#Fn
				})] | fn.If
			}) | fn.If
			Name:  string | fn.#Fn
			Tags?: {
				[string]: _
			} | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#CoreDefinitionVersion: {
		Type:       "AWS::Greengrass::CoreDefinitionVersion"
		Properties: close({
			CoreDefinitionId: string | fn.#Fn
			Cores:            [...close({
				CertificateArn: string | fn.#Fn
				Id:             string | fn.#Fn
				SyncShadow?:    bool | fn.#Fn
				ThingArn:       string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#DeviceDefinition: {
		Type:       "AWS::Greengrass::DeviceDefinition"
		Properties: close({
			InitialVersion?: close({
				Devices: [...close({
					CertificateArn: string | fn.#Fn
					Id:             string | fn.#Fn
					SyncShadow?:    bool | fn.#Fn
					ThingArn:       string | fn.#Fn
				})] | fn.If
			}) | fn.If
			Name:  string | fn.#Fn
			Tags?: {
				[string]: _
			} | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#DeviceDefinitionVersion: {
		Type:       "AWS::Greengrass::DeviceDefinitionVersion"
		Properties: close({
			DeviceDefinitionId: string | fn.#Fn
			Devices:            [...close({
				CertificateArn: string | fn.#Fn
				Id:             string | fn.#Fn
				SyncShadow?:    bool | fn.#Fn
				ThingArn:       string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#FunctionDefinition: {
		Type:       "AWS::Greengrass::FunctionDefinition"
		Properties: close({
			InitialVersion?: close({
				DefaultConfig?: close({
					Execution: close({
						IsolationMode?: string | fn.#Fn
						RunAs?:         close({
							Gid?: int | fn.#Fn
							Uid?: int | fn.#Fn
						}) | fn.If
					}) | fn.If
				}) | fn.If
				Functions: [...close({
					FunctionArn:           string | fn.#Fn
					FunctionConfiguration: close({
						EncodingType?: string | fn.#Fn
						Environment?:  close({
							AccessSysfs?: bool | fn.#Fn
							Execution?:   close({
								IsolationMode?: string | fn.#Fn
								RunAs?:         close({
									Gid?: int | fn.#Fn
									Uid?: int | fn.#Fn
								}) | fn.If
							}) | fn.If
							ResourceAccessPolicies?: [...close({
								Permission?: string | fn.#Fn
								ResourceId:  string | fn.#Fn
							})] | fn.If
							Variables?: {
								[string]: _
							} | fn.#Fn
						}) | fn.If
						ExecArgs?:   string | fn.#Fn
						Executable?: string | fn.#Fn
						MemorySize?: int | fn.#Fn
						Pinned?:     bool | fn.#Fn
						Timeout?:    int | fn.#Fn
					}) | fn.If
					Id: string | fn.#Fn
				})] | fn.If
			}) | fn.If
			Name:  string | fn.#Fn
			Tags?: {
				[string]: _
			} | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#FunctionDefinitionVersion: {
		Type:       "AWS::Greengrass::FunctionDefinitionVersion"
		Properties: close({
			DefaultConfig?: close({
				Execution: close({
					IsolationMode?: string | fn.#Fn
					RunAs?:         close({
						Gid?: int | fn.#Fn
						Uid?: int | fn.#Fn
					}) | fn.If
				}) | fn.If
			}) | fn.If
			FunctionDefinitionId: string | fn.#Fn
			Functions:            [...close({
				FunctionArn:           string | fn.#Fn
				FunctionConfiguration: close({
					EncodingType?: string | fn.#Fn
					Environment?:  close({
						AccessSysfs?: bool | fn.#Fn
						Execution?:   close({
							IsolationMode?: string | fn.#Fn
							RunAs?:         close({
								Gid?: int | fn.#Fn
								Uid?: int | fn.#Fn
							}) | fn.If
						}) | fn.If
						ResourceAccessPolicies?: [...close({
							Permission?: string | fn.#Fn
							ResourceId:  string | fn.#Fn
						})] | fn.If
						Variables?: {
							[string]: _
						} | fn.#Fn
					}) | fn.If
					ExecArgs?:   string | fn.#Fn
					Executable?: string | fn.#Fn
					MemorySize?: int | fn.#Fn
					Pinned?:     bool | fn.#Fn
					Timeout?:    int | fn.#Fn
				}) | fn.If
				Id: string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Group: {
		Type:       "AWS::Greengrass::Group"
		Properties: close({
			InitialVersion?: close({
				ConnectorDefinitionVersionArn?:    string | fn.#Fn
				CoreDefinitionVersionArn?:         string | fn.#Fn
				DeviceDefinitionVersionArn?:       string | fn.#Fn
				FunctionDefinitionVersionArn?:     string | fn.#Fn
				LoggerDefinitionVersionArn?:       string | fn.#Fn
				ResourceDefinitionVersionArn?:     string | fn.#Fn
				SubscriptionDefinitionVersionArn?: string | fn.#Fn
			}) | fn.If
			Name:     string | fn.#Fn
			RoleArn?: string | fn.#Fn
			Tags?:    {
				[string]: _
			} | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#GroupVersion: {
		Type:       "AWS::Greengrass::GroupVersion"
		Properties: close({
			ConnectorDefinitionVersionArn?:    string | fn.#Fn
			CoreDefinitionVersionArn?:         string | fn.#Fn
			DeviceDefinitionVersionArn?:       string | fn.#Fn
			FunctionDefinitionVersionArn?:     string | fn.#Fn
			GroupId:                           string | fn.#Fn
			LoggerDefinitionVersionArn?:       string | fn.#Fn
			ResourceDefinitionVersionArn?:     string | fn.#Fn
			SubscriptionDefinitionVersionArn?: string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#LoggerDefinition: {
		Type:       "AWS::Greengrass::LoggerDefinition"
		Properties: close({
			InitialVersion?: close({
				Loggers: [...close({
					Component: string | fn.#Fn
					Id:        string | fn.#Fn
					Level:     string | fn.#Fn
					Space?:    int | fn.#Fn
					Type:      string | fn.#Fn
				})] | fn.If
			}) | fn.If
			Name:  string | fn.#Fn
			Tags?: {
				[string]: _
			} | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#LoggerDefinitionVersion: {
		Type:       "AWS::Greengrass::LoggerDefinitionVersion"
		Properties: close({
			LoggerDefinitionId: string | fn.#Fn
			Loggers:            [...close({
				Component: string | fn.#Fn
				Id:        string | fn.#Fn
				Level:     string | fn.#Fn
				Space?:    int | fn.#Fn
				Type:      string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ResourceDefinition: {
		Type:       "AWS::Greengrass::ResourceDefinition"
		Properties: close({
			InitialVersion?: close({
				Resources: [...close({
					Id:                    string | fn.#Fn
					Name:                  string | fn.#Fn
					ResourceDataContainer: close({
						LocalDeviceResourceData?: close({
							GroupOwnerSetting?: close({
								AutoAddGroupOwner: bool | fn.#Fn
								GroupOwner?:       string | fn.#Fn
							}) | fn.If
							SourcePath: string | fn.#Fn
						}) | fn.If
						LocalVolumeResourceData?: close({
							DestinationPath:    string | fn.#Fn
							GroupOwnerSetting?: close({
								AutoAddGroupOwner: bool | fn.#Fn
								GroupOwner?:       string | fn.#Fn
							}) | fn.If
							SourcePath: string | fn.#Fn
						}) | fn.If
						S3MachineLearningModelResourceData?: close({
							DestinationPath: string | fn.#Fn
							OwnerSetting?:   close({
								GroupOwner:      string | fn.#Fn
								GroupPermission: string | fn.#Fn
							}) | fn.If
							S3Uri: string | fn.#Fn
						}) | fn.If
						SageMakerMachineLearningModelResourceData?: close({
							DestinationPath: string | fn.#Fn
							OwnerSetting?:   close({
								GroupOwner:      string | fn.#Fn
								GroupPermission: string | fn.#Fn
							}) | fn.If
							SageMakerJobArn: string | fn.#Fn
						}) | fn.If
						SecretsManagerSecretResourceData?: close({
							ARN:                                string | fn.#Fn
							AdditionalStagingLabelsToDownload?: [...(string | fn.#Fn)] | (string | fn.#Fn)
						}) | fn.If
					}) | fn.If
				})] | fn.If
			}) | fn.If
			Name:  string | fn.#Fn
			Tags?: {
				[string]: _
			} | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ResourceDefinitionVersion: {
		Type:       "AWS::Greengrass::ResourceDefinitionVersion"
		Properties: close({
			ResourceDefinitionId: string | fn.#Fn
			Resources:            [...close({
				Id:                    string | fn.#Fn
				Name:                  string | fn.#Fn
				ResourceDataContainer: close({
					LocalDeviceResourceData?: close({
						GroupOwnerSetting?: close({
							AutoAddGroupOwner: bool | fn.#Fn
							GroupOwner?:       string | fn.#Fn
						}) | fn.If
						SourcePath: string | fn.#Fn
					}) | fn.If
					LocalVolumeResourceData?: close({
						DestinationPath:    string | fn.#Fn
						GroupOwnerSetting?: close({
							AutoAddGroupOwner: bool | fn.#Fn
							GroupOwner?:       string | fn.#Fn
						}) | fn.If
						SourcePath: string | fn.#Fn
					}) | fn.If
					S3MachineLearningModelResourceData?: close({
						DestinationPath: string | fn.#Fn
						OwnerSetting?:   close({
							GroupOwner:      string | fn.#Fn
							GroupPermission: string | fn.#Fn
						}) | fn.If
						S3Uri: string | fn.#Fn
					}) | fn.If
					SageMakerMachineLearningModelResourceData?: close({
						DestinationPath: string | fn.#Fn
						OwnerSetting?:   close({
							GroupOwner:      string | fn.#Fn
							GroupPermission: string | fn.#Fn
						}) | fn.If
						SageMakerJobArn: string | fn.#Fn
					}) | fn.If
					SecretsManagerSecretResourceData?: close({
						ARN:                                string | fn.#Fn
						AdditionalStagingLabelsToDownload?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					}) | fn.If
				}) | fn.If
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#SubscriptionDefinition: {
		Type:       "AWS::Greengrass::SubscriptionDefinition"
		Properties: close({
			InitialVersion?: close({
				Subscriptions: [...close({
					Id:      string | fn.#Fn
					Source:  string | fn.#Fn
					Subject: string | fn.#Fn
					Target:  string | fn.#Fn
				})] | fn.If
			}) | fn.If
			Name:  string | fn.#Fn
			Tags?: {
				[string]: _
			} | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#SubscriptionDefinitionVersion: {
		Type:       "AWS::Greengrass::SubscriptionDefinitionVersion"
		Properties: close({
			SubscriptionDefinitionId: string | fn.#Fn
			Subscriptions:            [...close({
				Id:      string | fn.#Fn
				Source:  string | fn.#Fn
				Subject: string | fn.#Fn
				Target:  string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
