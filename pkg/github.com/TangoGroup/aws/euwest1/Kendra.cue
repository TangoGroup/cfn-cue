package euwest1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

Kendra :: {
	DataSource :: {
		Type:       "AWS::Kendra::DataSource"
		Properties: close({
			DataSourceConfiguration?: close({
				ConfluenceConfiguration?: close({
					AttachmentConfiguration?: close({
						AttachmentFieldMappings?: close({
							ConfluenceAttachmentFieldMappingsList?: [...close({
								DataSourceFieldName: ("AUTHOR" | "CONTENT_TYPE" | "CREATED_DATE" | "DISPLAY_URL" | "FILE_SIZE" | "ITEM_TYPE" | "PARENT_ID" | "SPACE_KEY" | "SPACE_NAME" | "URL" | "VERSION") | fn.Fn
								DateFieldFormat?:    (strings.MinRunes(4) & strings.MaxRunes(40)) | fn.Fn
								IndexFieldName:      (strings.MinRunes(1) & strings.MaxRunes(30)) | fn.Fn
							})] | fn.If
						}) | fn.If
						CrawlAttachments?: bool | fn.Fn
					}) | fn.If
					BlogConfiguration?: close({
						BlogFieldMappings?: close({
							ConfluenceBlogFieldMappingsList?: [...close({
								DataSourceFieldName: ("AUTHOR" | "DISPLAY_URL" | "ITEM_TYPE" | "LABELS" | "PUBLISH_DATE" | "SPACE_KEY" | "SPACE_NAME" | "URL" | "VERSION") | fn.Fn
								DateFieldFormat?:    (strings.MinRunes(4) & strings.MaxRunes(40)) | fn.Fn
								IndexFieldName:      (strings.MinRunes(1) & strings.MaxRunes(30)) | fn.Fn
							})] | fn.If
						}) | fn.If
					}) | fn.If
					ExclusionPatterns?: close({
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					InclusionPatterns?: close({
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					PageConfiguration?: close({
						PageFieldMappings?: close({
							ConfluencePageFieldMappingsList?: [...close({
								DataSourceFieldName: ("AUTHOR" | "CONTENT_STATUS" | "CREATED_DATE" | "DISPLAY_URL" | "ITEM_TYPE" | "LABELS" | "MODIFIED_DATE" | "PARENT_ID" | "SPACE_KEY" | "SPACE_NAME" | "URL" | "VERSION") | fn.Fn
								DateFieldFormat?:    (strings.MinRunes(4) & strings.MaxRunes(40)) | fn.Fn
								IndexFieldName:      (strings.MinRunes(1) & strings.MaxRunes(30)) | fn.Fn
							})] | fn.If
						}) | fn.If
					}) | fn.If
					SecretArn:           (strings.MinRunes(1) & strings.MaxRunes(1284) & (=~#"arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}"#)) | fn.Fn
					ServerUrl:           (strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"^(https?|ftp|file)://([^\s]*)"#)) | fn.Fn
					SpaceConfiguration?: close({
						CrawlArchivedSpaces?: bool | fn.Fn
						CrawlPersonalSpaces?: bool | fn.Fn
						ExcludeSpaces?:       close({
							ConfluenceSpaceList?: [...(string | fn.Fn)] | (string | fn.Fn)
						}) | fn.If
						IncludeSpaces?: close({
							ConfluenceSpaceList?: [...(string | fn.Fn)] | (string | fn.Fn)
						}) | fn.If
						SpaceFieldMappings?: close({
							ConfluenceSpaceFieldMappingsList?: [...close({
								DataSourceFieldName: ("DISPLAY_URL" | "ITEM_TYPE" | "SPACE_KEY" | "URL") | fn.Fn
								DateFieldFormat?:    (strings.MinRunes(4) & strings.MaxRunes(40)) | fn.Fn
								IndexFieldName:      (strings.MinRunes(1) & strings.MaxRunes(30)) | fn.Fn
							})] | fn.If
						}) | fn.If
					}) | fn.If
					Version:           ("CLOUD" | "SERVER") | fn.Fn
					VpcConfiguration?: close({
						SecurityGroupIds: [...((strings.MinRunes(1) & strings.MaxRunes(200) & (=~#"[\-0-9a-zA-Z]+"#)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(200) & (=~#"[\-0-9a-zA-Z]+"#)) | fn.Fn)
						SubnetIds:        [...((strings.MinRunes(1) & strings.MaxRunes(200) & (=~#"[\-0-9a-zA-Z]+"#)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(200) & (=~#"[\-0-9a-zA-Z]+"#)) | fn.Fn)
					}) | fn.If
				}) | fn.If
				DatabaseConfiguration?: close({
					AclConfiguration?: close({
						AllowedGroupsColumnName: (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
					}) | fn.If
					ColumnConfiguration: close({
						ChangeDetectingColumns: close({
							ChangeDetectingColumns?: [...(string | fn.Fn)] | (string | fn.Fn)
						}) | fn.If
						DocumentDataColumnName:   (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
						DocumentIdColumnName:     (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
						DocumentTitleColumnName?: (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
						FieldMappings?:           close({
							DataSourceToIndexFieldMappingList?: [...close({
								DataSourceFieldName: (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
								DateFieldFormat?:    (strings.MinRunes(4) & strings.MaxRunes(40)) | fn.Fn
								IndexFieldName:      (strings.MinRunes(1) & strings.MaxRunes(30)) | fn.Fn
							})] | fn.If
						}) | fn.If
					}) | fn.If
					ConnectionConfiguration: close({
						DatabaseHost: (strings.MinRunes(1) & strings.MaxRunes(253)) | fn.Fn
						DatabaseName: (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
						DatabasePort: (>=1 & <=65535) | fn.Fn
						SecretArn:    (strings.MinRunes(1) & strings.MaxRunes(1284) & (=~#"arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}"#)) | fn.Fn
						TableName:    (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
					}) | fn.If
					DatabaseEngineType: ("RDS_AURORA_MYSQL" | "RDS_AURORA_POSTGRESQL" | "RDS_MYSQL" | "RDS_POSTGRESQL") | fn.Fn
					SqlConfiguration?:  close({
						QueryIdentifiersEnclosingOption?: ("DOUBLE_QUOTES" | "NONE") | fn.Fn
					}) | fn.If
					VpcConfiguration?: close({
						SecurityGroupIds: [...((strings.MinRunes(1) & strings.MaxRunes(200) & (=~#"[\-0-9a-zA-Z]+"#)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(200) & (=~#"[\-0-9a-zA-Z]+"#)) | fn.Fn)
						SubnetIds:        [...((strings.MinRunes(1) & strings.MaxRunes(200) & (=~#"[\-0-9a-zA-Z]+"#)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(200) & (=~#"[\-0-9a-zA-Z]+"#)) | fn.Fn)
					}) | fn.If
				}) | fn.If
				GoogleDriveConfiguration?: close({
					ExcludeMimeTypes?: close({
						ExcludeMimeTypesList?: [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					ExcludeSharedDrives?: close({
						ExcludeSharedDrivesList?: [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					ExcludeUserAccounts?: close({
						ExcludeUserAccountsList?: [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					ExclusionPatterns?: close({
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					FieldMappings?: close({
						DataSourceToIndexFieldMappingList?: [...close({
							DataSourceFieldName: (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
							DateFieldFormat?:    (strings.MinRunes(4) & strings.MaxRunes(40)) | fn.Fn
							IndexFieldName:      (strings.MinRunes(1) & strings.MaxRunes(30)) | fn.Fn
						})] | fn.If
					}) | fn.If
					InclusionPatterns?: close({
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					SecretArn: (strings.MinRunes(1) & strings.MaxRunes(1284) & (=~#"arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}"#)) | fn.Fn
				}) | fn.If
				OneDriveConfiguration?: close({
					DisableLocalGroups?: bool | fn.Fn
					ExclusionPatterns?:  close({
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					FieldMappings?: close({
						DataSourceToIndexFieldMappingList?: [...close({
							DataSourceFieldName: (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
							DateFieldFormat?:    (strings.MinRunes(4) & strings.MaxRunes(40)) | fn.Fn
							IndexFieldName:      (strings.MinRunes(1) & strings.MaxRunes(30)) | fn.Fn
						})] | fn.If
					}) | fn.If
					InclusionPatterns?: close({
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					OneDriveUsers: close({
						OneDriveUserList?: close({
							OneDriveUserList?: [...(string | fn.Fn)] | (string | fn.Fn)
						}) | fn.If
						OneDriveUserS3Path?: close({
							Bucket: (strings.MinRunes(3) & strings.MaxRunes(63) & (=~#"[a-z0-9][\.\-a-z0-9]{1,61}[a-z0-9]"#)) | fn.Fn
							Key:    (strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.Fn
						}) | fn.If
					}) | fn.If
					SecretArn:    (strings.MinRunes(1) & strings.MaxRunes(1284) & (=~#"arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}"#)) | fn.Fn
					TenantDomain: (strings.MinRunes(1) & strings.MaxRunes(256) & (=~#"^([a-zA-Z0-9]+(-[a-zA-Z0-9]+)*\.)+[a-z]{2,}$"#)) | fn.Fn
				}) | fn.If
				S3Configuration?: close({
					AccessControlListConfiguration?: close({
						KeyPath?: (strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.Fn
					}) | fn.If
					BucketName:                      (strings.MinRunes(3) & strings.MaxRunes(63) & (=~#"[a-z0-9][\.\-a-z0-9]{1,61}[a-z0-9]"#)) | fn.Fn
					DocumentsMetadataConfiguration?: close({
						S3Prefix?: (strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.Fn
					}) | fn.If
					ExclusionPatterns?: close({
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					InclusionPatterns?: close({
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					InclusionPrefixes?: close({
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
				}) | fn.If
				SalesforceConfiguration?: close({
					ChatterFeedConfiguration?: close({
						DocumentDataFieldName:   (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
						DocumentTitleFieldName?: (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
						FieldMappings?:          close({
							DataSourceToIndexFieldMappingList?: [...close({
								DataSourceFieldName: (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
								DateFieldFormat?:    (strings.MinRunes(4) & strings.MaxRunes(40)) | fn.Fn
								IndexFieldName:      (strings.MinRunes(1) & strings.MaxRunes(30)) | fn.Fn
							})] | fn.If
						}) | fn.If
						IncludeFilterTypes?: close({
							SalesforceChatterFeedIncludeFilterTypes?: [...(string | fn.Fn)] | (string | fn.Fn)
						}) | fn.If
					}) | fn.If
					CrawlAttachments?:              bool | fn.Fn
					ExcludeAttachmentFilePatterns?: close({
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					IncludeAttachmentFilePatterns?: close({
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					KnowledgeArticleConfiguration?: close({
						CustomKnowledgeArticleTypeConfigurations?: close({
							SalesforceCustomKnowledgeArticleTypeConfigurationList?: [...close({
								DocumentDataFieldName:   (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
								DocumentTitleFieldName?: (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
								FieldMappings?:          close({
									DataSourceToIndexFieldMappingList?: [...close({
										DataSourceFieldName: (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
										DateFieldFormat?:    (strings.MinRunes(4) & strings.MaxRunes(40)) | fn.Fn
										IndexFieldName:      (strings.MinRunes(1) & strings.MaxRunes(30)) | fn.Fn
									})] | fn.If
								}) | fn.If
								Name: (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
							})] | fn.If
						}) | fn.If
						IncludedStates: close({
							SalesforceKnowledgeArticleStateList?: [...(string | fn.Fn)] | (string | fn.Fn)
						}) | fn.If
						StandardKnowledgeArticleTypeConfiguration?: close({
							DocumentDataFieldName:   (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
							DocumentTitleFieldName?: (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
							FieldMappings?:          close({
								DataSourceToIndexFieldMappingList?: [...close({
									DataSourceFieldName: (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
									DateFieldFormat?:    (strings.MinRunes(4) & strings.MaxRunes(40)) | fn.Fn
									IndexFieldName:      (strings.MinRunes(1) & strings.MaxRunes(30)) | fn.Fn
								})] | fn.If
							}) | fn.If
						}) | fn.If
					}) | fn.If
					SecretArn:                              (strings.MinRunes(1) & strings.MaxRunes(1284) & (=~#"arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}"#)) | fn.Fn
					ServerUrl:                              (strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"^(https?|ftp|file)://([^\s]*)"#)) | fn.Fn
					StandardObjectAttachmentConfiguration?: close({
						DocumentTitleFieldName?: (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
						FieldMappings?:          close({
							DataSourceToIndexFieldMappingList?: [...close({
								DataSourceFieldName: (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
								DateFieldFormat?:    (strings.MinRunes(4) & strings.MaxRunes(40)) | fn.Fn
								IndexFieldName:      (strings.MinRunes(1) & strings.MaxRunes(30)) | fn.Fn
							})] | fn.If
						}) | fn.If
					}) | fn.If
					StandardObjectConfigurations?: close({
						SalesforceStandardObjectConfigurationList?: [...close({
							DocumentDataFieldName:   (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
							DocumentTitleFieldName?: (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
							FieldMappings?:          close({
								DataSourceToIndexFieldMappingList?: [...close({
									DataSourceFieldName: (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
									DateFieldFormat?:    (strings.MinRunes(4) & strings.MaxRunes(40)) | fn.Fn
									IndexFieldName:      (strings.MinRunes(1) & strings.MaxRunes(30)) | fn.Fn
								})] | fn.If
							}) | fn.If
							Name: ("ACCOUNT" | "CAMPAIGN" | "CASE" | "CONTACT" | "CONTRACT" | "DOCUMENT" | "GROUP" | "IDEA" | "LEAD" | "OPPORTUNITY" | "PARTNER" | "PRICEBOOK" | "PRODUCT" | "PROFILE" | "SOLUTION" | "TASK" | "USER") | fn.Fn
						})] | fn.If
					}) | fn.If
				}) | fn.If
				ServiceNowConfiguration?: close({
					HostUrl:                        (strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"^(?!(^(https?|ftp|file):\/\/))[a-z0-9-]+(\.service-now\.com)$"#)) | fn.Fn
					KnowledgeArticleConfiguration?: close({
						CrawlAttachments?:              bool | fn.Fn
						DocumentDataFieldName:          (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
						DocumentTitleFieldName?:        (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
						ExcludeAttachmentFilePatterns?: close({
							DataSourceInclusionsExclusionsStrings?: [...(string | fn.Fn)] | (string | fn.Fn)
						}) | fn.If
						FieldMappings?: close({
							DataSourceToIndexFieldMappingList?: [...close({
								DataSourceFieldName: (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
								DateFieldFormat?:    (strings.MinRunes(4) & strings.MaxRunes(40)) | fn.Fn
								IndexFieldName:      (strings.MinRunes(1) & strings.MaxRunes(30)) | fn.Fn
							})] | fn.If
						}) | fn.If
						IncludeAttachmentFilePatterns?: close({
							DataSourceInclusionsExclusionsStrings?: [...(string | fn.Fn)] | (string | fn.Fn)
						}) | fn.If
					}) | fn.If
					SecretArn:                    (strings.MinRunes(1) & strings.MaxRunes(1284) & (=~#"arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}"#)) | fn.Fn
					ServiceCatalogConfiguration?: close({
						CrawlAttachments?:              bool | fn.Fn
						DocumentDataFieldName:          (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
						DocumentTitleFieldName?:        (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
						ExcludeAttachmentFilePatterns?: close({
							DataSourceInclusionsExclusionsStrings?: [...(string | fn.Fn)] | (string | fn.Fn)
						}) | fn.If
						FieldMappings?: close({
							DataSourceToIndexFieldMappingList?: [...close({
								DataSourceFieldName: (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
								DateFieldFormat?:    (strings.MinRunes(4) & strings.MaxRunes(40)) | fn.Fn
								IndexFieldName:      (strings.MinRunes(1) & strings.MaxRunes(30)) | fn.Fn
							})] | fn.If
						}) | fn.If
						IncludeAttachmentFilePatterns?: close({
							DataSourceInclusionsExclusionsStrings?: [...(string | fn.Fn)] | (string | fn.Fn)
						}) | fn.If
					}) | fn.If
					ServiceNowBuildVersion: ("LONDON" | "OTHERS") | fn.Fn
				}) | fn.If
				SharePointConfiguration?: close({
					CrawlAttachments?:       bool | fn.Fn
					DisableLocalGroups?:     bool | fn.Fn
					DocumentTitleFieldName?: (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
					ExclusionPatterns?:      close({
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					FieldMappings?: close({
						DataSourceToIndexFieldMappingList?: [...close({
							DataSourceFieldName: (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
							DateFieldFormat?:    (strings.MinRunes(4) & strings.MaxRunes(40)) | fn.Fn
							IndexFieldName:      (strings.MinRunes(1) & strings.MaxRunes(30)) | fn.Fn
						})] | fn.If
					}) | fn.If
					InclusionPatterns?: close({
						DataSourceInclusionsExclusionsStrings?: [...(string | fn.Fn)] | (string | fn.Fn)
					}) | fn.If
					SecretArn:         (strings.MinRunes(1) & strings.MaxRunes(1284) & (=~#"arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}"#)) | fn.Fn
					SharePointVersion: ("SHAREPOINT_ONLINE") | fn.Fn
					Urls:              [...((strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"^(https?|ftp|file)://([^\s]*)"#)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"^(https?|ftp|file)://([^\s]*)"#)) | fn.Fn)
					UseChangeLog?:     bool | fn.Fn
					VpcConfiguration?: close({
						SecurityGroupIds: [...((strings.MinRunes(1) & strings.MaxRunes(200) & (=~#"[\-0-9a-zA-Z]+"#)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(200) & (=~#"[\-0-9a-zA-Z]+"#)) | fn.Fn)
						SubnetIds:        [...((strings.MinRunes(1) & strings.MaxRunes(200) & (=~#"[\-0-9a-zA-Z]+"#)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(200) & (=~#"[\-0-9a-zA-Z]+"#)) | fn.Fn)
					}) | fn.If
				}) | fn.If
			}) | fn.If
			Description?: (strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.Fn
			IndexId:      (strings.MinRunes(36) & strings.MaxRunes(36)) | fn.Fn
			Name:         (strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.Fn
			RoleArn?:     (strings.MinRunes(1) & strings.MaxRunes(1284) & (=~#"arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}"#)) | fn.Fn
			Schedule?:    string | fn.Fn
			Tags?:        [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			Type: ("S3" | "SHAREPOINT" | "SALESFORCE" | "ONEDRIVE" | "SERVICENOW" | "DATABASE" | "CUSTOM" | "CONFLUENCE" | "GOOGLEDRIVE") | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Faq :: {
		Type:       "AWS::Kendra::Faq"
		Properties: close({
			Description?: (strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.Fn
			FileFormat?:  ("CSV" | "CSV_WITH_HEADER" | "JSON") | fn.Fn
			IndexId:      (strings.MinRunes(36) & strings.MaxRunes(36)) | fn.Fn
			Name:         (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
			RoleArn:      (strings.MinRunes(1) & strings.MaxRunes(1284) & (=~#"arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}"#)) | fn.Fn
			S3Path:       close({
				Bucket: (strings.MinRunes(3) & strings.MaxRunes(63) & (=~#"[a-z0-9][\.\-a-z0-9]{1,61}[a-z0-9]"#)) | fn.Fn
				Key:    (strings.MinRunes(1) & strings.MaxRunes(1024)) | fn.Fn
			}) | fn.If
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
	Index :: {
		Type:       "AWS::Kendra::Index"
		Properties: close({
			CapacityUnits?: close({
				QueryCapacityUnits:   int | fn.Fn
				StorageCapacityUnits: int | fn.Fn
			}) | fn.If
			Description?:                    string | fn.Fn
			DocumentMetadataConfigurations?: [...close({
				Name:       (strings.MinRunes(1) & strings.MaxRunes(30)) | fn.Fn
				Relevance?: close({
					Duration?:             (strings.MinRunes(1) & strings.MaxRunes(10) & (=~#"[0-9]+[s]"#)) | fn.Fn
					Freshness?:            bool | fn.Fn
					Importance?:           (>=1 & <=10) | fn.Fn
					RankOrder?:            ("ASCENDING" | "DESCENDING") | fn.Fn
					ValueImportanceItems?: close({
						ValueImportanceItems?: [...close({
							[string]: _
						})] | fn.If
					}) | fn.If
				}) | fn.If
				Search?: close({
					Displayable?: bool | fn.Fn
					Facetable?:   bool | fn.Fn
					Searchable?:  bool | fn.Fn
					Sortable?:    bool | fn.Fn
				}) | fn.If
				Type: ("STRING_VALUE" | "STRING_LIST_VALUE" | "LONG_VALUE" | "DATE_VALUE") | fn.Fn
			})] | fn.If
			Edition:                            ("DEVELOPER_EDITION" | "ENTERPRISE_EDITION") | fn.Fn
			Name:                               (strings.MinRunes(1) & strings.MaxRunes(1000)) | fn.Fn
			RoleArn:                            (strings.MinRunes(1) & strings.MaxRunes(1284) & (=~#"arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}"#)) | fn.Fn
			ServerSideEncryptionConfiguration?: close({
				KmsKeyId?: (strings.MinRunes(1) & strings.MaxRunes(2048)) | fn.Fn
			}) | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			UserContextPolicy?:       ("ATTRIBUTE_FILTER" | "USER_TOKEN") | fn.Fn
			UserTokenConfigurations?: [...close({
				JsonTokenTypeConfiguration?: close({
					GroupAttributeField:    (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
					UserNameAttributeField: (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
				}) | fn.If
				JwtTokenTypeConfiguration?: close({
					ClaimRegex?:             (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
					GroupAttributeField?:    (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
					Issuer?:                 (strings.MinRunes(1) & strings.MaxRunes(65)) | fn.Fn
					KeyLocation:             ("URL" | "SECRET_MANAGER") | fn.Fn
					SecretManagerArn?:       (strings.MinRunes(1) & strings.MaxRunes(1284) & (=~#"arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}"#)) | fn.Fn
					URL?:                    (strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"^(https?|ftp|file):\/\/([^\s]*)"#)) | fn.Fn
					UserNameAttributeField?: (strings.MinRunes(1) & strings.MaxRunes(100)) | fn.Fn
				}) | fn.If
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
