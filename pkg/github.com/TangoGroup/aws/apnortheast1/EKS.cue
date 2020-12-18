package apnortheast1

import "github.com/TangoGroup/aws/fn"

#EKS: {
	#Cluster: {
		Type:       "AWS::EKS::Cluster"
		Properties: close({
			EncryptionConfig?: [...close({
				Provider?: close({
					KeyArn?: string | fn.#Fn
				}) | fn.If
				Resources?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			})] | fn.If
			KubernetesNetworkConfig?: close({
				ServiceIpv4Cidr?: string | fn.#Fn
			}) | fn.If
			Name?:              string | fn.#Fn
			ResourcesVpcConfig: close({
				SecurityGroupIds?: [...(string | fn.#Fn)] | (string | fn.#Fn)
				SubnetIds:         [...(string | fn.#Fn)] | (string | fn.#Fn)
			}) | fn.If
			RoleArn:  string | fn.#Fn
			Version?: string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#FargateProfile: {
		Type:       "AWS::EKS::FargateProfile"
		Properties: close({
			ClusterName:         string | fn.#Fn
			FargateProfileName?: string | fn.#Fn
			PodExecutionRoleArn: string | fn.#Fn
			Selectors:           [...close({
				Labels?: [...close({
					Key:   string | fn.#Fn
					Value: string | fn.#Fn
				})] | fn.If
				Namespace: string | fn.#Fn
			})] | fn.If
			Subnets?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			Tags?:    [...close({
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Nodegroup: {
		Type:       "AWS::EKS::Nodegroup"
		Properties: close({
			AmiType?:            string | fn.#Fn
			ClusterName:         string | fn.#Fn
			DiskSize?:           number | fn.#Fn
			ForceUpdateEnabled?: bool | fn.#Fn
			InstanceTypes?:      [...(string | fn.#Fn)] | (string | fn.#Fn)
			Labels?:             {
				[string]: _
			} | fn.#Fn
			LaunchTemplate?: close({
				Id?:      string | fn.#Fn
				Name?:    string | fn.#Fn
				Version?: string | fn.#Fn
			}) | fn.If
			NodeRole:        string | fn.#Fn
			NodegroupName?:  string | fn.#Fn
			ReleaseVersion?: string | fn.#Fn
			RemoteAccess?:   close({
				Ec2SshKey:             string | fn.#Fn
				SourceSecurityGroups?: [...(string | fn.#Fn)] | (string | fn.#Fn)
			}) | fn.If
			ScalingConfig?: close({
				DesiredSize?: number | fn.#Fn
				MaxSize?:     number | fn.#Fn
				MinSize?:     number | fn.#Fn
			}) | fn.If
			Subnets: [...(string | fn.#Fn)] | (string | fn.#Fn)
			Tags?:   {
				[string]: _
			} | fn.#Fn
			Version?: string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
