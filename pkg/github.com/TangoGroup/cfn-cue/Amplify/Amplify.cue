package Amplify

import "github.com/TangoGroup/fn"

App :: {
	Type: "AWS::Amplify::App"
	Properties: {
		AccessToken?:              string | fn.Fn
		AutoBranchCreationConfig?: propAutoBranchCreationConfig
		BasicAuthConfig?:          propBasicAuthConfig
		BuildSpec?:                string | fn.Fn
		CustomRules?: [...propCustomRule]
		Description?: string | fn.Fn
		EnvironmentVariables?: [...propEnvironmentVariable]
		IAMServiceRole?: string | fn.Fn
		Name:            string | fn.Fn
		OauthToken?:     string | fn.Fn
		Repository?:     string | fn.Fn
		Tags?: [...propTag]
	}
	propAutoBranchCreationConfig :: {
		AutoBranchCreationPatterns?: [...string] | fn.Fn
		BasicAuthConfig?:            propBasicAuthConfig
		BuildSpec?:                  string | fn.Fn
		EnableAutoBranchCreation?:   bool | fn.Fn
		EnableAutoBuild?:            bool | fn.Fn
		EnablePullRequestPreview?:   bool | fn.Fn
		EnvironmentVariables?: [...propEnvironmentVariable]
		PullRequestEnvironmentName?: string | fn.Fn
		Stage?:                      string | fn.Fn
	}
	propBasicAuthConfig :: {
		EnableBasicAuth?: bool | fn.Fn
		Password?:        string | fn.Fn
		Username?:        string | fn.Fn
	}
	propCustomRule :: {
		Condition?: string | fn.Fn
		Source:     string | fn.Fn
		Status?:    string | fn.Fn
		Target:     string | fn.Fn
	}
	propEnvironmentVariable :: {
		Name:  string | fn.Fn
		Value: string | fn.Fn
	}
}
Branch :: {
	Type: "AWS::Amplify::Branch"
	Properties: {
		AppId:                     string | fn.Fn
		BasicAuthConfig?:          propBasicAuthConfig
		BranchName:                string | fn.Fn
		BuildSpec?:                string | fn.Fn
		Description?:              string | fn.Fn
		EnableAutoBuild?:          bool | fn.Fn
		EnablePullRequestPreview?: bool | fn.Fn
		EnvironmentVariables?: [...propEnvironmentVariable]
		PullRequestEnvironmentName?: string | fn.Fn
		Stage?:                      string | fn.Fn
		Tags?: [...propTag]
	}
	propBasicAuthConfig :: {
		EnableBasicAuth?: bool | fn.Fn
		Password:         string | fn.Fn
		Username:         string | fn.Fn
	}
	propEnvironmentVariable :: {
		Name:  string | fn.Fn
		Value: string | fn.Fn
	}
}
Domain :: {
	Type: "AWS::Amplify::Domain"
	Properties: {
		AppId:      string | fn.Fn
		DomainName: string | fn.Fn
		SubDomainSettings: [...propSubDomainSetting]
	}
	propSubDomainSetting :: {
		BranchName: string | fn.Fn
		Prefix:     string | fn.Fn
	}
}
