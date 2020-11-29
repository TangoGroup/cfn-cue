package apnortheast1

import "github.com/TangoGroup/aws/fn"

Amplify :: {
	App :: {
		Type:       "AWS::Amplify::App"
		Properties: close({
			AccessToken?:              string | fn.Fn
			AutoBranchCreationConfig?: close({
				AutoBranchCreationPatterns?: [...(string | fn.Fn)] | (string | fn.Fn)
				BasicAuthConfig?:            close({
					EnableBasicAuth?: bool | fn.Fn
					Password?:        string | fn.Fn
					Username?:        string | fn.Fn
				}) | fn.If
				BuildSpec?:                string | fn.Fn
				EnableAutoBranchCreation?: bool | fn.Fn
				EnableAutoBuild?:          bool | fn.Fn
				EnablePerformanceMode?:    bool | fn.Fn
				EnablePullRequestPreview?: bool | fn.Fn
				EnvironmentVariables?:     [...close({
					Name:  string | fn.Fn
					Value: string | fn.Fn
				})] | fn.If
				PullRequestEnvironmentName?: string | fn.Fn
				Stage?:                      string | fn.Fn
			}) | fn.If
			BasicAuthConfig?: close({
				EnableBasicAuth?: bool | fn.Fn
				Password?:        string | fn.Fn
				Username?:        string | fn.Fn
			}) | fn.If
			BuildSpec?:   string | fn.Fn
			CustomRules?: [...close({
				Condition?: string | fn.Fn
				Source:     string | fn.Fn
				Status?:    string | fn.Fn
				Target:     string | fn.Fn
			})] | fn.If
			Description?:              string | fn.Fn
			EnableBranchAutoDeletion?: bool | fn.Fn
			EnvironmentVariables?:     [...close({
				Name:  string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			IAMServiceRole?: string | fn.Fn
			Name:            string | fn.Fn
			OauthToken?:     string | fn.Fn
			Repository?:     string | fn.Fn
			Tags?:           [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Branch :: {
		Type:       "AWS::Amplify::Branch"
		Properties: close({
			AppId:            string | fn.Fn
			BasicAuthConfig?: close({
				EnableBasicAuth?: bool | fn.Fn
				Password:         string | fn.Fn
				Username:         string | fn.Fn
			}) | fn.If
			BranchName:                string | fn.Fn
			BuildSpec?:                string | fn.Fn
			Description?:              string | fn.Fn
			EnableAutoBuild?:          bool | fn.Fn
			EnablePerformanceMode?:    bool | fn.Fn
			EnablePullRequestPreview?: bool | fn.Fn
			EnvironmentVariables?:     [...close({
				Name:  string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			PullRequestEnvironmentName?: string | fn.Fn
			Stage?:                      string | fn.Fn
			Tags?:                       [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Domain :: {
		Type:       "AWS::Amplify::Domain"
		Properties: close({
			AppId:                          string | fn.Fn
			AutoSubDomainCreationPatterns?: [...(string | fn.Fn)] | (string | fn.Fn)
			AutoSubDomainIAMRole?:          string | fn.Fn
			DomainName:                     string | fn.Fn
			EnableAutoSubDomain?:           bool | fn.Fn
			SubDomainSettings:              [...close({
				BranchName: string | fn.Fn
				Prefix:     string | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
