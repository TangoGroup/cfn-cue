package eucentral1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

LookoutMetrics :: {
	Alert :: {
		Type:       "AWS::LookoutMetrics::Alert"
		Properties: close({
			Action: {
				[string]: _
			} | fn.Fn
			AlertDescription?:         (=~#".*\S.*"#) | fn.Fn
			AlertName?:                (strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9][a-zA-Z0-9\-_]*"#)) | fn.Fn
			AlertSensitivityThreshold: int | fn.Fn
			AnomalyDetectorArn:        (=~#"arn:([a-z\d-]+):.*:.*:.*:.+"#) | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	AnomalyDetector :: {
		Type:       "AWS::LookoutMetrics::AnomalyDetector"
		Properties: close({
			AnomalyDetectorConfig: {
				[string]: _
			} | fn.Fn
			AnomalyDetectorDescription?: (=~#".*\S.*"#) | fn.Fn
			AnomalyDetectorName?:        (strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9][a-zA-Z0-9\-_]*"#)) | fn.Fn
			KmsKeyArn?:                  (strings.MinRunes(20) & strings.MaxRunes(2048) & (=~#"arn:aws.*:kms:.*:[0-9]{12}:key/.*"#)) | fn.Fn
			MetricSetList:               [...close({
				DimensionList?: [...((strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9][a-zA-Z0-9\-_]*"#)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9][a-zA-Z0-9\-_]*"#)) | fn.Fn)
				MetricList:     [...close({
					AggregationFunction: ("AVG" | "SUM") | fn.Fn
					MetricName:          (strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9][a-zA-Z0-9\-_]*"#)) | fn.Fn
					Namespace?:          (strings.MinRunes(1) & strings.MaxRunes(255) & (=~#"[^:].*"#)) | fn.Fn
				})] | fn.If
				MetricSetDescription?: (=~#".*\S.*"#) | fn.Fn
				MetricSetFrequency?:   ("PT5M" | "PT10M" | "PT1H" | "P1D") | fn.Fn
				MetricSetName:         (strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9][a-zA-Z0-9\-_]*"#)) | fn.Fn
				MetricSource:          close({
					AppFlowConfig?: close({
						FlowName: (=~#"[a-zA-Z0-9][\w!@#.-]+"#) | fn.Fn
						RoleArn:  (=~#"arn:([a-z\d-]+):.*:.*:.*:.+"#) | fn.Fn
					}) | fn.If
					CloudwatchConfig?: close({
						RoleArn: (=~#"arn:([a-z\d-]+):.*:.*:.*:.+"#) | fn.Fn
					}) | fn.If
					RDSSourceConfig?: close({
						DBInstanceIdentifier: (strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z](?!.*--)(?!.*-$)[0-9a-zA-Z\-]*$"#)) | fn.Fn
						DatabaseHost:         (strings.MinRunes(1) & strings.MaxRunes(253) & (=~#".*\S.*"#)) | fn.Fn
						DatabaseName:         (strings.MinRunes(1) & strings.MaxRunes(64) & (=~#"[a-zA-Z0-9_]+"#)) | fn.Fn
						DatabasePort:         (>=1 & <=65535) | fn.Fn
						RoleArn:              (=~#"arn:([a-z\d-]+):.*:.*:.*:.+"#) | fn.Fn
						SecretManagerArn:     (=~#"arn:([a-z\d-]+):.*:.*:secret:AmazonLookoutMetrics-.+"#) | fn.Fn
						TableName:            (strings.MinRunes(1) & strings.MaxRunes(100) & (=~#"^[a-zA-Z][a-zA-Z0-9_]*$"#)) | fn.Fn
						VpcConfiguration:     close({
							SecurityGroupIdList: close({
								SecurityGroupIdList?: [...(string | fn.Fn)] | (string | fn.Fn)
							}) | fn.If
							SubnetIdList: close({
								SubnetIdList?: [...(string | fn.Fn)] | (string | fn.Fn)
							}) | fn.If
						}) | fn.If
					}) | fn.If
					RedshiftSourceConfig?: close({
						ClusterIdentifier: (strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-z](?!.*--)(?!.*-$)[0-9a-z\-]*$"#)) | fn.Fn
						DatabaseHost:      (strings.MinRunes(1) & strings.MaxRunes(253) & (=~#".*\S.*"#)) | fn.Fn
						DatabaseName:      (strings.MinRunes(1) & strings.MaxRunes(100) & (=~#"[a-z0-9]+"#)) | fn.Fn
						DatabasePort:      (>=1 & <=65535) | fn.Fn
						RoleArn:           (=~#"arn:([a-z\d-]+):.*:.*:.*:.+"#) | fn.Fn
						SecretManagerArn:  (=~#"arn:([a-z\d-]+):.*:.*:secret:AmazonLookoutMetrics-.+"#) | fn.Fn
						TableName:         (strings.MinRunes(1) & strings.MaxRunes(100) & (=~#"^[a-zA-Z][a-zA-Z0-9_]*$"#)) | fn.Fn
						VpcConfiguration:  close({
							SecurityGroupIdList: close({
								SecurityGroupIdList?: [...(string | fn.Fn)] | (string | fn.Fn)
							}) | fn.If
							SubnetIdList: close({
								SubnetIdList?: [...(string | fn.Fn)] | (string | fn.Fn)
							}) | fn.If
						}) | fn.If
					}) | fn.If
					S3SourceConfig?: close({
						FileFormatDescriptor: close({
							CsvFormatDescriptor?: close({
								Charset?:         (=~#"^[a-zA-Z0-9][a-zA-Z0-9\-_]*"#) | fn.Fn
								ContainsHeader?:  bool | fn.Fn
								Delimiter?:       (=~#"[^\r\n]"#) | fn.Fn
								FileCompression?: ("NONE" | "GZIP") | fn.Fn
								HeaderList?:      [...((strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9][a-zA-Z0-9\-_]*"#)) | fn.Fn)] | ((strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9][a-zA-Z0-9\-_]*"#)) | fn.Fn)
								QuoteSymbol?:     (=~#"[^\r\n]|^$"#) | fn.Fn
							}) | fn.If
							JsonFormatDescriptor?: close({
								Charset?:         (=~#"^[a-zA-Z0-9][a-zA-Z0-9\-_]*"#) | fn.Fn
								FileCompression?: ("NONE" | "GZIP") | fn.Fn
							}) | fn.If
						}) | fn.If
						HistoricalDataPathList?: [...((=~#"^s3://[a-z0-9].+$"#) | fn.Fn)] | ((=~#"^s3://[a-z0-9].+$"#) | fn.Fn)
						RoleArn:                 (=~#"arn:([a-z\d-]+):.*:.*:.*:.+"#) | fn.Fn
						TemplatedPathList?:      [...((=~#"^s3://[a-zA-Z0-9_\-\/ {}=]+$"#) | fn.Fn)] | ((=~#"^s3://[a-zA-Z0-9_\-\/ {}=]+$"#) | fn.Fn)
					}) | fn.If
				}) | fn.If
				Offset?:          int | fn.Fn
				TimestampColumn?: close({
					ColumnFormat?: (=~#".*\S.*"#) | fn.Fn
					ColumnName?:   (strings.MinRunes(1) & strings.MaxRunes(63) & (=~#"^[a-zA-Z0-9][a-zA-Z0-9\-_]*"#)) | fn.Fn
				}) | fn.If
				Timezone?: (=~#".*\S.*"#) | fn.Fn
			})] | fn.If
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
