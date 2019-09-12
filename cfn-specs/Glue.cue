package Glue

Classifier :: {
	Type: "AWS::Glue::Classifier"
	Properties: {
		CsvClassifier?:  __CsvClassifier
		GrokClassifier?: __GrokClassifier
		JsonClassifier?: __JsonClassifier
		XMLClassifier?:  __XMLClassifier
	}
	__CsvClassifier = {
		AllowSingleColumn?:    bool
		ContainsHeader?:       string
		Delimiter?:            string
		DisableValueTrimming?: bool
		Header?: [...string]
		Name?:        string
		QuoteSymbol?: string
	}
	__GrokClassifier = {
		Classification:  string
		CustomPatterns?: string
		GrokPattern:     string
		Name?:           string
	}
	__JsonClassifier = {
		JsonPath: string
		Name?:    string
	}
	__XMLClassifier = {
		Classification: string
		Name?:          string
		RowTag:         string
	}
}
Connection :: {
	Type: "AWS::Glue::Connection"
	Properties: {
		CatalogId:       string
		ConnectionInput: __ConnectionInput
	}
	__ConnectionInput = {
		ConnectionProperties: {
		}
		ConnectionType: "JDBC" | "SFTP"
		ConnectionType: string
		Description?:   string
		MatchCriteria?: [...string]
		Name?:                           string
		PhysicalConnectionRequirements?: __PhysicalConnectionRequirements
	}
	__PhysicalConnectionRequirements = {
		AvailabilityZone?: string
		SecurityGroupIdList?: [...string]
		SubnetId?: string
	}
}
Crawler :: {
	Type: "AWS::Glue::Crawler"
	Properties: {
		Classifiers?: [...string]
		Configuration?:                string
		CrawlerSecurityConfiguration?: string
		DatabaseName:                  string
		Description?:                  string
		Name?:                         string
		Role:                          string
		Schedule?:                     __Schedule
		SchemaChangePolicy?:           __SchemaChangePolicy
		TablePrefix?:                  string
		Tags?: {
		}
		Targets: __Targets
	}
	__JdbcTarget = {
		ConnectionName?: string
		Exclusions?: [...string]
		Path?: string
	}
	__S3Target = {
		Exclusions?: [...string]
		Path?: string
	}
	__Schedule = {
		ScheduleExpression?: string
	}
	__SchemaChangePolicy = {
		DeleteBehavior?: "DELETE_FROM_DATABASE" | "DEPRECATE_IN_DATABASE" | "LOG"
		DeleteBehavior?: string
		UpdateBehavior?: "LOG" | "UPDATE_IN_DATABASE"
		UpdateBehavior?: string
	}
	__Targets = {
		JdbcTargets?: [...__JdbcTarget]
		S3Targets?: [...__S3Target]
	}
}
DataCatalogEncryptionSettings :: {
	Type: "AWS::Glue::DataCatalogEncryptionSettings"
	Properties: {
		CatalogId:                     string
		DataCatalogEncryptionSettings: __DataCatalogEncryptionSettings
	}
	__ConnectionPasswordEncryption = {
		KmsKeyId?:                          string
		ReturnConnectionPasswordEncrypted?: bool
	}
	__DataCatalogEncryptionSettings = {
		ConnectionPasswordEncryption?: __ConnectionPasswordEncryption
		EncryptionAtRest?:             __EncryptionAtRest
	}
	__EncryptionAtRest = {
		CatalogEncryptionMode?: string
		SseAwsKmsKeyId?:        string
	}
}
Database :: {
	Type: "AWS::Glue::Database"
	Properties: {
		CatalogId:     string
		DatabaseInput: __DatabaseInput
	}
	__DatabaseInput = {
		Description?: string
		LocationUri?: string
		Name?:        string
		Parameters?: {
		}
	}
}
DevEndpoint :: {
	Type: "AWS::Glue::DevEndpoint"
	Properties: {
		EndpointName?:          string
		ExtraJarsS3Path?:       string
		ExtraPythonLibsS3Path?: string
		NumberOfNodes?:         int
		PublicKey?:             string
		RoleArn:                string
		SecurityConfiguration?: string
		SecurityGroupIds?: [...string]
		SubnetId?: string
		Tags?: {
		}
	}
}
Job :: {
	Type: "AWS::Glue::Job"
	Properties: {
		AllocatedCapacity?: float
		Command:            __JobCommand
		Connections?:       __ConnectionsList
		DefaultArguments?: {
		}
		Description?:           string
		ExecutionProperty?:     __ExecutionProperty
		GlueVersion?:           string
		LogUri?:                string
		MaxCapacity?:           float
		MaxRetries?:            float
		Name?:                  string
		NumberOfWorkers?:       >=0 & <=299
		NumberOfWorkers?:       int
		Role:                   string
		SecurityConfiguration?: string
		Tags?: {
		}
		WorkerType?: string
	}
	__ConnectionsList = {
		Connections?: [...string]
	}
	__ExecutionProperty = {
		MaxConcurrentRuns?: float
	}
	__JobCommand = {
		Name?:           string
		PythonVersion?:  string
		ScriptLocation?: string
	}
}
MLTransform :: {
	Type: "AWS::Glue::MLTransform"
	Properties: {
		Description?:        string
		InputRecordTables:   __InputRecordTables
		MaxCapacity?:        >=1 & <=100
		MaxCapacity?:        float
		MaxRetries?:         int
		Name?:               string
		NumberOfWorkers?:    int
		Role:                string
		Timeout?:            int
		TransformParameters: __TransformParameters
		WorkerType?:         string
	}
	__FindMatchesParameters = {
		AccuracyCostTradeoff?:    float
		EnforceProvidedLabels?:   bool
		PrecisionRecallTradeoff?: float
		PrimaryKeyColumnName:     string
	}
	__GlueTables = {
		CatalogId?:      string
		ConnectionName?: string
		DatabaseName:    string
		TableName:       string
	}
	__InputRecordTables = {
		GlueTables?: [...__GlueTables]
	}
	__TransformParameters = {
		FindMatchesParameters?: __FindMatchesParameters
		TransformType:          string
	}
}
Partition :: {
	Type: "AWS::Glue::Partition"
	Properties: {
		CatalogId:      string
		DatabaseName:   string
		PartitionInput: __PartitionInput
		TableName:      string
	}
	__Column = {
		Comment?: string
		Name:     string
		Type?:    string
	}
	__Order = {
		Column:     string
		SortOrder?: int
	}
	__PartitionInput = {
		Parameters?: {
		}
		StorageDescriptor?: __StorageDescriptor
		Values: [...string]
	}
	__SerdeInfo = {
		Name?: string
		Parameters?: {
		}
		SerializationLibrary?: string
	}
	__SkewedInfo = {
		SkewedColumnNames?: [...string]
		SkewedColumnValueLocationMaps?: {
		}
		SkewedColumnValues?: [...string]
	}
	__StorageDescriptor = {
		BucketColumns?: [...string]
		Columns?: [...__Column]
		Compressed?:      bool
		InputFormat?:     string
		Location?:        string
		NumberOfBuckets?: int
		OutputFormat?:    string
		Parameters?: {
		}
		SerdeInfo?:  __SerdeInfo
		SkewedInfo?: __SkewedInfo
		SortColumns?: [...__Order]
		StoredAsSubDirectories?: bool
	}
}
SecurityConfiguration :: {
	Type: "AWS::Glue::SecurityConfiguration"
	Properties: {
		EncryptionConfiguration: __EncryptionConfiguration
		Name:                    string
	}
	__CloudWatchEncryption = {
		CloudWatchEncryptionMode?: string
		KmsKeyArn?:                string
	}
	__EncryptionConfiguration = {
		CloudWatchEncryption?:   __CloudWatchEncryption
		JobBookmarksEncryption?: __JobBookmarksEncryption
		S3Encryptions?:          __S3Encryptions
	}
	__JobBookmarksEncryption = {
		JobBookmarksEncryptionMode?: string
		KmsKeyArn?:                  string
	}
	__S3Encryption = {
		KmsKeyArn?:        string
		S3EncryptionMode?: string
	}
	__S3Encryptions = {
	}
}
Table :: {
	Type: "AWS::Glue::Table"
	Properties: {
		CatalogId:    string
		DatabaseName: string
		TableInput:   __TableInput
	}
	__Column = {
		Comment?: string
		Name:     string
		Type?:    string
	}
	__Order = {
		Column:    string
		SortOrder: int
	}
	__SerdeInfo = {
		Name?: string
		Parameters?: {
		}
		SerializationLibrary?: string
	}
	__SkewedInfo = {
		SkewedColumnNames?: [...string]
		SkewedColumnValueLocationMaps?: {
		}
		SkewedColumnValues?: [...string]
	}
	__StorageDescriptor = {
		BucketColumns?: [...string]
		Columns?: [...__Column]
		Compressed?:      bool
		InputFormat?:     string
		Location?:        string
		NumberOfBuckets?: int
		OutputFormat?:    string
		Parameters?: {
		}
		SerdeInfo?:  __SerdeInfo
		SkewedInfo?: __SkewedInfo
		SortColumns?: [...__Order]
		StoredAsSubDirectories?: bool
	}
	__TableInput = {
		Description?: string
		Name?:        string
		Owner?:       string
		Parameters?: {
		}
		PartitionKeys?: [...__Column]
		Retention?:         int
		StorageDescriptor?: __StorageDescriptor
		TableType?:         "EXTERNAL_TABLE" | "VIRTUAL_VIEW"
		TableType?:         string
		ViewExpandedText?:  string
		ViewOriginalText?:  string
	}
}
Trigger :: {
	Type: "AWS::Glue::Trigger"
	Properties: {
		Actions: [...__Action]
		Description?: string
		Name?:        string
		Predicate?:   __Predicate
		Schedule?:    string
		Tags?: {
		}
		Type: "CONDITIONAL" | "ON_DEMAND" | "SCHEDULED"
		Type: string
	}
	__Action = {
		Arguments?: {
		}
		JobName?:               string
		SecurityConfiguration?: string
	}
	__Condition = {
		JobName?:         string
		LogicalOperator?: "EQUALS"
		LogicalOperator?: string
		State?:           "SUCCEEDED"
		State?:           string
	}
	__Predicate = {
		Conditions?: [...__Condition]
		Logical?: "AND"
		Logical?: string
	}
}
