package euwest1

import "github.com/TangoGroup/aws/fn"

#IoTWireless: {
	#Destination: {
		Type: "AWS::IoTWireless::Destination"
		Properties: {
			Description?:   string | fn.#Fn
			Expression:     string | fn.#Fn
			ExpressionType: string | fn.#Fn
			Name:           string | fn.#Fn
			NextToken?:     string | fn.#Fn
			RoleArn:        string | fn.#Fn
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
	#DeviceProfile: {
		Type: "AWS::IoTWireless::DeviceProfile"
		Properties: {
			LoRaWANDeviceProfile?: {
				ClassBTimeout?:     int | fn.#Fn
				ClassCTimeout?:     int | fn.#Fn
				MacVersion?:        string | fn.#Fn
				MaxDutyCycle?:      int | fn.#Fn
				MaxEirp?:           int | fn.#Fn
				PingSlotDr?:        int | fn.#Fn
				PingSlotFreq?:      int | fn.#Fn
				PingSlotPeriod?:    int | fn.#Fn
				RegParamsRevision?: string | fn.#Fn
				RfRegion?:          string | fn.#Fn
				Supports32BitFCnt?: bool | fn.#Fn
				SupportsClassB?:    bool | fn.#Fn
				SupportsClassC?:    bool | fn.#Fn
				SupportsJoin?:      bool | fn.#Fn
			} | fn.#If
			Name?:      string | fn.#Fn
			NextToken?: string | fn.#Fn
			Tags?:      [...{
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
	#ServiceProfile: {
		Type: "AWS::IoTWireless::ServiceProfile"
		Properties: {
			LoRaWANGetServiceProfileInfo?: {
				AddGwMetadata?:          bool | fn.#Fn
				ChannelMask?:            string | fn.#Fn
				DevStatusReqFreq?:       int | fn.#Fn
				DlBucketSize?:           int | fn.#Fn
				DlRate?:                 int | fn.#Fn
				DlRatePolicy?:           string | fn.#Fn
				DrMax?:                  int | fn.#Fn
				DrMin?:                  int | fn.#Fn
				HrAllowed?:              bool | fn.#Fn
				MinGwDiversity?:         int | fn.#Fn
				NwkGeoLoc?:              bool | fn.#Fn
				PrAllowed?:              bool | fn.#Fn
				RaAllowed?:              bool | fn.#Fn
				ReportDevStatusBattery?: bool | fn.#Fn
				ReportDevStatusMargin?:  bool | fn.#Fn
				TargetPer?:              int | fn.#Fn
				UlBucketSize?:           int | fn.#Fn
				UlRate?:                 int | fn.#Fn
				UlRatePolicy?:           string | fn.#Fn
			} | fn.#If
			LoRaWANServiceProfile?: {
				AddGwMetadata?: bool | fn.#Fn
			} | fn.#If
			Name?:      string | fn.#Fn
			NextToken?: string | fn.#Fn
			Tags?:      [...{
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
	#WirelessDevice: {
		Type: "AWS::IoTWireless::WirelessDevice"
		Properties: {
			Description?:    string | fn.#Fn
			DestinationName: string | fn.#Fn
			LoRaWANDevice?:  {
				AbpV10X?: {
					DevAddr:     string | fn.#Fn
					SessionKeys: {
						AppSKey: string | fn.#Fn
						NwkSKey: string | fn.#Fn
					} | fn.#If
				} | fn.#If
				AbpV11?: {
					DevAddr:     string | fn.#Fn
					SessionKeys: {
						AppSKey:     string | fn.#Fn
						FNwkSIntKey: string | fn.#Fn
						NwkSEncKey:  string | fn.#Fn
						SNwkSIntKey: string | fn.#Fn
					} | fn.#If
				} | fn.#If
				DevEui?:          string | fn.#Fn
				DeviceProfileId?: string | fn.#Fn
				OtaaV10X?:        {
					AppEui: string | fn.#Fn
					AppKey: string | fn.#Fn
				} | fn.#If
				OtaaV11?: {
					AppKey:  string | fn.#Fn
					JoinEui: string | fn.#Fn
					NwkKey:  string | fn.#Fn
				} | fn.#If
				ServiceProfileId?: string | fn.#Fn
			} | fn.#If
			Name?:      string | fn.#Fn
			NextToken?: string | fn.#Fn
			Tags?:      [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
			Type: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#WirelessGateway: {
		Type: "AWS::IoTWireless::WirelessGateway"
		Properties: {
			Description?:   string | fn.#Fn
			LoRaWANGateway: {
				GatewayEui: string | fn.#Fn
				RfRegion:   string | fn.#Fn
			} | fn.#If
			Name?:      string | fn.#Fn
			NextToken?: string | fn.#Fn
			Tags?:      [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
			ThingName?: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
