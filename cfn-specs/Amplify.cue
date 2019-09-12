package Amplify

App :: {
	Type: "AWS::Amplify::App"
	Properties: {
		AccessToken?:              string
		AutoBranchCreationConfig?: __AutoBranchCreationConfig
		BasicAuthConfig?:          __BasicAuthConfig
		BuildSpec?:                string
		CustomRules?: [...__CustomRule]
		Description?: string
		EnvironmentVariables?: [...__EnvironmentVariable]
		IAMServiceRole?: string
		Name:            string
		OauthToken?:     string
		Repository?:     string
		Tags?: [...__Tag]
	}
	__AutoBranchCreationConfig = {
		AutoBranchCreationPatterns?: [...string]
		BasicAuthConfig?:          __BasicAuthConfig
		BuildSpec?:                string
		EnableAutoBranchCreation?: bool
		EnableAutoBuild?:          bool
		EnvironmentVariables?: [...__EnvironmentVariable]
		Stage?: string
	}
	__BasicAuthConfig = {
		EnableBasicAuth?: bool
		Password?:        string
		Username?:        string
	}
	__CustomRule = {
		Condition?: string
		Source:     string
		Status?:    string
		Target:     string
	}
	__EnvironmentVariable = {
		Name:  string
		Value: string
	}
}
Branch :: {
	Type: "AWS::Amplify::Branch"
	Properties: {
		AppId:            string
		BasicAuthConfig?: __BasicAuthConfig
		BranchName:       string
		BuildSpec?:       string
		Description?:     string
		EnableAutoBuild?: bool
		EnvironmentVariables?: [...__EnvironmentVariable]
		Stage?: string
		Tags?: [...__Tag]
	}
	__BasicAuthConfig = {
		EnableBasicAuth?: bool
		Password:         string
		Username:         string
	}
	__EnvironmentVariable = {
		Name:  string
		Value: string
	}
}
Domain :: {
	Type: "AWS::Amplify::Domain"
	Properties: {
		AppId:      string
		DomainName: string
		SubDomainSettings: [...__SubDomainSetting]
	}
	__SubDomainSetting = {
		BranchName: string
		Prefix:     string
	}
}
