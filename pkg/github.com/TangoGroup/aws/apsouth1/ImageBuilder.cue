package apsouth1

import "github.com/TangoGroup/aws/fn"

ImageBuilder :: {
	Component :: {
		Type:       "AWS::ImageBuilder::Component"
		Properties: close({
			ChangeDescription?: string | fn.Fn
			Data?:              string | fn.Fn
			Description?:       string | fn.Fn
			KmsKeyId?:          string | fn.Fn
			Name:               string | fn.Fn
			Platform:           string | fn.Fn
			Tags?:              {
				[string]: string | fn.Fn
			} | fn.If
			Uri?:    string | fn.Fn
			Version: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	DistributionConfiguration :: {
		Type:       "AWS::ImageBuilder::DistributionConfiguration"
		Properties: close({
			Description?:  string | fn.Fn
			Distributions: [...close({
				AmiDistributionConfiguration?: {
					[string]: _
				} | fn.Fn
				LicenseConfigurationArns?: [...(string | fn.Fn)] | (string | fn.Fn)
				Region?:                   string | fn.Fn
			})] | fn.If
			Name:  string | fn.Fn
			Tags?: {
				[string]: string | fn.Fn
			} | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	ImageRecipe :: {
		Type:       "AWS::ImageBuilder::ImageRecipe"
		Properties: close({
			BlockDeviceMappings?: [...close({
				DeviceName?: string | fn.Fn
				Ebs?:        close({
					DeleteOnTermination?: bool | fn.Fn
					Encrypted?:           bool | fn.Fn
					Iops?:                int | fn.Fn
					KmsKeyId?:            string | fn.Fn
					SnapshotId?:          string | fn.Fn
					VolumeSize?:          int | fn.Fn
					VolumeType?:          string | fn.Fn
				}) | fn.If
				NoDevice?:    string | fn.Fn
				VirtualName?: string | fn.Fn
			})] | fn.If
			Components: [...close({
				ComponentArn?: string | fn.Fn
			})] | fn.If
			Description?: string | fn.Fn
			Name:         string | fn.Fn
			ParentImage:  string | fn.Fn
			Tags?:        {
				[string]: string | fn.Fn
			} | fn.If
			Version: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
