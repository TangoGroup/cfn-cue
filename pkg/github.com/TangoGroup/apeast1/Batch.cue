package apeast1

import "github.com/TangoGroup/fn"

Batch :: {
	ComputeEnvironment :: {
		Type: "AWS::Batch::ComputeEnvironment"
		Properties: {
			ComputeEnvironmentName?: string | fn.Fn
			ComputeResources?: {
				AllocationStrategy?: string | fn.Fn
				BidPercentage?:      int | fn.Fn
				DesiredvCpus?:       int | fn.Fn
				Ec2KeyPair?:         string | fn.Fn
				ImageId?:            string | fn.Fn
				InstanceRole:        string | fn.Fn
				InstanceTypes: [...(string | fn.Fn)]
				LaunchTemplate?: {
					LaunchTemplateId?:   string | fn.Fn
					LaunchTemplateName?: string | fn.Fn
					Version?:            string | fn.Fn
				}
				MaxvCpus:        int | fn.Fn
				MinvCpus:        int | fn.Fn
				PlacementGroup?: string | fn.Fn
				SecurityGroupIds?: [...(string | fn.Fn)]
				SpotIamFleetRole?: (string & (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#)) | fn.Fn
				Subnets: [...(string | fn.Fn)]
				Tags?: {
				} | fn.Fn
				Type: string | fn.Fn
			}
			ServiceRole: (string & (=~#"arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/[a-zA-Z_0-9+=,.@\-_/]+"#)) | fn.Fn
			State?:      string | fn.Fn
			Type:        string | fn.Fn
		}
	}
}
