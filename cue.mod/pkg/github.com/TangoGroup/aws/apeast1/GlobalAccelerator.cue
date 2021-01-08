package apeast1

import "github.com/TangoGroup/aws/fn"

#GlobalAccelerator: {
	#Accelerator: {
		Type: "AWS::GlobalAccelerator::Accelerator"
		Properties: {
			Enabled?:       bool | fn.#Fn
			IpAddressType?: string | fn.#Fn
			IpAddresses?:   [...(string | fn.#Fn)] | (string | fn.#Fn)
			Name:           string | fn.#Fn
			Tags?:          [...{
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
	#EndpointGroup: {
		Type: "AWS::GlobalAccelerator::EndpointGroup"
		Properties: {
			EndpointConfigurations?: [...{
				ClientIPPreservationEnabled?: bool | fn.#Fn
				EndpointId:                   string | fn.#Fn
				Weight?:                      int | fn.#Fn
			}] | fn.#If
			EndpointGroupRegion:         string | fn.#Fn
			HealthCheckIntervalSeconds?: int | fn.#Fn
			HealthCheckPath?:            string | fn.#Fn
			HealthCheckPort?:            int | fn.#Fn
			HealthCheckProtocol?:        string | fn.#Fn
			ListenerArn:                 string | fn.#Fn
			PortOverrides?:              [...{
				EndpointPort: int | fn.#Fn
				ListenerPort: int | fn.#Fn
			}] | fn.#If
			ThresholdCount?:        int | fn.#Fn
			TrafficDialPercentage?: number | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Listener: {
		Type: "AWS::GlobalAccelerator::Listener"
		Properties: {
			AcceleratorArn:  string | fn.#Fn
			ClientAffinity?: string | fn.#Fn
			PortRanges:      [...{
				FromPort: int | fn.#Fn
				ToPort:   int | fn.#Fn
			}] | fn.#If
			Protocol: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
