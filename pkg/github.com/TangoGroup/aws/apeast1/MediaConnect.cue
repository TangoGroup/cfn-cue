package apeast1

import "github.com/TangoGroup/aws/fn"

MediaConnect :: {
	Flow :: {
		Type:       "AWS::MediaConnect::Flow"
		Properties: close({
			AvailabilityZone?: string | fn.Fn
			Name:              string | fn.Fn
			Source:            close({
				Decryption?: close({
					Algorithm:                     string | fn.Fn
					ConstantInitializationVector?: string | fn.Fn
					DeviceId?:                     string | fn.Fn
					KeyType?:                      string | fn.Fn
					Region?:                       string | fn.Fn
					ResourceId?:                   string | fn.Fn
					RoleArn:                       string | fn.Fn
					SecretArn?:                    string | fn.Fn
					Url?:                          string | fn.Fn
				}) | fn.If
				Description?:      string | fn.Fn
				EntitlementArn?:   string | fn.Fn
				IngestIp?:         string | fn.Fn
				IngestPort?:       int | fn.Fn
				MaxBitrate?:       int | fn.Fn
				MaxLatency?:       int | fn.Fn
				Name?:             string | fn.Fn
				Protocol?:         string | fn.Fn
				SourceArn?:        string | fn.Fn
				StreamId?:         string | fn.Fn
				VpcInterfaceName?: string | fn.Fn
				WhitelistCidr?:    string | fn.Fn
			}) | fn.If
			SourceFailoverConfig?: close({
				RecoveryWindow?: int | fn.Fn
				State?:          string | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	FlowEntitlement :: {
		Type:       "AWS::MediaConnect::FlowEntitlement"
		Properties: close({
			DataTransferSubscriberFeePercent?: int | fn.Fn
			Description:                       string | fn.Fn
			Encryption?:                       close({
				Algorithm:                     string | fn.Fn
				ConstantInitializationVector?: string | fn.Fn
				DeviceId?:                     string | fn.Fn
				KeyType?:                      string | fn.Fn
				Region?:                       string | fn.Fn
				ResourceId?:                   string | fn.Fn
				RoleArn:                       string | fn.Fn
				SecretArn?:                    string | fn.Fn
				Url?:                          string | fn.Fn
			}) | fn.If
			EntitlementStatus?: string | fn.Fn
			FlowArn:            string | fn.Fn
			Name:               string | fn.Fn
			Subscribers:        [...(string | fn.Fn)] | (string | fn.Fn)
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	FlowOutput :: {
		Type:       "AWS::MediaConnect::FlowOutput"
		Properties: close({
			CidrAllowList?: [...(string | fn.Fn)] | (string | fn.Fn)
			Description?:   string | fn.Fn
			Destination?:   string | fn.Fn
			Encryption?:    close({
				Algorithm: string | fn.Fn
				KeyType?:  string | fn.Fn
				RoleArn:   string | fn.Fn
				SecretArn: string | fn.Fn
			}) | fn.If
			FlowArn:                 string | fn.Fn
			MaxLatency?:             int | fn.Fn
			Name?:                   string | fn.Fn
			Port?:                   int | fn.Fn
			Protocol:                string | fn.Fn
			RemoteId?:               string | fn.Fn
			SmoothingLatency?:       int | fn.Fn
			StreamId?:               string | fn.Fn
			VpcInterfaceAttachment?: close({
				VpcInterfaceName?: string | fn.Fn
			}) | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	FlowSource :: {
		Type:       "AWS::MediaConnect::FlowSource"
		Properties: close({
			Decryption?: close({
				Algorithm:                     string | fn.Fn
				ConstantInitializationVector?: string | fn.Fn
				DeviceId?:                     string | fn.Fn
				KeyType?:                      string | fn.Fn
				Region?:                       string | fn.Fn
				ResourceId?:                   string | fn.Fn
				RoleArn:                       string | fn.Fn
				SecretArn?:                    string | fn.Fn
				Url?:                          string | fn.Fn
			}) | fn.If
			Description:       string | fn.Fn
			EntitlementArn?:   string | fn.Fn
			FlowArn?:          string | fn.Fn
			IngestPort?:       int | fn.Fn
			MaxBitrate?:       int | fn.Fn
			MaxLatency?:       int | fn.Fn
			Name:              string | fn.Fn
			Protocol?:         string | fn.Fn
			StreamId?:         string | fn.Fn
			VpcInterfaceName?: string | fn.Fn
			WhitelistCidr?:    string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	FlowVpcInterface :: {
		Type:       "AWS::MediaConnect::FlowVpcInterface"
		Properties: close({
			FlowArn:          string | fn.Fn
			Name:             string | fn.Fn
			RoleArn:          string | fn.Fn
			SecurityGroupIds: [...(string | fn.Fn)] | (string | fn.Fn)
			SubnetId:         string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
