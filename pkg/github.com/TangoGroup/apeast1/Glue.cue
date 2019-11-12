package apeast1

import "github.com/TangoGroup/fn"

Glue :: {
	Classifier :: {
		Type: "AWS::Glue::Classifier"
		Properties: {
			CsvClassifier?: {
			}
			GrokClassifier?: {
			}
			JsonClassifier?: {
			}
			XMLClassifier?: {
			}
		}
	}
	Connection :: {
		Type: "AWS::Glue::Connection"
		Properties: {
			CatalogId: string | fn.Fn
			ConnectionInput: {
			}
		}
	}
	Crawler :: {
		Type: "AWS::Glue::Crawler"
		Properties: {
			Classifiers?: [...(string | fn.Fn)]
			Configuration?:                string | fn.Fn
			CrawlerSecurityConfiguration?: string | fn.Fn
			DatabaseName?:                 string | fn.Fn
			Description?:                  string | fn.Fn
			Name?:                         string | fn.Fn
			Role:                          string | fn.Fn
			Schedule?: {
			}
			SchemaChangePolicy?: {
			}
			TablePrefix?: string | fn.Fn
			Tags?:        {
			} | fn.Fn
			Targets: {
			}
		}
	}
	DataCatalogEncryptionSettings :: {
		Type: "AWS::Glue::DataCatalogEncryptionSettings"
		Properties: {
			CatalogId: string | fn.Fn
			DataCatalogEncryptionSettings: {
			}
		}
	}
	Database :: {
		Type: "AWS::Glue::Database"
		Properties: {
			CatalogId: string | fn.Fn
			DatabaseInput: {
			}
		}
	}
	DevEndpoint :: {
		Type: "AWS::Glue::DevEndpoint"
		Properties: {
			Arguments?: {
			} | fn.Fn
			EndpointName?:          string | fn.Fn
			ExtraJarsS3Path?:       string | fn.Fn
			ExtraPythonLibsS3Path?: string | fn.Fn
			GlueVersion?:           string | fn.Fn
			NumberOfNodes?:         int | fn.Fn
			NumberOfWorkers?:       int | fn.Fn
			PublicKey?:             string | fn.Fn
			RoleArn:                string | fn.Fn
			SecurityConfiguration?: string | fn.Fn
			SecurityGroupIds?: [...(string | fn.Fn)]
			SubnetId?: string | fn.Fn
			Tags?:     {
			} | fn.Fn
			WorkerType?: string | fn.Fn
		}
	}
	Job :: {
		Type: "AWS::Glue::Job"
		Properties: {
			AllocatedCapacity?: float | fn.Fn
			Command: {
			}
			Connections?: {
			}
			DefaultArguments?: {
			} | fn.Fn
			Description?: string | fn.Fn
			ExecutionProperty?: {
			}
			GlueVersion?: string | fn.Fn
			LogUri?:      string | fn.Fn
			MaxCapacity?: float | fn.Fn
			MaxRetries?:  float | fn.Fn
			Name?:        string | fn.Fn
			NotificationProperty?: {
			}
			NumberOfWorkers?:       int | fn.Fn
			Role:                   string | fn.Fn
			SecurityConfiguration?: string | fn.Fn
			Tags?:                  {
			} | fn.Fn
			Timeout?:    int | fn.Fn
			WorkerType?: string | fn.Fn
		}
	}
	MLTransform :: {
		Type: "AWS::Glue::MLTransform"
		Properties: {
			Description?: string | fn.Fn
			InputRecordTables: {
			}
			MaxCapacity?:     float | fn.Fn
			MaxRetries?:      int | fn.Fn
			Name?:            string | fn.Fn
			NumberOfWorkers?: int | fn.Fn
			Role:             string | fn.Fn
			Timeout?:         int | fn.Fn
			TransformParameters: {
			}
			WorkerType?: string | fn.Fn
		}
	}
	Partition :: {
		Type: "AWS::Glue::Partition"
		Properties: {
			CatalogId:    string | fn.Fn
			DatabaseName: string | fn.Fn
			PartitionInput: {
			}
			TableName: string | fn.Fn
		}
	}
	SecurityConfiguration :: {
		Type: "AWS::Glue::SecurityConfiguration"
		Properties: {
			EncryptionConfiguration: {
			}
			Name: string | fn.Fn
		}
	}
	Table :: {
		Type: "AWS::Glue::Table"
		Properties: {
			CatalogId:    string | fn.Fn
			DatabaseName: string | fn.Fn
			TableInput: {
			}
		}
	}
	Trigger :: {
		Type: "AWS::Glue::Trigger"
		Properties: {
			Actions: [...{
			}]
			Description?: string | fn.Fn
			Name?:        string | fn.Fn
			Predicate?: {
			}
			Schedule?:        string | fn.Fn
			StartOnCreation?: bool | fn.Fn
			Tags?:            {
			} | fn.Fn
			Type:          string | fn.Fn
			WorkflowName?: string | fn.Fn
		}
	}
	Workflow :: {
		Type: "AWS::Glue::Workflow"
		Properties: {
			DefaultRunProperties?: {
			} | fn.Fn
			Description?: string | fn.Fn
			Name?:        string | fn.Fn
			Tags?:        {
			} | fn.Fn
		}
	}
}
