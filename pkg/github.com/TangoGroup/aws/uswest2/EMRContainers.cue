package uswest2

import "github.com/TangoGroup/aws/fn"

EMRContainers :: {
	VirtualCluster :: {
		Type:       "AWS::EMRContainers::VirtualCluster"
		Properties: close({
			ContainerProvider: close({
				Id:   string | fn.Fn
				Info: close({
					EksInfo: close({
						Namespace: string | fn.Fn
					}) | fn.If
				}) | fn.If
				Type: string | fn.Fn
			}) | fn.If
			Name:  string | fn.Fn
			Tags?: [...close({
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
}
