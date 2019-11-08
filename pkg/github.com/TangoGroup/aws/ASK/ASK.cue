package ASK

import "github.com/TangoGroup/fn"

Skill :: {
	Type: "Alexa::ASK::Skill"
	Properties: {
		AuthenticationConfiguration: propAuthenticationConfiguration
		SkillPackage:                propSkillPackage
		VendorId:                    string | fn.Fn
	}
	propAuthenticationConfiguration :: {
		ClientId:     string | fn.Fn
		ClientSecret: string | fn.Fn
		RefreshToken: string | fn.Fn
	}
	propOverrides :: {
		Manifest?: {
		} | fn.Fn
	}
	propSkillPackage :: {
		Overrides?:       propOverrides
		S3Bucket:         string | fn.Fn
		S3BucketRole?:    string | fn.Fn
		S3Key:            string | fn.Fn
		S3ObjectVersion?: string | fn.Fn
	}
}
