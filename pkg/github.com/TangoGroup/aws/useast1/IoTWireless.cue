package useast1

import "github.com/TangoGroup/aws/fn"

IoTWireless :: {
	Destination :: {
		Type:       "AWS::IoTWireless::Destination"
		Properties: close({
			Description?:   string | fn.Fn
			Expression:     string | fn.Fn
			ExpressionType: string | fn.Fn
			Name:           string | fn.Fn
			RoleArn:        string | fn.Fn
			Tags?:          [...close({
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
	DeviceProfile :: {
		Type:       "AWS::IoTWireless::DeviceProfile"
		Properties: close({
			LoRaWAN?: close({
				ClassBTimeout?:     int | fn.Fn
				ClassCTimeout?:     int | fn.Fn
				MacVersion?:        string | fn.Fn
				MaxDutyCycle?:      int | fn.Fn
				MaxEirp?:           int | fn.Fn
				PingSlotDr?:        int | fn.Fn
				PingSlotFreq?:      int | fn.Fn
				PingSlotPeriod?:    int | fn.Fn
				RegParamsRevision?: string | fn.Fn
				RfRegion?:          string | fn.Fn
				Supports32BitFCnt?: bool | fn.Fn
				SupportsClassB?:    bool | fn.Fn
				SupportsClassC?:    bool | fn.Fn
				SupportsJoin?:      bool | fn.Fn
			}) | fn.If
			Name?: string | fn.Fn
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
	ServiceProfile :: {
		Type:       "AWS::IoTWireless::ServiceProfile"
		Properties: close({
			LoRaWAN?: close({
				AddGwMetadata?: bool | fn.Fn
			}) | fn.If
			Name?: string | fn.Fn
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
	WirelessDevice :: {
		Type:       "AWS::IoTWireless::WirelessDevice"
		Properties: close({
			Description?:          string | fn.Fn
			DestinationName:       string | fn.Fn
			LastUplinkReceivedAt?: string | fn.Fn
			LoRaWAN?:              close({
				AbpV10x?: close({
					DevAddr:     string | fn.Fn
					SessionKeys: close({
						AppSKey: string | fn.Fn
						NwkSKey: string | fn.Fn
					}) | fn.If
				}) | fn.If
				AbpV11?: close({
					DevAddr:     string | fn.Fn
					SessionKeys: close({
						AppSKey:     string | fn.Fn
						FNwkSIntKey: string | fn.Fn
						NwkSEncKey:  string | fn.Fn
						SNwkSIntKey: string | fn.Fn
					}) | fn.If
				}) | fn.If
				DevEui?:          string | fn.Fn
				DeviceProfileId?: string | fn.Fn
				OtaaV10x?:        close({
					AppEui: string | fn.Fn
					AppKey: string | fn.Fn
				}) | fn.If
				OtaaV11?: close({
					AppKey:  string | fn.Fn
					JoinEui: string | fn.Fn
					NwkKey:  string | fn.Fn
				}) | fn.If
				ServiceProfileId?: string | fn.Fn
			}) | fn.If
			Name?: string | fn.Fn
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			Type: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	WirelessGateway :: {
		Type:       "AWS::IoTWireless::WirelessGateway"
		Properties: close({
			Description?:          string | fn.Fn
			LastUplinkReceivedAt?: string | fn.Fn
			LoRaWAN:               close({
				GatewayEui: string | fn.Fn
				RfRegion:   string | fn.Fn
			}) | fn.If
			Name?: string | fn.Fn
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			ThingName?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
