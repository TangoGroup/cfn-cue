package Glue

import "github.com/TangoGroup/fn"

Classifier :: {
	Type: "AWS::Glue::Classifier"
	Properties: {
		CsvClassifier?:  __CsvClassifier
		GrokClassifier?: __GrokClassifier
		JsonClassifier?: __JsonClassifier
		XMLClassifier?:  __XMLClassifier
	}
	__CsvClassifier :: {
		AllowSingleColumn?:    bool | fn.Fn
		ContainsHeader?:       string | fn.Fn
		Delimiter?:            string | fn.Fn
		DisableValueTrimming?: bool | fn.Fn
		Header?:               [...string] | fn.Fn
		Name?:                 string | fn.Fn
		QuoteSymbol?:          string | fn.Fn
	}
	__GrokClassifier :: {
		Classification:  string | fn.Fn
		CustomPatterns?: string | fn.Fn
		GrokPattern:     string | fn.Fn
		Name?:           string | fn.Fn
	}
	__JsonClassifier :: {
		JsonPath: string | fn.Fn
		Name?:    string | fn.Fn
	}
	__XMLClassifier :: {
		Classification: string | fn.Fn
		Name?:          string | fn.Fn
		RowTag:         string | fn.Fn
	}
}
Connection :: {
	Type: "AWS::Glue::Connection"
	Properties: {
		CatalogId:       string | fn.Fn
		ConnectionInput: __ConnectionInput
	}
	__ConnectionInput :: {
		ConnectionProperties: {
		} | fn.Fn
		ConnectionType:                  (string & ("JDBC" | "SFTP")) | fn.Fn
		Description?:                    string | fn.Fn
		MatchCriteria?:                  [...string] | fn.Fn
		Name?:                           string | fn.Fn
		PhysicalConnectionRequirements?: __PhysicalConnectionRequirements
	}
	__PhysicalConnectionRequirements :: {
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
		Schedule?:                     __Schedule
		SchemaChangePolicy?:           __SchemaChangePolicy
		TablePrefix?:                  string | fn.Fn
		Tags?:                         {
		} | fn.Fn
		Targets: __Targets
	}
	__CatalogTarget :: {
		DatabaseName?: string | fn.Fn
		Tables?:       [...string] | fn.Fn
	}
	__DynamoDBTarget :: {
		Path?: string | fn.Fn
	}
	__JdbcTarget :: {
		ConnectionName?: string | fn.Fn
		Exclusions?:     [...string] | fn.Fn
		Path?:           string | fn.Fn
	}
	__S3Target :: {
		Exclusions?: [...string] | fn.Fn
		Path?:       string | fn.Fn
	}
	__Schedule :: {
		ScheduleExpression?: string | fn.Fn
	}
	__SchemaChangePolicy :: {
		DeleteBehavior?: (string & ("DELETE_FROM_DATABASE" | "DEPRECATE_IN_DATABASE" | "LOG")) | fn.Fn
		UpdateBehavior?: (string & ("LOG" | "UPDATE_IN_DATABASE")) | fn.Fn
	}
	__Targets :: {
		CatalogTargets?: [...__CatalogTarget]
		DynamoDBTargets?: [...__DynamoDBTarget]
		JdbcTargets?: [...__JdbcTarget]
		S3Targets?: [...__S3Target]
	}
}
DataCatalogEncryptionSettings :: {
	Type: "AWS::Glue::DataCatalogEncryptionSettings"
	Properties: {
		CatalogId:                     string | fn.Fn
		DataCatalogEncryptionSettings: __DataCatalogEncryptionSettings
	}
	__ConnectionPasswordEncryption :: {
		KmsKeyId?:                          string | fn.Fn
		ReturnConnectionPasswordEncrypted?: bool | fn.Fn
	}
	__DataCatalogEncryptionSettings :: {
		ConnectionPasswordEncryption?: __ConnectionPasswordEncryption
		EncryptionAtRest?:             __EncryptionAtRest
	}
	__EncryptionAtRest :: {
		CatalogEncryptionMode?: string | fn.Fn
		SseAwsKmsKeyId?:        string | fn.Fn
	}
}
Database :: {
	Type: "AWS::Glue::Database"
	Properties: {
		CatalogId:     string | fn.Fn
		DatabaseInput: __DatabaseInput
	}
	__DatabaseInput :: {
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
		Command:            __JobCommand
		Connections?:       __ConnectionsList
		DefaultArguments?:  {
		} | fn.Fn
		Description?:           string | fn.Fn
		ExecutionProperty?:     __ExecutionProperty
		GlueVersion?:           string | fn.Fn
		LogUri?:                string | fn.Fn
		MaxCapacity?:           float | fn.Fn
		MaxRetries?:            float | fn.Fn
		Name?:                  string | fn.Fn
		NotificationProperty?:  __NotificationProperty
		NumberOfWorkers?:       (int & (>=0 & <=299)) | fn.Fn
		Role:                   string | fn.Fn
		SecurityConfiguration?: string | fn.Fn
		Tags?:                  {
		} | fn.Fn
		Timeout?:    int | fn.Fn
		WorkerType?: string | fn.Fn
	}
	__ConnectionsList :: {
		Connections?: [...string] | fn.Fn
	}
	__ExecutionProperty :: {
		MaxConcurrentRuns?: float | fn.Fn
	}
	__JobCommand :: {
		Name?:           string | fn.Fn
		PythonVersion?:  string | fn.Fn
		ScriptLocation?: string | fn.Fn
	}
	__NotificationProperty :: {
		NotifyDelayAfter?: int | fn.Fn
	}
}
MLTransform :: {
	Type: "AWS::Glue::MLTransform"
	Properties: {
		Description?:        string | fn.Fn
		InputRecordTables:   __InputRecordTables
		MaxCapacity?:        (float & (>=1 & <=100)) | fn.Fn
		MaxRetries?:         int | fn.Fn
		Name?:               string | fn.Fn
		NumberOfWorkers?:    int | fn.Fn
		Role:                string | fn.Fn
		Timeout?:            int | fn.Fn
		TransformParameters: __TransformParameters
		WorkerType?:         string | fn.Fn
	}
	__FindMatchesParameters :: {
		AccuracyCostTradeoff?:    float | fn.Fn
		EnforceProvidedLabels?:   bool | fn.Fn
		PrecisionRecallTradeoff?: float | fn.Fn
		PrimaryKeyColumnName:     string | fn.Fn
	}
	__GlueTables :: {
		CatalogId?:      string | fn.Fn
		ConnectionName?: string | fn.Fn
		DatabaseName:    string | fn.Fn
		TableName:       string | fn.Fn
	}
	__InputRecordTables :: {
		GlueTables?: [...__GlueTables]
	}
	__TransformParameters :: {
		FindMatchesParameters?: __FindMatchesParameters
		TransformType:          string | fn.Fn
	}
}
Partition :: {
	Type: "AWS::Glue::Partition"
	Properties: {
		CatalogId:      string | fn.Fn
		DatabaseName:   string | fn.Fn
		PartitionInput: __PartitionInput
		TableName:      string | fn.Fn
	}
	__Column :: {
		Comment?: string | fn.Fn
		Name:     string | fn.Fn
		Type?:    string | fn.Fn
	}
	__Order :: {
		Column:     string | fn.Fn
		SortOrder?: int | fn.Fn
	}
	__PartitionInput :: {
		Parameters?: {
		} | fn.Fn
		StorageDescriptor?: __StorageDescriptor
		Values:             [...string] | fn.Fn
	}
	__SerdeInfo :: {
		Name?:       string | fn.Fn
		Parameters?: {
		} | fn.Fn
		SerializationLibrary?: string | fn.Fn
	}
	__SkewedInfo :: {
		SkewedColumnNames?:             [...string] | fn.Fn
		SkewedColumnValueLocationMaps?: {
		} | fn.Fn
		SkewedColumnValues?: [...string] | fn.Fn
	}
	__StorageDescriptor :: {
		BucketColumns?: [...string] | fn.Fn
		Columns?: [...__Column]
		Compressed?:      bool | fn.Fn
		InputFormat?:     string | fn.Fn
		Location?:        string | fn.Fn
		NumberOfBuckets?: int | fn.Fn
		OutputFormat?:    string | fn.Fn
		Parameters?:      {
		} | fn.Fn
		SerdeInfo?:  __SerdeInfo
		SkewedInfo?: __SkewedInfo
		SortColumns?: [...__Order]
		StoredAsSubDirectories?: bool | fn.Fn
	}
}
SecurityConfiguration :: {
	Type: "AWS::Glue::SecurityConfiguration"
	Properties: {
		EncryptionConfiguration: __EncryptionConfiguration
		Name:                    string | fn.Fn
	}
	__CloudWatchEncryption :: {
		CloudWatchEncryptionMode?: string | fn.Fn
		KmsKeyArn?:                string | fn.Fn
	}
	__EncryptionConfiguration :: {
		CloudWatchEncryption?:   __CloudWatchEncryption
		JobBookmarksEncryption?: __JobBookmarksEncryption
		S3Encryptions?:          __S3Encryptions
	}
	__JobBookmarksEncryption :: {
		JobBookmarksEncryptionMode?: string | fn.Fn
		KmsKeyArn?:                  string | fn.Fn
	}
	__S3Encryption :: {
		KmsKeyArn?:        string | fn.Fn
		S3EncryptionMode?: string | fn.Fn
	}
	__S3Encryptions :: {
	}
}
Table :: {
	Type: "AWS::Glue::Table"
	Properties: {
		CatalogId:    string | fn.Fn
		DatabaseName: string | fn.Fn
		TableInput:   __TableInput
	}
	__Column :: {
		Comment?: string | fn.Fn
		Name:     string | fn.Fn
		Type?:    string | fn.Fn
	}
	__Order :: {
		Column:    string | fn.Fn
		SortOrder: int | fn.Fn
	}
	__SerdeInfo :: {
		Name?:       string | fn.Fn
		Parameters?: {
		} | fn.Fn
		SerializationLibrary?: string | fn.Fn
	}
	__SkewedInfo :: {
		SkewedColumnNames?:             [...string] | fn.Fn
		SkewedColumnValueLocationMaps?: {
		} | fn.Fn
		SkewedColumnValues?: [...string] | fn.Fn
	}
	__StorageDescriptor :: {
		BucketColumns?: [...string] | fn.Fn
		Columns?: [...__Column]
		Compressed?:      bool | fn.Fn
		InputFormat?:     string | fn.Fn
		Location?:        string | fn.Fn
		NumberOfBuckets?: int | fn.Fn
		OutputFormat?:    string | fn.Fn
		Parameters?:      {
		} | fn.Fn
		SerdeInfo?:  __SerdeInfo
		SkewedInfo?: __SkewedInfo
		SortColumns?: [...__Order]
		StoredAsSubDirectories?: bool | fn.Fn
	}
	__TableInput :: {
		Description?: string | fn.Fn
		Name?:        string | fn.Fn
		Owner?:       string | fn.Fn
		Parameters?:  {
		} | fn.Fn
		PartitionKeys?: [...__Column]
		Retention?:         int | fn.Fn
		StorageDescriptor?: __StorageDescriptor
		TableType?:         (string & ("EXTERNAL_TABLE" | "VIRTUAL_VIEW")) | fn.Fn
		ViewExpandedText?:  string | fn.Fn
		ViewOriginalText?:  string | fn.Fn
	}
}
Trigger :: {
	Type: "AWS::Glue::Trigger"
	Properties: {
		Actions: [...__Action]
		Description?:     string | fn.Fn
		Name?:            string | fn.Fn
		Predicate?:       __Predicate
		Schedule?:        string | fn.Fn
		StartOnCreation?: bool | fn.Fn
		Tags?:            {
		} | fn.Fn
		Type:          (string & ("CONDITIONAL" | "ON_DEMAND" | "SCHEDULED")) | fn.Fn
		WorkflowName?: string | fn.Fn
	}
	__Action :: {
		Arguments?: {
		} | fn.Fn
		CrawlerName?:           string | fn.Fn
		JobName?:               string | fn.Fn
		NotificationProperty?:  __NotificationProperty
		SecurityConfiguration?: string | fn.Fn
		Timeout?:               int | fn.Fn
	}
	__Condition :: {
		CrawlState?:      string | fn.Fn
		CrawlerName?:     string | fn.Fn
		JobName?:         string | fn.Fn
		LogicalOperator?: (string & ("EQUALS")) | fn.Fn
		State?:           (string & ("SUCCEEDED")) | fn.Fn
	}
	__NotificationProperty :: {
		NotifyDelayAfter?: int | fn.Fn
	}
	__Predicate :: {
		Conditions?: [...__Condition]
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
