package FSx

FileSystem :: {
  Type: "AWS::FSx::FileSystem"
  Properties: {
    BackupId?:            string
    FileSystemType?:      string
    KmsKeyId?:            string
    LustreConfiguration?: __LustreConfiguration
    SecurityGroupIds?: [...string]
    StorageCapacity?: >=300 & <=65536
    StorageCapacity?: int
    SubnetIds?: [...string]
    Tags?: [...__Tag]
    WindowsConfiguration?: __WindowsConfiguration
  }
  __LustreConfiguration = {
    ExportPath?:                 string
    ImportPath?:                 string
    ImportedFileChunkSize?:      int
    WeeklyMaintenanceStartTime?: string
  }
  __WindowsConfiguration = {
    ActiveDirectoryId?:             string
    AutomaticBackupRetentionDays?:  int
    CopyTagsToBackups?:             bool
    DailyAutomaticBackupStartTime?: string
    ThroughputCapacity?:            int
    WeeklyMaintenanceStartTime?:    string
  }
}
