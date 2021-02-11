package eucentral1

import (
	"github.com/TangoGroup/aws/fn"
	"strings"
)

QuickSight :: {
	Analysis :: {
		Type:       "AWS::QuickSight::Analysis"
		Properties: close({
			AnalysisId:   (strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"[\w\-]+"#)) | fn.Fn
			AwsAccountId: (strings.MinRunes(12) & strings.MaxRunes(12) & (=~#"^[0-9]{12}$"#)) | fn.Fn
			Errors?:      [...close({
				Message?: (=~#".*\S.*"#) | fn.Fn
				Type?:    ("ACCESS_DENIED" | "SOURCE_NOT_FOUND" | "DATA_SET_NOT_FOUND" | "INTERNAL_FAILURE" | "PARAMETER_VALUE_INCOMPATIBLE" | "PARAMETER_TYPE_INVALID" | "PARAMETER_NOT_FOUND" | "COLUMN_TYPE_MISMATCH" | "COLUMN_GEOGRAPHIC_ROLE_MISMATCH" | "COLUMN_REPLACEMENT_MISSING") | fn.Fn
			})] | fn.If
			Name?:       (strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"[\u0020-\u00FF]+"#)) | fn.Fn
			Parameters?: close({
				DateTimeParameters?: [...close({
					Name:   (=~#".*\S.*"#) | fn.Fn
					Values: [...(string | fn.Fn)] | (string | fn.Fn)
				})] | fn.If
				DecimalParameters?: [...close({
					Name:   (=~#".*\S.*"#) | fn.Fn
					Values: [...(number | fn.Fn)] | (number | fn.Fn)
				})] | fn.If
				IntegerParameters?: [...close({
					Name:   (=~#".*\S.*"#) | fn.Fn
					Values: [...(number | fn.Fn)] | (number | fn.Fn)
				})] | fn.If
				StringParameters?: [...close({
					Name:   (=~#".*\S.*"#) | fn.Fn
					Values: [...(string | fn.Fn)] | (string | fn.Fn)
				})] | fn.If
			}) | fn.If
			Permissions?: [...close({
				Actions:   [...(string | fn.Fn)] | (string | fn.Fn)
				Principal: (strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn
			})] | fn.If
			SourceEntity?: close({
				SourceTemplate?: close({
					Arn:               string | fn.Fn
					DataSetReferences: [...close({
						DataSetArn:         string | fn.Fn
						DataSetPlaceholder: (=~#".*\S.*"#) | fn.Fn
					})] | fn.If
				}) | fn.If
			}) | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			ThemeArn?: string | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Dashboard :: {
		Type:       "AWS::QuickSight::Dashboard"
		Properties: close({
			AwsAccountId:             (strings.MinRunes(12) & strings.MaxRunes(12) & (=~#"^[0-9]{12}$"#)) | fn.Fn
			DashboardId:              (strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"[\w\-]+"#)) | fn.Fn
			DashboardPublishOptions?: close({
				AdHocFilteringOption?: close({
					AvailabilityStatus?: ("ENABLED" | "DISABLED") | fn.Fn
				}) | fn.If
				ExportToCSVOption?: close({
					AvailabilityStatus?: ("ENABLED" | "DISABLED") | fn.Fn
				}) | fn.If
				SheetControlsOption?: close({
					VisibilityState?: ("EXPANDED" | "COLLAPSED") | fn.Fn
				}) | fn.If
			}) | fn.If
			Name?:       (strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"[\u0020-\u00FF]+"#)) | fn.Fn
			Parameters?: close({
				DateTimeParameters?: [...close({
					Name:   (=~#".*\S.*"#) | fn.Fn
					Values: [...(string | fn.Fn)] | (string | fn.Fn)
				})] | fn.If
				DecimalParameters?: [...close({
					Name:   (=~#".*\S.*"#) | fn.Fn
					Values: [...(number | fn.Fn)] | (number | fn.Fn)
				})] | fn.If
				IntegerParameters?: [...close({
					Name:   (=~#".*\S.*"#) | fn.Fn
					Values: [...(number | fn.Fn)] | (number | fn.Fn)
				})] | fn.If
				StringParameters?: [...close({
					Name:   (=~#".*\S.*"#) | fn.Fn
					Values: [...(string | fn.Fn)] | (string | fn.Fn)
				})] | fn.If
			}) | fn.If
			Permissions?: [...close({
				Actions:   [...(string | fn.Fn)] | (string | fn.Fn)
				Principal: (strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn
			})] | fn.If
			SourceEntity?: close({
				SourceTemplate?: close({
					Arn:               string | fn.Fn
					DataSetReferences: [...close({
						DataSetArn:         string | fn.Fn
						DataSetPlaceholder: (=~#".*\S.*"#) | fn.Fn
					})] | fn.If
				}) | fn.If
			}) | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			ThemeArn?:           string | fn.Fn
			VersionDescription?: (strings.MinRunes(1) & strings.MaxRunes(512)) | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Template :: {
		Type:       "AWS::QuickSight::Template"
		Properties: close({
			AwsAccountId: (strings.MinRunes(12) & strings.MaxRunes(12) & (=~#"^[0-9]{12}$"#)) | fn.Fn
			Name?:        (strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"[\u0020-\u00FF]+"#)) | fn.Fn
			Permissions?: [...close({
				Actions:   [...(string | fn.Fn)] | (string | fn.Fn)
				Principal: (strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn
			})] | fn.If
			SourceEntity?: close({
				SourceAnalysis?: close({
					Arn:               string | fn.Fn
					DataSetReferences: [...close({
						DataSetArn:         string | fn.Fn
						DataSetPlaceholder: (=~#".*\S.*"#) | fn.Fn
					})] | fn.If
				}) | fn.If
				SourceTemplate?: close({
					Arn: string | fn.Fn
				}) | fn.If
			}) | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			TemplateId:          (strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"[\w\-]+"#)) | fn.Fn
			VersionDescription?: (strings.MinRunes(1) & strings.MaxRunes(512)) | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	Theme :: {
		Type:       "AWS::QuickSight::Theme"
		Properties: close({
			AwsAccountId:   (strings.MinRunes(12) & strings.MaxRunes(12) & (=~#"^[0-9]{12}$"#)) | fn.Fn
			BaseThemeId?:   (strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"[\w\-]+"#)) | fn.Fn
			Configuration?: close({
				DataColorPalette?: close({
					Colors?:         [...((=~#"^#[A-F0-9]{6}$"#) | fn.Fn)] | ((=~#"^#[A-F0-9]{6}$"#) | fn.Fn)
					EmptyFillColor?: (=~#"^#[A-F0-9]{6}$"#) | fn.Fn
					MinMaxGradient?: [...((=~#"^#[A-F0-9]{6}$"#) | fn.Fn)] | ((=~#"^#[A-F0-9]{6}$"#) | fn.Fn)
				}) | fn.If
				Sheet?: close({
					Tile?: close({
						Border?: close({
							Show?: bool | fn.Fn
						}) | fn.If
					}) | fn.If
					TileLayout?: close({
						Gutter?: close({
							Show?: bool | fn.Fn
						}) | fn.If
						Margin?: close({
							Show?: bool | fn.Fn
						}) | fn.If
					}) | fn.If
				}) | fn.If
				Typography?: close({
					FontFamilies?: [...close({
						FontFamily?: string | fn.Fn
					})] | fn.If
				}) | fn.If
				UIColorPalette?: close({
					Accent?:              (=~#"^#[A-F0-9]{6}$"#) | fn.Fn
					AccentForeground?:    (=~#"^#[A-F0-9]{6}$"#) | fn.Fn
					Danger?:              (=~#"^#[A-F0-9]{6}$"#) | fn.Fn
					DangerForeground?:    (=~#"^#[A-F0-9]{6}$"#) | fn.Fn
					Dimension?:           (=~#"^#[A-F0-9]{6}$"#) | fn.Fn
					DimensionForeground?: (=~#"^#[A-F0-9]{6}$"#) | fn.Fn
					Measure?:             (=~#"^#[A-F0-9]{6}$"#) | fn.Fn
					MeasureForeground?:   (=~#"^#[A-F0-9]{6}$"#) | fn.Fn
					PrimaryBackground?:   (=~#"^#[A-F0-9]{6}$"#) | fn.Fn
					PrimaryForeground?:   (=~#"^#[A-F0-9]{6}$"#) | fn.Fn
					SecondaryBackground?: (=~#"^#[A-F0-9]{6}$"#) | fn.Fn
					SecondaryForeground?: (=~#"^#[A-F0-9]{6}$"#) | fn.Fn
					Success?:             (=~#"^#[A-F0-9]{6}$"#) | fn.Fn
					SuccessForeground?:   (=~#"^#[A-F0-9]{6}$"#) | fn.Fn
					Warning?:             (=~#"^#[A-F0-9]{6}$"#) | fn.Fn
					WarningForeground?:   (=~#"^#[A-F0-9]{6}$"#) | fn.Fn
				}) | fn.If
			}) | fn.If
			Name?:        (strings.MinRunes(1) & strings.MaxRunes(2048)) | fn.Fn
			Permissions?: [...close({
				Actions:   [...(string | fn.Fn)] | (string | fn.Fn)
				Principal: (strings.MinRunes(1) & strings.MaxRunes(256)) | fn.Fn
			})] | fn.If
			Tags?: [...close({
				Key:   string | fn.Fn
				Value: string | fn.Fn
			})] | fn.If
			ThemeId:             (strings.MinRunes(1) & strings.MaxRunes(2048) & (=~#"[\w\-]+"#)) | fn.Fn
			VersionDescription?: (strings.MinRunes(1) & strings.MaxRunes(512)) | fn.Fn
		})
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
