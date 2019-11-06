package Amplify

import "github.com/TangoGroup/fn"

App :: {
	Type: "AWS::Amplify::App"
	Properties: {
		AccessToken?:              string | fn.Fn
		AutoBranchCreationConfig?: __AutoBranchCreationConfig
		BasicAuthConfig?:          __BasicAuthConfig
		BuildSpec?:                string | fn.Fn
		CustomRules?: [...__CustomRule]
		Description?: string | fn.Fn
		EnvironmentVariables?: [...__EnvironmentVariable]
		IAMServiceRole?: string | fn.Fn
		Name:            string | fn.Fn
		OauthToken?:     string | fn.Fn
		Repository?:     string | fn.Fn
		Tags?: [...__Tag]
	}
	__AutoBranchCreationConfig :: {
		AutoBranchCreationPatterns?: [...string] | fn.Fn
		BasicAuthConfig?:            __BasicAuthConfig
		BuildSpec?:                  string | fn.Fn
		EnableAutoBranchCreation?:   bool | fn.Fn
		EnableAutoBuild?:            bool | fn.Fn
		EnablePullRequestPreview?:   bool | fn.Fn
		EnvironmentVariables?: [...__EnvironmentVariable]
		PullRequestEnvironmentName?: string | fn.Fn
		Stage?:                      string | fn.Fn
	}
	__BasicAuthConfig :: {
		EnableBasicAuth?: bool | fn.Fn
		Password?:        string | fn.Fn
		Username?:        string | fn.Fn
	}
	__CustomRule :: {
		Condition?: string | fn.Fn
		Source:     string | fn.Fn
		Status?:    string | fn.Fn
		Target:     string | fn.Fn
	}
	__EnvironmentVariable :: {
		Name:  string | fn.Fn
		Value: string | fn.Fn
	}
}
Branch :: {
	Type: "AWS::Amplify::Branch"
	Properties: {
		AppId:                     string | fn.Fn
		BasicAuthConfig?:          __BasicAuthConfig
		BranchName:                string | fn.Fn
		BuildSpec?:                string | fn.Fn
		Description?:              string | fn.Fn
		EnableAutoBuild?:          bool | fn.Fn
		EnablePullRequestPreview?: bool | fn.Fn
		EnvironmentVariables?: [...__EnvironmentVariable]
		PullRequestEnvironmentName?: string | fn.Fn
		Stage?:                      string | fn.Fn
		Tags?: [...__Tag]
	}
	__BasicAuthConfig :: {
		EnableBasicAuth?: bool | fn.Fn
		Password:         string | fn.Fn
		Username:         string | fn.Fn
	}
	__EnvironmentVariable :: {
		Name:  string | fn.Fn
		Value: string | fn.Fn
	}
}
Domain :: {
	Type: "AWS::Amplify::Domain"
	Properties: {
		AppId:      string | fn.Fn
		DomainName: string | fn.Fn
		SubDomainSettings: [...__SubDomainSetting]
	}
	__SubDomainSetting :: {
		BranchName: string | fn.Fn
		Prefix:     string | fn.Fn
	}
}
