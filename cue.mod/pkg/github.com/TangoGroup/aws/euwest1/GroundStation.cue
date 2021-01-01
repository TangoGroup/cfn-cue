package euwest1

import "github.com/TangoGroup/aws/fn"

#GroundStation: {
	#Config: {
		Type:       "AWS::GroundStation::Config"
		Properties: close({
			ConfigData: {
				[string]: _
			} | fn.#Fn
			Name:  string | fn.#Fn
			Tags?: [...close({
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
	#DataflowEndpointGroup: {
		Type:       "AWS::GroundStation::DataflowEndpointGroup"
		Properties: close({
			EndpointDetails: [...close({
				Endpoint?: close({
					Address?: close({
						Name?: string | fn.#Fn
						Port?: int | fn.#Fn
					}) | fn.If
					Mtu?:    int | fn.#Fn
					Name?:   string | fn.#Fn
					Status?: string | fn.#Fn
				}) | fn.If
				SecurityDetails?: close({
					RoleArn?:          string | fn.#Fn
					SecurityGroupIds?: [...(string | fn.#Fn)] | (string | fn.#Fn)
					SubnetIds?:        [...(string | fn.#Fn)] | (string | fn.#Fn)
				}) | fn.If
			})] | fn.If
			Tags?: [...close({
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
	#MissionProfile: {
		Type:       "AWS::GroundStation::MissionProfile"
		Properties: close({
			ContactPostPassDurationSeconds?: int | fn.#Fn
			ContactPrePassDurationSeconds?:  int | fn.#Fn
			DataflowEdges:                   [...close({
				Destination?: string | fn.#Fn
				Source?:      string | fn.#Fn
			})] | fn.If
			MinimumViableContactDurationSeconds: int | fn.#Fn
			Name:                                string | fn.#Fn
			Tags?:                               [...close({
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			})] | fn.If
			TrackingConfigArn: string | fn.#Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
