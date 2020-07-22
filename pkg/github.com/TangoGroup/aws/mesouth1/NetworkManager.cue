package mesouth1

import "github.com/TangoGroup/aws/fn"

NetworkManager :: {
	CustomerGatewayAssociation :: {
		Type:       "AWS::NetworkManager::CustomerGatewayAssociation"
		Properties: close({
			CustomerGatewayArn: string | fn.Fn
			DeviceId:           string | fn.Fn
			GlobalNetworkId:    string | fn.Fn
			LinkId?:            string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Device :: {
		Type:       "AWS::NetworkManager::Device"
		Properties: close({
			Description?:    string | fn.Fn
			GlobalNetworkId: string | fn.Fn
			Location?:       close({
				Address?:   string | fn.Fn
				Latitude?:  string | fn.Fn
				Longitude?: string | fn.Fn
			}) | fn.If
			Model?:        string | fn.Fn
			SerialNumber?: string | fn.Fn
			SiteId?:       string | fn.Fn
			Tags?:         [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			Type?:   string | fn.Fn
			Vendor?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	GlobalNetwork :: {
		Type:       "AWS::NetworkManager::GlobalNetwork"
		Properties: close({
			Description?: string | fn.Fn
			Tags?:        [...close({
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
	Link :: {
		Type:       "AWS::NetworkManager::Link"
		Properties: close({
			Bandwidth: close({
				DownloadSpeed?: int | fn.Fn
				UploadSpeed?:   int | fn.Fn
			}) | fn.If
			Description?:    string | fn.Fn
			GlobalNetworkId: string | fn.Fn
			Provider?:       string | fn.Fn
			SiteId:          string | fn.Fn
			Tags?:           [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			Type?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	LinkAssociation :: {
		Type:       "AWS::NetworkManager::LinkAssociation"
		Properties: close({
			DeviceId:        string | fn.Fn
			GlobalNetworkId: string | fn.Fn
			LinkId:          string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Site :: {
		Type:       "AWS::NetworkManager::Site"
		Properties: close({
			Description?:    string | fn.Fn
			GlobalNetworkId: string | fn.Fn
			Location?:       close({
				Address?:   string | fn.Fn
				Latitude?:  string | fn.Fn
				Longitude?: string | fn.Fn
			}) | fn.If
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
	TransitGatewayRegistration :: {
		Type:       "AWS::NetworkManager::TransitGatewayRegistration"
		Properties: close({
			GlobalNetworkId:   string | fn.Fn
			TransitGatewayArn: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
