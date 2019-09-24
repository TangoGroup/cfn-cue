package DirectoryService

MicrosoftAD :: {
	Type: "AWS::DirectoryService::MicrosoftAD"
	Properties: {
		CreateAlias?: bool
		Edition?:     "Enterprise" | "Standard"
		Edition?:     string
		EnableSso?:   bool
		Name:         string
		Password:     string
		ShortName?:   string
		VpcSettings:  __VpcSettings
	}
	__VpcSettings :: {
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
		Size:         "Large" | "Small"
		Size:         string
		VpcSettings:  __VpcSettings
	}
	__VpcSettings :: {
		SubnetIds: [...string]
		VpcId: string
	}
}
