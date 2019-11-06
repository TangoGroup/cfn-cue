package Glue

import "github.com/TangoGroup/fn"

Classifier :: {
	Type: "AWS::Glue::Classifier"
	Properties: {
		CsvClassifier?:  propCsvClassifier
		GrokClassifier?: propGrokClassifier
		JsonClassifier?: propJsonClassifier
		XMLClassifier?:  propXMLClassifier
	}
	propCsvClassifier :: {
		AllowSingleColumn?:    bool | fn.Fn
		ContainsHeader?:       string | fn.Fn
		Delimiter?:            string | fn.Fn
		DisableValueTrimming?: bool | fn.Fn
		Header?:               [...string] | fn.Fn
		Name?:                 string | fn.Fn
		QuoteSymbol?:          string | fn.Fn
	}
	propGrokClassifier :: {
		Classification:  string | fn.Fn
		CustomPatterns?: string | fn.Fn
		GrokPattern:     string | fn.Fn
		Name?:           string | fn.Fn
	}
	propJsonClassifier :: {
		JsonPath: string | fn.Fn
		Name?:    string | fn.Fn
	}
	propXMLClassifier :: {
		Classification: string | fn.Fn
		Name?:          string | fn.Fn
		RowTag:         string | fn.Fn
	}
}
Connection :: {
	Type: "AWS::Glue::Connection"
	Properties: {
		CatalogId:       string | fn.Fn
		ConnectionInput: propConnectionInput
	}
	propConnectionInput :: {
		ConnectionProperties: {
		} | fn.Fn
		ConnectionType:                  (string & ("JDBC" | "SFTP")) | fn.Fn
		Description?:                    string | fn.Fn
		MatchCriteria?:                  [...string] | fn.Fn
		Name?:                           string | fn.Fn
		PhysicalConnectionRequirements?: propPhysicalConnectionRequirements
	}
	propPhysicalConnectionRequirements :: {
		AvailabilityZone?:    string | fn.Fn
		SecurityGroupIdList?: [...string] | fn.Fn
		SubnetId?:            string | fn.Fn
	}
}
Crawler :: {
	Type: "AWS::Glue::Crawler"
	Properties: {
		Classifiers?:                  [...string] | fn.Fn
		Configuration?:                string | fn.Fn
		CrawlerSecurityConfiguration?: string | fn.Fn
		DatabaseName?:                 string | fn.Fn
		Description?:                  string | fn.Fn
		Name?:                         string | fn.Fn
		Role:                          string | fn.Fn
		Schedule?:                     propSchedule
		SchemaChangePolicy?:           propSchemaChangePolicy
		TablePrefix?:                  string | fn.Fn
		Tags?:                         {
		} | fn.Fn
		Targets: propTargets
	}
	propCatalogTarget :: {
		DatabaseName?: string | fn.Fn
		Tables?:       [...string] | fn.Fn
	}
	propDynamoDBTarget :: {
		Path?: string | fn.Fn
	}
	propJdbcTarget :: {
		ConnectionName?: string | fn.Fn
		Exclusions?:     [...string] | fn.Fn
		Path?:           string | fn.Fn
	}
	propS3Target :: {
		Exclusions?: [...string] | fn.Fn
		Path?:       string | fn.Fn
	}
	propSchedule :: {
		ScheduleExpression?: string | fn.Fn
	}
	propSchemaChangePolicy :: {
		DeleteBehavior?: (string & ("DELETE_FROM_DATABASE" | "DEPRECATE_IN_DATABASE" | "LOG")) | fn.Fn
		UpdateBehavior?: (string & ("LOG" | "UPDATE_IN_DATABASE")) | fn.Fn
	}
	propTargets :: {
		CatalogTargets?: [...propCatalogTarget]
		DynamoDBTargets?: [...propDynamoDBTarget]
		JdbcTargets?: [...propJdbcTarget]
		S3Targets?: [...propS3Target]
	}
}
DataCatalogEncryptionSettings :: {
	Type: "AWS::Glue::DataCatalogEncryptionSettings"
	Properties: {
		CatalogId:                     string | fn.Fn
		DataCatalogEncryptionSettings: propDataCatalogEncryptionSettings
	}
	propConnectionPasswordEncryption :: {
		KmsKeyId?:                          string | fn.Fn
		ReturnConnectionPasswordEncrypted?: bool | fn.Fn
	}
	propDataCatalogEncryptionSettings :: {
		ConnectionPasswordEncryption?: propConnectionPasswordEncryption
		EncryptionAtRest?:             propEncryptionAtRest
	}
	propEncryptionAtRest :: {
		CatalogEncryptionMode?: string | fn.Fn
		SseAwsKmsKeyId?:        string | fn.Fn
	}
}
Database :: {
	Type: "AWS::Glue::Database"
	Properties: {
		CatalogId:     string | fn.Fn
		DatabaseInput: propDatabaseInput
	}
	propDatabaseInput :: {
		Description?: string | fn.Fn
		LocationUri?: string | fn.Fn
		Name?:        string | fn.Fn
		Parameters?:  {
		} | fn.Fn
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
		SecurityGroupIds?:      [...string] | fn.Fn
		SubnetId?:              string | fn.Fn
		Tags?:                  {
		} | fn.Fn
		WorkerType?: string | fn.Fn
	}
}
Job :: {
	Type: "AWS::Glue::Job"
	Properties: {
		AllocatedCapacity?: float | fn.Fn
		Command:            propJobCommand
		Connections?:       propConnectionsList
		DefaultArguments?:  {
		} | fn.Fn
		Description?:           string | fn.Fn
		ExecutionProperty?:     propExecutionProperty
		GlueVersion?:           string | fn.Fn
		LogUri?:                string | fn.Fn
		MaxCapacity?:           float | fn.Fn
		MaxRetries?:            float | fn.Fn
		Name?:                  string | fn.Fn
		NotificationProperty?:  propNotificationProperty
		NumberOfWorkers?:       (int & (>=0 & <=299)) | fn.Fn
		Role:                   string | fn.Fn
		SecurityConfiguration?: string | fn.Fn
		Tags?:                  {
		} | fn.Fn
		Timeout?:    int | fn.Fn
		WorkerType?: string | fn.Fn
	}
	propConnectionsList :: {
		Connections?: [...string] | fn.Fn
	}
	propExecutionProperty :: {
		MaxConcurrentRuns?: float | fn.Fn
	}
	propJobCommand :: {
		Name?:           string | fn.Fn
		PythonVersion?:  string | fn.Fn
		ScriptLocation?: string | fn.Fn
	}
	propNotificationProperty :: {
		NotifyDelayAfter?: int | fn.Fn
	}
}
MLTransform :: {
	Type: "AWS::Glue::MLTransform"
	Properties: {
		Description?:        string | fn.Fn
		InputRecordTables:   propInputRecordTables
		MaxCapacity?:        (float & (>=1 & <=100)) | fn.Fn
		MaxRetries?:         int | fn.Fn
		Name?:               string | fn.Fn
		NumberOfWorkers?:    int | fn.Fn
		Role:                string | fn.Fn
		Timeout?:            int | fn.Fn
		TransformParameters: propTransformParameters
		WorkerType?:         string | fn.Fn
	}
	propFindMatchesParameters :: {
		AccuracyCostTradeoff?:    float | fn.Fn
		EnforceProvidedLabels?:   bool | fn.Fn
		PrecisionRecallTradeoff?: float | fn.Fn
		PrimaryKeyColumnName:     string | fn.Fn
	}
	propGlueTables :: {
		CatalogId?:      string | fn.Fn
		ConnectionName?: string | fn.Fn
		DatabaseName:    string | fn.Fn
		TableName:       string | fn.Fn
	}
	propInputRecordTables :: {
		GlueTables?: [...propGlueTables]
	}
	propTransformParameters :: {
		FindMatchesParameters?: propFindMatchesParameters
		TransformType:          string | fn.Fn
	}
}
Partition :: {
	Type: "AWS::Glue::Partition"
	Properties: {
		CatalogId:      string | fn.Fn
		DatabaseName:   string | fn.Fn
		PartitionInput: propPartitionInput
		TableName:      string | fn.Fn
	}
	propColumn :: {
		Comment?: string | fn.Fn
		Name:     string | fn.Fn
		Type?:    string | fn.Fn
	}
	propOrder :: {
		Column:     string | fn.Fn
		SortOrder?: int | fn.Fn
	}
	propPartitionInput :: {
		Parameters?: {
		} | fn.Fn
		StorageDescriptor?: propStorageDescriptor
		Values:             [...string] | fn.Fn
	}
	propSerdeInfo :: {
		Name?:       string | fn.Fn
		Parameters?: {
		} | fn.Fn
		SerializationLibrary?: string | fn.Fn
	}
	propSkewedInfo :: {
		SkewedColumnNames?:             [...string] | fn.Fn
		SkewedColumnValueLocationMaps?: {
		} | fn.Fn
		SkewedColumnValues?: [...string] | fn.Fn
	}
	propStorageDescriptor :: {
		BucketColumns?: [...string] | fn.Fn
		Columns?: [...propColumn]
		Compressed?:      bool | fn.Fn
		InputFormat?:     string | fn.Fn
		Location?:        string | fn.Fn
		NumberOfBuckets?: int | fn.Fn
		OutputFormat?:    string | fn.Fn
		Parameters?:      {
		} | fn.Fn
		SerdeInfo?:  propSerdeInfo
		SkewedInfo?: propSkewedInfo
		SortColumns?: [...propOrder]
		StoredAsSubDirectories?: bool | fn.Fn
	}
}
SecurityConfiguration :: {
	Type: "AWS::Glue::SecurityConfiguration"
	Properties: {
		EncryptionConfiguration: propEncryptionConfiguration
		Name:                    string | fn.Fn
	}
	propCloudWatchEncryption :: {
		CloudWatchEncryptionMode?: string | fn.Fn
		KmsKeyArn?:                string | fn.Fn
	}
	propEncryptionConfiguration :: {
		CloudWatchEncryption?:   propCloudWatchEncryption
		JobBookmarksEncryption?: propJobBookmarksEncryption
		S3Encryptions?:          propS3Encryptions
	}
	propJobBookmarksEncryption :: {
		JobBookmarksEncryptionMode?: string | fn.Fn
		KmsKeyArn?:                  string | fn.Fn
	}
	propS3Encryption :: {
		KmsKeyArn?:        string | fn.Fn
		S3EncryptionMode?: string | fn.Fn
	}
	propS3Encryptions :: {
	}
}
Table :: {
	Type: "AWS::Glue::Table"
	Properties: {
		CatalogId:    string | fn.Fn
		DatabaseName: string | fn.Fn
		TableInput:   propTableInput
	}
	propColumn :: {
		Comment?: string | fn.Fn
		Name:     string | fn.Fn
		Type?:    string | fn.Fn
	}
	propOrder :: {
		Column:    string | fn.Fn
		SortOrder: int | fn.Fn
	}
	propSerdeInfo :: {
		Name?:       string | fn.Fn
		Parameters?: {
		} | fn.Fn
		SerializationLibrary?: string | fn.Fn
	}
	propSkewedInfo :: {
		SkewedColumnNames?:             [...string] | fn.Fn
		SkewedColumnValueLocationMaps?: {
		} | fn.Fn
		SkewedColumnValues?: [...string] | fn.Fn
	}
	propStorageDescriptor :: {
		BucketColumns?: [...string] | fn.Fn
		Columns?: [...propColumn]
		Compressed?:      bool | fn.Fn
		InputFormat?:     string | fn.Fn
		Location?:        string | fn.Fn
		NumberOfBuckets?: int | fn.Fn
		OutputFormat?:    string | fn.Fn
		Parameters?:      {
		} | fn.Fn
		SerdeInfo?:  propSerdeInfo
		SkewedInfo?: propSkewedInfo
		SortColumns?: [...propOrder]
		StoredAsSubDirectories?: bool | fn.Fn
	}
	propTableInput :: {
		Description?: string | fn.Fn
		Name?:        string | fn.Fn
		Owner?:       string | fn.Fn
		Parameters?:  {
		} | fn.Fn
		PartitionKeys?: [...propColumn]
		Retention?:         int | fn.Fn
		StorageDescriptor?: propStorageDescriptor
		TableType?:         (string & ("EXTERNAL_TABLE" | "VIRTUAL_VIEW")) | fn.Fn
		ViewExpandedText?:  string | fn.Fn
		ViewOriginalText?:  string | fn.Fn
	}
}
Trigger :: {
	Type: "AWS::Glue::Trigger"
	Properties: {
		Actions: [...propAction]
		Description?:     string | fn.Fn
		Name?:            string | fn.Fn
		Predicate?:       propPredicate
		Schedule?:        string | fn.Fn
		StartOnCreation?: bool | fn.Fn
		Tags?:            {
		} | fn.Fn
		Type:          (string & ("CONDITIONAL" | "ON_DEMAND" | "SCHEDULED")) | fn.Fn
		WorkflowName?: string | fn.Fn
	}
	propAction :: {
		Arguments?: {
		} | fn.Fn
		CrawlerName?:           string | fn.Fn
		JobName?:               string | fn.Fn
		NotificationProperty?:  propNotificationProperty
		SecurityConfiguration?: string | fn.Fn
		Timeout?:               int | fn.Fn
	}
	propCondition :: {
		CrawlState?:      string | fn.Fn
		CrawlerName?:     string | fn.Fn
		JobName?:         string | fn.Fn
		LogicalOperator?: (string & ("EQUALS")) | fn.Fn
		State?:           (string & ("SUCCEEDED")) | fn.Fn
	}
	propNotificationProperty :: {
		NotifyDelayAfter?: int | fn.Fn
	}
	propPredicate :: {
		Conditions?: [...propCondition]
		Logical?: (string & ("AND")) | fn.Fn
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
