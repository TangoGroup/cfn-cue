package euwest1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

IoTWireless :: {
	Destination :: {
		Type:       "AWS::IoTWireless::Destination"
		Properties: close({
			Description?:   string | fn.Fn
			Expression:     string | fn.Fn
			ExpressionType: ("RuleName" | "MqttTopic") | fn.Fn
			Name:           (=~#"[a-zA-Z0-9:_-]+"#) | fn.Fn
			RoleArn:        (strings.MinRunes(20) & strings.MaxRunes(2048)) | fn.Fn
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
				PingSlotFreq?:      (>=1000000 & <=16700000) | fn.Fn
				PingSlotPeriod?:    (>=128 & <=4096) | fn.Fn
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
			LastUplinkReceivedAt?: (=~#"^^([\+-]?\d{4}(?!\d{2}\b))((-?)((0[1-9]|1[0-2])(\3([12]\d|0[1-9]|3[01]))?|W([0-4]\d|5[0-2])(-?[1-7])?|(00[1-9]|0[1-9]\d|[12]\d{2}|3([0-5]\d|6[1-6])))([T\s]((([01]\d|2[0-3])((:?)[0-5]\d)?|24\:?00)([\.,]\d+(?!:))?)?(\17[0-5]\d([\.,]\d+)?)?([zZ]|([\+-])([01]\d|2[0-3]):?([0-5]\d)?)?)?)?$"#) | fn.Fn
			LoRaWAN?:              close({
				AbpV10x?: close({
					DevAddr:     (=~#"[a-fA-F0-9]{8}"#) | fn.Fn
					SessionKeys: close({
						AppSKey: (=~#"[a-fA-F0-9]{32}"#) | fn.Fn
						NwkSKey: (=~#"[a-fA-F0-9]{32}"#) | fn.Fn
					}) | fn.If
				}) | fn.If
				AbpV11?: close({
					DevAddr:     (=~#"[a-fA-F0-9]{8}"#) | fn.Fn
					SessionKeys: close({
						AppSKey:     (=~#"[a-fA-F0-9]{32}"#) | fn.Fn
						FNwkSIntKey: (=~#"[a-fA-F0-9]{32}"#) | fn.Fn
						NwkSEncKey:  (=~#"[a-fA-F0-9]{32}"#) | fn.Fn
						SNwkSIntKey: (=~#"[a-fA-F0-9]{32}"#) | fn.Fn
					}) | fn.If
				}) | fn.If
				DevEui?:          (=~#"[a-f0-9]{16}"#) | fn.Fn
				DeviceProfileId?: string | fn.Fn
				OtaaV10x?:        close({
					AppEui: (=~#"[a-fA-F0-9]{16}"#) | fn.Fn
					AppKey: (=~#"[a-fA-F0-9]{32}"#) | fn.Fn
				}) | fn.If
				OtaaV11?: close({
					AppKey:  (=~#"[a-fA-F0-9]{32}"#) | fn.Fn
					JoinEui: (=~#"[a-fA-F0-9]{16}"#) | fn.Fn
					NwkKey:  (=~#"[a-fA-F0-9]{32}"#) | fn.Fn
				}) | fn.If
				ServiceProfileId?: string | fn.Fn
			}) | fn.If
			Name?: string | fn.Fn
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			Type: ("Sidewalk" | "LoRaWAN") | fn.Fn
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
			LastUplinkReceivedAt?: (=~#"^^([\+-]?\d{4}(?!\d{2}\b))((-?)((0[1-9]|1[0-2])(\3([12]\d|0[1-9]|3[01]))?|W([0-4]\d|5[0-2])(-?[1-7])?|(00[1-9]|0[1-9]\d|[12]\d{2}|3([0-5]\d|6[1-6])))([T\s]((([01]\d|2[0-3])((:?)[0-5]\d)?|24\:?00)([\.,]\d+(?!:))?)?(\17[0-5]\d([\.,]\d+)?)?([zZ]|([\+-])([01]\d|2[0-3]):?([0-5]\d)?)?)?)?$"#) | fn.Fn
			LoRaWAN:               close({
				GatewayEui: (=~#"^(([0-9a-f]{2}-){7}|([0-9a-f]{2}:){7}|([0-9a-f]{2}\s){7}|([0-9a-f]{2}){7})([0-9a-f]{2})$"#) | fn.Fn
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
