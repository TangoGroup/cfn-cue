package cnnorthwest1

import "github.com/TangoGroup/aws/fn"

#ImageBuilder: {
	#Component: {
		Type:       "AWS::ImageBuilder::Component"
		Properties: close({
			ChangeDescription?:   string | fn.#Fn
			Data?:                string | fn.#Fn
			Description?:         string | fn.#Fn
			KmsKeyId?:            string | fn.#Fn
			Name:                 string | fn.#Fn
			Platform:             string | fn.#Fn
			SupportedOsVersions?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			Tags?:                {
				[string]: string | fn.#Fn
			} | fn.If
			Uri?:    string | fn.#Fn
			Version: string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#DistributionConfiguration: {
		Type:       "AWS::ImageBuilder::DistributionConfiguration"
		Properties: close({
			Description?:  string | fn.#Fn
			Distributions: [...close({
				AmiDistributionConfiguration?: {
					[string]: _
				} | fn.#Fn
				LicenseConfigurationArns?: [...(string | fn.#Fn)] | (string | fn.#Fn)
				Region:                    string | fn.#Fn
			})] | fn.If
			Name:  string | fn.#Fn
			Tags?: {
				[string]: string | fn.#Fn
			} | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Image: {
		Type:       "AWS::ImageBuilder::Image"
		Properties: close({
			DistributionConfigurationArn?: string | fn.#Fn
			EnhancedImageMetadataEnabled?: bool | fn.#Fn
			ImageRecipeArn:                string | fn.#Fn
			ImageTestsConfiguration?:      close({
				ImageTestsEnabled?: bool | fn.#Fn
				TimeoutMinutes?:    int | fn.#Fn
			}) | fn.If
			InfrastructureConfigurationArn: string | fn.#Fn
			Tags?:                          {
				[string]: string | fn.#Fn
			} | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ImagePipeline: {
		Type:       "AWS::ImageBuilder::ImagePipeline"
		Properties: close({
			Description?:                  string | fn.#Fn
			DistributionConfigurationArn?: string | fn.#Fn
			EnhancedImageMetadataEnabled?: bool | fn.#Fn
			ImageRecipeArn:                string | fn.#Fn
			ImageTestsConfiguration?:      close({
				ImageTestsEnabled?: bool | fn.#Fn
				TimeoutMinutes?:    int | fn.#Fn
			}) | fn.If
			InfrastructureConfigurationArn: string | fn.#Fn
			Name:                           string | fn.#Fn
			Schedule?:                      close({
				PipelineExecutionStartCondition?: string | fn.#Fn
				ScheduleExpression?:              string | fn.#Fn
			}) | fn.If
			Status?: string | fn.#Fn
			Tags?:   {
				[string]: string | fn.#Fn
			} | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#ImageRecipe: {
		Type:       "AWS::ImageBuilder::ImageRecipe"
		Properties: close({
			BlockDeviceMappings?: [...close({
				DeviceName?: string | fn.#Fn
				Ebs?:        close({
					DeleteOnTermination?: bool | fn.#Fn
					Encrypted?:           bool | fn.#Fn
					Iops?:                int | fn.#Fn
					KmsKeyId?:            string | fn.#Fn
					SnapshotId?:          string | fn.#Fn
					VolumeSize?:          int | fn.#Fn
					VolumeType?:          string | fn.#Fn
				}) | fn.If
				NoDevice?:    string | fn.#Fn
				VirtualName?: string | fn.#Fn
			})] | fn.If
			Components: [...close({
				ComponentArn?: string | fn.#Fn
			})] | fn.If
			Description?: string | fn.#Fn
			Name:         string | fn.#Fn
			ParentImage:  string | fn.#Fn
			Tags?:        {
				[string]: string | fn.#Fn
			} | fn.If
			Version:           string | fn.#Fn
			WorkingDirectory?: string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#InfrastructureConfiguration: {
		Type:       "AWS::ImageBuilder::InfrastructureConfiguration"
		Properties: close({
			Description?:        string | fn.#Fn
			InstanceProfileName: string | fn.#Fn
			InstanceTypes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
			KeyPair?:            string | fn.#Fn
			Logging?:            {
				[string]: _
			} | fn.#Fn
			Name:          string | fn.#Fn
			ResourceTags?: {
				[string]: string | fn.#Fn
			} | fn.If
			SecurityGroupIds?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			SnsTopicArn?:      string | fn.#Fn
			SubnetId?:         string | fn.#Fn
			Tags?:             {
				[string]: string | fn.#Fn
			} | fn.If
			TerminateInstanceOnFailure?: bool | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
