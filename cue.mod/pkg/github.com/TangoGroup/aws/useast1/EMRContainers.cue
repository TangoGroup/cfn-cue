package useast1

import "github.com/TangoGroup/aws/fn"

#EMRContainers: {
	#VirtualCluster: {
		Type: "AWS::EMRContainers::VirtualCluster"
		Properties: {
			ContainerProvider: {
				Id:   string | fn.#Fn
				Info: {
					EksInfo: {
						Namespace: string | fn.#Fn
					} | fn.#If
				} | fn.#If
				Type: string | fn.#Fn
			} | fn.#If
			Name:  string | fn.#Fn
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
