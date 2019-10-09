package IoTAnalytics

import "github.com/TangoGroup/fn"

Channel :: {
	Type: "AWS::IoTAnalytics::Channel"
	Properties: {
		ChannelName?:     string | fn.Fn
		ChannelStorage?:  __ChannelStorage
		RetentionPeriod?: __RetentionPeriod
		Tags?: [...__Tag]
	}
	__ChannelStorage :: {
		CustomerManagedS3?: __CustomerManagedS3
		ServiceManagedS3?:  __ServiceManagedS3
	}
	__CustomerManagedS3 :: {
		Bucket:     string | fn.Fn
		KeyPrefix?: string | fn.Fn
		RoleArn:    string | fn.Fn
	}
	__RetentionPeriod :: {
		NumberOfDays?: int | fn.Fn
		Unlimited?:    bool | fn.Fn
	}
	__ServiceManagedS3 :: {
	}
}
Dataset :: {
	Type: "AWS::IoTAnalytics::Dataset"
	Properties: {
		Actions: [...__Action]
		ContentDeliveryRules?: [...__DatasetContentDeliveryRule]
		DatasetName?:     string | fn.Fn
		RetentionPeriod?: __RetentionPeriod
		Tags?: [...__Tag]
		Triggers?: [...__Trigger]
		VersioningConfiguration?: __VersioningConfiguration
	}
	__Action :: {
		ActionName:       string | fn.Fn
		ContainerAction?: __ContainerAction
		QueryAction?:     __QueryAction
	}
	__ContainerAction :: {
		ExecutionRoleArn:      string | fn.Fn
		Image:                 string | fn.Fn
		ResourceConfiguration: __ResourceConfiguration
		Variables?: [...__Variable]
	}
	__DatasetContentDeliveryRule :: {
		Destination: __DatasetContentDeliveryRuleDestination
		EntryName?:  string | fn.Fn
	}
	__DatasetContentDeliveryRuleDestination :: {
		IotEventsDestinationConfiguration?: __IotEventsDestinationConfiguration
		S3DestinationConfiguration?:        __S3DestinationConfiguration
	}
	__DatasetContentVersionValue :: {
		DatasetName?: string | fn.Fn
	}
	__DeltaTime :: {
		OffsetSeconds:  int | fn.Fn
		TimeExpression: string | fn.Fn
	}
	__Filter :: {
		DeltaTime?: __DeltaTime
	}
	__GlueConfiguration :: {
		DatabaseName: string | fn.Fn
		TableName:    string | fn.Fn
	}
	__IotEventsDestinationConfiguration :: {
		InputName: string | fn.Fn
		RoleArn:   string | fn.Fn
	}
	__OutputFileUriValue :: {
		FileName?: string | fn.Fn
	}
	__QueryAction :: {
		Filters?: [...__Filter]
		SqlQuery: string | fn.Fn
	}
	__ResourceConfiguration :: {
		ComputeType:    string | fn.Fn
		VolumeSizeInGB: int | fn.Fn
	}
	__RetentionPeriod :: {
		NumberOfDays: int | fn.Fn
		Unlimited:    bool | fn.Fn
	}
	__S3DestinationConfiguration :: {
		Bucket:             string | fn.Fn
		GlueConfiguration?: __GlueConfiguration
		Key:                string | fn.Fn
		RoleArn:            string | fn.Fn
	}
	__Schedule :: {
		ScheduleExpression: string | fn.Fn
	}
	__Trigger :: {
		Schedule?:          __Schedule
		TriggeringDataset?: __TriggeringDataset
	}
	__TriggeringDataset :: {
		DatasetName: string | fn.Fn
	}
	__Variable :: {
		DatasetContentVersionValue?: __DatasetContentVersionValue
		DoubleValue?:                float | fn.Fn
		OutputFileUriValue?:         __OutputFileUriValue
		StringValue?:                string | fn.Fn
		VariableName:                string | fn.Fn
	}
	__VersioningConfiguration :: {
		MaxVersions?: int | fn.Fn
		Unlimited?:   bool | fn.Fn
	}
}
Datastore :: {
	Type: "AWS::IoTAnalytics::Datastore"
	Properties: {
		DatastoreName?:    string | fn.Fn
		DatastoreStorage?: __DatastoreStorage
		RetentionPeriod?:  __RetentionPeriod
		Tags?: [...__Tag]
	}
	__CustomerManagedS3 :: {
		Bucket:     string | fn.Fn
		KeyPrefix?: string | fn.Fn
		RoleArn:    string | fn.Fn
	}
	__DatastoreStorage :: {
		CustomerManagedS3?: __CustomerManagedS3
		ServiceManagedS3?:  __ServiceManagedS3
	}
	__RetentionPeriod :: {
		NumberOfDays?: int | fn.Fn
		Unlimited?:    bool | fn.Fn
	}
	__ServiceManagedS3 :: {
	}
}
Pipeline :: {
	Type: "AWS::IoTAnalytics::Pipeline"
	Properties: {
		PipelineActivities: [...__Activity]
		PipelineName?: string | fn.Fn
		Tags?: [...__Tag]
	}
	__Activity :: {
		AddAttributes?:        __AddAttributes
		Channel?:              __Channel
		Datastore?:            __Datastore
		DeviceRegistryEnrich?: __DeviceRegistryEnrich
		DeviceShadowEnrich?:   __DeviceShadowEnrich
		Filter?:               __Filter
		Lambda?:               __Lambda
		Math?:                 __Math
		RemoveAttributes?:     __RemoveAttributes
		SelectAttributes?:     __SelectAttributes
	}
	__AddAttributes :: {
		Attributes?: {
		} | fn.Fn
		Name?: string | fn.Fn
		Next?: string | fn.Fn
	}
	__Channel :: {
		ChannelName?: string | fn.Fn
		Name?:        string | fn.Fn
		Next?:        string | fn.Fn
	}
	__Datastore :: {
		DatastoreName?: string | fn.Fn
		Name?:          string | fn.Fn
	}
	__DeviceRegistryEnrich :: {
		Attribute?: string | fn.Fn
		Name?:      string | fn.Fn
		Next?:      string | fn.Fn
		RoleArn?:   string | fn.Fn
		ThingName?: string | fn.Fn
	}
	__DeviceShadowEnrich :: {
		Attribute?: string | fn.Fn
		Name?:      string | fn.Fn
		Next?:      string | fn.Fn
		RoleArn?:   string | fn.Fn
		ThingName?: string | fn.Fn
	}
	__Filter :: {
		Filter?: string | fn.Fn
		Name?:   string | fn.Fn
		Next?:   string | fn.Fn
	}
	__Lambda :: {
		BatchSize?:  int | fn.Fn
		LambdaName?: string | fn.Fn
		Name?:       string | fn.Fn
		Next?:       string | fn.Fn
	}
	__Math :: {
		Attribute?: string | fn.Fn
		Math?:      string | fn.Fn
		Name?:      string | fn.Fn
		Next?:      string | fn.Fn
	}
	__RemoveAttributes :: {
		Attributes?: [...string] | fn.Fn
		Name?:       string | fn.Fn
		Next?:       string | fn.Fn
	}
	__SelectAttributes :: {
		Attributes?: [...string] | fn.Fn
		Name?:       string | fn.Fn
		Next?:       string | fn.Fn
	}
}
