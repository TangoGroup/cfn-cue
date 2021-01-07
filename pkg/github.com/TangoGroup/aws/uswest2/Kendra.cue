package uswest2

import "github.com/TangoGroup/aws/fn"

#Kendra: {
	#DataSource: {
		Type: "AWS::Kendra::DataSource"
		Properties: {
			DataSourceConfiguration?: {
				ConfluenceConfiguration?: {
					AttachmentConfiguration?: {
						AttachmentFieldMappings?: {
							ConfluenceAttachmentFieldMappingsList?: [...{
								DataSourceFieldName: string | fn.#Fn
								DateFieldFormat?:    string | fn.#Fn
								IndexFieldName:      string | fn.#Fn
							}] | fn.#If
						} | fn.#If
						CrawlAttachments?: bool | fn.#Fn
					} | fn.#If
					BlogConfiguration?: {
						BlogFieldMappings?: {
							ConfluenceBlogFieldMappingsList?: [...{
								DataSourceFieldName: string | fn.#Fn
								DateFieldFormat?:    string | fn.#Fn
								IndexFieldName:      string | fn.#Fn
							}] | fn.#If
						} | fn.#If
					} | fn.#If
					ExclusionPatterns?: {
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					} | fn.#If
					InclusionPatterns?: {
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					} | fn.#If
					PageConfiguration?: {
						PageFieldMappings?: {
							ConfluencePageFieldMappingsList?: [...{
								DataSourceFieldName: string | fn.#Fn
								DateFieldFormat?:    string | fn.#Fn
								IndexFieldName:      string | fn.#Fn
							}] | fn.#If
						} | fn.#If
					} | fn.#If
					SecretArn:           string | fn.#Fn
					ServerUrl:           string | fn.#Fn
					SpaceConfiguration?: {
						CrawlArchivedSpaces?: bool | fn.#Fn
						CrawlPersonalSpaces?: bool | fn.#Fn
						ExcludeSpaces?:       {
							ConfluenceSpaceList?: [...(string | fn.#Fn)] | (string | fn.#Fn)
						} | fn.#If
						IncludeSpaces?: {
							ConfluenceSpaceList?: [...(string | fn.#Fn)] | (string | fn.#Fn)
						} | fn.#If
						SpaceFieldMappings?: {
							ConfluenceSpaceFieldMappingsList?: [...{
								DataSourceFieldName: string | fn.#Fn
								DateFieldFormat?:    string | fn.#Fn
								IndexFieldName:      string | fn.#Fn
							}] | fn.#If
						} | fn.#If
					} | fn.#If
					Version:           string | fn.#Fn
					VpcConfiguration?: {
						SecurityGroupIds: [...(string | fn.#Fn)] | (string | fn.#Fn)
						SubnetIds:        [...(string | fn.#Fn)] | (string | fn.#Fn)
					} | fn.#If
				} | fn.#If
				DatabaseConfiguration?: {
					AclConfiguration?: {
						AllowedGroupsColumnName: string | fn.#Fn
					} | fn.#If
					ColumnConfiguration: {
						ChangeDetectingColumns: {
							ChangeDetectingColumns?: [...(string | fn.#Fn)] | (string | fn.#Fn)
						} | fn.#If
						DocumentDataColumnName:   string | fn.#Fn
						DocumentIdColumnName:     string | fn.#Fn
						DocumentTitleColumnName?: string | fn.#Fn
						FieldMappings?:           {
							DataSourceToIndexFieldMappingList?: [...{
								DataSourceFieldName: string | fn.#Fn
								DateFieldFormat?:    string | fn.#Fn
								IndexFieldName:      string | fn.#Fn
							}] | fn.#If
						} | fn.#If
					} | fn.#If
					ConnectionConfiguration: {
						DatabaseHost: string | fn.#Fn
						DatabaseName: string | fn.#Fn
						DatabasePort: int | fn.#Fn
						SecretArn:    string | fn.#Fn
						TableName:    string | fn.#Fn
					} | fn.#If
					DatabaseEngineType: string | fn.#Fn
					SqlConfiguration?:  {
						QueryIdentifiersEnclosingOption?: string | fn.#Fn
					} | fn.#If
					VpcConfiguration?: {
						SecurityGroupIds: [...(string | fn.#Fn)] | (string | fn.#Fn)
						SubnetIds:        [...(string | fn.#Fn)] | (string | fn.#Fn)
					} | fn.#If
				} | fn.#If
				OneDriveConfiguration?: {
					DisableLocalGroups?: bool | fn.#Fn
					ExclusionPatterns?:  {
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					} | fn.#If
					FieldMappings?: {
						DataSourceToIndexFieldMappingList?: [...{
							DataSourceFieldName: string | fn.#Fn
							DateFieldFormat?:    string | fn.#Fn
							IndexFieldName:      string | fn.#Fn
						}] | fn.#If
					} | fn.#If
					InclusionPatterns?: {
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					} | fn.#If
					OneDriveUsers: {
						OneDriveUserList?: {
							OneDriveUserList?: [...(string | fn.#Fn)] | (string | fn.#Fn)
						} | fn.#If
						OneDriveUserS3Path?: {
							Bucket: string | fn.#Fn
							Key:    string | fn.#Fn
						} | fn.#If
					} | fn.#If
					SecretArn:    string | fn.#Fn
					TenantDomain: string | fn.#Fn
				} | fn.#If
				S3Configuration?: {
					AccessControlListConfiguration?: {
						KeyPath?: string | fn.#Fn
					} | fn.#If
					BucketName:                      string | fn.#Fn
					DocumentsMetadataConfiguration?: {
						S3Prefix?: string | fn.#Fn
					} | fn.#If
					ExclusionPatterns?: {
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					} | fn.#If
					InclusionPatterns?: {
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					} | fn.#If
					InclusionPrefixes?: {
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					} | fn.#If
				} | fn.#If
				SalesforceConfiguration?: {
					ChatterFeedConfiguration?: {
						DocumentDataFieldName:   string | fn.#Fn
						DocumentTitleFieldName?: string | fn.#Fn
						FieldMappings?:          {
							DataSourceToIndexFieldMappingList?: [...{
								DataSourceFieldName: string | fn.#Fn
								DateFieldFormat?:    string | fn.#Fn
								IndexFieldName:      string | fn.#Fn
							}] | fn.#If
						} | fn.#If
						IncludeFilterTypes?: {
							SalesforceChatterFeedIncludeFilterTypes?: [...(string | fn.#Fn)] | (string | fn.#Fn)
						} | fn.#If
					} | fn.#If
					CrawlAttachments?:              bool | fn.#Fn
					ExcludeAttachmentFilePatterns?: {
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					} | fn.#If
					IncludeAttachmentFilePatterns?: {
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					} | fn.#If
					KnowledgeArticleConfiguration?: {
						CustomKnowledgeArticleTypeConfigurations?: {
							SalesforceCustomKnowledgeArticleTypeConfigurationList?: [...{
								DocumentDataFieldName:   string | fn.#Fn
								DocumentTitleFieldName?: string | fn.#Fn
								FieldMappings?:          {
									DataSourceToIndexFieldMappingList?: [...{
										DataSourceFieldName: string | fn.#Fn
										DateFieldFormat?:    string | fn.#Fn
										IndexFieldName:      string | fn.#Fn
									}] | fn.#If
								} | fn.#If
								Name: string | fn.#Fn
							}] | fn.#If
						} | fn.#If
						IncludedStates: {
							SalesforceKnowledgeArticleStateList?: [...(string | fn.#Fn)] | (string | fn.#Fn)
						} | fn.#If
						StandardKnowledgeArticleTypeConfiguration?: {
							DocumentDataFieldName:   string | fn.#Fn
							DocumentTitleFieldName?: string | fn.#Fn
							FieldMappings?:          {
								DataSourceToIndexFieldMappingList?: [...{
									DataSourceFieldName: string | fn.#Fn
									DateFieldFormat?:    string | fn.#Fn
									IndexFieldName:      string | fn.#Fn
								}] | fn.#If
							} | fn.#If
						} | fn.#If
					} | fn.#If
					SecretArn:                              string | fn.#Fn
					ServerUrl:                              string | fn.#Fn
					StandardObjectAttachmentConfiguration?: {
						DocumentTitleFieldName?: string | fn.#Fn
						FieldMappings?:          {
							DataSourceToIndexFieldMappingList?: [...{
								DataSourceFieldName: string | fn.#Fn
								DateFieldFormat?:    string | fn.#Fn
								IndexFieldName:      string | fn.#Fn
							}] | fn.#If
						} | fn.#If
					} | fn.#If
					StandardObjectConfigurations?: {
						SalesforceStandardObjectConfigurationList?: [...{
							DocumentDataFieldName:   string | fn.#Fn
							DocumentTitleFieldName?: string | fn.#Fn
							FieldMappings?:          {
								DataSourceToIndexFieldMappingList?: [...{
									DataSourceFieldName: string | fn.#Fn
									DateFieldFormat?:    string | fn.#Fn
									IndexFieldName:      string | fn.#Fn
								}] | fn.#If
							} | fn.#If
							Name: string | fn.#Fn
						}] | fn.#If
					} | fn.#If
				} | fn.#If
				ServiceNowConfiguration?: {
					HostUrl:                        string | fn.#Fn
					KnowledgeArticleConfiguration?: {
						CrawlAttachments?:              bool | fn.#Fn
						DocumentDataFieldName:          string | fn.#Fn
						DocumentTitleFieldName?:        string | fn.#Fn
						ExcludeAttachmentFilePatterns?: {
							DataSourceInclusionsExclusionsStrings?: [...(string | fn.#Fn)] | (string | fn.#Fn)
						} | fn.#If
						FieldMappings?: {
							DataSourceToIndexFieldMappingList?: [...{
								DataSourceFieldName: string | fn.#Fn
								DateFieldFormat?:    string | fn.#Fn
								IndexFieldName:      string | fn.#Fn
							}] | fn.#If
						} | fn.#If
						IncludeAttachmentFilePatterns?: {
							DataSourceInclusionsExclusionsStrings?: [...(string | fn.#Fn)] | (string | fn.#Fn)
						} | fn.#If
					} | fn.#If
					SecretArn:                    string | fn.#Fn
					ServiceCatalogConfiguration?: {
						CrawlAttachments?:              bool | fn.#Fn
						DocumentDataFieldName:          string | fn.#Fn
						DocumentTitleFieldName?:        string | fn.#Fn
						ExcludeAttachmentFilePatterns?: {
							DataSourceInclusionsExclusionsStrings?: [...(string | fn.#Fn)] | (string | fn.#Fn)
						} | fn.#If
						FieldMappings?: {
							DataSourceToIndexFieldMappingList?: [...{
								DataSourceFieldName: string | fn.#Fn
								DateFieldFormat?:    string | fn.#Fn
								IndexFieldName:      string | fn.#Fn
							}] | fn.#If
						} | fn.#If
						IncludeAttachmentFilePatterns?: {
							DataSourceInclusionsExclusionsStrings?: [...(string | fn.#Fn)] | (string | fn.#Fn)
						} | fn.#If
					} | fn.#If
					ServiceNowBuildVersion: string | fn.#Fn
				} | fn.#If
				SharePointConfiguration?: {
					CrawlAttachments?:       bool | fn.#Fn
					DisableLocalGroups?:     bool | fn.#Fn
					DocumentTitleFieldName?: string | fn.#Fn
					ExclusionPatterns?:      {
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					} | fn.#If
					FieldMappings?: {
						DataSourceToIndexFieldMappingList?: [...{
							DataSourceFieldName: string | fn.#Fn
							DateFieldFormat?:    string | fn.#Fn
							IndexFieldName:      string | fn.#Fn
						}] | fn.#If
					} | fn.#If
					InclusionPatterns?: {
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					} | fn.#If
					SecretArn:         string | fn.#Fn
					SharePointVersion: string | fn.#Fn
					Urls:              [...(string | fn.#Fn)] | (string | fn.#Fn)
					UseChangeLog?:     bool | fn.#Fn
					VpcConfiguration?: {
						SecurityGroupIds: [...(string | fn.#Fn)] | (string | fn.#Fn)
						SubnetIds:        [...(string | fn.#Fn)] | (string | fn.#Fn)
					} | fn.#If
				} | fn.#If
			} | fn.#If
			Description?: string | fn.#Fn
			IndexId:      string | fn.#Fn
			Name:         string | fn.#Fn
			RoleArn?:     string | fn.#Fn
			Schedule?:    string | fn.#Fn
			Tags?:        {
				TagList?: [...{
					Key:   string | fn.#Fn
					Value: string | fn.#Fn
				}] | fn.#If
			} | fn.#If
			Type: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Faq: {
		Type: "AWS::Kendra::Faq"
		Properties: {
			Description?: string | fn.#Fn
			FileFormat?:  string | fn.#Fn
			IndexId:      string | fn.#Fn
			Name:         string | fn.#Fn
			RoleArn:      string | fn.#Fn
			S3Path:       {
				Bucket: string | fn.#Fn
				Key:    string | fn.#Fn
			} | fn.#If
			Tags?: {
				TagList?: [...{
					Key:   string | fn.#Fn
					Value: string | fn.#Fn
				}] | fn.#If
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Index: {
		Type: "AWS::Kendra::Index"
		Properties: {
			CapacityUnits?: {
				QueryCapacityUnits:   int | fn.#Fn
				StorageCapacityUnits: int | fn.#Fn
			} | fn.#If
			Description?:                    string | fn.#Fn
			DocumentMetadataConfigurations?: {
				DocumentMetadataConfigurationList?: [...{
					Name:       string | fn.#Fn
					Relevance?: {
						Duration?:             string | fn.#Fn
						Freshness?:            bool | fn.#Fn
						Importance?:           int | fn.#Fn
						RankOrder?:            string | fn.#Fn
						ValueImportanceItems?: {
							ValueImportanceItems?: [...{
								[string]: _
							}] | fn.#If
						} | fn.#If
					} | fn.#If
					Search?: {
						Displayable?: bool | fn.#Fn
						Facetable?:   bool | fn.#Fn
						Searchable?:  bool | fn.#Fn
						Sortable?:    bool | fn.#Fn
					} | fn.#If
					Type: string | fn.#Fn
				}] | fn.#If
			} | fn.#If
			Edition:                            string | fn.#Fn
			Name:                               string | fn.#Fn
			RoleArn:                            string | fn.#Fn
			ServerSideEncryptionConfiguration?: {
				KmsKeyId?: string | fn.#Fn
			} | fn.#If
			Tags?: {
				TagList?: [...{
					Key:   string | fn.#Fn
					Value: string | fn.#Fn
				}] | fn.#If
			} | fn.#If
			UserContextPolicy?:       string | fn.#Fn
			UserTokenConfigurations?: {
				UserTokenConfigurationList?: [...{
					JsonTokenTypeConfiguration?: {
						GroupAttributeField:    string | fn.#Fn
						UserNameAttributeField: string | fn.#Fn
					} | fn.#If
					JwtTokenTypeConfiguration?: {
						ClaimRegex?:             string | fn.#Fn
						GroupAttributeField?:    string | fn.#Fn
						Issuer?:                 string | fn.#Fn
						KeyLocation:             string | fn.#Fn
						SecretManagerArn?:       string | fn.#Fn
						URL?:                    string | fn.#Fn
						UserNameAttributeField?: string | fn.#Fn
					} | fn.#If
				}] | fn.#If
			} | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
