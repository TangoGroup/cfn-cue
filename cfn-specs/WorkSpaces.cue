package WorkSpaces

Workspace :: {
  Type: "AWS::WorkSpaces::Workspace"
  Properties: {
    BundleId:                     string
    DirectoryId:                  string
    RootVolumeEncryptionEnabled?: bool
    Tags?: [...__Tag]
    UserName:                     string
    UserVolumeEncryptionEnabled?: bool
    VolumeEncryptionKey?:         string
    WorkspaceProperties?:         __WorkspaceProperties
  }
  __WorkspaceProperties = {
    ComputeTypeName?:                     "GRAPHICS" | "PERFORMANCE" | "POWER" | "STANDARD" | "VALUE"
    ComputeTypeName?:                     string
    RootVolumeSizeGib?:                   int
    RunningMode?:                         "ALWAYS_ON" | "AUTO_STOP"
    RunningMode?:                         string
    RunningModeAutoStopTimeoutInMinutes?: int
    UserVolumeSizeGib?:                   int
  }
}
