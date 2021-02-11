package useast1

import "github.com/TangoGroup/aws/fn"

GreengrassV2 :: {
	ComponentVersion :: {
		Type:       "AWS::GreengrassV2::ComponentVersion"
		Properties: close({
			InlineRecipe?:   string | fn.Fn
			LambdaFunction?: close({
				ComponentDependencies?: {
					[string]: close({
						DependencyType?:     string | fn.Fn
						VersionRequirement?: string | fn.Fn
					})
				} | fn.If
				ComponentLambdaParameters?: close({
					EnvironmentVariables?: {
						[string]: string | fn.Fn
					} | fn.If
					EventSources?: [...close({
						Topic?: string | fn.Fn
						Type?:  ("PUB_SUB" | "IOT_CORE") | fn.Fn
					})] | fn.If
					ExecArgs?:                 [...(string | fn.Fn)] | (string | fn.Fn)
					InputPayloadEncodingType?: ("json" | "binary") | fn.Fn
					LinuxProcessParams?:       close({
						ContainerParams?: close({
							Devices?: [...close({
								AddGroupOwner?: bool | fn.Fn
								Path?:          string | fn.Fn
								Permission?:    ("ro" | "rw") | fn.Fn
							})] | fn.If
							MemorySizeInKB?: int | fn.Fn
							MountROSysfs?:   bool | fn.Fn
							Volumes?:        [...close({
								AddGroupOwner?:   bool | fn.Fn
								DestinationPath?: string | fn.Fn
								Permission?:      ("ro" | "rw") | fn.Fn
								SourcePath?:      string | fn.Fn
							})] | fn.If
						}) | fn.If
						IsolationMode?: ("GreengrassContainer" | "NoContainer") | fn.Fn
					}) | fn.If
					MaxIdleTimeInSeconds?:   int | fn.Fn
					MaxInstancesCount?:      int | fn.Fn
					MaxQueueSize?:           int | fn.Fn
					Pinned?:                 bool | fn.Fn
					StatusTimeoutInSeconds?: int | fn.Fn
					TimeoutInSeconds?:       int | fn.Fn
				}) | fn.If
				ComponentName?:      string | fn.Fn
				ComponentPlatforms?: [...close({
					Attributes?: {
						[string]: string | fn.Fn
					} | fn.If
					Name?: string | fn.Fn
				})] | fn.If
				ComponentVersion?: string | fn.Fn
				LambdaArn?:        (=~#"^arn:aws(-(cn|us-gov))?:lambda:(([a-z]+-)+[0-9])?:([0-9]{12})?:[^.]+$"#) | fn.Fn
			}) | fn.If
			Tags?: {
				[string]: string | fn.Fn
			} | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
