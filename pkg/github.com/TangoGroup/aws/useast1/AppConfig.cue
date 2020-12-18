package useast1

import "github.com/TangoGroup/aws/fn"

#AppConfig: {
	#Application: {
		Type:       "AWS::AppConfig::Application"
		Properties: close({
			Description?: string | fn.#Fn
			Name:         string | fn.#Fn
			Tags?:        [...close({
				Key?:   string | fn.#Fn
				Value?: string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ConfigurationProfile: {
		Type:       "AWS::AppConfig::ConfigurationProfile"
		Properties: close({
			ApplicationId:     string | fn.#Fn
			Description?:      string | fn.#Fn
			LocationUri:       string | fn.#Fn
			Name:              string | fn.#Fn
			RetrievalRoleArn?: string | fn.#Fn
			Tags?:             [...close({
				Key?:   string | fn.#Fn
				Value?: string | fn.#Fn
			})] | fn.If
			Validators?: [...close({
				Content?: string | fn.#Fn
				Type?:    string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Deployment: {
		Type:       "AWS::AppConfig::Deployment"
		Properties: close({
			ApplicationId:          string | fn.#Fn
			ConfigurationProfileId: string | fn.#Fn
			ConfigurationVersion:   string | fn.#Fn
			DeploymentStrategyId:   string | fn.#Fn
			Description?:           string | fn.#Fn
			EnvironmentId:          string | fn.#Fn
			Tags?:                  [...close({
				Key?:   string | fn.#Fn
				Value?: string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#DeploymentStrategy: {
		Type:       "AWS::AppConfig::DeploymentStrategy"
		Properties: close({
			DeploymentDurationInMinutes: number | fn.#Fn
			Description?:                string | fn.#Fn
			FinalBakeTimeInMinutes?:     number | fn.#Fn
			GrowthFactor:                number | fn.#Fn
			GrowthType?:                 string | fn.#Fn
			Name:                        string | fn.#Fn
			ReplicateTo:                 string | fn.#Fn
			Tags?:                       [...close({
				Key?:   string | fn.#Fn
				Value?: string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Environment: {
		Type:       "AWS::AppConfig::Environment"
		Properties: close({
			ApplicationId: string | fn.#Fn
			Description?:  string | fn.#Fn
			Monitors?:     [...close({
				AlarmArn?:     string | fn.#Fn
				AlarmRoleArn?: string | fn.#Fn
			})] | fn.If
			Name:  string | fn.#Fn
			Tags?: [...close({
				Key?:   string | fn.#Fn
				Value?: string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#HostedConfigurationVersion: {
		Type:       "AWS::AppConfig::HostedConfigurationVersion"
		Properties: close({
			ApplicationId:          string | fn.#Fn
			ConfigurationProfileId: string | fn.#Fn
			Content:                string | fn.#Fn
			ContentType:            string | fn.#Fn
			Description?:           string | fn.#Fn
			LatestVersionNumber?:   number | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
