package cacentral1

import "github.com/TangoGroup/aws/fn"

#QuickSight: {
	#Analysis: {
		Type: "AWS::QuickSight::Analysis"
		Properties: {
			AnalysisId:   string | fn.#Fn
			AwsAccountId: string | fn.#Fn
			Errors?:      [...{
				Message?: string | fn.#Fn
				Type?:    string | fn.#Fn
			}] | fn.#If
			Name?:       string | fn.#Fn
			Parameters?: {
				DateTimeParameters?: [...{
					Name:   string | fn.#Fn
					Values: [...(string | fn.#Fn)] | (string | fn.#Fn)
				}] | fn.#If
				DecimalParameters?: [...{
					Name:   string | fn.#Fn
					Values: [...(number | fn.#Fn)] | (number | fn.#Fn)
				}] | fn.#If
				IntegerParameters?: [...{
					Name:   string | fn.#Fn
					Values: [...(number | fn.#Fn)] | (number | fn.#Fn)
				}] | fn.#If
				StringParameters?: [...{
					Name:   string | fn.#Fn
					Values: [...(string | fn.#Fn)] | (string | fn.#Fn)
				}] | fn.#If
			} | fn.#If
			Permissions?: [...{
				Actions:   [...(string | fn.#Fn)] | (string | fn.#Fn)
				Principal: string | fn.#Fn
			}] | fn.#If
			SourceEntity?: {
				SourceTemplate?: {
					Arn:               string | fn.#Fn
					DataSetReferences: [...{
						DataSetArn:         string | fn.#Fn
						DataSetPlaceholder: string | fn.#Fn
					}] | fn.#If
				} | fn.#If
			} | fn.#If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
			ThemeArn?: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Dashboard: {
		Type: "AWS::QuickSight::Dashboard"
		Properties: {
			AwsAccountId:             string | fn.#Fn
			DashboardId:              string | fn.#Fn
			DashboardPublishOptions?: {
				AdHocFilteringOption?: {
					AvailabilityStatus?: string | fn.#Fn
				} | fn.#If
				ExportToCSVOption?: {
					AvailabilityStatus?: string | fn.#Fn
				} | fn.#If
				SheetControlsOption?: {
					VisibilityState?: string | fn.#Fn
				} | fn.#If
			} | fn.#If
			Name?:       string | fn.#Fn
			Parameters?: {
				DateTimeParameters?: [...{
					Name:   string | fn.#Fn
					Values: [...(string | fn.#Fn)] | (string | fn.#Fn)
				}] | fn.#If
				DecimalParameters?: [...{
					Name:   string | fn.#Fn
					Values: [...(number | fn.#Fn)] | (number | fn.#Fn)
				}] | fn.#If
				IntegerParameters?: [...{
					Name:   string | fn.#Fn
					Values: [...(number | fn.#Fn)] | (number | fn.#Fn)
				}] | fn.#If
				StringParameters?: [...{
					Name:   string | fn.#Fn
					Values: [...(string | fn.#Fn)] | (string | fn.#Fn)
				}] | fn.#If
			} | fn.#If
			Permissions?: [...{
				Actions:   [...(string | fn.#Fn)] | (string | fn.#Fn)
				Principal: string | fn.#Fn
			}] | fn.#If
			SourceEntity?: {
				SourceTemplate?: {
					Arn:               string | fn.#Fn
					DataSetReferences: [...{
						DataSetArn:         string | fn.#Fn
						DataSetPlaceholder: string | fn.#Fn
					}] | fn.#If
				} | fn.#If
			} | fn.#If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
			ThemeArn?:           string | fn.#Fn
			VersionDescription?: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Template: {
		Type: "AWS::QuickSight::Template"
		Properties: {
			AwsAccountId: string | fn.#Fn
			Name?:        string | fn.#Fn
			Permissions?: [...{
				Actions:   [...(string | fn.#Fn)] | (string | fn.#Fn)
				Principal: string | fn.#Fn
			}] | fn.#If
			SourceEntity?: {
				SourceAnalysis?: {
					Arn:               string | fn.#Fn
					DataSetReferences: [...{
						DataSetArn:         string | fn.#Fn
						DataSetPlaceholder: string | fn.#Fn
					}] | fn.#If
				} | fn.#If
				SourceTemplate?: {
					Arn: string | fn.#Fn
				} | fn.#If
			} | fn.#If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
			TemplateId:          string | fn.#Fn
			VersionDescription?: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
	#Theme: {
		Type: "AWS::QuickSight::Theme"
		Properties: {
			AwsAccountId:   string | fn.#Fn
			BaseThemeId?:   string | fn.#Fn
			Configuration?: {
				DataColorPalette?: {
					Colors?:         [...(string | fn.#Fn)] | (string | fn.#Fn)
					EmptyFillColor?: string | fn.#Fn
					MinMaxGradient?: [...(string | fn.#Fn)] | (string | fn.#Fn)
				} | fn.#If
				Sheet?: {
					Tile?: {
						Border?: {
							Show?: bool | fn.#Fn
						} | fn.#If
					} | fn.#If
					TileLayout?: {
						Gutter?: {
							Show?: bool | fn.#Fn
						} | fn.#If
						Margin?: {
							Show?: bool | fn.#Fn
						} | fn.#If
					} | fn.#If
				} | fn.#If
				Typography?: {
					FontFamilies?: [...{
						FontFamily?: string | fn.#Fn
					}] | fn.#If
				} | fn.#If
				UIColorPalette?: {
					Accent?:              string | fn.#Fn
					AccentForeground?:    string | fn.#Fn
					Danger?:              string | fn.#Fn
					DangerForeground?:    string | fn.#Fn
					Dimension?:           string | fn.#Fn
					DimensionForeground?: string | fn.#Fn
					Measure?:             string | fn.#Fn
					MeasureForeground?:   string | fn.#Fn
					PrimaryBackground?:   string | fn.#Fn
					PrimaryForeground?:   string | fn.#Fn
					SecondaryBackground?: string | fn.#Fn
					SecondaryForeground?: string | fn.#Fn
					Success?:             string | fn.#Fn
					SuccessForeground?:   string | fn.#Fn
					Warning?:             string | fn.#Fn
					WarningForeground?:   string | fn.#Fn
				} | fn.#If
			} | fn.#If
			Name?:        string | fn.#Fn
			Permissions?: [...{
				Actions:   [...(string | fn.#Fn)] | (string | fn.#Fn)
				Principal: string | fn.#Fn
			}] | fn.#If
			Tags?: [...{
				Key:   string | fn.#Fn
				Value: string | fn.#Fn
			}] | fn.#If
			ThemeId:             string | fn.#Fn
			VersionDescription?: string | fn.#Fn
		}
		DependsOn?:           string | [...string]
		DeletionPolicy?:      "Delete" | "Retain"
		UpdateReplacePolicy?: "Delete" | "Retain"
		Metadata?: [string]: _
		Condition?: string
	}
}
