package IoTAnalytics

import "github.com/TangoGroup/fn"

Channel :: {
	Type: "AWS::IoTAnalytics::Channel"
	Properties: {
		ChannelName?:     string | fn.Fn
		ChannelStorage?:  propChannelStorage
		RetentionPeriod?: propRetentionPeriod
		Tags?: [...propTag]
	}
	propChannelStorage :: {
		CustomerManagedS3?: propCustomerManagedS3
		ServiceManagedS3?:  propServiceManagedS3
	}
	propCustomerManagedS3 :: {
		Bucket:     string | fn.Fn
		KeyPrefix?: string | fn.Fn
		RoleArn:    string | fn.Fn
	}
	propRetentionPeriod :: {
		NumberOfDays?: int | fn.Fn
		Unlimited?:    bool | fn.Fn
	}
	propServiceManagedS3 :: {
	}
}
Dataset :: {
	Type: "AWS::IoTAnalytics::Dataset"
	Properties: {
		Actions: [...propAction]
		ContentDeliveryRules?: [...propDatasetContentDeliveryRule]
		DatasetName?:     string | fn.Fn
		RetentionPeriod?: propRetentionPeriod
		Tags?: [...propTag]
		Triggers?: [...propTrigger]
		VersioningConfiguration?: propVersioningConfiguration
	}
	propAction :: {
		ActionName:       string | fn.Fn
		ContainerAction?: propContainerAction
		QueryAction?:     propQueryAction
	}
	propContainerAction :: {
		ExecutionRoleArn:      string | fn.Fn
		Image:                 string | fn.Fn
		ResourceConfiguration: propResourceConfiguration
		Variables?: [...propVariable]
	}
	propDatasetContentDeliveryRule :: {
		Destination: propDatasetContentDeliveryRuleDestination
		EntryName?:  string | fn.Fn
	}
	propDatasetContentDeliveryRuleDestination :: {
		IotEventsDestinationConfiguration?: propIotEventsDestinationConfiguration
		S3DestinationConfiguration?:        propS3DestinationConfiguration
	}
	propDatasetContentVersionValue :: {
		DatasetName?: string | fn.Fn
	}
	propDeltaTime :: {
		OffsetSeconds:  int | fn.Fn
		TimeExpression: string | fn.Fn
	}
	propFilter :: {
		DeltaTime?: propDeltaTime
	}
	propGlueConfiguration :: {
		DatabaseName: string | fn.Fn
		TableName:    string | fn.Fn
	}
	propIotEventsDestinationConfiguration :: {
		InputName: string | fn.Fn
		RoleArn:   string | fn.Fn
	}
	propOutputFileUriValue :: {
		FileName?: string | fn.Fn
	}
	propQueryAction :: {
		Filters?: [...propFilter]
		SqlQuery: string | fn.Fn
	}
	propResourceConfiguration :: {
		ComputeType:    string | fn.Fn
		VolumeSizeInGB: int | fn.Fn
	}
	propRetentionPeriod :: {
		NumberOfDays: int | fn.Fn
		Unlimited:    bool | fn.Fn
	}
	propS3DestinationConfiguration :: {
		Bucket:             string | fn.Fn
		GlueConfiguration?: propGlueConfiguration
		Key:                string | fn.Fn
		RoleArn:            string | fn.Fn
	}
	propSchedule :: {
		ScheduleExpression: string | fn.Fn
	}
	propTrigger :: {
		Schedule?:          propSchedule
		TriggeringDataset?: propTriggeringDataset
	}
	propTriggeringDataset :: {
		DatasetName: string | fn.Fn
	}
	propVariable :: {
		DatasetContentVersionValue?: propDatasetContentVersionValue
		DoubleValue?:                float | fn.Fn
		OutputFileUriValue?:         propOutputFileUriValue
		StringValue?:                string | fn.Fn
		VariableName:                string | fn.Fn
	}
	propVersioningConfiguration :: {
		MaxVersions?: int | fn.Fn
		Unlimited?:   bool | fn.Fn
	}
}
Datastore :: {
	Type: "AWS::IoTAnalytics::Datastore"
	Properties: {
		DatastoreName?:    string | fn.Fn
		DatastoreStorage?: propDatastoreStorage
		RetentionPeriod?:  propRetentionPeriod
		Tags?: [...propTag]
	}
	propCustomerManagedS3 :: {
		Bucket:     string | fn.Fn
		KeyPrefix?: string | fn.Fn
		RoleArn:    string | fn.Fn
	}
	propDatastoreStorage :: {
		CustomerManagedS3?: propCustomerManagedS3
		ServiceManagedS3?:  propServiceManagedS3
	}
	propRetentionPeriod :: {
		NumberOfDays?: int | fn.Fn
		Unlimited?:    bool | fn.Fn
	}
	propServiceManagedS3 :: {
	}
}
Pipeline :: {
	Type: "AWS::IoTAnalytics::Pipeline"
	Properties: {
		PipelineActivities: [...propActivity]
		PipelineName?: string | fn.Fn
		Tags?: [...propTag]
	}
	propActivity :: {
		AddAttributes?:        propAddAttributes
		Channel?:              propChannel
		Datastore?:            propDatastore
		DeviceRegistryEnrich?: propDeviceRegistryEnrich
		DeviceShadowEnrich?:   propDeviceShadowEnrich
		Filter?:               propFilter
		Lambda?:               propLambda
		Math?:                 propMath
		RemoveAttributes?:     propRemoveAttributes
		SelectAttributes?:     propSelectAttributes
	}
	propAddAttributes :: {
		Attributes?: {
		} | fn.Fn
		Name?: string | fn.Fn
		Next?: string | fn.Fn
	}
	propChannel :: {
		ChannelName?: string | fn.Fn
		Name?:        string | fn.Fn
		Next?:        string | fn.Fn
	}
	propDatastore :: {
		DatastoreName?: string | fn.Fn
		Name?:          string | fn.Fn
	}
	propDeviceRegistryEnrich :: {
		Attribute?: string | fn.Fn
		Name?:      string | fn.Fn
		Next?:      string | fn.Fn
		RoleArn?:   string | fn.Fn
		ThingName?: string | fn.Fn
	}
	propDeviceShadowEnrich :: {
		Attribute?: string | fn.Fn
		Name?:      string | fn.Fn
		Next?:      string | fn.Fn
		RoleArn?:   string | fn.Fn
		ThingName?: string | fn.Fn
	}
	propFilter :: {
		Filter?: string | fn.Fn
		Name?:   string | fn.Fn
		Next?:   string | fn.Fn
	}
	propLambda :: {
		BatchSize?:  int | fn.Fn
		LambdaName?: string | fn.Fn
		Name?:       string | fn.Fn
		Next?:       string | fn.Fn
	}
	propMath :: {
		Attribute?: string | fn.Fn
		Math?:      string | fn.Fn
		Name?:      string | fn.Fn
		Next?:      string | fn.Fn
	}
	propRemoveAttributes :: {
		Attributes?: [...string] | fn.Fn
		Name?:       string | fn.Fn
		Next?:       string | fn.Fn
	}
	propSelectAttributes :: {
		Attributes?: [...string] | fn.Fn
		Name?:       string | fn.Fn
		Next?:       string | fn.Fn
	}
}
