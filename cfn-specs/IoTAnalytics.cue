package IoTAnalytics

Channel :: {
	Type: "AWS::IoTAnalytics::Channel"
	Properties: {
		ChannelName?:     string
		ChannelStorage?:  __ChannelStorage
		RetentionPeriod?: __RetentionPeriod
		Tags?: [...__Tag]
	}
	__ChannelStorage = {
		CustomerManagedS3?: __CustomerManagedS3
		ServiceManagedS3?:  __ServiceManagedS3
	}
	__CustomerManagedS3 = {
		Bucket:     string
		KeyPrefix?: string
		RoleArn:    string
	}
	__RetentionPeriod = {
		NumberOfDays?: int
		Unlimited?:    bool
	}
	__ServiceManagedS3 = {
	}
}
Dataset :: {
	Type: "AWS::IoTAnalytics::Dataset"
	Properties: {
		Actions: [...__Action]
		ContentDeliveryRules?: [...__DatasetContentDeliveryRule]
		DatasetName?:     string
		RetentionPeriod?: __RetentionPeriod
		Tags?: [...__Tag]
		Triggers?: [...__Trigger]
		VersioningConfiguration?: __VersioningConfiguration
	}
	__Action = {
		ActionName:       string
		ContainerAction?: __ContainerAction
		QueryAction?:     __QueryAction
	}
	__ContainerAction = {
		ExecutionRoleArn:      string
		Image:                 string
		ResourceConfiguration: __ResourceConfiguration
		Variables?: [...__Variable]
	}
	__DatasetContentDeliveryRule = {
		Destination: __DatasetContentDeliveryRuleDestination
		EntryName?:  string
	}
	__DatasetContentDeliveryRuleDestination = {
		IotEventsDestinationConfiguration?: __IotEventsDestinationConfiguration
		S3DestinationConfiguration?:        __S3DestinationConfiguration
	}
	__DatasetContentVersionValue = {
		DatasetName?: string
	}
	__DeltaTime = {
		OffsetSeconds:  int
		TimeExpression: string
	}
	__Filter = {
		DeltaTime?: __DeltaTime
	}
	__GlueConfiguration = {
		DatabaseName: string
		TableName:    string
	}
	__IotEventsDestinationConfiguration = {
		InputName: string
		RoleArn:   string
	}
	__OutputFileUriValue = {
		FileName?: string
	}
	__QueryAction = {
		Filters?: [...__Filter]
		SqlQuery: string
	}
	__ResourceConfiguration = {
		ComputeType:    string
		VolumeSizeInGB: int
	}
	__RetentionPeriod = {
		NumberOfDays: int
		Unlimited:    bool
	}
	__S3DestinationConfiguration = {
		Bucket:             string
		GlueConfiguration?: __GlueConfiguration
		Key:                string
		RoleArn:            string
	}
	__Schedule = {
		ScheduleExpression: string
	}
	__Trigger = {
		Schedule?:          __Schedule
		TriggeringDataset?: __TriggeringDataset
	}
	__TriggeringDataset = {
		DatasetName: string
	}
	__Variable = {
		DatasetContentVersionValue?: __DatasetContentVersionValue
		DoubleValue?:                float
		OutputFileUriValue?:         __OutputFileUriValue
		StringValue?:                string
		VariableName:                string
	}
	__VersioningConfiguration = {
		MaxVersions?: int
		Unlimited?:   bool
	}
}
Datastore :: {
	Type: "AWS::IoTAnalytics::Datastore"
	Properties: {
		DatastoreName?:    string
		DatastoreStorage?: __DatastoreStorage
		RetentionPeriod?:  __RetentionPeriod
		Tags?: [...__Tag]
	}
	__CustomerManagedS3 = {
		Bucket:     string
		KeyPrefix?: string
		RoleArn:    string
	}
	__DatastoreStorage = {
		CustomerManagedS3?: __CustomerManagedS3
		ServiceManagedS3?:  __ServiceManagedS3
	}
	__RetentionPeriod = {
		NumberOfDays?: int
		Unlimited?:    bool
	}
	__ServiceManagedS3 = {
	}
}
Pipeline :: {
	Type: "AWS::IoTAnalytics::Pipeline"
	Properties: {
		PipelineActivities: [...__Activity]
		PipelineName?: string
		Tags?: [...__Tag]
	}
	__Activity = {
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
	__AddAttributes = {
		Attributes?: {
		}
		Name?: string
		Next?: string
	}
	__Channel = {
		ChannelName?: string
		Name?:        string
		Next?:        string
	}
	__Datastore = {
		DatastoreName?: string
		Name?:          string
	}
	__DeviceRegistryEnrich = {
		Attribute?: string
		Name?:      string
		Next?:      string
		RoleArn?:   string
		ThingName?: string
	}
	__DeviceShadowEnrich = {
		Attribute?: string
		Name?:      string
		Next?:      string
		RoleArn?:   string
		ThingName?: string
	}
	__Filter = {
		Filter?: string
		Name?:   string
		Next?:   string
	}
	__Lambda = {
		BatchSize?:  int
		LambdaName?: string
		Name?:       string
		Next?:       string
	}
	__Math = {
		Attribute?: string
		Math?:      string
		Name?:      string
		Next?:      string
	}
	__RemoveAttributes = {
		Attributes?: [...string]
		Name?: string
		Next?: string
	}
	__SelectAttributes = {
		Attributes?: [...string]
		Name?: string
		Next?: string
	}
}
