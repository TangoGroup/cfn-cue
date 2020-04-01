package apnortheast1

import "github.com/TangoGroup/aws/fn"

EKS :: {
	Cluster :: {
		Type:       "AWS::EKS::Cluster"
		Properties: close({
			EncryptionConfig?: [...close({
				Provider?: close({
					KeyArn?: string | fn.Fn
				}) | fn.If
				Resources?: [...(string | fn.Fn)] | (string | fn.Fn)
			})] | fn.If
			Name?:              string | fn.Fn
			ResourcesVpcConfig: close({
				SecurityGroupIds?: [...(string | fn.Fn)] | (string | fn.Fn)
				SubnetIds:         [...(string | fn.Fn)] | (string | fn.Fn)
			}) | fn.If
			RoleArn:  string | fn.Fn
			Version?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Nodegroup :: {
		Type:       "AWS::EKS::Nodegroup"
		Properties: close({
			AmiType?:            string | fn.Fn
			ClusterName:         string | fn.Fn
			DiskSize?:           number | fn.Fn
			ForceUpdateEnabled?: bool | fn.Fn
			InstanceTypes?:      [...(string | fn.Fn)] | (string | fn.Fn)
			Labels?:             {
				[string]: _
			} | fn.Fn
			NodeRole:        string | fn.Fn
			NodegroupName?:  string | fn.Fn
			ReleaseVersion?: string | fn.Fn
			RemoteAccess?:   close({
				Ec2SshKey:             string | fn.Fn
				SourceSecurityGroups?: [...(string | fn.Fn)] | (string | fn.Fn)
			}) | fn.If
			ScalingConfig?: close({
				DesiredSize?: number | fn.Fn
				MaxSize?:     number | fn.Fn
				MinSize?:     number | fn.Fn
			}) | fn.If
			Subnets: [...(string | fn.Fn)] | (string | fn.Fn)
			Tags?:   {
				[string]: _
			} | fn.Fn
			Version?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
