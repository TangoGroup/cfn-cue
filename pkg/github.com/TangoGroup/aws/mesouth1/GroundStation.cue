package mesouth1

import "github.com/TangoGroup/aws/fn"

GroundStation :: {
	Config :: {
		Type:       "AWS::GroundStation::Config"
		Properties: close({
			ConfigData: close({
				AntennaDownlinkConfig?: close({
					SpectrumConfig?: close({
						Bandwidth?: close({
							Units?: string | fn.Fn
							Value?: number | fn.Fn
						}) | fn.If
						CenterFrequency?: close({
							Units?: string | fn.Fn
							Value?: number | fn.Fn
						}) | fn.If
						Polarization?: string | fn.Fn
					}) | fn.If
				}) | fn.If
				AntennaDownlinkDemodDecodeConfig?: close({
					DecodeConfig?: close({
						UnvalidatedJson?: string | fn.Fn
					}) | fn.If
					DemodulationConfig?: close({
						UnvalidatedJson?: string | fn.Fn
					}) | fn.If
					SpectrumConfig?: close({
						Bandwidth?: close({
							Units?: string | fn.Fn
							Value?: number | fn.Fn
						}) | fn.If
						CenterFrequency?: close({
							Units?: string | fn.Fn
							Value?: number | fn.Fn
						}) | fn.If
						Polarization?: string | fn.Fn
					}) | fn.If
				}) | fn.If
				AntennaUplinkConfig?: close({
					SpectrumConfig?: close({
						CenterFrequency?: close({
							Units?: string | fn.Fn
							Value?: number | fn.Fn
						}) | fn.If
						Polarization?: string | fn.Fn
					}) | fn.If
					TargetEirp?: close({
						Units?: string | fn.Fn
						Value?: number | fn.Fn
					}) | fn.If
					TransmitDisabled?: bool | fn.Fn
				}) | fn.If
				DataflowEndpointConfig?: close({
					DataflowEndpointName?:   string | fn.Fn
					DataflowEndpointRegion?: string | fn.Fn
				}) | fn.If
				S3RecordingConfig?: close({
					BucketArn?: string | fn.Fn
					Prefix?:    string | fn.Fn
					RoleArn?:   string | fn.Fn
				}) | fn.If
				TrackingConfig?: close({
					Autotrack?: string | fn.Fn
				}) | fn.If
				UplinkEchoConfig?: close({
					AntennaUplinkConfigArn?: string | fn.Fn
					Enabled?:                bool | fn.Fn
				}) | fn.If
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
	DataflowEndpointGroup :: {
		Type:       "AWS::GroundStation::DataflowEndpointGroup"
		Properties: close({
			EndpointDetails: [...close({
				Endpoint?: close({
					Address?: close({
						Name?: string | fn.Fn
						Port?: int | fn.Fn
					}) | fn.If
					Mtu?:  int | fn.Fn
					Name?: string | fn.Fn
				}) | fn.If
				SecurityDetails?: close({
					RoleArn?:          string | fn.Fn
					SecurityGroupIds?: [...(string | fn.Fn)] | (string | fn.Fn)
					SubnetIds?:        [...(string | fn.Fn)] | (string | fn.Fn)
				}) | fn.If
			})] | fn.If
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
	MissionProfile :: {
		Type:       "AWS::GroundStation::MissionProfile"
		Properties: close({
			ContactPostPassDurationSeconds?: int | fn.Fn
			ContactPrePassDurationSeconds?:  int | fn.Fn
			DataflowEdges:                   [...close({
				Destination?: string | fn.Fn
				Source?:      string | fn.Fn
			})] | fn.If
			MinimumViableContactDurationSeconds: int | fn.Fn
			Name:                                string | fn.Fn
			Tags?:                               [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			TrackingConfigArn: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
