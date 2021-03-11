package apnortheast3

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
			KubernetesNetworkConfig?: close({
				ServiceIpv4Cidr?: string | fn.Fn
			}) | fn.If
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
}
