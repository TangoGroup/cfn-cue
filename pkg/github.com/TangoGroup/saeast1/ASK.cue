package saeast1

import "github.com/TangoGroup/fn"

ASK :: {
	Skill :: {
		Type: "Alexa::ASK::Skill"
		Properties: {
			AuthenticationConfiguration: {
				ClientId:     string | fn.Fn
				ClientSecret: string | fn.Fn
				RefreshToken: string | fn.Fn
			}
			SkillPackage: {
				Overrides?: Manifest?: {
				} | fn.Fn
				S3Bucket:         string | fn.Fn
				S3BucketRole?:    string | fn.Fn
				S3Key:            string | fn.Fn
				S3ObjectVersion?: string | fn.Fn
			}
			VendorId: string | fn.Fn
		}
	}
}
