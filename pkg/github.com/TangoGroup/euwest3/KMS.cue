package euwest3

import "github.com/TangoGroup/fn"

KMS :: {
	Alias :: {
		Type: "AWS::KMS::Alias"
		Properties: {
			AliasName:   string | fn.Fn
			TargetKeyId: string | fn.Fn
		}
	}
	Key :: {
		Type: "AWS::KMS::Key"
		Properties: {
			Description?:       string | fn.Fn
			EnableKeyRotation?: bool | fn.Fn
			Enabled?:           bool | fn.Fn
			KeyPolicy:          {
				[string]: _
			} | fn.Fn
			KeyUsage?:            string | fn.Fn
			PendingWindowInDays?: (int & (>=7 & <=30)) | fn.Fn
			Tags?: [...{
			}]
		}
	}
}
