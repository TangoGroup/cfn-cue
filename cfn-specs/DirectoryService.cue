package DirectoryService

MicrosoftAD :: {
  Type: "AWS::DirectoryService::MicrosoftAD"
  Properties: {
    CreateAlias?: bool
    Edition?:     string
    EnableSso?:   bool
    Name:         string
    Password:     string
    ShortName?:   string
    VpcSettings:  __VpcSettings
  }
  __VpcSettings = {
    SubnetIds: [...string]
    VpcId: string
  }
}
SimpleAD :: {
  Type: "AWS::DirectoryService::SimpleAD"
  Properties: {
    CreateAlias?: bool
    Description?: string
    EnableSso?:   bool
    Name:         string
    Password:     string
    ShortName?:   string
    Size:         string
    VpcSettings:  __VpcSettings
  }
  __VpcSettings = {
    SubnetIds: [...string]
    VpcId: string
  }
}
