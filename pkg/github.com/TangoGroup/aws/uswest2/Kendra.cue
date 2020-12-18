package uswest2

import "github.com/TangoGroup/aws/fn"

#Kendra: {
	#DataSource: {
		Type:       "AWS::Kendra::DataSource"
		Properties: close({
			DataSourceConfiguration?: close({
				ConfluenceConfiguration?: close({
					AttachmentConfiguration?: close({
						AttachmentFieldMappings?: close({
							ConfluenceAttachmentFieldMappingsList?: [...close({
								DataSourceFieldName: string | fn.#Fn
								DateFieldFormat?:    string | fn.#Fn
								IndexFieldName:      string | fn.#Fn
							})] | fn.If
						}) | fn.If
						CrawlAttachments?: bool | fn.#Fn
					}) | fn.If
					BlogConfiguration?: close({
						BlogFieldMappings?: close({
							ConfluenceBlogFieldMappingsList?: [...close({
								DataSourceFieldName: string | fn.#Fn
								DateFieldFormat?:    string | fn.#Fn
								IndexFieldName:      string | fn.#Fn
							})] | fn.If
						}) | fn.If
					}) | fn.If
					ExclusionPatterns?: close({
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					}) | fn.If
					InclusionPatterns?: close({
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					}) | fn.If
					PageConfiguration?: close({
						PageFieldMappings?: close({
							ConfluencePageFieldMappingsList?: [...close({
								DataSourceFieldName: string | fn.#Fn
								DateFieldFormat?:    string | fn.#Fn
								IndexFieldName:      string | fn.#Fn
							})] | fn.If
						}) | fn.If
					}) | fn.If
					SecretArn:           string | fn.#Fn
					ServerUrl:           string | fn.#Fn
					SpaceConfiguration?: close({
						CrawlArchivedSpaces?: bool | fn.#Fn
						CrawlPersonalSpaces?: bool | fn.#Fn
						ExcludeSpaces?:       close({
							ConfluenceSpaceList?: [...(string | fn.#Fn)] | (string | fn.#Fn)
						}) | fn.If
						IncludeSpaces?: close({
							ConfluenceSpaceList?: [...(string | fn.#Fn)] | (string | fn.#Fn)
						}) | fn.If
						SpaceFieldMappings?: close({
							ConfluenceSpaceFieldMappingsList?: [...close({
								DataSourceFieldName: string | fn.#Fn
								DateFieldFormat?:    string | fn.#Fn
								IndexFieldName:      string | fn.#Fn
							})] | fn.If
						}) | fn.If
					}) | fn.If
					Version:           string | fn.#Fn
					VpcConfiguration?: close({
						SecurityGroupIds: [...(string | fn.#Fn)] | (string | fn.#Fn)
						SubnetIds:        [...(string | fn.#Fn)] | (string | fn.#Fn)
					}) | fn.If
				}) | fn.If
				DatabaseConfiguration?: close({
					AclConfiguration?: close({
						AllowedGroupsColumnName: string | fn.#Fn
					}) | fn.If
					ColumnConfiguration: close({
						ChangeDetectingColumns: close({
							ChangeDetectingColumns?: [...(string | fn.#Fn)] | (string | fn.#Fn)
						}) | fn.If
						DocumentDataColumnName:   string | fn.#Fn
						DocumentIdColumnName:     string | fn.#Fn
						DocumentTitleColumnName?: string | fn.#Fn
						FieldMappings?:           close({
							DataSourceToIndexFieldMappingList?: [...close({
								DataSourceFieldName: string | fn.#Fn
								DateFieldFormat?:    string | fn.#Fn
								IndexFieldName:      string | fn.#Fn
							})] | fn.If
						}) | fn.If
					}) | fn.If
					ConnectionConfiguration: close({
						DatabaseHost: string | fn.#Fn
						DatabaseName: string | fn.#Fn
						DatabasePort: int | fn.#Fn
						SecretArn:    string | fn.#Fn
						TableName:    string | fn.#Fn
					}) | fn.If
					DatabaseEngineType: string | fn.#Fn
					SqlConfiguration?:  close({
						QueryIdentifiersEnclosingOption?: string | fn.#Fn
					}) | fn.If
					VpcConfiguration?: close({
						SecurityGroupIds: [...(string | fn.#Fn)] | (string | fn.#Fn)
						SubnetIds:        [...(string | fn.#Fn)] | (string | fn.#Fn)
					}) | fn.If
				}) | fn.If
				OneDriveConfiguration?: close({
					DisableLocalGroups?: bool | fn.#Fn
					ExclusionPatterns?:  close({
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					}) | fn.If
					FieldMappings?: close({
						DataSourceToIndexFieldMappingList?: [...close({
							DataSourceFieldName: string | fn.#Fn
							DateFieldFormat?:    string | fn.#Fn
							IndexFieldName:      string | fn.#Fn
						})] | fn.If
					}) | fn.If
					InclusionPatterns?: close({
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					}) | fn.If
					OneDriveUsers: close({
						OneDriveUserList?: close({
							OneDriveUserList?: [...(string | fn.#Fn)] | (string | fn.#Fn)
						}) | fn.If
						OneDriveUserS3Path?: close({
							Bucket: string | fn.#Fn
							Key:    string | fn.#Fn
						}) | fn.If
					}) | fn.If
					SecretArn:    string | fn.#Fn
					TenantDomain: string | fn.#Fn
				}) | fn.If
				S3Configuration?: close({
					AccessControlListConfiguration?: close({
						KeyPath?: string | fn.#Fn
					}) | fn.If
					BucketName:                      string | fn.#Fn
					DocumentsMetadataConfiguration?: close({
						S3Prefix?: string | fn.#Fn
					}) | fn.If
					ExclusionPatterns?: close({
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					}) | fn.If
					InclusionPatterns?: close({
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					}) | fn.If
					InclusionPrefixes?: close({
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					}) | fn.If
				}) | fn.If
				SalesforceConfiguration?: close({
					ChatterFeedConfiguration?: close({
						DocumentDataFieldName:   string | fn.#Fn
						DocumentTitleFieldName?: string | fn.#Fn
						FieldMappings?:          close({
							DataSourceToIndexFieldMappingList?: [...close({
								DataSourceFieldName: string | fn.#Fn
								DateFieldFormat?:    string | fn.#Fn
								IndexFieldName:      string | fn.#Fn
							})] | fn.If
						}) | fn.If
						IncludeFilterTypes?: close({
							SalesforceChatterFeedIncludeFilterTypes?: [...(string | fn.#Fn)] | (string | fn.#Fn)
						}) | fn.If
					}) | fn.If
					CrawlAttachments?:              bool | fn.#Fn
					ExcludeAttachmentFilePatterns?: close({
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					}) | fn.If
					IncludeAttachmentFilePatterns?: close({
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					}) | fn.If
					KnowledgeArticleConfiguration?: close({
						CustomKnowledgeArticleTypeConfigurations?: close({
							SalesforceCustomKnowledgeArticleTypeConfigurationList?: [...close({
								DocumentDataFieldName:   string | fn.#Fn
								DocumentTitleFieldName?: string | fn.#Fn
								FieldMappings?:          close({
									DataSourceToIndexFieldMappingList?: [...close({
										DataSourceFieldName: string | fn.#Fn
										DateFieldFormat?:    string | fn.#Fn
										IndexFieldName:      string | fn.#Fn
									})] | fn.If
								}) | fn.If
								Name: string | fn.#Fn
							})] | fn.If
						}) | fn.If
						IncludedStates: close({
							SalesforceKnowledgeArticleStateList?: [...(string | fn.#Fn)] | (string | fn.#Fn)
						}) | fn.If
						StandardKnowledgeArticleTypeConfiguration?: close({
							DocumentDataFieldName:   string | fn.#Fn
							DocumentTitleFieldName?: string | fn.#Fn
							FieldMappings?:          close({
								DataSourceToIndexFieldMappingList?: [...close({
									DataSourceFieldName: string | fn.#Fn
									DateFieldFormat?:    string | fn.#Fn
									IndexFieldName:      string | fn.#Fn
								})] | fn.If
							}) | fn.If
						}) | fn.If
					}) | fn.If
					SecretArn:                              string | fn.#Fn
					ServerUrl:                              string | fn.#Fn
					StandardObjectAttachmentConfiguration?: close({
						DocumentTitleFieldName?: string | fn.#Fn
						FieldMappings?:          close({
							DataSourceToIndexFieldMappingList?: [...close({
								DataSourceFieldName: string | fn.#Fn
								DateFieldFormat?:    string | fn.#Fn
								IndexFieldName:      string | fn.#Fn
							})] | fn.If
						}) | fn.If
					}) | fn.If
					StandardObjectConfigurations?: close({
						SalesforceStandardObjectConfigurationList?: [...close({
							DocumentDataFieldName:   string | fn.#Fn
							DocumentTitleFieldName?: string | fn.#Fn
							FieldMappings?:          close({
								DataSourceToIndexFieldMappingList?: [...close({
									DataSourceFieldName: string | fn.#Fn
									DateFieldFormat?:    string | fn.#Fn
									IndexFieldName:      string | fn.#Fn
								})] | fn.If
							}) | fn.If
							Name: string | fn.#Fn
						})] | fn.If
					}) | fn.If
				}) | fn.If
				ServiceNowConfiguration?: close({
					HostUrl:                        string | fn.#Fn
					KnowledgeArticleConfiguration?: close({
						CrawlAttachments?:              bool | fn.#Fn
						DocumentDataFieldName:          string | fn.#Fn
						DocumentTitleFieldName?:        string | fn.#Fn
						ExcludeAttachmentFilePatterns?: close({
							DataSourceInclusionsExclusionsStrings?: [...(string | fn.#Fn)] | (string | fn.#Fn)
						}) | fn.If
						FieldMappings?: close({
							DataSourceToIndexFieldMappingList?: [...close({
								DataSourceFieldName: string | fn.#Fn
								DateFieldFormat?:    string | fn.#Fn
								IndexFieldName:      string | fn.#Fn
							})] | fn.If
						}) | fn.If
						IncludeAttachmentFilePatterns?: close({
							DataSourceInclusionsExclusionsStrings?: [...(string | fn.#Fn)] | (string | fn.#Fn)
						}) | fn.If
					}) | fn.If
					SecretArn:                    string | fn.#Fn
					ServiceCatalogConfiguration?: close({
						CrawlAttachments?:              bool | fn.#Fn
						DocumentDataFieldName:          string | fn.#Fn
						DocumentTitleFieldName?:        string | fn.#Fn
						ExcludeAttachmentFilePatterns?: close({
							DataSourceInclusionsExclusionsStrings?: [...(string | fn.#Fn)] | (string | fn.#Fn)
						}) | fn.If
						FieldMappings?: close({
							DataSourceToIndexFieldMappingList?: [...close({
								DataSourceFieldName: string | fn.#Fn
								DateFieldFormat?:    string | fn.#Fn
								IndexFieldName:      string | fn.#Fn
							})] | fn.If
						}) | fn.If
						IncludeAttachmentFilePatterns?: close({
							DataSourceInclusionsExclusionsStrings?: [...(string | fn.#Fn)] | (string | fn.#Fn)
						}) | fn.If
					}) | fn.If
					ServiceNowBuildVersion: string | fn.#Fn
				}) | fn.If
				SharePointConfiguration?: close({
					CrawlAttachments?:       bool | fn.#Fn
					DisableLocalGroups?:     bool | fn.#Fn
					DocumentTitleFieldName?: string | fn.#Fn
					ExclusionPatterns?:      close({
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					}) | fn.If
					FieldMappings?: close({
						DataSourceToIndexFieldMappingList?: [...close({
							DataSourceFieldName: string | fn.#Fn
							DateFieldFormat?:    string | fn.#Fn
							IndexFieldName:      string | fn.#Fn
						})] | fn.If
					}) | fn.If
					InclusionPatterns?: close({
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					}) | fn.If
					SecretArn:         string | fn.#Fn
					SharePointVersion: string | fn.#Fn
					Urls:              [...(string | fn.#Fn)] | (string | fn.#Fn)
					UseChangeLog?:     bool | fn.#Fn
					VpcConfiguration?: close({
						SecurityGroupIds: [...(string | fn.#Fn)] | (string | fn.#Fn)
						SubnetIds:        [...(string | fn.#Fn)] | (string | fn.#Fn)
					}) | fn.If
				}) | fn.If
			}) | fn.If
			Description?: string | fn.#Fn
			IndexId:      string | fn.#Fn
			Name:         string | fn.#Fn
			RoleArn?:     string | fn.#Fn
			Schedule?:    string | fn.#Fn
			Tags?:        close({
				TagList?: [...close({
					Key:   string | fn.#Fn
					Value: string | fn.#Fn
				})] | fn.If
			}) | fn.If
			Type: string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Faq: {
		Type:       "AWS::Kendra::Faq"
		Properties: close({
			Description?: string | fn.#Fn
			FileFormat?:  string | fn.#Fn
			IndexId:      string | fn.#Fn
			Name:         string | fn.#Fn
			RoleArn:      string | fn.#Fn
			S3Path:       close({
				Bucket: string | fn.#Fn
				Key:    string | fn.#Fn
			}) | fn.If
			Tags?: close({
				TagList?: [...close({
					Key:   string | fn.#Fn
					Value: string | fn.#Fn
				})] | fn.If
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Index: {
		Type:       "AWS::Kendra::Index"
		Properties: close({
			CapacityUnits?: close({
				QueryCapacityUnits:   int | fn.#Fn
				StorageCapacityUnits: int | fn.#Fn
			}) | fn.If
			Description?:                    string | fn.#Fn
			DocumentMetadataConfigurations?: close({
				DocumentMetadataConfigurationList?: [...close({
					Name:       string | fn.#Fn
					Relevance?: close({
						Duration?:             string | fn.#Fn
						Freshness?:            bool | fn.#Fn
						Importance?:           int | fn.#Fn
						RankOrder?:            string | fn.#Fn
						ValueImportanceItems?: close({
							ValueImportanceItems?: [...close({
								[string]: _
							})] | fn.If
						}) | fn.If
					}) | fn.If
					Search?: close({
						Displayable?: bool | fn.#Fn
						Facetable?:   bool | fn.#Fn
						Searchable?:  bool | fn.#Fn
						Sortable?:    bool | fn.#Fn
					}) | fn.If
					Type: string | fn.#Fn
				})] | fn.If
			}) | fn.If
			Edition:                            string | fn.#Fn
			Name:                               string | fn.#Fn
			RoleArn:                            string | fn.#Fn
			ServerSideEncryptionConfiguration?: close({
				KmsKeyId?: string | fn.#Fn
			}) | fn.If
			Tags?: close({
				TagList?: [...close({
					Key:   string | fn.#Fn
					Value: string | fn.#Fn
				})] | fn.If
			}) | fn.If
			UserContextPolicy?:       string | fn.#Fn
			UserTokenConfigurations?: close({
				UserTokenConfigurationList?: [...close({
					JsonTokenTypeConfiguration?: close({
						GroupAttributeField:    string | fn.#Fn
						UserNameAttributeField: string | fn.#Fn
					}) | fn.If
					JwtTokenTypeConfiguration?: close({
						ClaimRegex?:             string | fn.#Fn
						GroupAttributeField?:    string | fn.#Fn
						Issuer?:                 string | fn.#Fn
						KeyLocation:             string | fn.#Fn
						SecretManagerArn?:       string | fn.#Fn
						URL?:                    string | fn.#Fn
						UserNameAttributeField?: string | fn.#Fn
					}) | fn.If
				})] | fn.If
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
