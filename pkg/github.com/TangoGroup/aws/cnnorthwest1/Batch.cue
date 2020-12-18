package cnnorthwest1

import "github.com/TangoGroup/aws/fn"

#Batch: {
	#ComputeEnvironment: {
		Type:       "AWS::Batch::ComputeEnvironment"
		Properties: close({
			ComputeEnvironmentName?: string | fn.#Fn
			ComputeResources?:       close({
				AllocationStrategy?: string | fn.#Fn
				BidPercentage?:      int | fn.#Fn
				DesiredvCpus?:       int | fn.#Fn
				Ec2Configuration?:   [...close({
					ImageIdOverride?: string | fn.#Fn
					ImageType:        string | fn.#Fn
				})] | fn.If
				Ec2KeyPair?:     string | fn.#Fn
				ImageId?:        string | fn.#Fn
				InstanceRole:    string | fn.#Fn
				InstanceTypes:   [...(string | fn.#Fn)] | (string | fn.#Fn)
				LaunchTemplate?: close({
					LaunchTemplateId?:   string | fn.#Fn
					LaunchTemplateName?: string | fn.#Fn
					Version?:            string | fn.#Fn
				}) | fn.If
				MaxvCpus:          int | fn.#Fn
				MinvCpus:          int | fn.#Fn
				PlacementGroup?:   string | fn.#Fn
				SecurityGroupIds?: [...(string | fn.#Fn)] | (string | fn.#Fn)
				SpotIamFleetRole?: (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#) | fn.#Fn
				Subnets:           [...(string | fn.#Fn)] | (string | fn.#Fn)
				Tags?:             {
					[string]: _
				} | fn.#Fn
				Type: string | fn.#Fn
			}) | fn.If
			ServiceRole: (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#) | fn.#Fn
			State?:      string | fn.#Fn
			Tags?:       {
				[string]: _
			} | fn.#Fn
			Type: string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
