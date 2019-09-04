package KinesisAnalyticsV2

Application :: {
  Type: "AWS::KinesisAnalyticsV2::Application"
  Properties: {
    ApplicationConfiguration?: __ApplicationConfiguration
    ApplicationDescription?:   string
    ApplicationName?:          string
    RuntimeEnvironment:        string
    ServiceExecutionRole:      string
  }
  __ApplicationCodeConfiguration = {
    CodeContent:     __CodeContent
    CodeContentType: string
  }
  __ApplicationConfiguration = {
    ApplicationCodeConfiguration?:     __ApplicationCodeConfiguration
    ApplicationSnapshotConfiguration?: __ApplicationSnapshotConfiguration
    EnvironmentProperties?:            __EnvironmentProperties
    FlinkApplicationConfiguration?:    __FlinkApplicationConfiguration
    SqlApplicationConfiguration?:      __SqlApplicationConfiguration
  }
  __ApplicationSnapshotConfiguration = {
    SnapshotsEnabled: bool
  }
  __CSVMappingParameters = {
    RecordColumnDelimiter: string
    RecordRowDelimiter:    string
  }
  __CheckpointConfiguration = {
    CheckpointInterval?:         int
    CheckpointingEnabled?:       bool
    ConfigurationType:           string
    MinPauseBetweenCheckpoints?: int
  }
  __CodeContent = {
    S3ContentLocation?: __S3ContentLocation
    TextContent?:       string
    ZipFileContent?:    string
  }
  __EnvironmentProperties = {
    PropertyGroups?: [...__PropertyGroup]
  }
  __FlinkApplicationConfiguration = {
    CheckpointConfiguration?:  __CheckpointConfiguration
    MonitoringConfiguration?:  __MonitoringConfiguration
    ParallelismConfiguration?: __ParallelismConfiguration
  }
  __Input = {
    InputParallelism?:             __InputParallelism
    InputProcessingConfiguration?: __InputProcessingConfiguration
    InputSchema:                   __InputSchema
    KinesisFirehoseInput?:         __KinesisFirehoseInput
    KinesisStreamsInput?:          __KinesisStreamsInput
    NamePrefix:                    string
  }
  __InputLambdaProcessor = {
    ResourceARN: string
  }
  __InputParallelism = {
    Count?: int
  }
  __InputProcessingConfiguration = {
    InputLambdaProcessor?: __InputLambdaProcessor
  }
  __InputSchema = {
    RecordColumns: [...__RecordColumn]
    RecordEncoding?: string
    RecordFormat:    __RecordFormat
  }
  __JSONMappingParameters = {
    RecordRowPath: string
  }
  __KinesisFirehoseInput = {
    ResourceARN: string
  }
  __KinesisStreamsInput = {
    ResourceARN: string
  }
  __MappingParameters = {
    CSVMappingParameters?:  __CSVMappingParameters
    JSONMappingParameters?: __JSONMappingParameters
  }
  __MonitoringConfiguration = {
    ConfigurationType: string
    LogLevel?:         string
    MetricsLevel?:     string
  }
  __ParallelismConfiguration = {
    AutoScalingEnabled?: bool
    ConfigurationType:   string
    Parallelism?:        int
    ParallelismPerKPU?:  int
  }
  __PropertyGroup = {
    PropertyGroupId?: string
    PropertyMap?: {
    }
  }
  __RecordColumn = {
    Mapping?: string
    Name:     string
    SqlType:  string
  }
  __RecordFormat = {
    MappingParameters?: __MappingParameters
    RecordFormatType:   string
  }
  __S3ContentLocation = {
    BucketARN?:     string
    FileKey?:       string
    ObjectVersion?: string
  }
  __SqlApplicationConfiguration = {
    Inputs?: [...__Input]
  }
}
ApplicationCloudWatchLoggingOption :: {
  Type: "AWS::KinesisAnalyticsV2::ApplicationCloudWatchLoggingOption"
  Properties: {
    ApplicationName:         string
    CloudWatchLoggingOption: __CloudWatchLoggingOption
  }
  __CloudWatchLoggingOption = {
    LogStreamARN: string
  }
}
ApplicationOutput :: {
  Type: "AWS::KinesisAnalyticsV2::ApplicationOutput"
  Properties: {
    ApplicationName: string
    Output:          __Output
  }
  __DestinationSchema = {
    RecordFormatType?: string
  }
  __KinesisFirehoseOutput = {
    ResourceARN: string
  }
  __KinesisStreamsOutput = {
    ResourceARN: string
  }
  __LambdaOutput = {
    ResourceARN: string
  }
  __Output = {
    DestinationSchema:      __DestinationSchema
    KinesisFirehoseOutput?: __KinesisFirehoseOutput
    KinesisStreamsOutput?:  __KinesisStreamsOutput
    LambdaOutput?:          __LambdaOutput
    Name?:                  string
  }
}
ApplicationReferenceDataSource :: {
  Type: "AWS::KinesisAnalyticsV2::ApplicationReferenceDataSource"
  Properties: {
    ApplicationName:     string
    ReferenceDataSource: __ReferenceDataSource
  }
  __CSVMappingParameters = {
    RecordColumnDelimiter: string
    RecordRowDelimiter:    string
  }
  __JSONMappingParameters = {
    RecordRowPath: string
  }
  __MappingParameters = {
    CSVMappingParameters?:  __CSVMappingParameters
    JSONMappingParameters?: __JSONMappingParameters
  }
  __RecordColumn = {
    Mapping?: string
    Name:     string
    SqlType:  string
  }
  __RecordFormat = {
    MappingParameters?: __MappingParameters
    RecordFormatType:   string
  }
  __ReferenceDataSource = {
    ReferenceSchema:        __ReferenceSchema
    S3ReferenceDataSource?: __S3ReferenceDataSource
    TableName?:             string
  }
  __ReferenceSchema = {
    RecordColumns: [...__RecordColumn]
    RecordEncoding?: string
    RecordFormat:    __RecordFormat
  }
  __S3ReferenceDataSource = {
    BucketARN: string
    FileKey:   string
  }
}
